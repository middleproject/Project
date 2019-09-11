package com.sist.model;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.Model;
import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.dao.RecipeDAO;
import com.sist.vo.MemberVO;

@Controller("mypageModel")
public class MypageModel {
	// ����������^^
	@RequestMapping("mypage/mypageMain.do")
	public String mypage_Main(Model model) {
		HttpSession session = model.getRequest().getSession();
		String id = (String) session.getAttribute("id");
		MemberVO vo = MemberDAO.memberData(id);
		int wishCount =MemberDAO.wishCount(id);
		int msgCount = RecipeDAO.msgCount(id);
		
		model.addAttribute("msgCount", msgCount);
		model.addAttribute("wishCount", wishCount);
		model.addAttribute("vo", vo);
		model.addAttribute("main_jsp", "../mypage/mypageMain.jsp");
		return "../main/main.jsp";
	}
	// ȸ������ ����
	@RequestMapping("mypage/memberModify.do")
	public String mypage_memberModify(Model model) {
		HttpSession session = model.getRequest().getSession();
		String id = (String) session.getAttribute("id");
		MemberVO vo = MemberDAO.memberData(id);
		model.addAttribute("vo", vo);
		model.addAttribute("main_jsp", "../mypage/memberModify.jsp");
		return "../main/main.jsp";

	}
	@RequestMapping("mypage/modify_ok.do")
	public String modify_ok(Model model) {
		try {
			model.getRequest().setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		String id = model.getRequest().getParameter("id"); // ���̵�
		String pwd = model.getRequest().getParameter("pwd"); // ��й�ȣ
		String name = model.getRequest().getParameter("name"); // �̸�
		String sex = model.getRequest().getParameter("sex"); // ����
		String tel1 = model.getRequest().getParameter("tel1"); // ����ȭ
		String tel2 = model.getRequest().getParameter("tel2");
		String tel3 = model.getRequest().getParameter("tel3");
		String phone1 = model.getRequest().getParameter("phone1"); // �޴��� ��ȭ
		String phone2 = model.getRequest().getParameter("phone2");
		String phone3 = model.getRequest().getParameter("phone3");

		String zipcode = model.getRequest().getParameter("addr1"); // �����ȣ
		String addr2 = model.getRequest().getParameter("addr2"); // �ּ�
		String addr3 = model.getRequest().getParameter("addr3"); // ���ּ�
		String exAddr = model.getRequest().getParameter("exAddr"); // �����׸�
		String birthday = model.getRequest().getParameter("birthday"); // �������
		
		
		String tel = tel1 + tel2 + tel3; // 02-222-111
		String phone = phone1 + phone2 + phone3; // 010-2020-1818
		Date date = Date.valueOf(birthday);
		String addr = addr2 + " " + addr3 + " " + exAddr;
		
		System.out.println("id:" + id);
		System.out.println("pwd:" + pwd);
		System.out.println("name:" + name);
		System.out.println("tel:" + tel);
		System.out.println("phone:" + phone);
		System.out.println("addr1:" + zipcode);
		System.out.println("addr2:" + addr);
		System.out.println("sex:" + sex);
		System.out.println("date:" + date);
		
		MemberVO vo = MemberDAO.memberData(id);
		try {
			vo.setPwd(pwd);
			vo.setTel(tel);
			vo.setPhone(phone);
			vo.setAddr1(zipcode);
			vo.setAddr2(addr);
			vo.setSex(sex);
			vo.setBirthday(date);

			MemberDAO.memberModify(vo);
		} catch (Exception e) {
			System.out.println("ȸ������ �� ����");
			e.printStackTrace();
		}
		model.addAttribute("result", "OK");
		
		return "../mypage/modify_ok.jsp";
	}
	// ������ ������(����)
	@RequestMapping("mypage/adminpageMain.do")
	public String adminpage_main(Model model) {
		
		int count = MemberDAO.countAllMember();
		
		model.addAttribute("memCount", count);
		model.addAttribute("main_jsp", "../mypage/adminpageMain.jsp");
		return "../main/main.jsp";

	}
	
	// ȸ�� ���� ������
	@RequestMapping("mypage/memberManagement.do")
	public String memberManagement(Model model) {
		try {
			model.getRequest().setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		
		List list = MemberDAO.memAllData();
		
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../mypage/memberManagement.jsp");
		return "../main/main.jsp";
	}

}
