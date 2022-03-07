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
	private Date startDate;
	private Date endDate;
	private int page;
	private int length;
	
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
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
}

