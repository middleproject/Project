package com.sist.model;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.Cookie;
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
			session.setAttribute("pay", vo.getPay());
			
		}
		/*
		 * System.out.println("아이디:" + id); System.out.println("이름:" +
		 * vo.getName()); System.out.println("구분:" + vo.getAdmin());
		 */

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
		Cookie[] cookies = model.getRequest().getCookies();
		// 쿠키 삭제(수명 0)
		if (cookies != null) {
			for (Cookie c : cookies) {
				c.setMaxAge(0);
				model.getResponse().addCookie(c);
			}
		}

		return "redirect:../main/main.do";
	}

	// 회원가입
	@RequestMapping("member/signUp_ok.do")
	public String member_signUp_ok(Model model) {
		try {
			model.getRequest().setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}

		String id = model.getRequest().getParameter("id"); // 아이디
		String pwd = model.getRequest().getParameter("pwd"); // 비밀번호
		String name = model.getRequest().getParameter("name"); // 이름
		String sex = model.getRequest().getParameter("sex"); // 성별
		String email1 = model.getRequest().getParameter("email1");
		String email2 = model.getRequest().getParameter("email2");
		String tel1 = model.getRequest().getParameter("tel1"); // 집전화
		String tel2 = model.getRequest().getParameter("tel2");
		String tel3 = model.getRequest().getParameter("tel3");
		String phone1 = model.getRequest().getParameter("phone1"); // 휴대폰 전화
		String phone2 = model.getRequest().getParameter("phone2");
		String phone3 = model.getRequest().getParameter("phone3");

		String zipcode = model.getRequest().getParameter("addr1"); // 우편번호
		String addr2 = model.getRequest().getParameter("addr2"); // 주소
		String addr3 = model.getRequest().getParameter("addr3"); // 상세주소
		String exAddr = model.getRequest().getParameter("exAddr"); // 참고항목
		String birthday = model.getRequest().getParameter("birthday"); // 생년월일

		System.out.println("변환 전 birthday: " + birthday);

		// ============== 변환 =============
		String email = email1 + "@" + email2; // aaa@aaa.com
		String tel = tel1 + tel2 + tel3; // 02-222-111
		String phone = phone1 + phone2 + phone3; // 010-2020-1818
		Date date = Date.valueOf(birthday);
		String addr = addr2 + " " + addr3 + " " + exAddr;
		// ========================
		System.out.println("id:" + id);
		System.out.println("pwd:" + pwd);
		System.out.println("name:" + name);
		System.out.println("email:" + email);
		System.out.println("tel:" + tel);
		System.out.println("phone:" + phone);
		System.out.println("addr1:" + zipcode);
		System.out.println("addr2:" + addr);
		System.out.println("sex:" + sex);
		System.out.println("date:" + date);

		MemberVO vo = new MemberVO();
		try {
			vo.setId(id);
			vo.setPwd(pwd);
			vo.setName(name);
			vo.setEmail(email);
			vo.setTel(tel);
			vo.setPhone(phone);
			vo.setAddr1(zipcode);
			vo.setAddr2(addr);
			vo.setSex(sex);
			vo.setBirthday(date);

			MemberDAO.memberSignUp(vo);
		} catch (Exception e) {
			System.out.println("회원가입 폼 오류");
			e.printStackTrace();
		}

		model.addAttribute("result", "OK");

		return "../member/signUp_ok.jsp";
	}

	// 아이디 찾기
	@RequestMapping("member/idFind.do")
	public String memIdFind(Model model) {

		return "../member/idFind.jsp";
	}

	@RequestMapping("member/idFind_ok.do")
	public String memIdFind_ok(Model model) {
		String email = model.getRequest().getParameter("email");
		String id = MemberDAO.memIdFind(email);

		model.addAttribute("result", id);

		return "../member/idFind_ok.jsp";
	}

	// 비밀번호 찾기
	@RequestMapping("member/pwdFind.do")
	public String memPwdFind(Model model) {
		return "../member/pwdFind.jsp";
	}

	@RequestMapping("member/pwdFind_ok.do")
	public String memPwdFind_ok(Model model) {
		String id = model.getRequest().getParameter("id");
		String email = model.getRequest().getParameter("email");
		System.out.println("email: " + email);
		System.out.println("id: " + id);

		String result = MemberDAO.memPwdFind(id, email); // 비밀번호

		model.addAttribute("result", result);
		return "../member/pwdFind_ok.jsp";
	}
	
	// 회원 탈퇴
	@RequestMapping("member/memberDelete.do")
	public String member_delete(Model model) {
		model.addAttribute("main_jsp", "../member/memberDelete.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("member/memberDel_ok.do")
	public String deleteUser_ok(Model model) {
		try {
			model.getRequest().setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg = "";
		HttpSession session = model.getRequest().getSession();

		String id = model.getRequest().getParameter("id");
		String pwd = model.getRequest().getParameter("pwd");

		msg = MemberDAO.memberDelete(id, pwd);
		if(msg == "OK") {
			session.invalidate();
			Cookie[] cookies = model.getRequest().getCookies();
			// 쿠키 삭제(수명 0)
			if (cookies != null) {
				for (Cookie c : cookies) {
					c.setMaxAge(0);
					model.getResponse().addCookie(c);
				}
			}
		}
		
		model.addAttribute("msg", msg);
		
		return "../member/memberDel_ok.jsp";

	}

	// 우편번호
	@RequestMapping("member/postFind.do")
	public String postFind(Model model) {

		return "../member/postFind.jsp";
	}

	// 아이디 중복 확인
	@RequestMapping("member/idcheck.do")
	public String idcheck(Model model) {

		return "../member/idcheck.jsp";
	}

	@RequestMapping("member/idcheck_result.do")
	public String idcheck_result(Model model) {
		String id = model.getRequest().getParameter("id");
		int count = MemberDAO.IdCheck(id);
		/*System.out.println("======================");
		System.out.println(id);
		System.out.println(count);*/
		model.addAttribute("result", count);

		return "../member/idcheck_result.jsp";
	}

	// 캐시충전
	@RequestMapping("member/cashPage.do")
	public String member_cash(Model model) {
		model.addAttribute("main_jsp", "../member/cashPage.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("member/cashPage_ok.do")
	public String member_cash_ok(Model model) {
		HttpSession session = model.getRequest().getSession();
		Map cashMap = new HashMap();
		
		String id = (String)session.getAttribute("id");
		String money = model.getRequest().getParameter("money");
		System.out.println("충전금액: " + money);
		System.out.println("아이디: " + id);
		
		cashMap.put("cash", Integer.parseInt(money));
		cashMap.put("id", id);
		
		try {
			MemberDAO.memPayUpdate(cashMap);			// 캐시 추가
			int currentCash = MemberDAO.memChkPay(id);	// 현재 캐시 확인
			
			session.setAttribute("pay", currentCash);		
			model.addAttribute("result", "OK");
			model.addAttribute("curCash", currentCash);
		} catch (Exception e) {
			model.addAttribute("result", "FAIL");
			System.out.println("캐쉬충전오류");
			e.printStackTrace();
		}

		return "../member/cashPage_ok.jsp";
	}
	

	

}
