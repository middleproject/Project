package com.sist.vo;
import java.util.*;
public class ImgBoardVO {
/*	CREATE TABLE imgboard(
			no NUMBER,
			name VARCHAR2(34) CONSTRAINT ib_name_nn NOT NULL,
			content CLOB CONSTRAINT ib_cont_nn NOT NULL,
			pwd VARCHAR2(10) CONSTRAINT ib_pwd_nn NOT NULL,
			regdate DATE DEFAULT SYSDATE,
			filename VARCHAR2(260),
			filesize NUMBER,
			CONSTRAINT ib_no_pk PRIMARY KEY(no)
		);*/
	
	private int no;
	private String name;
	private String content;
	private String pwd;
	private String filename;
	private int filesize;
	private String dbday;
	private Date day;
	
	
	public Date getDay() {
		return day;
	}
	public void setDay(Date day) {
		this.day = day;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	
	
}
