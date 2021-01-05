package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.Shop;

public interface ShopService {

	public List<Shop> ShopList(HouseInfo h);
}
