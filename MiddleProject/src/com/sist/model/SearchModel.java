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
import com.sist.vo.DifficultyVO;
import com.sist.vo.IngreVO;
import com.sist.vo.IngredetailVO;
import com.sist.vo.RecipeVO;



@Controller("searchModel")
public class SearchModel {
	@RequestMapping("search/search.do")
	public String search(Model model)
	{ 
		  /*if(page==null)
			  page="1";
		  int curpage=Integer.parseInt(page);
		  Map map=new HashMap();
		  int rowSize=9;
		  int start=(curpage*rowSize)-(rowSize-1);
		  int end=curpage*rowSize;
		  
		  map.put("start", start);
		  map.put("end", end);*/
		 
	   List<IngreVO> list=SearchDAO.IngreListData();
	   List<DifficultyVO> dlist=SearchDAO.DifficultyListData();
	   
	    //model.addAttribute("curpage", curpage); 
	    model.addAttribute("dlist", dlist);
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
		 String info = model.getRequest().getParameter("info");
		 String ingre2 = model.getRequest().getParameter("ingre2");
		 if(info==null){
			 info="";
		 }
		 if(ingre2==null){
			 ingre2="";
		 }
		 if(ingre==null){
			 ingre="";
		 }
		 System.out.println("검색:여러개"+info+ingre+ingre2);
		   Map map=new HashMap();
		   map.put("ingre", ingre);
		   map.put("info", info);
		   map.put("ingre2", ingre2);
		   
		   List<RecipeVO> list=SearchDAO.searchIngreData(map);
		   for(RecipeVO vo:list)
		   {
			   System.out.println(vo.getSummary());
		   }
		   model.addAttribute("list", list);
		   return "searchingre.jsp";
	   }
	 
	 
	 @RequestMapping("search/difficultylist.do")
	   public String search_difficultylist(Model model)
	   {
		 try{
			 model.getRequest().setCharacterEncoding("UTF-8");
		 }catch(Exception ex){}
		 String info=model.getRequest().getParameter("info");
		   Map map=new HashMap();
		   map.put("info", info);
		   List<RecipeVO> list=SearchDAO.searchDifficultyData(map);
		   for(RecipeVO vo:list)
		   {
			   System.out.println(vo.getSummary());
		   }
		   model.addAttribute("list", list);
		   return "difficultylist.jsp";
	   }
	 
	
	 	

}


