package co.makeu.up.refund.service;

import java.sql.Date;

import lombok.Data;

@Data
public class RefundVO {
	private Date reqDate;
	private String content;
	private String rfStCode;
	private int tlsnNo;
}
