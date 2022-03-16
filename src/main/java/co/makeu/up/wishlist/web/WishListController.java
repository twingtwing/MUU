package co.makeu.up.wishlist.web;

import java.security.Principal;
import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.common.view.PaginationFive;
import co.makeu.up.wishlist.service.WishListServiceImpl;
import co.makeu.up.wishlist.service.WishlistVO;

@Controller
public class WishListController {
	Logger logger = LoggerFactory.getLogger(WishListController.class);
	
	@Autowired
	WishListServiceImpl wishListDao;

	@GetMapping("/user/userWishList")
	public String wishListSearch(Model model, Principal pri, WishlistVO vo,
			@RequestParam("lec") int lec) {
		
		vo.setPage(0);
		vo.setId(pri.getName());
		int listCnt = wishListDao.WishListCnt();
		System.out.println(listCnt + " 있냐?");
		PaginationFive pagination = new PaginationFive(listCnt,1);
		List<WishlistVO> wlist = wishListDao.WishListSearch(vo);
		model.addAttribute("ltno", vo.getLtNo());
		model.addAttribute("pagination",pagination);
		model.addAttribute("wishlists", wlist);
		//수정
		boolean flag = false;
		for (WishlistVO w : wlist) {
			if(w.getLtNo() == lec) {
				flag = true;
			}
		}
		if(lec != 0 && !flag) {
			System.out.println(lec);
			System.out.println(flag);
			WishlistVO wvo = new WishlistVO();
			wvo.setLtNo(lec);
			wvo.setId(pri.getName());
			wishListDao.heartInsert(wvo);
		}
		//수정
		return "main/user/userWi";
	}
	
	@ResponseBody 
	@GetMapping("/user/userWishListPage")
	  public List<WishlistVO> userWishListPage(WishlistVO vo) {
	  logger.info(vo.getId()+"page는"+vo.getPage()); 
	  return wishListDao.WishListSearch(vo); 
	}
	
	@ResponseBody
	@RequestMapping("/user/deleteWishList")
	public String deleteWishList(Principal pri,@RequestParam(value="ltNoArr[]") List<Integer> ltNoArr){
		wishListDao.deleteWishList(ltNoArr, pri.getName());
		return "redirect:/user/userWi";
	}
	
	//하트 추가
	@ResponseBody
	@PostMapping("/user/heartInsert")
	public String heartInsert(WishlistVO vo, Principal pri) {
		String result = "N";
		vo.setId(pri.getName());
		if(wishListDao.heartInsert(vo) != 0) {
			result = "Y";
		}
		return result;
	}
	
	//하트 삭제
	@ResponseBody
	@PostMapping("/user/heartDelete")
	public String heartDelete(WishlistVO vo, Principal pri) {
		String result = "N";
		vo.setId(pri.getName());
		if(wishListDao.heartDelete(vo) != 0) {
			result = "Y";
		}
		return result;
	}

}
