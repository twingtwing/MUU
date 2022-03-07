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

	private String start;
	private String end;
	
	private int length;
	private int pageNum;
	private int amount;

	public FaqVO(){
		this (1,10);
	}
	public FaqVO(int pageNum , int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
