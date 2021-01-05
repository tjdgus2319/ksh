package com.ssafy.happyhouse.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.dto.HouseInfo;

public interface HouseInfoService {


	public HouseInfo searchHouseInfo(HouseInfo h) throws  SQLException;
}
