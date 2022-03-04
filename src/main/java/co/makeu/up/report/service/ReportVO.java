package co.makeu.up.report.service;

import java.sql.Date;

import lombok.Data;

@Data
public class ReportVO {
	private int rpNo;
	private String reporter;
	private int ltNo;
	private String ctgr;
	private String content;
	private String rpStCode;
	private int num; // 리뷰번호
	private String type;
	private Date rpDate;
}
