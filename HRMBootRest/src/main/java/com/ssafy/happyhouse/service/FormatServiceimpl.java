package com.ssafy.happyhouse.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.FormatDAO;

@Service
public class FormatServiceimpl implements FormatService {

	@Autowired
	public FormatDAO fdao;
	
	@Override
	public int idCheck(String idFromAjax) throws Exception {
		return fdao.idCheck(idFromAjax);
	}

}
