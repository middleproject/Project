package com.sist.vo;

public class BoardCategoryVO {
	private int categoryno; //나누는 게시판의 카테고리번호 PK
	private String categoryname; //게시판의 이름
	
	public int getCategoryno() {
		return categoryno;
	}
	public void setCategoryno(int categoryno) {
		this.categoryno = categoryno;
	}
	public String getCategoryname() {
		return categoryname;
	}
	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}
}
