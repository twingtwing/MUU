package co.makeu.up.faq.service;

import java.util.Date;

import lombok.Data;

@Data
public class FaqVO {
	private int fno;
	private String ctgr;
	private String qcontent;
	private String fstcode;
	private Date wrdate;
	private String acontent;
	
	//for user search
	private String searchttl;

	//for extend
	private String ctgrName;
	private String fstName;
	
	//for search
	private String start;
	private String end;
	private String searchFlag;
	
	//for page
	private int length;
	private int pageNum;
	private int amount;
	
	private String orderColumn;
	private String orderBy;

	public FaqVO(){
		this (1,10);
	}
	public FaqVO(int pageNum , int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
