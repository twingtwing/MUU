package co.makeu.up.users.service;

import java.sql.Date;

import lombok.Data;

@Data
public class UsersVO {
	private String id;
	private String pw;
	private String name;
	private String birthDate; 
	private String tel;
	private String gender;
	private int zip;
	private String addr;
	private String detaAddr;
	private String socialToken;
	private String authCode;
	private String uGrdCode;
	private String pht;
	private Date joinDate;
	private String uStCode;
	private int point;
	private String creIntro;
	private String creGrdCode;
	private String socialCode;
}
