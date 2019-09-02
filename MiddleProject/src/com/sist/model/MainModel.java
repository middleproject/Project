package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.sist.controller.*;
import com.sist.dao.*;
import com.sist.vo.*;
import com.sist.model.*;

@Controller("mainModel")
public class MainModel {
	
	@RequestMapping("main/main.do")
	public String main_page(Model model){
		//���ο� ��ٱ��� ���� 
		int Wishcount = 0;
		int msgCount = 0;
		HttpSession session = model.getRequest().getSession();
		String id =(String)session.getAttribute("id");
		
		if(id!=null) { 
			Wishcount = MemberDAO.wishCount(id);
			msgCount = RecipeDAO.msgCount(id);
		}
		System.out.println("�޼��� ī��Ʈ:"+msgCount);
		session.setAttribute("msgCount", msgCount);
		session.setAttribute("Wishcount", Wishcount);
		//List<RecipeVO> list = RecipeDAO.recipeAllData(); 
		//model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../main/home.jsp");
		return "../main/main.jsp";
	}
	
}
