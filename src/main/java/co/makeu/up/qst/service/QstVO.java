package co.makeu.up.qst.service;

import java.sql.Date;

public class QstVO {
	private int qstNo;
	private String ttl;
	private String content;
	private String ttlContent;
	private Date qRegDate;
	private String wirter;
	private String writer;
	private String aContent;
	private Date aRegDate;
	private String email;
	private String qstStCode;
	private String startDate;
	private String endDate;
	private int page;
	private int length;
	private int endrow;
	private String orderColumn;
	private String orderBy;
	
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
	public int getEndrow() {
		return endrow;
	}
	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}
	public int getLength() {
		return length;
	}
	public void setLength(int length) {
		this.length = length;
	}
	public int getQstNo() {
		return qstNo;
	}
	public void setQstNo(int qstNo) {
		this.qstNo = qstNo;
	}
	public String getTtl() {
		return ttl;
	}
	public void setTtl(String ttl) {
		this.ttl = ttl;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTtlContent() {
		return ttlContent;
	}
	public void setTtlContent(String ttlContent) {
		this.ttlContent = ttlContent;
	}
	public Date getqRegDate() {
		return qRegDate;
	}
	public void setqRegDate(Date qRegDate) {
		this.qRegDate = qRegDate;
	}
	public String getWirter() {
		return wirter;
	}
	public void setWirter(String wirter) {
		this.wirter = wirter;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getaContent() {
		return aContent;
	}
	public void setaContent(String aContent) {
		this.aContent = aContent;
	}
	public Date getaRegDate() {
		return aRegDate;
	}
	public void setaRegDate(Date aRegDate) {
		this.aRegDate = aRegDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQstStCode() {
		return qstStCode;
	}
	public void setQstStCode(String qstStCode) {
		this.qstStCode = qstStCode;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
}

