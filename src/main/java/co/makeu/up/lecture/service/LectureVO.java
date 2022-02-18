package co.makeu.up.lecture.service;

import java.sql.Date;

import lombok.Data;

@Data
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
	private int kitPrc;
	private String tag1;
	private String tag2;
	private String tag3;
	private Date reqDate;
	private String ltStCode;
	private Date expDate;
	private Date startDate;
}
