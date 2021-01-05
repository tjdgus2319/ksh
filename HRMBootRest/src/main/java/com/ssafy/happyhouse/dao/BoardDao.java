package com.ssafy.happyhouse.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.dto.Board;


@Mapper
public interface BoardDao {

	public void brdRegist(Board dto) throws Exception;

	public ArrayList<Board> brdList() throws Exception;

	public Board brdDetail(String articleno) throws Exception;

	public void brdModify(Board dto) throws Exception;

	public void brdDelete(String articleno) throws Exception;

}
