package com.ssafy.happyhouse.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.BoardDao;
import com.ssafy.happyhouse.dto.Board;

@Service
public class BoardServiceimpl implements BoardService {

	@Autowired
	private BoardDao boarddao;

	@Override
	public void brdRegist(Board dto) throws Exception {
		boarddao.brdRegist(dto);
		
	}

	@Override
	public ArrayList<Board> brdList() throws Exception {
		
		return boarddao.brdList();
	}

	@Override
	public Board brdDetail(String articleno) throws Exception {
		// TODO Auto-generated method stub
		return boarddao.brdDetail(articleno);
	}

	@Override
	public void brdModify(Board dto) throws Exception {
		// TODO Auto-generated method stub
		boarddao.brdModify(dto);
	}

	@Override
	public void brdDelete(String articleno) throws Exception {
		// TODO Auto-generated method stub
		boarddao.brdDelete(articleno);
	}
}
