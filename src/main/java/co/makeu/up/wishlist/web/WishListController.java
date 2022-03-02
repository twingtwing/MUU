package co.makeu.up.wishlist.web;

import java.security.Principal;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.common.view.Pagination;
import co.makeu.up.common.view.PaginationFive;
import co.makeu.up.notice.service.NoticeVO;
import co.makeu.up.notice.web.NoticeController;
import co.makeu.up.wishlist.service.WishListServiceImpl;
import co.makeu.up.wishlist.service.WishlistVO;

@Controller
public class WishListController {
	Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	WishListServiceImpl wishListDao;

	@GetMapping("/user/userWishList")
	public String wishListSearch(Model model, Principal pri, WishlistVO vo) {
		vo.setPage(0);
		vo.setId(pri.getName());
		int listCnt = wishListDao.WishListCnt();
		System.out.println(listCnt + " 있냐?");
		PaginationFive pagination = new PaginationFive(listCnt,1);
		List<WishlistVO> wlist = wishListDao.WishListSearch(vo);
		model.addAttribute("ltno", vo.getLtNo());
		model.addAttribute("pagination",pagination);
		model.addAttribute("wishlists", wlist);
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
		System.out.println("여기 오면 대박이야");
		wishListDao.deleteWishList(ltNoArr, pri.getName());
		return "redirect:/user/userWi";
	}
	

}
