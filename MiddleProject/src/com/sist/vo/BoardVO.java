package com.sist.vo;

import java.util.*;

public class BoardVO {
	private int boardno; //게시판번호 PK
	private int categoryno; //카테고리번호 BoardCategoryVO의 FK
	private String subject; //제목
	private String content; //내용
	private String addfile; //첨부파일
	private int hit; //좋아요
	private Date day; //작성일
	private String memberid; //작성자 Member의 FK
	private int groupid;
	private int groupstep;
	private int grouptab;
	private int root;
	private int depth;
	private String dbday;
	private String pwd;
	private int num;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public int getCategoryno() {
		return categoryno;
	}
	public void setCategoryno(int categoryno) {
		this.categoryno = categoryno;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAddfile() {
		return addfile;
	}
	public void setAddfile(String addfile) {
		this.addfile = addfile;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Date getDay() {
		return day;
	}
	public void setDay(Date day) {
		this.day = day;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public int getGroupid() {
		return groupid;
	}
	public void setGroupid(int groupid) {
		this.groupid = groupid;
	}
	public int getGroupstep() {
		return groupstep;
	}
	public void setGroupstep(int groupstep) {
		this.groupstep = groupstep;
	}
	public int getGrouptab() {
		return grouptab;
	}
	public void setGrouptab(int grouptab) {
		this.grouptab = grouptab;
	}
	public int getRoot() {
		return root;
	}
	public void setRoot(int root) {
		this.root = root;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
}
