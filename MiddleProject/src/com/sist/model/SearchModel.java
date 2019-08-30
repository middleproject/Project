package com.sist.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import com.sist.controller.Controller;
import com.sist.controller.Model;
import com.sist.controller.RequestMapping;

import com.sist.dao.SearchDAO;
import com.sist.vo.IngreVO;
import com.sist.vo.IngredetailVO;
import com.sist.vo.RecipeVO;



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
		   List<String> list=SearchDAO.IngredetailData(Integer.parseInt(ino));
		   model.addAttribute("list", list);
		   return "searchlist.jsp";
	   }
	 @RequestMapping("search/searchingre.do")
	   public String search_recipelist(Model model)
	   {
		 try{
			 model.getRequest().setCharacterEncoding("UTF-8");
		 }catch(Exception ex){}
		 String ingre=model.getRequest().getParameter("ingre");
		   Map map=new HashMap();
		   map.put("ingre", ingre);
		   
		   List<RecipeVO> list=SearchDAO.searchIngreData(map);
		   for(RecipeVO vo:list)
		   {
			   System.out.println(vo.getSummary());
		   }
		   model.addAttribute("list", list);
		   return "searchingre.jsp";
	   }

}


