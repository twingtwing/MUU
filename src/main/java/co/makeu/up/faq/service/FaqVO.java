package co.makeu.up.faq.service;

import java.util.Date;

import lombok.Data;

@Data
public class FaqVO {
	private int fno;
	private String ctgr;
	private String qcontent;
	private String fstcode;
	private Date wrdate;
	private String acontent;	
}
