package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import com.sist.controller.Controller;
import com.sist.controller.Model;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.IngredetailVO;
import com.sist.vo.RecipeVO;
@Controller("recipeModel")
public class RecipeModel {

	@RequestMapping("recipe/recipe_list.do")
	public static String recipe_page(Model model){
		try {
			model.getRequest().setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		Map keymap = new HashMap();
		String key = model.getRequest().getParameter("key");
		String ingre = model.getRequest().getParameter("ingre");
		String tag = model.getRequest().getParameter("tag");
		if(key!=null) {
			keymap.put("key", key);
		}else{
			key="";
			keymap.put("key", key);
		}
		if(ingre!=null) {
			keymap.put("ingre", ingre);
		}else{
			ingre="";
			keymap.put("ingre", ingre);
		}
		if(tag!=null) {
			keymap.put("tag", tag);
		}else{
			tag="";
			keymap.put("tag", tag);
		}
		String page=model.getRequest().getParameter("page");
		if(page==null){
			page="1";
		}
		int curpage=Integer.parseInt(page);

		int rowSize=6;
		int start=(curpage*rowSize)-(rowSize-1);
		int end=curpage*rowSize;
		
		keymap.put("end", end);
		keymap.put("start", start);
		  
		int total = RecipeDAO.RecipeTotalPage();
		int count = RecipeDAO.RecipeCount();
		count=count-((curpage*rowSize)-rowSize); 
		
		int BLOCK=5;
		   
		int startpage=((curpage-1)/BLOCK*BLOCK)+1;
	   
		int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	  
		int allpage=total;
	   
		if(endpage>allpage)
		{
			   endpage=allpage;
		}
		List<RecipeVO> hlist = RecipeDAO.recipeHotRecipe(3);
		List<RecipeVO> list = RecipeDAO.recipeSearch(keymap);
		model.addAttribute("list", list);
		
		for(RecipeVO vo:list){
			if(vo.getSummary_in()==null){
				continue;
			}else{
				int len=vo.getSummary_in().length();
				
				if(len>100)
				{
					vo.setSummary_in(vo.getSummary_in().substring(0, 100)+"...");
				}
			}
		}
		
		model.addAttribute("key", key);
		model.addAttribute("tag", tag);
		model.addAttribute("ingre", ingre);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("curpage", curpage);
		model.addAttribute("allpage", allpage);
		model.addAttribute("BLOCK", BLOCK);
		
		model.addAttribute("total", total);
		model.addAttribute("count", count);
		
		model.addAttribute("hlist", hlist);
		model.addAttribute("main_jsp", "../recipe/recipe_list.jsp");
		return "../main/main.jsp";
	}
	
	// 디테일 페이지
	@RequestMapping("recipe/recipe_detail.do")
	public static String recipe_detail(Model model){
		String no = model.getRequest().getParameter("no");
		RecipeVO vo = RecipeDAO.recipeDetailData(Integer.parseInt(no));
		List<IngredetailVO> homeList = new ArrayList<IngredetailVO>(); // 인그리 디테일 받을 값
		List<IngredetailVO> lotteList = new ArrayList<IngredetailVO>();
		List<IngredetailVO> emartList = new ArrayList<IngredetailVO>();
		List<String> ilist = new ArrayList<String>(); // 인그리 디테일 넘길 값
		List<RecipeVO> list = new ArrayList<RecipeVO>();
		Map map = new HashMap();
		String in = new String();
		String complete = new String();
		String[] tagStr = null;
		String[] step = null;
		String[] step_poster=null;
		try {
			if(vo.getInfo()!=null){
				
				in = vo.getInfo().substring(4, vo.getInfo().length()-2);
			}
			String[] info = in.split("##");
			if(info.length<3){
				for(int i=0;i<info.length;i++){
					info[i]="";
				}
			}
			if(vo.getComplete()!=null){
				complete = vo.getComplete().substring(0,vo.getComplete().indexOf(","));
				model.addAttribute("complete", complete);
			}
			if(vo.getIngre()!=null){
				StringTokenizer st = new StringTokenizer(vo.getIngre(),",");
				while(st.hasMoreTokens()){
					ilist.add(st.nextToken());
				}
			}
				for(String ingre:ilist){
					
					List<IngredetailVO> slist = RecipeDAO.IngrePrice(ingre);
					if(slist!=null){
						for(IngredetailVO ivo:slist){
							if(ivo.getMno()==1){
								System.out.println(ivo.getMno());
								homeList.add(ivo);
							}else if(ivo.getMno()==2){
								lotteList.add(ivo);
								System.out.println(ivo.getMno());
							}else{
								emartList.add(ivo);
								System.out.println(ivo.getMno());
							}
						}
				}
				model.addAttribute("ilist", ilist);
			}
			if(vo.getTag()!=null){
				tagStr = vo.getTag().split(",");
				map.put("tagStr", tagStr);
				list = RecipeDAO.relateRecipe(map);
			}
			if(vo.getStep()!=null){
				step = vo.getStep().split("##");
			}
			if(vo.getSTEP_POSTER()!=null){
				step_poster = vo.getSTEP_POSTER().split("##");
			}
			for(RecipeVO rvo:list){
				if(rvo.getSummary_in()==null){
					continue;
				}else{
					int len=rvo.getSummary_in().length();
					
					if(len>14)
					{
						rvo.setSummary_in(rvo.getSummary_in().substring(0, 14)+"...");
					}
				}
			}
			model.addAttribute("count", ilist.size());
			model.addAttribute("homelist", homeList);
			model.addAttribute("lottelist", lotteList);
			model.addAttribute("emartlist", emartList);
			model.addAttribute("tagStr", tagStr);
			model.addAttribute("list", list);
			model.addAttribute("info", info);
			model.addAttribute("step", step);
			model.addAttribute("step_poster", step_poster);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(vo.getImage()==null){
			vo.setImage("https://previews.123rf.com/images/julynx/julynx1408/julynx140800023/30746516-%EC%82%AC%EC%9A%A9%ED%95%A0-%EC%88%98-%EC%97%86%EA%B1%B0%EB%82%98-%EC%9D%B4%EB%AF%B8%EC%A7%80-%EC%82%AC%EC%A7%84-%EC%97%86%EC%9D%8C.jpg");
		}
		model.addAttribute("vo", vo);
		model.addAttribute("main_jsp", "../recipe/recipe_detail.jsp");
		return "../main/main.jsp";
	}
}
