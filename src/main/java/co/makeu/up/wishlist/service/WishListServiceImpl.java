package co.makeu.up.wishlist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("wishListDao")
public class WishListServiceImpl implements WishListService {
	@Autowired WishListMapper map;

	@Override
	public List<WishlistVO> WishListSearch(String id) {
		return map.WishListSearch(id);
	}

}
