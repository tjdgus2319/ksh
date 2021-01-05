package com.ssafy.happyhouse.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IdCheckDAO {

	public int idCheck(String idFromAjax) throws Exception;

}
