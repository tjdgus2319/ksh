package com.ssafy.happyhouse.dto;

public class myarea {

	public String id;
	public String si;
	public String gu;
	public String dong;
	public String dongcode;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSi() {
		return si;
	}
	public void setSi(String si) {
		this.si = si;
	}
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getDongcode() {
		return dongcode;
	}
	public void setDongcode(String dongcode) {
		this.dongcode = dongcode;
	}
	
	public myarea() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "myarea [id=" + id + ", si=" + si + ", gu=" + gu + ", dong=" + dong + ", dongcode=" + dongcode + "]";
	}
}
