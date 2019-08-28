package com.sist.model;

import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.Model;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

@Controller("MemberModel")

public class MemberModel {
	@RequestMapping("member/signIn.do")
	public String member_login(Model model) {
		return "../member/signIn.jsp";
	}
	
	@RequestMapping("member/signIn_ok.do")
	public String member_login_ok(Model model) {
		String id = model.getRequest().getParameter("id");
		String pwd = model.getRequest().getParameter("pwd");
		MemberVO vo = MemberDAO.isLogin(id, pwd);
		if(vo.getMsg().equals("OK")) {
			HttpSession session = model.getRequest().getSession();
			session.setAttribute("id", id);
			session.setAttribute("name", vo.getName());
			session.setAttribute("admin", vo.getAdmin());
		}
		System.out.println("아이디:"+id);
		System.out.println("이름:"+ vo.getName());
		System.out.println("구분:"+ vo.getAdmin());
		
		model.addAttribute("result", vo.getMsg());	// OK,NOID,NOPWD
		
		return "../member/signIn_ok.jsp";
	}
	
	@RequestMapping("member/signUp.do")
	public String member_signUp(Model model) {
		return "../member/signUp.jsp";
	}
}
