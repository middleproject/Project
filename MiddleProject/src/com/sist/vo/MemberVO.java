package com.sist.vo;

import java.util.*;
/*
 * "ID" VARCHAR2(500 BYTE), 
	"PWD" VARCHAR2(20 BYTE) CONSTRAINT "MEMBER_PWD_NN" NOT NULL ENABLE, 
	"NAME" VARCHAR2(20 BYTE) CONSTRAINT "MEMBER_NAME_NN" NOT NULL ENABLE, 
	"EMAIL" VARCHAR2(40 BYTE), 
	"TEL" VARCHAR2(10 BYTE), 
	"PHONE" VARCHAR2(15 BYTE) CONSTRAINT "MEMBER_PHONE_NN" NOT NULL ENABLE, 
	"ADDR1" VARCHAR2(100 BYTE) CONSTRAINT "MEMBER_ADDR1_NN" NOT NULL ENABLE, 
	"ADDR2" VARCHAR2(100 BYTE), 
	"SEX" VARCHAR2(10 BYTE), 
	"ADMIN" NUMBER DEFAULT 0, 
	"PAY" NUMBER DEFAULT 0, 
 */

public class MemberVO {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String tel;
	private String phone;
	private String addr1;	// zipcode
	private String addr2;	// 상세주소
	private String sex;	// 남자, 여자
	private int admin;	// 0: 일반유저, 1: 관리자, 2: 셰프
	private int pay;
	private String msg;	// NOID OK NOPWD
	private Date birthday;
	private String poster;
	private int reserveCount;
	
	
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	
	public int getReserveCount() {
		return reserveCount;
	}
	public void setReserveCount(int reserveCount) {
		this.reserveCount = reserveCount;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	
	
}
