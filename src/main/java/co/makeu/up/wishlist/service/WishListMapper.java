package co.makeu.up.wishlist.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface WishListMapper {
	List<WishlistVO> WishListSearch(WishlistVO vo);
	int WishListCnt();
	//int deleteWishList(WishlistVO vo);
	int deleteWishList(@Param("ltNo") int temp, @Param("id") String tempId);//단건 삭제
	int heartInsert(WishlistVO vo); //단건 추가
	
}
