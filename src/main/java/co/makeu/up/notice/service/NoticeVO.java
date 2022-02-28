package co.makeu.up.notice.service;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeVO {
	private int ntNo;
	private Date wrDate;
	private String ttl;
	private String content;
	private int hits;
	private int ltNo;
	private int fileNo;
	private Date modDate;
	
	// for pagination
	private int page;
	// for search
	private String ttlSearchKey;
	private String contentSearchKey;
}
