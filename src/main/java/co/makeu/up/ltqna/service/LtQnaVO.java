package co.makeu.up.ltqna.service;

import java.sql.Date;

//import lombok.Data;


public class LtQnaVO {
	private int qnaNo;
	private String aContent;
	private String qContent;
	private int ltNo;
	private Date aRegDate;
	private Date qRegDate;
	private String qnaStCode;
	private String writer;
	private String yn; // 답변 대기중/전 표시
	
	//확장 vo
	private String name;
	private String myQna;
	
	// page
	private int page;
	// search
	private String writerSearchKey;
	private String contentSearchKey;
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getaContent() {
		return aContent;
	}
	public void setaContent(String aContent) {
		this.aContent = aContent;
	}
	public String getqContent() {
		return qContent;
	}
	public void setqContent(String qContent) {
		this.qContent = qContent;
	}
	public int getLtNo() {
		return ltNo;
	}
	public void setLtNo(int ltNo) {
		this.ltNo = ltNo;
	}
	public Date getaRegDate() {
		return aRegDate;
	}
	public void setaRegDate(Date aRegDate) {
		this.aRegDate = aRegDate;
	}
	public Date getqRegDate() {
		return qRegDate;
	}
	public void setqRegDate(Date qRegDate) {
		this.qRegDate = qRegDate;
	}
	public String getQnaStCode() {
		return qnaStCode;
	}
	public void setQnaStCode(String qnaStCode) {
		this.qnaStCode = qnaStCode;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getYn() {
		return yn;
	}
	public void setYn(String yn) {
		this.yn = yn;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getWriterSearchKey() {
		return writerSearchKey;
	}
	public void setWriterSearchKey(String writerSearchKey) {
		this.writerSearchKey = writerSearchKey;
	}
	public String getContentSearchKey() {
		return contentSearchKey;
	}
	public void setContentSearchKey(String contentSearchKey) {
		this.contentSearchKey = contentSearchKey;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMyQna() {
		return myQna;
	}
	public void setMyQna(String myQna) {
		this.myQna = myQna;
	}
	
}
