package com.sist.model;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
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
		HttpSession session = model.getRequest().getSession();
		String id = (String)session.getAttribute("id");
		String no = model.getRequest().getParameter("no");
		RecipeVO vo = RecipeDAO.recipeDetailData(Integer.parseInt(no));
		//wish 확인
		WishVO wvo = new WishVO();
		wvo.setId(id);
		wvo.setRecipeno(Integer.parseInt(no));
		int wishCount = RecipeDAO.wishCount(wvo);
		List<IngredetailVO> homeList = new ArrayList<IngredetailVO>(); // 인그리 디테일 받을 값
		List<IngredetailVO> lotteList = new ArrayList<IngredetailVO>();
		List<IngredetailVO> emartList = new ArrayList<IngredetailVO>();
		List<String> ilist = new ArrayList<String>(); // 인그리 디테일 넘길 값
		List<RecipeVO> list = new ArrayList<RecipeVO>();
		// 로그인 세션
		int folloCount = 0;
		
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
		List<FollowVO> madeList =new ArrayList<FollowVO>();
		List<RecipeVO> list2 = new ArrayList<RecipeVO>();
		List<RecipeVO> list = new ArrayList<RecipeVO>();
		List<ReadVO> rlist = new ArrayList<ReadVO>();
		for(FollowVO vo:madeList){
			System.out.println("팔로우 아이디 날짜:"+vo.getDay()+vo.getFollow());
		}
		//페이지 나누기
		Map map =new HashMap();
		//팔로워 찾기
		madeList = RecipeDAO.followSearch(id);
		
		for(FollowVO vo:madeList){
			list2=(RecipeDAO.followSearchRecipe(vo));
			for(RecipeVO rvo:list2){
				list.add(rvo);
			}
		}
		// 읽은 값 구분
		rlist = RecipeDAO.readAllData(id);
		
		model.addAttribute("rlist", rlist);
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../recipe/follow.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("recipe/wish.do")
	public String recipe_wish(Model model){
		HttpSession session = model.getRequest().getSession();
		String recipeno = model.getRequest().getParameter("recipeno");
		String id =(String)session.getAttribute("id");
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
		System.out.println(vo.getId()+vo.getRecipeno());
		RecipeDAO.wishDelete(vo);
		
		return "../recipe/jjim_ok.jsp";
	}
	@RequestMapping("recipe/wishRecipe.do")
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
		
		return "redirect:../recipe/msg.do";
	}
	@RequestMapping("recipe/msgdetail.do")
	public String msgDetail(Model model){
		String msgno =model.getRequest().getParameter("no");
		RecipeDAO.msgUpdate(Integer.parseInt(msgno));
		MsgVO vo = new MsgVO();
		vo = RecipeDAO.msgDetail(Integer.parseInt(msgno));
		System.out.println("메세지 값:"+vo.getMemberid()+vo.getContent()+vo.getSub());
		model.addAttribute("vo", vo);
		return "msgdetail.jsp";
	}
	//메세지 보낸 사람이 삭제
	@RequestMapping("recipe/msgSendDelete.do")
	public String msgSendDelete(Model model){
		String msgno = model.getRequest().getParameter("msgno");
		RecipeDAO.msgSendDelete(Integer.parseInt(msgno));
		return "follow_ok.jsp";
	}
	@RequestMapping("recipe/msgReDelete.do")
	public String msgReDelete(Model model){
		String msgno = model.getRequest().getParameter("msgno");
		RecipeDAO.msgReDelete(Integer.parseInt(msgno));
		
		return "follow_ok.jsp";
	}
	
	@RequestMapping("recipe/recipeRegister.do")
	public String recipe_Register(Model model) {
		HttpSession session = model.getRequest().getSession();
		String id = (String)session.getAttribute("id");
		model.addAttribute("main_jsp", "../recipe/recipeRegister.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("recipe/recipeUpload.do")
	public String recipe_update(Model model){
		try {
			model.getRequest().setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		HttpSession session = model.getRequest().getSession();
		String id = (String)session.getAttribute("id");
		String path="c:\\mvcDev\\mvcStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\MiddleProject\\main";
		String enctype="UTF-8";
		int size=100*1024*1024; 
		MultipartRequest mr=null;
		try {
			mr = new MultipartRequest(model.getRequest(), path, size, enctype, new DefaultFileRenamePolicy());
		} catch (IOException e) {
			e.printStackTrace();
		}
		String summary = mr.getParameter("summary");
		String summary_in = mr.getParameter("summary_in");
		String ingre1 = mr.getParameter("ingre1");
		String ingre2 = mr.getParameter("ingre2");
		String ingre3 = mr.getParameter("ingre3");
		String ingre= ingre1+","+ingre2+","+ingre3;
		String ingre4 = mr.getParameter("ingre4");
		if(ingre4!=null){
			String ingre5 = mr.getParameter("ingre5");
			ingre = ingre1+","+ingre2+","+ingre3+","+ingre4;
			if(ingre5!=null){
				String ingre6 = mr.getParameter("ingre6");
				  ingre = ingre1+","+ingre2+","+ingre3+","+ingre4+","+ingre5;
				if(ingre6!=null){
					String ingre7 = mr.getParameter("ingre7");
					 ingre = ingre1+","+ingre2+","+ingre3+","+ingre4+","+ingre5+"##"+ingre6;
					if(ingre7!=null){
						 ingre = ingre1+","+ingre2+","+ingre3+","+ingre4+","+ingre5+","+ingre6+","+ingre7;
					}
				}
			}
		}
		Enumeration formNames=mr.getFileNames();
		String[] poster = new String[3];
		int i=0;
		while(formNames.hasMoreElements()) {
		
			String name = (String) formNames.nextElement();
		
			String sFileName= mr.getFilesystemName(name);
			poster[i] = sFileName;
			System.out.println(sFileName);
			i++;
		}
		String info1 =mr.getParameter("info1");
		String info2 =mr.getParameter("info2");
		String info3 =mr.getParameter("info3");
		String info = "####"+info1+"##"+info2+"##"+info3+"##";
		
		String step =mr.getParameter("step");
		String tip =mr.getParameter("step");
		String tag =mr.getParameter("tag");
		String step_poster =poster[1];
		String complete=poster[2];
		String poster1 = poster[0];
		RecipeVO vo = new RecipeVO();
		vo.setComplete("http://localhost:8080/MiddleProject/main/"+complete+",");
		vo.setPoster("http://localhost:8080/MiddleProject/main/"+poster1);
		vo.setInfo(info);
		vo.setIngre(ingre);
		vo.setMade(id);
		vo.setStep(step);
		vo.setSTEP_POSTER("http://localhost:8080/MiddleProject/main/"+step_poster);
		vo.setTip(tip);
		vo.setTag(tag);
		vo.setImage("");
		vo.setHit(0);
		vo.setSummary(summary);
		vo.setSummary_in(summary_in);
		System.out.println(vo.getComplete()+vo.getSummary()+vo.getSummary_in()+vo.getInfo()+vo.getIngre()+vo.getStep()+
				vo.getSTEP_POSTER()+vo.getTip()+vo.getPoster()+vo.getTag());
		RecipeDAO.cateDateInsert(vo);
		System.out.println("레시피 인서트 완료");
		return "redirect:../recipe/recipe_list.do";
	}
}
