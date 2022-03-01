package co.makeu.up.wishlist.service;

import java.util.List;

public interface WishListMapper {
	List<WishlistVO> WishListSearch(WishlistVO vo);
	int WishListCnt();
}
