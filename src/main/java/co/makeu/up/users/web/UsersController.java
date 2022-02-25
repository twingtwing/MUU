package co.makeu.up.users.web;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.makeu.up.users.service.UsersServiceImpl;
import co.makeu.up.users.service.UsersVO;

@Controller
public class UsersController {
	private final Logger logger = LoggerFactory.getLogger(UsersController.class.getName());
	@Autowired
	JavaMailSender mailSender;
	@Autowired
	UsersServiceImpl usersDao;
	@Inject
	BCryptPasswordEncoder pwEncoder;

	@PostMapping("/login")
	public void login(UsersVO vo) {
	}

	@PostMapping("/logout")
	public void logout() {
	}

	@PostMapping("/signup")
	public String signup(UsersVO vo) {
		String pw = pwEncoder.encode(vo.getPw());
		vo.setPw(pw);
		usersDao.insertUsers(vo);
		System.out.println();
		return "main/all/home";
	}

	@GetMapping("/forget")
	public String forget() {
		return "main/all/findidpw";
	}

	
	@ResponseBody
	@GetMapping("/idchk")
	public boolean idchk(UsersVO vo) {
		String id = usersDao.ajaxChkId(vo.getId());
		if (id == null) {
			return true;
		} else {
			return false;
		}
	}
	
	
	// 이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody
	public int emailVerify(@RequestParam(value="email", required=false) String email) {
		System.out.println(email);
		Random r = new Random();
		int num = r.nextInt(999999);
		String fromEamil = "muuproject.up@gmail.com";
		String toEamil = email;// comma넣으면 여러개 가능함

		String subject = "[MakeUUp] 비밀번호변경 인증 이메일 입니다";
		String content = "<h3>[비밀번호 변경 인증 번호]</h3>\n<p>인증번호 : " + num + "</p>";
		
		MimeMessage mail = mailSender.createMimeMessage();
		MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");

		try {
			mailHelper.setFrom(fromEamil);
			mailHelper.setTo(toEamil);
			mailHelper.setSubject(subject);
			mailHelper.setText(content, true);// true는 html을 사용한다는 의미 -> img도 보낼수 있음

			mailSender.send(mail);

		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return num;
	}
	

	// 새 비밀번호 페이지 이동
	@GetMapping("/changePwForm")
	public String newPw(@RequestParam(value="email", required = false) String email, Model model) {
		model.addAttribute("id",email);
		return "main/all/changePwForm";
	}

	// 비밀번호 변경
	@PostMapping("/changePw")
	public String changePw(UsersVO vo) {
		vo.setPw(pwEncoder.encode(vo.getPw()));
		usersDao.changePw(vo);
		return "main/all/home";
	}
	
	@GetMapping("/user/userSelect")
	public String userSelect(Model model, Principal pri, UsersVO vo) {
		vo.setId(pri.getName());
		vo = usersDao.selectUsers(vo);
		model.addAttribute("user", vo);
		return "main/user/userS";
	}
	
	@PostMapping("/user/userInfoUpdate")
	public String userInfoUpdate(UsersVO vo, HttpServletResponse response, Principal pri) {
		vo.setId(pri.getName());
		usersDao.updateUserInfo(vo);
		return "redirect:/user/userSelect";
	}
	
	@PostMapping("/user/uploadProfile")
	@ResponseBody
	public void userUploadProfile(MultipartFile uploadFile, Principal pri, UsersVO vo,HttpServletResponse res) throws IOException {
		String uploadFolder = "C:\\uploadTest";
		String uploadFileName = uploadFile.getOriginalFilename();
		Random r = new Random();
		int num = r.nextInt(999999);
		
		uploadFileName = num+uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
		logger.info("파일명: "+uploadFileName);
		File saveFile = new File(uploadFolder,uploadFileName);
		String id = pri.getName();
		try {
			uploadFile.transferTo(saveFile);
			vo.setPht("/upload/"+uploadFileName);
			vo.setId(id);
			usersDao.updateUserProfileImg(vo);
			res.getWriter().append(vo.getPht());
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		}
	}
}
