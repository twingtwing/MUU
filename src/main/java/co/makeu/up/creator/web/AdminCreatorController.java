package co.makeu.up.creator.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import co.makeu.up.common.view.Pagination;
import co.makeu.up.creator.service.CreatorServiceImpl;
import co.makeu.up.creator.service.CreatorVO;
import co.makeu.up.lecture.service.LectureServiceImpl;
import co.makeu.up.lecture.service.LectureVO;
import co.makeu.up.refund.service.RefundServiceImpl;
import co.makeu.up.report.service.ReportServiceImpl;
import co.makeu.up.users.service.UsersServiceImpl;
import co.makeu.up.users.service.UsersVO;

@Controller
public class AdminCreatorController {
	@Autowired UsersServiceImpl userDao;
	@Autowired CreatorServiceImpl creatorDao;
	@Autowired LectureServiceImpl lectureDao;
	@Autowired RefundServiceImpl refundDao;
	@Autowired ReportServiceImpl reportDao;
	
	//admin list
	@GetMapping("/admin/adCreL")
	public String adCreL(UsersVO vo, Model model) {
		if(vo.getCreGrdCodeList()==null) {
			String[] grd = {"Family","VIP","VVIP"};
			vo.setCreGrdCodeList(grd);
		}
		if(vo.getPage()==0) {
			vo.setPage(1);
		}
		vo.setAuthCode("A03");
		List<UsersVO> list = userDao.usersList(vo);
		Pagination pagination = new Pagination(list.size()!=0 ? list.get(0).getCnt() : 1,vo.getPage());
		model.addAttribute("creators",list);
		model.addAttribute("pages",pagination);
		model.addAttribute("search",vo);
		return "admin/all/adCreL";
	}
	
	//admin Select
	@GetMapping("/admin/creatorSelect")
	public String adCreS(Model model, UsersVO vo) {
		CreatorVO crevo = new CreatorVO();
		crevo.setId(vo.getId());
		List<LectureVO> list = lectureDao.creLectureList(vo.getId());
		int salesAll = 0;
		for(LectureVO l : list) {
			salesAll = salesAll + l.getSales();
		}
		model.addAttribute("userInfo",userDao.selectUsers(vo));
		model.addAttribute("cre",creatorDao.creatorSelect(crevo));
		model.addAttribute("lectures", list);
		model.addAttribute("salesAll",salesAll);
		model.addAttribute("refundList",refundDao.RefundListByCreator(vo.getId()));
		model.addAttribute("reports",reportDao.reportLectureList(vo.getId()));
		return "admin/all/adCreS";
	}
	
}
