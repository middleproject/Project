package com.sist.vo;

public class IngreVO {
/*
 * CREATE TABLE Ingre(
IngreNo NUMBER,
IngreName VARCHAR2(500) CONSTRAINT ingre_name_nn NOT NULL,
IngrePoster VARCHAR2(4000) CONSTRAINT ingre_poster_nn NOT NULL,
IngreInfo VARCHAR2(4000) CONSTRAINT ingre_info_nn NOT NULL,
CONSTRAINT ingre_no_pk PRIMARY KEY(ingreno)
);
 */
	private int ingreno;
	private String ingrename;
	private String ingreposter;
	private String ingreinfo;
	public int getIngreno() {
		return ingreno;
	}
	public void setIngreno(int ingreno) {
		this.ingreno = ingreno;
	}
	public String getIngrename() {
		return ingrename;
	}
	public void setIngrename(String ingrename) {
		this.ingrename = ingrename;
	}
	public String getIngreposter() {
		return ingreposter;
	}
	public void setIngreposter(String ingreposter) {
		this.ingreposter = ingreposter;
	}
	public String getIngreinfo() {
		return ingreinfo;
	}
	public void setIngreinfo(String ingreinfo) {
		this.ingreinfo = ingreinfo;
	}
	
	
}
