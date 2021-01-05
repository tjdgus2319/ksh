package com.ssafy.happyhouse.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FormatDAO {

	public int idCheck(String idFromAjax) throws Exception;

}
