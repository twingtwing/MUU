package co.makeu.up.files.service;

import java.sql.Date;

import lombok.Data;

@Data
public class FilesVO {
	private int fileNo;
	private Date wrDate;
	private String useYn;
	private String filePath;
	private String phyPath;
}
