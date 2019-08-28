package com.sist.vo;
/*
 * No NUMBER,
ino NUMBER,
mno NUMBER,
IngreDetailName VARCHAR2(50) CONSTRAINT ingrede_name_nn NOT NULL,
unit VARCHAR2(100),
price NUMBER DEFAULT 0,
 */
public class IngredetailVO {
	private int no;
	private int ino;
	private int mno;
	private String ingredetailname;
	private String unit;
	private int price;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getIno() {
		return ino;
	}
	public void setIno(int ino) {
		this.ino = ino;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getIngredetailname() {
		return ingredetailname;
	}
	public void setIngredetailname(String ingredetailname) {
		this.ingredetailname = ingredetailname;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

}
