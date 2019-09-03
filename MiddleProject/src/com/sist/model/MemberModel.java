package com.sist.model;

import java.sql.Date;
import java.text.SimpleDateFormat;

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
		}
		/*System.out.println("���̵�:" + id);
		System.out.println("�̸�:" + vo.getName());
		System.out.println("����:" + vo.getAdmin());*/

		model.addAttribute("result", vo.getMsg()); // OK,NOID,NOPWD
		return "../member/signIn_ok.jsp";
	}

	@RequestMapping("member/signUp.do")
	public String member_signUp(Model model) {
		model.addAttribute("main_jsp", "../member/signUp.jsp");
		return "../main/main.jsp";
	}

	// �α׾ƿ�
		@RequestMapping("member/logout.do")
		public String member_logout(Model model) {
			HttpSession session = model.getRequest().getSession();
			session.invalidate();// session�� ����� ��� ������ ���� => id=null,admin=null
			Cookie[] cookies = model.getRequest().getCookies();
			// ��Ű ����(���� 0)
			if(cookies != null){
				for(Cookie c : cookies) {
					c.setMaxAge(0);
					model.getResponse().addCookie(c);
				}
			}
			
			return "redirect:../main/main.do";
		}

		// ȸ������
		@RequestMapping("member/signUp_ok.do")
		public String member_signUp_ok(Model model) {
			try {
				model.getRequest().setCharacterEncoding("UTF-8");
			} catch (Exception e) {
			}

			String id = model.getRequest().getParameter("id"); // ���̵�
			String pwd = model.getRequest().getParameter("pwd"); // ��й�ȣ
			String name = model.getRequest().getParameter("name"); // �̸�
			String sex = model.getRequest().getParameter("sex"); // ����
			String email1 = model.getRequest().getParameter("email1");
			String email2 = model.getRequest().getParameter("email2");
			String tel1 = model.getRequest().getParameter("tel1"); // ����ȭ
			String tel2 = model.getRequest().getParameter("tel2");
			String tel3 = model.getRequest().getParameter("tel3");
			String phone1 = model.getRequest().getParameter("phone1"); // �޴��� ��ȭ
			String phone2 = model.getRequest().getParameter("phone2");
			String phone3 = model.getRequest().getParameter("phone3");

			String addr1 = model.getRequest().getParameter("addr1"); // �����ȣ
			String addr2 = model.getRequest().getParameter("addr2"); // �� �ּ�
			String birthday = model.getRequest().getParameter("birthday"); // �������

			// ============== ��ȯ =============
			String email = email1 + "@" + email2;		// aaa@aaa.com
			String tel = tel1 + tel2 + tel3;			// 02-222-111
			String phone = phone1 + phone2 + phone3;	// 010-2020-1818
			Date date = Date.valueOf(birthday);
			
			// ========================
			System.out.println("id:"+id);
			System.out.println("pwd:"+pwd);
			System.out.println("name:"+name);
			System.out.println("email:"+email);
			System.out.println("tel:"+tel);
			System.out.println("phone:"+phone);
			System.out.println("addr1:"+addr1);
			System.out.println("addr2:"+addr2);
			System.out.println("sex:"+sex);
			System.out.println("date:"+ date);
			
			
			
			
			MemberVO vo = new MemberVO();

			vo.setId(id);
			vo.setPwd(pwd);
			vo.setName(name);
			vo.setEmail(email);
			vo.setTel(tel);
			vo.setPhone(phone);
			vo.setAddr1("111-111");
			vo.setAddr2("�ӽ���ġ");
			vo.setSex(sex);
			vo.setBirthday(date);
			
			MemberDAO.memberSignUp(vo);
			
			model.addAttribute("result", "OK");

			return "../member/signUp_ok.jsp";
	}

		// ���̵� ã��
		@RequestMapping("member/idFind.do")
		public String memIdFind(Model model) {

			return "../member/idFind.jsp";
		}
		
		@RequestMapping("member/idFind_ok.do")
		public String memIdFind_ok(Model model) {
			String email = model.getRequest().getParameter("email");
			String id = MemberDAO.memIdFind(email);
			/*if(!id.equals("ERROR")){
				HttpSession session = model.getRequest().getSession();
				session.setAttribute("id", id);
			}*/
			/*System.out.println("email: " + email);
			System.out.println("id: " + id);*/
			
			model.addAttribute("result", id);
			
			return "../member/idFind_ok.jsp";
		}

		// ��й�ȣ ã��
		@RequestMapping("member/pwdFind.do")
		public String memPwdFind(Model model) {
			return "../member/pwdFind.jsp";
		}
		
		@RequestMapping("member/pwdFind_ok.do")
		public String memPwdFind_ok(Model model){
			String id = model.getRequest().getParameter("id");
			String email = model.getRequest().getParameter("email");
			System.out.println("email: " + email);
			System.out.println("id: " + id);
			
			String result = MemberDAO.memPwdFind(id, email);	// ��й�ȣ
			
			model.addAttribute("result", result);
			return "../member/pwdFind_ok.jsp";
		}
		
		// ȸ�� Ż��
		@RequestMapping("member/deleteUser.do")
		public String deleteUser_ok(Model model) {
			String id = model.getRequest().getParameter("id");
			
			MemberDAO.memberDelete(id);
			return "../main/main.jsp";

		}
}
