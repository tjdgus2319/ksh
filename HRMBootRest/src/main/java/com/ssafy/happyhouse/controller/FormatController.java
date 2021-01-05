package com.ssafy.happyhouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("/AFormatController")
public class FormatController {

//	@Autowired
//	private AFormatService service;
//	
//	@GetMapping(value = "id_check")
//	public String id_check(Model m) {
//		String idfromajax = (String) m.getAttribute("id_input");
//		int idCount = service.idCheck(idfromajax);
//		return "";
//	}
}
