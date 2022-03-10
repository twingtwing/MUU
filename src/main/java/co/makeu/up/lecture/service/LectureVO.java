package co.makeu.up.lecture.service;

import java.sql.Date;

import lombok.Data;

public class LectureVO {
	private int ltNo;
	private String creId;
	private String ttl;
	private String intro;
	private String upCtgr;
	private String downCtgr;
	private String thumb;
	private String pht1;
	private String pht2;
	private String pht3;
	private int openTerm;
	private int tlsnTerm;
	private int prc;
	private String kitName;
	private String kitIntro;
	private String kitPrc;
	private String tag1;
	private String tag2;
	private String tag3;
	private Date reqDate;
	private String ltStCode;
	private Date expDate;
	private Date startDate;
	private float avgStar;
	private int studentCount;
	private int endrow;
	private String orderColumn;
	private String orderBy;
	
	
	public int getEndrow() {
		return endrow;
	}
	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}
	public String getOrderColumn() {
		return orderColumn;
	}
	public void setOrderColumn(String orderColumn) {
		this.orderColumn = orderColumn;
	}
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	
	//extended vo --> 딴데서 재활용해도됨
	private int star;//별점 평균
	private int rCount;//별점 갯수
	private String wash;//워시리스트 여부
	private int wCount;//워시리스트 갯수
	private String name;//크리에이터 이름
	private String pht;//크리에이터 사진
	private String creIntro;//크리에이터 소개
	private String mySugang;//내 수강 영부
	private String ltStCodeName;
	private Date endDate;
	private String ctgrId;

	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getLtStCodeName() {
		return ltStCodeName;
	}
	public void setLtStCodeName(String ltStCodeName) {
		this.ltStCodeName = ltStCodeName;
	}
	// 검색 시 사용
	private Date pastDate;
	private Date recentDate;
	private int count;
	private String[] ltStCodeList;
	private int cnt; // 수강인원
	private int sales; // 강의별 매출액
	
	//관리자 강의 관리를 위한 VO객체 선언 - 문의는 박정욱에게
	private int page;
	private int pageNum;
	private int amount;
	private int length;
	private String start;
	private String end;
	private String lowCtgr;
	private String highCtgr;
	
	public LectureVO(){
		this (1,10);
	}
	public LectureVO(int pageNum , int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	

	public String getLowCtgr() {
		return lowCtgr;
	}
	public void setLowCtgr(String lowCtgr) {
		this.lowCtgr = lowCtgr;
	}
	public String getHighCtgr() {
		return highCtgr;
	}
	public void setHighCtgr(String highCtgr) {
		this.highCtgr = highCtgr;
	}		
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public int getPageNum() {
		return pageNum;
	}

	public String[] getLtStCodeList() {
		return ltStCodeList;
	}
	public void setLtStCodeList(String[] ltStCodeList) {
		this.ltStCodeList = ltStCodeList;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Date getPastDate() {
		return pastDate;
	}
	public void setPastDate(Date pastDate) {
		this.pastDate = pastDate;
	}
	public Date getRecentDate() {
		return recentDate;
	}
	public void setRecentDate(Date recentDate) {
		this.recentDate = recentDate;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getLength() {
		return length;
	}
	public void setLength(int length) {
		this.length = length;
	}
			
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public int getLtNo() {
		return ltNo;
	}
	public void setLtNo(int ltNo) {
		this.ltNo = ltNo;
	}
	public String getCreId() {
		return creId;
	}
	public void setCreId(String creId) {
		this.creId = creId;
	}
	public String getTtl() {
		return ttl;
	}
	public void setTtl(String ttl) {
		this.ttl = ttl;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getUpCtgr() {
		return upCtgr;
	}
	public void setUpCtgr(String upCtgr) {
		this.upCtgr = upCtgr;
	}
	public String getDownCtgr() {
		return downCtgr;
	}
	public void setDownCtgr(String downCtgr) {
		this.downCtgr = downCtgr;
	}
	public String getThumb() {
		return thumb;
	}
	public void setThumb(String thumb) {
		this.thumb = thumb;
	}
	public String getPht1() {
		return pht1;
	}
	public void setPht1(String pht1) {
		this.pht1 = pht1;
	}
	public String getPht2() {
		return pht2;
	}
	public void setPht2(String pht2) {
		this.pht2 = pht2;
	}
	public String getPht3() {
		return pht3;
	}
	public void setPht3(String pht3) {
		this.pht3 = pht3;
	}
	public int getOpenTerm() {
		return openTerm;
	}
	public void setOpenTerm(int openTerm) {
		this.openTerm = openTerm;
	}
	public int getTlsnTerm() {
		return tlsnTerm;
	}
	public void setTlsnTerm(int tlsnTerm) {
		this.tlsnTerm = tlsnTerm;
	}
	public int getPrc() {
		return prc;
	}
	public void setPrc(int prc) {
		this.prc = prc;
	}
	public String getKitName() {
		return kitName;
	}
	public void setKitName(String kitName) {
		this.kitName = kitName;
	}
	public String getKitIntro() {
		return kitIntro;
	}
	public void setKitIntro(String kitIntro) {
		this.kitIntro = kitIntro;
	}
	public String getKitPrc() {
		return kitPrc;
	}
	public void setKitPrc(String kitPrc) {
		this.kitPrc = kitPrc;
	}
	public String getTag1() {
		return tag1;
	}
	public void setTag1(String tag1) {
		this.tag1 = tag1;
	}
	public String getTag2() {
		return tag2;
	}
	public void setTag2(String tag2) {
		this.tag2 = tag2;
	}
	public String getTag3() {
		return tag3;
	}
	public void setTag3(String tag3) {
		this.tag3 = tag3;
	}
	public Date getReqDate() {
		return reqDate;
	}
	public void setReqDate(Date reqDate) {
		this.reqDate = reqDate;
	}
	public String getLtStCode() {
		return ltStCode;
	}
	public void setLtStCode(String ltStCode) {
		this.ltStCode = ltStCode;
	}
	public Date getExpDate() {
		return expDate;
	}
	public void setExpDate(Date expDate) {
		this.expDate = expDate;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public float getAvgStar() {
		return avgStar;
	}
	public void setAvgStar(float avgStar) {
		this.avgStar = avgStar;
	}
	public int getStudentCount() {
		return studentCount;
	}
	public void setStudentCount(int studentCount) {
		this.studentCount = studentCount;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public int getrCount() {
		return rCount;
	}
	public void setrCount(int rCount) {
		this.rCount = rCount;
	}
	public String getWash() {
		return wash;
	}
	public void setWash(String wash) {
		this.wash = wash;
	}
	public int getwCount() {
		return wCount;
	}
	public void setwCount(int wCount) {
		this.wCount = wCount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPht() {
		return pht;
	}
	public void setPht(String pht) {
		this.pht = pht;
	}
	public String getCreIntro() {
		return creIntro;
	}
	public void setCreIntro(String creIntro) {
		this.creIntro = creIntro;
	}
	public String getMySugang() {
		return mySugang;
	}
	public void setMySugang(String mySugang) {
		this.mySugang = mySugang;
	}

	public String getCtgrId() {
		return ctgrId;
	}
	public void setCtgrId(String ctgrId) {
		this.ctgrId = ctgrId;
	}
	
	
	
}
