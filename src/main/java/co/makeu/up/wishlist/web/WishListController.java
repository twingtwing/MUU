package co.makeu.up.wishlist.web;
import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.makeu.up.wishlist.service.WishListServiceImpl;
import co.makeu.up.wishlist.service.WishlistVO;

@Controller
public class WishListController {
	@Autowired WishListServiceImpl wishLitsDao;
	
	@GetMapping("/user/userWishList")
	public String wishList() {
		return "main/user/userWi";
	}
	
	@ResponseBody
	@GetMapping("/user/wishListSearch")
	public List<WishlistVO> wishListSearch(Model model, Principal pri) {
		return wishLitsDao.WishListSearch(pri.getName());
	}
}
