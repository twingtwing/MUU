package co.makeu.up.wishlist.service;

import lombok.Data;

@Data
public class WishlistVO {
	private String id;
	private int ltNo;

	// 조인해서 들고왔는데 값을 넣을 그릇이 없어서 만드는 vo객체들
	private String ttl;
	private String intro;
	private int prc;
	private String ltStCode;
	
	// 페이지네이션을 위한 vo객체
	private int page;

}
