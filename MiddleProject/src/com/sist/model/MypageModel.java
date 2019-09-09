package com.sist.model;

import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.Model;
import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.dao.RecipeDAO;
import com.sist.vo.MemberVO;

@Controller("mypageModel")
public class MypageModel {

	@RequestMapping("mypage/mypageMain.do")
	public String mypage_Main(Model model) {
		HttpSession session = model.getRequest().getSession();
		String id = (String)session.getAttribute("id");
		MemberVO vo = MemberDAO.memberAllData(id);
		int wishCount =MemberDAO.wishCount(id);
		int msgCount = RecipeDAO.msgCount(id);
		
		model.addAttribute("msgCount", msgCount);
		model.addAttribute("wishCount", wishCount);
		model.addAttribute("vo", vo);
		model.addAttribute("main_jsp", "../mypage/mypageMain.jsp");
		return "../main/main.jsp";
	}
	
		@RequestMapping("mypage/memberModify.do")
		public String mypage_memberModify(Model model) {
			HttpSession session = model.getRequest().getSession();
			String id = (String)session.getAttribute("id");
			MemberVO vo = MemberDAO.memberAllData(id);
			model.addAttribute("vo", vo);
			model.addAttribute("main_jsp", "../mypage/memberModify.jsp");
			return "../main/main.jsp";
				
}

		@RequestMapping("mypage/adminpageMain.do")
		public String adminpage_main(Model model) {

			model.addAttribute("main_jsp", "../mypage/adminpageMain.jsp");
			return "../main/main.jsp";
				
}	
		
	
	
}

