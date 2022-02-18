package co.makeu.up.detacode.service;

import java.sql.Date;

import lombok.Data;

@Data
public class detaCodeVO {
	private String name;
	private String desc;
	private String useYn;
	private Date regDate;
	private Date modDate;
	private String codeId;
	private String detaId;
}
