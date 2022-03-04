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
	private String name;
	private String start;
	private String end;
	
	private String addr;
	private int zip;
	private String deta_addr;
	
	
	// 페이지네이션을 위한 vo객체
	private int page;
	
	// 검색을 위한 객체
	private String ttlSearchKey;
	private String contentSearchKey;
	private String idSearchKey;
	
	// 어드민 페이지네이션을 위한 객체
	private int pageNum;
	private int amount;
	private int length;
	
	public RefundVO(){
		this (1,10);
	}
	public RefundVO(int pageNum , int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
}
