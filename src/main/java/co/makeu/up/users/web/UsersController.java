package co.makeu.up.users.web;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
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
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
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
	@Autowired
	String saveDir;

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
		return "redirect:/home";
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
		SecureRandom r = new SecureRandom();
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
	@GetMapping("/user/userPwForm")
	public String userPwForm(Principal pri) {
		return "main/user/userPwForm";
	}
	

	// 비밀번호 변경
	@PostMapping("/changePw")
	public String changePw(UsersVO vo) {
		vo.setPw(pwEncoder.encode(vo.getPw()));
		usersDao.changePw(vo);
		return "redirect:/home";
	}
	@PostMapping("/user/changePw")
	public String userChangePw(UsersVO vo, Principal pri) {
		System.out.println(vo.getPw());
		vo.setPw(pwEncoder.encode(vo.getPw()));
		System.out.println(vo.getPw());
		vo.setId(pri.getName());
		usersDao.changePw(vo);
		return "redirect:/user/userSelect";
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
	public void userUploadProfile(MultipartFile uploadFile, Principal pri, UsersVO vo,HttpServletResponse res, String beforeFileName) throws IOException {
		String uploadFolder = saveDir;
		SecureRandom r = new SecureRandom();
		int num = r.nextInt(999999);
		// 기존에 있던 프로필사진 삭제
		if(!beforeFileName.equals("no")) {			
			File oldimg = new File(uploadFolder+"\\"+beforeFileName.substring(beforeFileName.lastIndexOf("/")+1));
			oldimg.delete();
		}
		
		String uploadFileName = uploadFile.getOriginalFilename();
		uploadFileName = num+uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
		File saveFile = new File(uploadFolder,uploadFileName);
		logger.info(uploadFolder);
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
	
	@ResponseBody
	@GetMapping("/user/userFarewellChk")
	public String userFarewell(String id) {
		String result;
		if(usersDao.chkCreFarewell(id).size()==0) {
			result = "ok";
		} else {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			result = dateFormat.format(usersDao.chkCreFarewell(id).get(0));
		}
		logger.info(result);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/user/userFarewell")
	public void userFarewell(String id, String pht) {
		
		// 크리에이터의 경우 기존에 서버에있던 강의 다 지우는기능 나중에 추가하기(언제?)
		
		// 서버에서 프로필사진 삭제
		if(pht!=null) {
			File removePht = new File(pht);
			removePht.delete();			
		}
		usersDao.deleteUsers(id);
	}
	
	@GetMapping("/user/userUpdate")
	public String userUpdateForm(UsersVO vo,Principal pri,Model model) {
		vo.setId(pri.getName());
		vo = usersDao.selectUsers(vo);
		model.addAttribute("user",vo);
		return "main/user/userU";
	}
	
	@GetMapping("/user/creatorRegister")
	public String creatorRegister() {
		return "main/user/userCreReg";
	}
	
	@PostMapping("/user/passwordChk")
	@ResponseBody
	public String passwordChk(Principal pri, String pw) {
		BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder();
		if(bcrypt.matches(pw,usersDao.userPwChck(pri.getName()))) {
			return "ok";
		} else {
			return "ng";
		}
	}
	
	@PostMapping("/user/userTocreator")
	public String userTocreator(Principal pri, UsersVO vo) {
		vo.setId(pri.getName());
		usersDao.userToCreator(vo);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		List<GrantedAuthority> updatedAuthority = new ArrayList<GrantedAuthority>();
		updatedAuthority.add(new SimpleGrantedAuthority("A03"));
		Authentication newAuth = new UsernamePasswordAuthenticationToken(auth.getPrincipal(), auth.getCredentials(),updatedAuthority);
		SecurityContextHolder.getContext().setAuthentication(newAuth);
		return "redirect:/creator/creS";
	}
	
}
