package co.makeu.up.qst.service;

import java.sql.Date;

import lombok.Data;

@Data
public class QstVO {
	private int qstNo;
	private String ttl;
	private String content;
	private Date qRegDate;
	private String wirter;
	private String aContent;
	private Date aRegDate;
	private String email;
	private String qstStCode;
}
