package co.makeu.up.board.service;

import java.sql.Date;
import java.util.List;

import co.makeu.up.detafile.service.DetafileVO;
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
	private int nextbno;
	private int prebno;
	private String nextbttl;
	private String prebttl;
	private int length;
	private String start;
	private String end;
	private String mix;
	private String searchFlag;
	
	private List<DetafileVO> detaFileList;

	private int pageNum;
	private int amount;
	
	private String orderColumn;
	private String orderBy;

	public BoardVO(){
		this (1,10);
	}
	public BoardVO(int pageNum , int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
