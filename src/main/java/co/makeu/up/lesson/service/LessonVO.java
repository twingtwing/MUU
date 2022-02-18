package co.makeu.up.lesson.service;

import java.sql.Date;

import lombok.Data;

@Data
public class LessonVO {
	private int lsnNo;
	private String ttl;
	private String lsnFile;
	private int ltNo;
	private Date regDate;
	private Date modDate;
	private String lsnTime;
}
