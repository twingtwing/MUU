package co.makeu.up.ltqna.service;

import java.sql.Date;

import lombok.Data;

@Data
public class LtQnaVO {
	private int qnaNo;
	private String aContent;
	private String qContent;
	private int ltNo;
	private Date aRegDate;
	private Date qRegDate;
	private String qnaStCode;
	private String wirter;
}
