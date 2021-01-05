package com.ssafy.happyhouse.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SelectKeyDAO {

	public ArrayList<String> makeSearchList(String searchWordFromAjax) throws Exception;

}
