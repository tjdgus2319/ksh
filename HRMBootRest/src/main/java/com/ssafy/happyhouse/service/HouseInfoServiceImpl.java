package com.ssafy.happyhouse.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.HouseInfoDao;
import com.ssafy.happyhouse.dto.HouseInfo;

@Service
public class HouseInfoServiceImpl implements HouseInfoService {

	@Autowired
	private HouseInfoDao houseinfodao;
	
	
	@Override
	public HouseInfo searchHouseInfo(HouseInfo h) throws SQLException {
		
		return houseinfodao.searchHouseInfo(h);
	}

	
}
