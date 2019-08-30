package com.sist.model;

import java.sql.Date;
import java.text.SimpleDateFormat;

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
		if (vo.getMsg().equals("OK")) {
			HttpSession session = model.getRequest().getSession();
			session.setAttribute("id", id);
			session.setAttribute("name", vo.getName());
			session.setAttribute("admin", vo.getAdmin());
		}
		System.out.println("아이디:" + id);
		System.out.println("이름:" + vo.getName());
		System.out.println("구분:" + vo.getAdmin());

		model.addAttribute("result", vo.getMsg()); // OK,NOID,NOPWD
		return "../member/signIn_ok.jsp";
	}

	@RequestMapping("member/signUp.do")
	public String member_signUp(Model model) {
		model.addAttribute("main_jsp", "../member/signUp.jsp");
		return "../main/main.jsp";
	}

	// 로그아웃
	@RequestMapping("member/logout.do")
	public String member_logout(Model model) {
		HttpSession session = model.getRequest().getSession();
		session.invalidate();// session에 저장된 모든 데이터 삭제 => id=null,admin=null
		return "redirect:../main/main.do";
	}

	// 회원가입
	@RequestMapping("member/signUp_ok.do")
	public String member_signUp_ok(Model model) {
		try {
			model.getRequest().setCharacterEncoding("UTF-8");
		} catch (Exception e) {
		}

		String id = model.getRequest().getParameter("id"); // 아이디
		String pwd = model.getRequest().getParameter("pwd"); // 비밀번호
		String name = model.getRequest().getParameter("name"); // 이름
		String sex = model.getRequest().getParameter("sex"); // 성별
		String email1 = model.getRequest().getParameter("email1");
		String email2 = model.getRequest().getParameter("email2");
		// 000-0000-0000
		String tel1 = model.getRequest().getParameter("tel1"); // 집전화
		String tel2 = model.getRequest().getParameter("tel2");
		String tel3 = model.getRequest().getParameter("tel3");
		String phone1 = model.getRequest().getParameter("phone1"); // 휴대폰 전화
		String phone2 = model.getRequest().getParameter("phone2");
		String phone3 = model.getRequest().getParameter("phone3");

		String addr1 = model.getRequest().getParameter("addr1"); // 우편번호
		String addr2 = model.getRequest().getParameter("addr2"); // 상세 주소
		String birthday = model.getRequest().getParameter("birthday"); // 생년월일

		System.out.println(birthday);
		// ============== 변환 =============
		String email = email1 + "@" + email2;
		String tel = tel1 + tel2 + tel3;
		String phone = phone1 + phone2 + phone3;
		// =============== 날짜포맷변환 String->util.date->sql.date ===============
		SimpleDateFormat beforeForm = new SimpleDateFormat("yyyymmdd");
		SimpleDateFormat afterForm = new SimpleDateFormat("yyyy-mm-dd");

		java.util.Date tempDate = null;

		try {
			// yyyymmdd
			tempDate = beforeForm.parse(birthday);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// yyyymmdd-> yyyy-mm-dd
		String transDate = afterForm.format(tempDate);

		Date date = Date.valueOf(transDate);
		// ========================

		MemberVO vo = new MemberVO();

		vo.setId(id);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setEmail(email);
		vo.setTel(tel);
		vo.setPhone(phone);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		vo.setSex(sex);
		vo.setBirthday(date);

		return "../member/signUp_ok.jsp";
	}

	@RequestMapping("member/idFind.do")
	public String memIdFind(Model model) {

		return "../member/idFind.jsp";
	}

	@RequestMapping("member/pwdFind.do")
	public String memPwdFind(Model model) {

		return "../member/pwdFind.jsp";
	}
}
