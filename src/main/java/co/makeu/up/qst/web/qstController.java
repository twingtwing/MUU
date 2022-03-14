package co.makeu.up.qst.web;

import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.common.view.Pagination;
import co.makeu.up.qst.service.QstServiceImpl;
import co.makeu.up.qst.service.QstVO;

@Controller
public class qstController {
	@Autowired QstServiceImpl qstDao;
	@Autowired
	JavaMailSender mailSender;
	@GetMapping("/user/qna")
	public String qna() {
		return "main/all/qna";
	}
	
	@ResponseBody
	@PostMapping("/QstInsert")
	public String QstInsert(QstVO vo) {
		System.out.println(vo.toString());
		qstDao.QstInsert(vo);
		return "main/all/qna";
	}
	
	//admin list
	@GetMapping("/admin/adQstL")
	public String adQstL(QstVO vo, Model model, @Param("state") boolean state) {
		if(!state) {
			model.addAttribute("state", false);
		} else {
			model.addAttribute("state", true);
		}
		if(vo.getPage()==0) {
			vo.setPage(1);
		}
		List<QstVO> list = qstDao.qstSelectList(vo);
		Pagination pagination = new Pagination(list.size()!=0 ? list.get(0).getLength() : 1, vo.getPage()); 
		model.addAttribute("pages",pagination);
		model.addAttribute("qstList",list);
		model.addAttribute("searchData",vo);
		return "admin/all/adQstL";
	}
	
	
	//admin select
	@GetMapping("/admin/adQstS")
	public String adQstS(int qstNo, Model model) {
		model.addAttribute("qst",qstDao.qstSelect(qstNo));
		return "admin/all/adQstS";
	}
	
	
	@PostMapping("admin/adQstMail")
	public String adQstMail(QstVO vo) {
		String fromEamil = "muuproject.up@gmail.com";
		String toEamil = vo.getEmail();

		String subject = "[MakeUUp] 작성하신 문의글 '"+vo.getTtl()+"'에 대한 답변입니다.";
		String content = vo.getaContent();
		
		MimeMessage mail = mailSender.createMimeMessage();
		MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");

		try {
			mailHelper.setFrom(fromEamil);
			mailHelper.setTo(toEamil);
			mailHelper.setSubject(subject);
			mailHelper.setText(content, true); // true는 html을 사용한다는 의미 -> img도 보낼수 있음
			mailSender.send(mail);

		} catch (MessagingException e) {
			e.printStackTrace();
		}
		qstDao.qstUpdateStCode(vo); // 답변완료 + 답변 업데이트
		return "redirect:/admin/adQstL";
	}
}
