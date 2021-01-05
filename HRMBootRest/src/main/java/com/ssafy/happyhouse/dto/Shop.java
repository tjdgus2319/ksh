package com.ssafy.happyhouse.dto;

public class Shop {

	public String shopname;
	public String codename1;
	public String address;
	public String getshopname() {
		return shopname;
	}
	public void setshopname(String shopname) {
		this.shopname = shopname;
	}
	public String getcodename1() {
		return codename1;
	}
	public void setcodename1(String codename1) {
		this.codename1 = codename1;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "Shop [shopname=" + shopname + ", codename1=" + codename1 + ", address=" + address + "]";
	}
	
	public Shop() {
		// TODO Auto-generated constructor stub
	}
}
