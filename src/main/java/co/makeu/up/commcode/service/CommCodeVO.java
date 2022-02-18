package co.makeu.up.commcode.service;

import java.sql.Date;

import lombok.Data;

@Data
public class CommCodeVO {
	private String codeId;
	private String codeName;
	private String desct;
	private String useYn;
	private Date regDate;
	private Date modDate;
}
