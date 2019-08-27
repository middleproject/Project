package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.Model;
import com.sist.controller.RequestMapping;

@Controller("searchModel")
public class SearchModel {
	@RequestMapping("search/search.do")
	public String search(Model model)
	{
		model.addAttribute("main_jsp", "../search/search.jsp");
		return "../main/main.jsp";
	}

}

