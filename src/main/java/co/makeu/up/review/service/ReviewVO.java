package co.makeu.up.review.service;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private int rvNo;
	private Date wrDate;
	private String rvCode;
	private String content;
	private int star;
	private int ltNo;
	private String writer;
	
	private float avgStar;
	//확장	
	private String myReview;//내 강의
	private String name;
	private String pht;
	private int page;
	private int cnt;
	
}
