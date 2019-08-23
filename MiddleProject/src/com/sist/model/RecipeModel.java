package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sist.controller.Controller;
import com.sist.controller.Model;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;

import com.sist.vo.RecipeVO;
@Controller("recipeModel")
public class RecipeModel {

	@RequestMapping("recipe/recipe_list.do")
	public static String recipe_page(Model model){
		String page=model.getRequest().getParameter("page");
		if(page==null){
			page="1";
		}
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=15;
		int start=(curpage*rowSize)-(rowSize-1);
		int end=curpage*rowSize;
		  
		map.put("start", start);
		map.put("end", end);
		  
		int total = RecipeDAO.RecipeTotalPage();
		int count = RecipeDAO.RecipeCount();
		count=count-((curpage*rowSize)-rowSize); 
		List<RecipeVO> list = RecipeDAO.recipeListData(map);
		model.addAttribute("curpage", curpage);
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		model.addAttribute("count", count);
		model.addAttribute("main_jsp", "../recipe/recipe_list.jsp");
		return "../main/main.jsp";
	}

}
