package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.ShopDao;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.Shop;

@Service
public class ShopServiceimpl implements ShopService {

	@Autowired
	ShopDao dao;
	
	@Override
	public List<Shop> ShopList(HouseInfo h) {
		return dao.ShopList(h);
	}

}
