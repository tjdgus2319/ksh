package com.ssafy.happyhouse.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.service.HouseInfoService;
import com.ssafy.happyhouse.service.ShopService;

@Controller
public class HouseInfoController {

	@Autowired
	private HouseInfoService houseinfoservice;
	
	@Autowired
	private ShopService shopservice;
	
	@GetMapping("/searchforlat.do")
	private String search(Model m , @RequestParam String dong  , @RequestParam String code , @RequestParam String jibun , HttpSession hs){
		HouseInfo h = new HouseInfo();
		h.setDong(dong); 
		h.setCode(code);
		h.setJibun(jibun);
		System.out.println(h.toString());
		hs.setAttribute("shopinfos", shopservice.ShopList(h));
	try {
		
		m.addAttribute("deal", houseinfoservice.searchHouseInfo(h));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    return "deal/deal";
	}
	
//	@GetMapping("/makeSearchList.do")
//	private @ResponseBody ResponseEntity<List<HouseInfo>> makesearch(){
//		
//	}
	
}
