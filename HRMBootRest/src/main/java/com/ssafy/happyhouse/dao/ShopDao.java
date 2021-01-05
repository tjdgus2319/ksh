package com.ssafy.happyhouse.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.Shop;

@Mapper
public interface ShopDao {

	public List<Shop> ShopList(HouseInfo h);
}
