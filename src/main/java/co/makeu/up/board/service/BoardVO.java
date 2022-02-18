package co.makeu.up.board.service;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int bNo;
	private String ttl;
	private String content;
	private String bStCode;
	private Date wrDate;
	private int hits;
	private int fileNo;
}
