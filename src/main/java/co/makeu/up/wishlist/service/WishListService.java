package co.makeu.up.wishlist.service;

import java.util.List;

public interface WishListService {
	List<WishlistVO> WishListSearch(WishlistVO vo);
	int WishListCnt();
	int deleteWishList(List<Integer> ltNoArr, String id);
	
	int heartDelete(WishlistVO vo); //단건 삭제
	int heartInsert(WishlistVO vo); //단건 추가
}
