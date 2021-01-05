package com.ssafy.happyhouse.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.dto.Member;

@Mapper
public interface LoginDAO {

	public void joinMember(Member dto) throws Exception;
	public void modify(Member dto) throws Exception;
	public void delete(String i) throws Exception;
	public String findpw(Member dto) throws Exception;
	public ArrayList<Member> searchallmember() throws Exception;
	public Member login(Member dto) throws Exception;

}
