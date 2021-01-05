package com.ssafy.happyhouse.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.dto.*;


@Mapper
public interface HouseDealDao {
	
	public List<HouseDeal> searchAll(HousePageBean bean) ;
	public List<HouseDeal> searchAlldong(HousePageBean bean) ;
	public List<HouseDeal> searchAllapt(HousePageBean bean) ;
	public HouseDeal search(int no);
}
