package com.ssafy.happyhouse.service;

import java.util.ArrayList;

import com.ssafy.happyhouse.dto.Member;

public interface LoginService {

	public void joinMember(Member dto) throws Exception;
	public void modify(Member dto) throws Exception;
	public void delete(String i) throws Exception;
	public String findpw(Member dto) throws Exception;
	public ArrayList<Member> searchallmember() throws Exception;
	public Member login(Member dto) throws Exception;
}
