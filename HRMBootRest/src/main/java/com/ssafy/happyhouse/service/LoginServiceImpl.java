package com.ssafy.happyhouse.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.LoginDAO;
import com.ssafy.happyhouse.dto.Member;

@Service
public class LoginServiceImpl  implements LoginService{
	
	@Autowired
	LoginDAO logindao;
	
	@Override
	public void joinMember(Member dto) throws Exception {
		
		logindao.joinMember(dto);
	}

	@Override
	public void modify(Member dto) throws Exception {
		logindao.modify(dto);
		
	}

	@Override
	public void delete(String i) throws Exception {
		logindao.delete(i);
		
	}

	@Override
	public String findpw(Member dto) throws Exception {
		return logindao.findpw(dto);
	}

	@Override
	public ArrayList<Member> searchallmember() throws Exception {
		return logindao.searchallmember();
	}

	@Override
	public Member login(Member dto) throws Exception {
		return logindao.login(dto);
	}

}
