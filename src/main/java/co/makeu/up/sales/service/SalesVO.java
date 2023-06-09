package co.makeu.up.sales.service;

import java.util.List;

import co.makeu.up.sugang.service.SugangVO;
import lombok.Data;

@Data
public class SalesVO {
	private int year;
	private int pay;
	private int cnt;
	private String selectYear;
	private int month;
	private int mon;
	private String upCtgr;
	private String day;
	private int ages;
	
	private String ctgr;
	private int hc01;
	private int hc02;
	private int hc03;
	private int hc04;
	private int hc05;
	private int hc06;
	private int hc07;
	
	private int rank;
	private String id;
	private String name;
	private int creCnt;
	
	private int woman;
	private int man;
	
	private int age10;
	private int age20;
	private int age30;
	private int age40;	
	private int age50;
	private int age60;
	
	private String ttl;
	private String start;
	private String end;
	
	//FOR MAIN
	private String tableName;	
	private List<SalesVO> countList;
	private List<SugangVO> lectureTop3;
	private List<SugangVO> creatorTop3;
	
	//FOR SEARCH
	private String yearId;
	private String yearName;
	private String monthId;
	private String monthName;

	private String searchYearFlag;
	private String searchMonthFlag;
	
	private String orderYearColumn;
	private String orderYearBy;		
	private String orderMonthColumn;
	private String orderMonthBy;	
	
	//FOR PAGE
	private int length;

	private int pageYearNum;
	private int amountYear;
	private int pageMonthNum;
	private int amountMonth;

	public SalesVO(){
		this(1,10,1,10);
	}
	public SalesVO(int pageYearNum , int amountYear,int pageMonthNum,int amountMonth) {
		this.pageYearNum = pageYearNum;
		this.amountYear = amountYear;
		this.pageMonthNum = pageMonthNum;
		this.amountMonth = amountMonth;
	}	

}
