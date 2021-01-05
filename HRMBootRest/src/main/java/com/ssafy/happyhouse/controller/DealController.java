package com.ssafy.happyhouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HousePageBean;
import com.ssafy.happyhouse.service.DealService;

@Controller
public class DealController {

	@Autowired
	private DealService Dealservice;
	
	@GetMapping("/qna.do")
	private String QnApage() {
		System.out.println("--qna call--");
		return "QNA";
	}
	
			
	@GetMapping("/searchall.do")
	private String searchall(Model m, @RequestParam String[] type, @RequestParam("word") String word, @RequestParam("key") String key) throws Exception{
		HousePageBean bean = new HousePageBean();
//		boolean[] type = new boolean[4];
//		for (int i = 0, len=types.length; i < len; i++) {
//			switch (types[i]) {
//			case "APT_DEAL":	type[0]=true;	break;
//			case "APT_RENT":	type[1]=true;	break;
//			case "HOUSE_DEAL":	type[2]=true;	break;
//			case "HOUSE_RENT":	type[3]=true;	break;
//			}
//		}
//		bean.setSearchType(type);
		word = word.trim();
		key = key.trim();
		if(!word.isEmpty()) {
			if(key.equals("dong"))
			{
				bean.setDong(word);
			    m.addAttribute("deals", Dealservice.searchAlldong(bean));
			}
			else if(key.equals("aptname"))
			{
				bean.setAptname(word);
			    m.addAttribute("deals", Dealservice.searchAllapt(bean));
			}
		}
		else
		    m.addAttribute("deals", Dealservice.searchAll(bean));

		System.out.println("apt= "+bean.getAptname() +" dong= "+ bean.getDong());

		return "about";
	}
	
	@GetMapping("/searchdetail.do")
	private String search(Model m ,int no){
		HouseDeal temp = Dealservice.search(no);
		m.addAttribute("deal",temp);
	    return "searchforlat.do";
	}
	
}
