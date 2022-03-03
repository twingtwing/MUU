package co.makeu.up.refund.service;

import java.sql.Date;

import lombok.Data;

@Data
public class RefundVO {
	private Date reqDate;
	private String content;
	private String rfStCode;
	private int tlsnNo;
	
	//크리에이터와 관리자를 위한 VO객체 확보(문의는 박정욱에게)
	private String id;
	private int pay;
	private Date regDate;
	private String ttl;
	private String cre_id;
	private int count;
	private int ltNo;
	
	// 페이지네이션을 위한 vo객체
	private int page;
	
	// 검색을 위한 객체
	private String ttlSearchKey;
	private String contentSearchKey;
	private String idSearchKey;

	
}
