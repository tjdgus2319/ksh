package com.ssafy.happyhouse.dao;

import java.util.List;

import com.ssafy.happyhouse.dto.myarea;

public interface Myareadao {

	public List<myarea> showall();
	public int registarea(myarea m);
		
}
