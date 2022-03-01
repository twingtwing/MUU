package co.makeu.up.wishlist.web;

import java.security.Principal;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.common.view.Pagination;
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
		Pagination pagination = new Pagination(listCnt,1);
		List<WishlistVO> wlist = wishListDao.WishListSearch(vo);
		model.addAttribute("ltno", vo.getPage());
		model.addAttribute("pagination",pagination);
		model.addAttribute("wishlists", wlist);
		return "main/user/userWi";
	}
	
	  @GetMapping("/user/userWishListPage")
	  @ResponseBody public List<WishlistVO> userWishListPage(WishlistVO vo) {
	  logger.info("page는"+vo.getPage()); 
	  return wishListDao.WishListSearch(vo); }

}
