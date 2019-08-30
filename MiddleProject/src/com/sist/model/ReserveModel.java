package com.sist.model;

import com.sist.controller.*;

@Controller("reserveModel")
public class ReserveModel {
	
	@RequestMapping("reserve/reserve.do")
	public String reserve_main(Model model){
		
		model.addAttribute("main_jsp", "../reserve/reserve.jsp");
		return "../main/main.jsp";
	}
	
}
