package com.ssafy.happyhouse.service;

import java.util.ArrayList;

import com.ssafy.happyhouse.dto.Board;


public interface BoardService {

	public void brdRegist(Board dto) throws Exception;

	public ArrayList<Board> brdList() throws Exception;

	public Board brdDetail(String articleno) throws Exception;

	public void brdModify(Board dto) throws Exception;

	public void brdDelete(String articleno) throws Exception;
}
