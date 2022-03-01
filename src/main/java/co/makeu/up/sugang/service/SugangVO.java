package co.makeu.up.sugang.service;

import java.sql.Date;

import lombok.Data;

@Data
public class SugangVO {
	private int tlsnNo;
	private String id;
	private int ltNo;
	private Date regDate;
	private int usePoint;
	private String tlsnStCode;
	private String shipStCode;
	private String rtnContent;
	private String shipNum;
	private int pay;
	private int zip;
	private String addr;
	private String detaAddr;
	private String tel;
	private Date expDate;
	
	// for join
	private String ttl;
	private String thumb;
	private int cnt;
	
	// progress
	private int progPct;
}
