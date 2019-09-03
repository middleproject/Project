package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.Model;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.FollowVO;
import com.sist.vo.IngredetailVO;
import com.sist.vo.MsgVO;
import com.sist.vo.ReadVO;
import com.sist.vo.RecipeVO;
import com.sist.vo.WishVO;
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
		int ifcount = 0;
		int total =0;
		if(key!=null && key!="") {
			keymap.put("key", key);
		}else{
			key="";
			keymap.put("key", key);
			ifcount++;
		}
		if(ingre!=null && ingre!="") {
			keymap.put("ingre", ingre);
		}else{
			ingre="";
			keymap.put("ingre", ingre);
			ifcount++;
		}
		if(tag!=null && tag!="") {
			keymap.put("tag", tag);
		}else{
			tag="";
			keymap.put("tag", tag);
			ifcount++;
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
		if(ifcount==3){
			total=RecipeDAO.RecipeTotalPage();
		}else{
			total=RecipeDAO.RecipeSearchPage(keymap);
		}
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
		//wish 확인
		int wishCount = RecipeDAO.wishCount(Integer.parseInt(no));
		List<IngredetailVO> homeList = new ArrayList<IngredetailVO>(); // 인그리 디테일 받을 값
		List<IngredetailVO> lotteList = new ArrayList<IngredetailVO>();
		List<IngredetailVO> emartList = new ArrayList<IngredetailVO>();
		List<String> ilist = new ArrayList<String>(); // 인그리 디테일 넘길 값
		List<RecipeVO> list = new ArrayList<RecipeVO>();
		// 로그인 세션
		int folloCount = 0;
		HttpSession session = model.getRequest().getSession();
		String id = (String)session.getAttribute("id");
		//게시물 read
		if(id!=null){
			ReadVO rvo= new ReadVO();
			rvo.setId(id);
			rvo.setRno(Integer.parseInt(no));
			int readCount = RecipeDAO.readCount(rvo);
			if(readCount==0){
				RecipeDAO.readInsert(rvo);
			}
		}
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
					int len=rvo.getSummary().length();
					
					if(len>10)
					{
						rvo.setSummary_in(rvo.getSummary().substring(0, 10)+"...");
						list.add(rvo);
					}
				}
			}
			// 팔로우 확인
			if(id!=null){
				FollowVO fvo = new FollowVO();
				fvo.setId(id);
				fvo.setFollow(vo.getMade());
				folloCount = RecipeDAO.followCount(fvo);
				System.out.println(folloCount);
			}
			model.addAttribute("wishCount", wishCount);
			model.addAttribute("folloCount", folloCount);
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
	
	@RequestMapping("recipe/follow_ok.do")
	public String recipe_follow_ok(Model model){
		try {
			model.getRequest().setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		String id = model.getRequest().getParameter("id");
		String follow = model.getRequest().getParameter("follow");
		FollowVO vo = new FollowVO();
		vo.setFollow(follow);
		vo.setId(id);
		System.out.println("팔로우ID:"+id);
		System.out.println("팔로우된:"+follow);
		RecipeDAO.followInsert(vo);
		return "../recipe/follow_ok.jsp";
	}
	@RequestMapping("recipe/unfollow.do")
	public String recipe_unfollow(Model model){
		try {
			model.getRequest().setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		String id = model.getRequest().getParameter("id");
		System.out.println("아이디취소"+id);
		String follow = model.getRequest().getParameter("follow");
		System.out.println("팔로우취소"+follow);
		FollowVO vo = new FollowVO();
		vo.setFollow(follow);
		vo.setId(id);
		RecipeDAO.followDelete(vo);
		return "../recipe/unfollow_ok.jsp";
	}
	@RequestMapping("recipe/follow.do")
	public String recipe_follow(Model model){
		try {
			model.getRequest().setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		HttpSession session = model.getRequest().getSession();
		
		String id =(String)session.getAttribute("id");
		List<String> madeList =new ArrayList<String>();
		List<RecipeVO> list = new ArrayList<RecipeVO>();
		List<ReadVO> rlist = new ArrayList<ReadVO>();
		//페이지 나누기
		int total=0;
		Map keymap = new HashMap();
		String page =model.getRequest().getParameter("page");
		int curpage=Integer.parseInt(page);
		
		int rowSize=6;
		int start=(curpage*rowSize)-(rowSize-1);
		int end=curpage*rowSize;
		
		keymap.put("end", end);
		keymap.put("start", start);
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
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("curpage", curpage);
		model.addAttribute("allpage", allpage);
		model.addAttribute("BLOCK", BLOCK);
		model.addAttribute("total", total);
		model.addAttribute("count", count);
		
		
		Map map =new HashMap();
		//팔로워 찾기
		madeList = RecipeDAO.followSearch(id);
		
		map.put("made", madeList);
	
		// 읽은 값 구분
		rlist = RecipeDAO.readAllData(id);
		list = RecipeDAO.followSearchRecipe(map);
		model.addAttribute("rlist", rlist);
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../recipe/follow.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("recipe/wish.do")
	public String recipe_wish(Model model){
		String recipeno = model.getRequest().getParameter("recipeno");
		String id = model.getRequest().getParameter("id");
		WishVO vo =new WishVO();
		vo.setId(id);
		vo.setRecipeno(Integer.parseInt(recipeno));
		RecipeDAO.wishInsert(vo);
		return "../recipe/jjim_ok.jsp";
	}
	@RequestMapping("recipe/unwish.do")
	public String recipe_unwish(Model model){
		String recipeno = model.getRequest().getParameter("recipeno");
		String id = model.getRequest().getParameter("id");
		WishVO vo =new WishVO();
		vo.setId(id);
		vo.setRecipeno(Integer.parseInt(recipeno));
		RecipeDAO.wishDelete(vo);
		return "../recipe/jjim_ok.jsp";
	}
	@RequestMapping("reicpe/wishRecipe.do")
	public String recipe_wishRecipe(Model model){
		HttpSession session = model.getRequest().getSession();
		String id =(String)session.getAttribute("id");
		List<Integer> iList = new  ArrayList<Integer>();
		List<RecipeVO> list = new ArrayList<RecipeVO>();
		iList = RecipeDAO.wishData(id);
		for(int no:iList){
			RecipeVO vo = RecipeDAO.wishAllData(no);
			list.add(vo);
		}
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../recipe/wishRecipe.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("recipe/msg.do")
	public String recipe_msg(Model model) {
		try {
			model.getRequest().setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		HttpSession session = model.getRequest().getSession();
		String id = (String)session.getAttribute("id");	
		List<MsgVO> list = RecipeDAO.msgSend(id);
		
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../recipe/msg.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("recipe/rmsg.do")
	public String recipe_reseveMsg(Model model) {
		HttpSession session = model.getRequest().getSession();
		String id = (String)session.getAttribute("id");
		List<MsgVO> rlist = RecipeDAO.msgReseve(id);
		
		model.addAttribute("rlist", rlist);
		
		return "rmsg.jsp";
	}
	@RequestMapping("recipe/sendmsg.do")
	public String recipe_sendMsg(Model model) {
		
		
		return "sendmsg.jsp";
	}
	
	@RequestMapping("recipe/send.do")
	public String recipe_send(Model model) {
		try {
			model.getRequest().setCharacterEncoding("UTF-8");
		} catch (Exception e) {
		}
		HttpSession session = model.getRequest().getSession();
		String memberid = (String)session.getAttribute("id");	
		String id = model.getRequest().getParameter("id");
		String sub = model.getRequest().getParameter("sub");
		String content = model.getRequest().getParameter("content");
		MsgVO vo = new MsgVO();
		if(sub!=null) {
			if(content==null) content="";
			vo.setMemberid(memberid);
			vo.setId(id);
			vo.setContent(content);
			vo.setSub(sub);
			RecipeDAO.msgInsert(vo);
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		System.out.println("id:"+id);
		System.out.println("보낸:"+memberid+"제목"+sub+"내용:"+content);
		
		return "redirect:../recipe/sendmsg.do";
	}
	
	@RequestMapping("recipe/recipeRegister.do")
	public String recipe_rigister(Model model) {
		try {
			model.getRequest().setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		HttpSession session = model.getRequest().getSession();
		String id = (String)session.getAttribute("id");	
		List<MsgVO> list = RecipeDAO.msgSend(id);
		
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../recipe/recipeRegister.jsp");
		return "../main/main.jsp";
	}
	
	
	
}
