package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.Myareadao;
import com.ssafy.happyhouse.dto.myarea;

@Service
public class Myareaimpl implements Myarea {

	@Autowired
	Myareadao dao;
	@Override
	public List<myarea> showall() {
		return dao.showall();
	}

	@Override
	public int registarea(myarea m) {
		return dao.registarea(m);
	}

}
