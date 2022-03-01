package co.makeu.up.wishlist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.makeu.up.notice.service.NoticeVO;

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

}
