package co.makeu.up.sugang.service;



//import java.util.Date;
import java.sql.Date;
import org.springframework.format.annotation.DateTimeFormat;

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
	
	//for extended
	private int num;
	
	//for join
	private String ttl;
	private String thumb;
	private int cnt;
	private String kitName;
	private String kitIntro;
	private int kitPrc;
	private String intro;
	private String creId;
	private Date reqDate;
	private String rfStCode;
	private String content;
	
	// progress
	private int progPct;
	
	// for search
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date regDateSearch;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date expDateSearch;
}
