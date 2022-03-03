package co.makeu.up.users.service;

import java.sql.Date;


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
	private String u_grd_code;
	private String pht;
	private Date joinDate;
	private Date pastDate;
	private Date recentDate;
	public Date getPastDate() {
		return pastDate;
	}
	public void setPastDate(Date pastDate) {
		this.pastDate = pastDate;
	}
	public Date getLastDate() {
		return recentDate;
	}
	public void setLastDate(Date recentDate) {
		this.recentDate = recentDate;
	}
	private String uStCode;
	private int point;
	private String creIntro;
	private String creGrdCode;
	private String socialCode;
	private int age;
	
	private int page; // for pagination
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getZip() {
		return zip;
	}
	public void setZip(int zip) {
		this.zip = zip;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getDetaAddr() {
		return detaAddr;
	}
	public void setDetaAddr(String detaAddr) {
		this.detaAddr = detaAddr;
	}
	public String getSocialToken() {
		return socialToken;
	}
	public void setSocialToken(String socialToken) {
		this.socialToken = socialToken;
	}
	public String getAuthCode() {
		return authCode;
	}
	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}
	public String getuGrdCode() {
		return uGrdCode;
	}
	public void setuGrdCode(String uGrdCode) {
		this.uGrdCode = uGrdCode;
	}
	public String getU_grd_code() {
		return u_grd_code;
	}
	public void setU_grd_code(String u_grd_code) {
		this.u_grd_code = u_grd_code;
	}
	public String getPht() {
		return pht;
	}
	public void setPht(String pht) {
		this.pht = pht;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public String getuStCode() {
		return uStCode;
	}
	public void setuStCode(String uStCode) {
		this.uStCode = uStCode;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getCreIntro() {
		return creIntro;
	}
	public void setCreIntro(String creIntro) {
		this.creIntro = creIntro;
	}
	public String getCreGrdCode() {
		return creGrdCode;
	}
	public void setCreGrdCode(String creGrdCode) {
		this.creGrdCode = creGrdCode;
	}
	public String getSocialCode() {
		return socialCode;
	}
	public void setSocialCode(String socialCode) {
		this.socialCode = socialCode;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
}
