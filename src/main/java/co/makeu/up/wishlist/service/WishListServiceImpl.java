package co.makeu.up.wishlist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("wishListDao")
public class WishListServiceImpl implements WishListService {
	
	@Autowired WishListMapper map;

	@Override
	public List<WishlistVO> WishListSearch(WishlistVO vo) {
		return map.WishListSearch(vo);
	}
	
	@Override
	public int WishListCnt() {
		return map.WishListCnt();
	}

	@Override
	public int deleteWishList(List<Integer> ltNoArr, String id) {
		for(int value : ltNoArr) {
			map.deleteWishList(value, id);
		}
		return 0;
	}

	@Override
	public int heartDelete(WishlistVO vo) {
		return map.deleteWishList(vo.getLtNo(), vo.getId());
	}

	@Override
	public int heartInsert(WishlistVO vo) {
		return map.heartInsert(vo);
	}

}
