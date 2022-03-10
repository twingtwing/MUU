package co.makeu.up.users.service;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;


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
	private String[] uGrdCodeList;
	private String[] creGrdCodeList;
	private String pht;
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date joinDate;
	private Date pastDate;
	private Date recentDate;
	private Integer cnt;
	private int endrow;
	private String orderColumn;
	private String orderBy;
	
	public String getOrderColumn() {
		return orderColumn;
	}
	public void setOrderColumn(String orderColumn) {
		this.orderColumn = orderColumn;
	}
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	public int getEndrow() {
		return endrow;
	}
	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}
	public String[] getCreGrdCodeList() {
		return creGrdCodeList;
	}
	public void setCreGrdCodeList(String[] creGrdCodeList) {
		this.creGrdCodeList = creGrdCodeList;
	}
	public Integer getCnt() {
		return cnt;
	}
	public void setCnt(Integer cnt) {
		this.cnt = cnt;
	}
	public String[] getuGrdCodeList() {
		return uGrdCodeList;
	}
	public void setuGrdCodeList(String[] uGrdCodeList) {
		this.uGrdCodeList = uGrdCodeList;
	}
	public Date getRecentDate() {
		return recentDate;
	}
	public void setRecentDate(Date recentDate) {
		this.recentDate = recentDate;
	}
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
	
	// for pagination
	private int page;

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
