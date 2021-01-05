package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.HouseDealDao;
import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HousePageBean;

@Service
public class DealServiceImpl implements DealService {

	@Autowired
	private HouseDealDao housedealdao;
	
	@Override
	public List<HouseDeal> searchAll(HousePageBean bean) throws Exception {
//		 boolean[] types = bean.getSearchType();
//	       int cnt=0;
//	       for(boolean t : types) {
//	          if(t) {
//	             cnt++;
//	          }
//	       }
//	       if(cnt==0) {
//	          throw new Exception();
//	       }
		return housedealdao.searchAll(bean);
	}

	@Override
	public HouseDeal search(int no) {
		// TODO Auto-generated method stub
		return housedealdao.search(no);
	}

	@Override
	public List<HouseDeal> searchAllapt(HousePageBean bean) throws Exception {
		// TODO Auto-generated method stub
		return housedealdao.searchAllapt(bean);
	}
	
	@Override
	public List<HouseDeal> searchAlldong(HousePageBean bean) throws Exception {
		// TODO Auto-generated method stub
		return housedealdao.searchAlldong(bean);
	}


}
