package com.ssafy.happyhouse.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.SelectKeyDAO;

@Service
public class SelectKeyServiceimpl implements SelectKeyService{

	@Autowired
	private SelectKeyDAO selectkeydao;

	@Override
	public ArrayList<String> makeSearchList(String searchWordFromAjax) throws Exception {
		// TODO Auto-generated method stub
		return selectkeydao.makeSearchList(searchWordFromAjax);
	}
	
}
