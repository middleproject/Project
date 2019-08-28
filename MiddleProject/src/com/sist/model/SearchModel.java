package com.sist.model;

import java.util.List;

import com.sist.controller.Controller;
import com.sist.controller.Model;
import com.sist.controller.RequestMapping;

import com.sist.dao.SearchDAO;
import com.sist.vo.IngreVO;
import com.sist.vo.IngredetailVO;


@Controller("searchModel")
public class SearchModel {
	@RequestMapping("search/search.do")
	public String search(Model model)
	{ 
		
	   List<IngreVO> list=SearchDAO.IngreListData();
	   
	   
	   
	   model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../search/search.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("search/searchlist.do")
	   public String search_searchlist(Model model)
	   {
		   String ino=model.getRequest().getParameter("ino");
		   List<IngredetailVO> list=SearchDAO.IngredetailData();
		   
		   
		   model.addAttribute("list", list);
		   return "searchlist.jsp";
	   }

}


