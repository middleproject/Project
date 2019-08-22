package com.sist.model;

import java.util.List;

import com.sist.controller.*;
import com.sist.dao.*;
import com.sist.vo.*;
import com.sist.model.*;

@Controller("mainModel")
public class MainModel {
	
	@RequestMapping("main/main.do")
	public String main_page(Model model){
		
		List<RecipeVO> list = RecipeDAO.recipeAllData(); 
		model.addAttribute("list", list);
	
		return "../main/main.jsp";
	}
}
