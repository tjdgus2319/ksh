package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.QnADAO;
import com.ssafy.happyhouse.dto.QnA;

@Service
public class QnAServiceImpl implements QnAService {

	@Autowired
	private QnADAO dao;
	// 전체조회
	@Override
	public List<QnA> retrieveQnAall() {
		return dao.selectQnAall();
	}
	// 상세조회
	@Override
	public QnA retrieveQnA(int qnaNo) {
		return dao.selectQnA(qnaNo) ;
	}
	// 등록
	@Override
	public boolean insertQnA(QnA qna) {
		
		return dao.insertQnA(qna) ==1 ;
	}
	// 수정
	@Override
	public boolean updateQnA(QnA qna) {
		// TODO Auto-generated method stub
		return dao.updateQnA(qna) ==1 ;
	}
	// 삭제
	@Override
	public boolean deleteQnA(int qnaNo) {
		// TODO Auto-generated method stub
		return dao.deleteQnA(qnaNo)==1;
	}

}
