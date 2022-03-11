package co.makeu.up.users.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.common.view.Pagination;
import co.makeu.up.sugang.service.SugangServiceImpl;
import co.makeu.up.sugang.service.SugangVO;
import co.makeu.up.users.service.UsersServiceImpl;
import co.makeu.up.users.service.UsersVO;

@Controller
public class AdminUserController {
	@Autowired UsersServiceImpl usersDao;
	@Autowired SugangServiceImpl sugangDao;
	
	@GetMapping("/admin/adUserL")
	public String adUserL(Model model,UsersVO vo) {
		String[] grd = {"일반","새싹","꽃","나무"};
		if(vo.getuGrdCodeList()==null) {
			vo.setuGrdCodeList(grd);
		}

		if(vo.getPage()==0) {
			vo.setPage(1);
		}
		List<UsersVO> list = usersDao.usersList(vo);
		Pagination pagination = new Pagination(list.size()!=0 ? list.get(0).getCnt() : 1, vo.getPage());
		model.addAttribute("grd",grd);
		model.addAttribute("pages",pagination);
		model.addAttribute("users", list);
		model.addAttribute("search",vo);
		return "admin/all/adUserL";		
	}
	
	@GetMapping("/admin/userSelect")
	public String adUserS(UsersVO vo, Model model,SugangVO sugangvo) {
		model.addAttribute("userInfo",usersDao.selectUsers(vo));
		model.addAttribute("sugang",sugangDao.sugangSelectList(vo.getId()));
		
		sugangvo.setId(vo.getId());
		List<SugangVO> sugangList = new ArrayList<SugangVO>();
		List<SugangVO> deliverList = new ArrayList<SugangVO>();
		for(SugangVO s : sugangDao.sugangPay(sugangvo)) {
			if(s.getShipStCode()!=null && s.getShipNum()!=null && !s.getShipStCode().equals("D03")) {
				deliverList.add(s);
			}			
			if(!s.getTlsnStCode().equals("SU03")) {
				sugangList.add(s);
			}
		}
		model.addAttribute("sugang",sugangList);
		model.addAttribute("refund",sugangDao.userRefundList(vo.getId()));
		model.addAttribute("deliver",deliverList);
		return "admin/all/adUserS";
	}
	
	@PostMapping("/admin/userSearch")
	@ResponseBody
	public List<UsersVO> userSearch(@RequestBody UsersVO vo){
		return usersDao.usersList(vo);
	}
}
