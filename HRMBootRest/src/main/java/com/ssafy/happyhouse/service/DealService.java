package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HousePageBean;

public interface DealService {

	public List<HouseDeal> searchAll(HousePageBean bean) throws Exception ;
	public List<HouseDeal> searchAlldong(HousePageBean bean) throws Exception ;
	public List<HouseDeal> searchAllapt(HousePageBean bean) throws Exception ;
	public HouseDeal search(int no);
}
