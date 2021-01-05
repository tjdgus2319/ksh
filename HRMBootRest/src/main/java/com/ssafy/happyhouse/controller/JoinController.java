package com.ssafy.happyhouse.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.ssafy.happyhouse.dto.Member;
import com.ssafy.happyhouse.service.LoginService;


@Controller
public class JoinController {


	@Autowired
	public LoginService service;
	
	@PostMapping("/join_member.do")
	public @ResponseBody int JoinMember(@ModelAttribute Member dto) {
		try {
			System.out.println(dto.getUsername() +" !!");
			service.joinMember(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 1;
	}
	
	@PostMapping("/login.do")
	public @ResponseBody ResponseEntity<Member> Login(@RequestParam("mbr_id") String id ,@RequestParam("mbr_pwd") String pwd , HttpSession hs) {
		Member dto = new Member();
		dto.setUserid(id); dto.setUserpwd(pwd);
		try {
			dto = service.login(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(dto.getUserid() != null && !(dto.getUserid().trim().equals(""))) {
			hs.setAttribute("user_session", dto);
			System.out.println("로그인완료123");
		}
		return new ResponseEntity<Member>(HttpStatus.OK);
	}
	
	@PostMapping("/logout.do")
	public @ResponseBody int Logout(HttpSession hs) {
		System.out.println("로그아웃호출");
		hs.invalidate();
		return 1;
	}

	@PostMapping("/delete.do")
	public  @ResponseBody int delete(@RequestParam("mbr_id") String mbr_id) {
		try {
			service.delete(mbr_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 1;
	}
	
	@PostMapping("/find_pw.do")
	public @ResponseBody String findpw(@RequestParam String mbr_id , @RequestParam String mbr_tel , @RequestParam String mbr_email , HttpSession hs ) {
		Member m = new Member();
		m.setUserid(mbr_id);
		m.setTelephone(mbr_tel);
		m.setEmail(mbr_email);
		String pw = null;
		try {
			return service.findpw(m);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pw;
	}

	@PostMapping("/modify.do")
	public @ResponseBody int modify(@ModelAttribute Member m ) {
		try {
			service.modify(m);
			return 1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
}
