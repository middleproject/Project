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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.controller.Controller;
import com.sist.controller.Model;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.manager.NaverBlogManager;
import com.sist.vo.DataBoardReplyVO;
import com.sist.vo.FollowVO;
import com.sist.vo.IngredetailVO;
import com.sist.vo.MsgVO;
import com.sist.vo.ReadVO;
import com.sist.vo.RecipeVO;
import com.sist.vo.RecommandVO;
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
		String info = model.getRequest().getParameter("info");
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
		if(info!=null && info!="") {
			keymap.put("info", info);
		}else{
			info="";
			keymap.put("info", info);
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
		if(ifcount==4){
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
		model.addAttribute("info", info);
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
	
	// µðÅ×ÀÏ ÆäÀÌÁö
	@RequestMapping("recipe/recipe_detail.do")
	public static String recipe_detail(Model model){
		HttpSession session = model.getRequest().getSession();
		String id = (String)session.getAttribute("id");
		String no = model.getRequest().getParameter("no");
		//Åõµ¥ÀÌ È÷Æ® ¾÷µ¥ÀÌÆ®
		Cookie cookie = new Cookie(id+no, String.valueOf(no));
		cookie.setMaxAge(60*60*24);
		model.getResponse().addCookie(cookie);
		// ÀÐÀº ¸ñ·Ï
		if(id!=null){
			ReadVO readvo = new ReadVO();
			readvo.setId(id);
			readvo.setRno(Integer.parseInt(no));
			RecipeDAO.readRecipe(readvo);
		}
		//¿À´Ã È÷Æ®¼ö ÀúÀå
		int todayHit = RecipeDAO.todayHitCount(Integer.parseInt(no));
		if(todayHit==0){
			RecipeDAO.todayHitInsert(Integer.parseInt(no));
		}else{
			RecipeDAO.todayHitUpdate(Integer.parseInt(no));
		}
		//È÷Æ®¼ö
		RecipeVO vo = RecipeDAO.recipeDetailData(Integer.parseInt(no));
		//wish È®ÀÎ
		WishVO wvo = new WishVO();
		wvo.setId(id);
		wvo.setRecipeno(Integer.parseInt(no));
		int wishCount = 0;
		if(id!=null) wishCount = RecipeDAO.wishCount(wvo);
		
		List<IngredetailVO> homeList = new ArrayList<IngredetailVO>(); // ÀÎ±×¸® µðÅ×ÀÏ ¹ÞÀ» °ª
		List<IngredetailVO> lotteList = new ArrayList<IngredetailVO>();
		List<IngredetailVO> emartList = new ArrayList<IngredetailVO>();
		List<String> ilist = new ArrayList<String>(); // ÀÎ±×¸® µðÅ×ÀÏ ³Ñ±æ °ª
		List<RecipeVO> list = new ArrayList<RecipeVO>();
		// ·Î±×ÀÎ ¼¼¼Ç
		int folloCount = 0;
		
		//°Ô½Ã¹° read
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
			// ÆÈ·Î¿ì È®ÀÎ
			if(id!=null){
				FollowVO fvo = new FollowVO();
				fvo.setId(id);
				fvo.setFollow(vo.getMade());
				folloCount = RecipeDAO.followCount(fvo);
				System.out.println(folloCount);
			}
			
			//´ñ±Û
			List<BoardDAO> replylist = BoardDAO.recipereplyListData(Integer.parseInt(no));
			DataBoardReplyVO replyvo = new DataBoardReplyVO();
			replyvo.setBno(Integer.parseInt(no));
			model.addAttribute("replylist", replylist);
			model.addAttribute("ilist", ilist);
			model.addAttribute("wishCount", wishCount);
			model.addAttribute("folloCount", folloCount);
			model.addAttribute("count", ilist.size());
/*			model.addAttribute("homelist", homeList);
			model.addAttribute("lottelist", lotteList);
			model.addAttribute("emartlist", emartList);*/
			model.addAttribute("tagStr", tagStr);
			model.addAttribute("list", list);
			model.addAttribute("info", info);
			model.addAttribute("step", step);
			model.addAttribute("step_poster", step_poster);
			model.addAttribute("no", no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(vo.getImage()==null){
			vo.setImage("https://previews.123rf.com/images/julynx/julynx1408/julynx140800023/30746516-%EC%82%AC%EC%9A%A9%ED%95%A0-%EC%88%98-%EC%97%86%EA%B1%B0%EB%82%98-%EC%9D%B4%EB%AF%B8%EC%A7%80-%EC%82%AC%EC%A7%84-%EC%97%86%EC%9D%8C.jpg");
		}
		model.addAttribute("id", id);
		model.addAttribute("vo", vo);
		model.addAttribute("main_jsp", "../recipe/recipe_detail.jsp");
		return "../main/main.jsp";
	}
	
	
	@RequestMapping("recipe/popupmart.do")
	public String recipe_pop(Model model){
		String no = model.getRequest().getParameter("no");
		System.out.println("no::"+no);
		List<String> ilist = new ArrayList<String>(); // ÀÎ±×¸® µðÅ×ÀÏ ³Ñ±æ °ª
		List<IngredetailVO> homeList = new ArrayList<IngredetailVO>(); // ÀÎ±×¸® µðÅ×ÀÏ ¹ÞÀ» °ª
		List<IngredetailVO> lotteList = new ArrayList<IngredetailVO>();
		List<IngredetailVO> emartList = new ArrayList<IngredetailVO>();
		RecipeVO vo = RecipeDAO.recipeDetailData(Integer.parseInt(no));
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
			
			model.addAttribute("homelist", homeList);
			model.addAttribute("lottelist", lotteList);
			model.addAttribute("emartlist", emartList);
		return "../recipe/popupmart.jsp";
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
		System.out.println("ÆÈ·Î¿ìID:"+id);
		System.out.println("ÆÈ·Î¿ìµÈ:"+follow);
		RecipeDAO.followInsert(vo);
		return "../recipe/follow_ok.jsp";
	}
	@RequestMapping("recipe/unfollow.do")
	public String recipe_unfollow(Model model){
		try {
			model.getRequest().setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		String id = model.getRequest().getParameter("id");
		System.out.println("¾ÆÀÌµðÃë¼Ò"+id);
		String follow = model.getRequest().getParameter("follow");
		System.out.println("ÆÈ·Î¿ìÃë¼Ò"+follow);
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
		List<RecipeVO> list = new ArrayList<RecipeVO>();
		List<Integer> rList = new  ArrayList<Integer>(); // ÀÐÀº ·¹½ÃÇÇ
		List<Integer> iList = new  ArrayList<Integer>(); //±¸µ¶ÀÚ ·¹½ÃÇÇ
		RecipeVO zvo = new RecipeVO();
		for(FollowVO vo:madeList){
			System.out.println("ÆÈ·Î¿ì ¾ÆÀÌµð ³¯Â¥:"+vo.getDay()+vo.getFollow());
		}
		//ÆÈ·Î¿ö Ã£±â
		madeList = RecipeDAO.followSearch(id);
		
		for(FollowVO vo:madeList){
			iList=(RecipeDAO.followSearchRecipe(vo));
		}
		rList = RecipeDAO.readIntRecipe(id);
		System.out.println("i»çÀÌÁî:"+iList.size());
		System.out.println("r»çÀÌÁî:"+iList.size());
		for(int i:iList){
			for(int j:rList){
				if(i==j){
					zvo = RecipeDAO.wishAllData(i);
					zvo.setRead(true);
				}
			}
			list.add(zvo);
		}
		System.out.println(list.size());
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
		List<Integer> iList = new  ArrayList<Integer>(); //±¸µ¶ÀÚ ·¹½ÃÇÇ
		List<Integer> rList = new  ArrayList<Integer>(); // ÀÐÀº ·¹½ÃÇÇ
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
			System.out.println("¼º°ø");
		}else {
			System.out.println("½ÇÆÐ");
		}
		System.out.println("id:"+id);
		System.out.println("º¸³½:"+memberid+"Á¦¸ñ"+sub+"³»¿ë:"+content);
		
		return "redirect:../recipe/msg.do";
	}
	@RequestMapping("recipe/msgdetail.do")
	public String msgDetail(Model model){
		String msgno =model.getRequest().getParameter("no");
		RecipeDAO.msgUpdate(Integer.parseInt(msgno));
		MsgVO vo = new MsgVO();
		vo = RecipeDAO.msgDetail(Integer.parseInt(msgno));
		System.out.println("¸Þ¼¼Áö °ª:"+vo.getMemberid()+vo.getContent()+vo.getSub());
		model.addAttribute("vo", vo);
		return "msgdetail.jsp";
	}
	//¸Þ¼¼Áö º¸³½ »ç¶÷ÀÌ »èÁ¦
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
		System.out.println("·¹½ÃÇÇ ÀÎ¼­Æ® ¿Ï·á");
		return "redirect:../recipe/recipe_list.do";
	}
	@RequestMapping("recipe/recipeDelete.do")
	public String recipe_delete(Model model){
		String no = model.getRequest().getParameter("msgno");
		RecipeDAO.recipeDelete(Integer.parseInt(no));
		
		return "redirect:../recipe/recipe_list.do";
	}
	//·¹½ÃÇÇ´ñ±Û
		@RequestMapping("recipe/reply_insert.do")
		public String recipe_replyInsert(Model model) {
			try {
				model.getRequest().setCharacterEncoding("UTF-8");
			} catch (Exception ex) { }
			System.out.println("============ ÀÌ ¾Æ·¡´Â ¸ðµ¨ÀÔ´Ï´Ù");
			String bno = model.getRequest().getParameter("bno");
			System.out.println("cnoÀÇ°ªÀº?"+bno);
			String msg = model.getRequest().getParameter("msg");
			System.out.println("msgÀÇ°ªÀº?"+msg);
			HttpSession session = model.getRequest().getSession();
			String id = (String) session.getAttribute("id");
			System.out.println("idÀÇ°ªÀº?"+id);
			String name = (String)session.getAttribute("name");
			System.out.println("nameÀÇ°ªÀº?"+name);
				
			DataBoardReplyVO vo = new DataBoardReplyVO();
			vo.setCno(Integer.parseInt(bno));
			vo.setMsg(msg);
			vo.setId(id);
			vo.setName(name);
			
			BoardDAO.recipereplyInsert(vo);
			
			return "redirect:../recipe/recipe_detail.do?no="+bno;
		}
		//»èÁ¦
		@RequestMapping("recipe/reply_delete.do")
		public String recipe_replyDelete(Model model) {
			String no = model.getRequest().getParameter("no");
			System.out.println("»èÁ¦]noÀÇ°ªÀº"+no);
			String bno = model.getRequest().getParameter("bno");
			System.out.println("»èÁ¦]bnoÀÇ°ªÀº"+bno);
			BoardDAO.recipereplyDelete(Integer.parseInt(no));
		return "redirect:../recipe/recipe_detail.do?no="+bno;
		}
		//¼öÁ¤ÇÏ±â
		@RequestMapping("recipe/reply_update.do")
		public String datareply_update(Model model) {
			System.out.println("===================1");
			try {
				model.getRequest().setCharacterEncoding("UTF-8");
			} catch (Exception ex) { }
			System.out.println("===================1");
			String msg = model.getRequest().getParameter("msg");
			System.out.println("msg´Â ¤Ð¤Ð"+msg);
			String no = model.getRequest().getParameter("no"); 
			System.out.println("no´Â ¤Ð¤Ð"+msg);
			String bno = model.getRequest().getParameter("bno");
			System.out.println("bno´Â ¤Ð¤Ð"+msg);
			//DAOÃ³¸®
			DataBoardReplyVO vo = new DataBoardReplyVO();
			vo.setMsg(msg);
			vo.setNo(Integer.parseInt(no));
			
			BoardDAO.recipereplyUpdate(vo);
		
			return "redirect:../recipe/recipe_detail.do?no="+bno;
		}
		@RequestMapping("recipe/lately.do")
		public String recipe_lately(Model model){
			List<RecipeVO> list = new ArrayList<RecipeVO>();
			HttpSession session = model.getRequest().getSession();
			String id = (String)session.getAttribute("id");
			Cookie[] cookies = model.getRequest().getCookies();
			for(int i=0; i < cookies.length;i++){
				if(cookies[i].getName().startsWith(id)){
					String recipeno = cookies[i].getValue();
					RecipeVO vo = RecipeDAO.recipeDetailnoUpdate(Integer.parseInt(recipeno));
					list.add(vo);
				}
			}
			model.addAttribute("list", list);
			model.addAttribute("main_jsp", "../recipe/lately.jsp");
			return "../main/main.jsp";
		}
		@RequestMapping("recipe/recommend.do")
		public String recipe_recommend(Model model){
			try {
				model.getRequest().setCharacterEncoding("UTF-8");
			} catch (Exception e) {}
			NaverBlogManager n = new NaverBlogManager();
			String json = n.blogGetData("·¹½ÃÇÇ");
			List<String> bList = new ArrayList<String>();
			try {
			   	JSONParser jp = new JSONParser();
				JSONObject obj = (JSONObject)jp.parse(json);
				JSONArray arr=(JSONArray)obj.get("items");
				for(int i=0;i<arr.size();i++){
					JSONObject js = (JSONObject)arr.get(i);
					String desc =(String)js.get("description");
					desc= desc.replace("<", "");
					desc= desc.replace(">", "");
					desc= desc.replace("/", "");
					desc= desc.replaceAll("[A-Za-z]", "");
					desc= desc.replace("&", "");
					desc= desc.replace("#", "");
					desc= desc.replace(",", "");
					bList.add(desc);
				}
			} catch (Exception e) {}
				List<RecipeVO> mList = RecipeDAO.recipeAllData();
			   int[] count = new int[mList.size()];
			   Pattern[] p = new Pattern[mList.size()];
			   for(int i=0; i<p.length;i++){
				   p[i]=Pattern.compile(mList.get(i).getSummary());
				   // Â¥°í,Â¥´Ù,Â¥´Ï,Â¬´Ï´Ù -> Â¥[°¡-ÆR]+
			   }
			   Matcher[] m = new Matcher[mList.size()];
			   for(String s:bList){
				   for(int i=0;i<m.length;i++){
					   m[i]=p[i].matcher(s);
					   while(m[i].find()){
						   count[i]++;
					   }
				   }
			   }
			   List<RecipeVO> list= new ArrayList<RecipeVO>();
			   List<RecommandVO> rList = new ArrayList<RecommandVO>();
			   for(int i=0; i<mList.size();i++){
				   if(count[i]>1){
					   System.out.println(mList.get(i).getSummary()+":"+count[i]);
					   list.add(mList.get(i));
					   RecommandVO vo = new RecommandVO();
					   vo.setCount(count[i]);
					   vo.setTitle(mList.get(i).getSummary());
					   rList.add(vo);
				   }
			 }
		
			model.addAttribute("rList", rList);
			model.addAttribute("list", list);
			model.addAttribute("main_jsp", "../recipe/recommend.jsp");
			return "../main/main.jsp";
		}
}
