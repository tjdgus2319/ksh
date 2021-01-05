package com.ssafy.happyhouse.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.SidoCode;

@Mapper
public interface SelectBoxDAO {

	ArrayList<SidoCode> selectSido() throws Exception;

	ArrayList<SidoCode> selectGugun(String sido) throws Exception;

	ArrayList<HouseInfo> selectDong(String gugun) throws Exception;

	ArrayList<HouseInfo> selectApt(String dong) throws Exception;

}
