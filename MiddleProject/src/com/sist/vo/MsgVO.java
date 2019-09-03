package com.sist.vo;

public class MsgVO {
	private int msgno;
	private String content;
	private String sub;
	private String memberid;
	private String id;
	private int read;
	private String day;
	private int del;
	private int sendDel;
	
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public int getSendDel() {
		return sendDel;
	}
	public void setSendDel(int sendDel) {
		this.sendDel = sendDel;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public int getMsgno() {
		return msgno;
	}
	public void setMsgno(int msgno) {
		this.msgno = msgno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSub() {
		return sub;
	}
	public void setSub(String sub) {
		this.sub = sub;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getRead() {
		return read;
	}
	public void setRead(int read) {
		this.read = read;
	}
	
}
