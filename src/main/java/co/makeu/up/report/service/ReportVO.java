package co.makeu.up.report.service;

import java.sql.Date;

import lombok.Data;

@Data
public class ReportVO {
	private int rpNo; // 신고번호
	private String reporter; // 신고자
	private int ltNo; // 강의번호
	private String ctgr; // 카테고리 코드
	private String content; // 신고내용
	private String rpStCode; // 신고상태코드
	private int num; // 리뷰번호
	private String type; // 신고 유형코드
	private Date rpdate; // 신고날짜
	private String ttl; //강의 명
	private String recontent; // 리부내용
	private String creid; // 크리에이터 아디
	private int star; // 별점
	private int cnt; // 신고횟수
	private int length;
	private String start;
	private String end;

	private int pageNum;
	private int amount;
	
	public ReportVO(){
		this (1,10);
	}
	public ReportVO(int pageNum , int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}

