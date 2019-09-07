package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;



import com.sist.controller.*;
import com.sist.dao.RecipeDAO;
import com.sist.dao.ReserveDAO;
import com.sist.vo.MemberVO;
import com.sist.vo.RecipeVO;
import com.sist.vo.ReserveVO;

@Controller("reserveModel")
public class ReserveModel {
	
	@RequestMapping("reserve/reserve.do")
	public String reserve_main(Model model){
		
		model.addAttribute("main_jsp", "../reserve/reserve.jsp");
		return "../main/main.jsp";
	}

	
	@RequestMapping("reserve/search.do")
	public String reserve_search(Model model){
		try {
			model.getRequest().setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		
		
		Map keymap = new HashMap();
		String key = model.getRequest().getParameter("key");
		if(key!=null && key!="") {
			keymap.put("key", key);
		}else{
			key="검색하세요";
			keymap.put("key", key);
		}
		
		
		
		model.addAttribute("key", key);
		
		return "../reserve/search.jsp";
	}
	
	@RequestMapping("reserve/search2.do")
	public String reserve_search2(Model model){
		try {
			model.getRequest().setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		
		
		Map keymap = new HashMap();
		String key = model.getRequest().getParameter("key");
		keymap.put("key", key);

		
		
		String page=model.getRequest().getParameter("page");
		if(page==null){
			page="1";
		}
		int curpage=Integer.parseInt(page);
		
		int rowSize=1;
		int start=(curpage*rowSize)-(rowSize-1);
		int end=curpage*rowSize;
		
		keymap.put("end", end);
		keymap.put("start", start);
		int total=RecipeDAO.RecipeSearchPage(keymap);
		/*int count = RecipeDAO.RecipeCount();
		count=count-((curpage*rowSize)-rowSize); */
		
		int BLOCK=5;
		
		int startpage=((curpage-1)/BLOCK*BLOCK)+1;
		
		int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		int allpage=total;
		
		if(endpage>allpage)
		{
			endpage=allpage;
		}
		
		
		List<RecipeVO> list = RecipeDAO.recipeSearch(keymap);
		model.addAttribute("list", list);
		
		for(RecipeVO vo:list){
			if(vo.getSummary_in()==null){
				continue;
			}else{
				int len=vo.getSummary_in().length();
				
				if(len>50)
				{
					vo.setSummary_in(vo.getSummary_in().substring(0, 50)+"...");
				}
			}
		}
		
		model.addAttribute("key", key);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("curpage", curpage);
		model.addAttribute("allpage", allpage);
		model.addAttribute("BLOCK", BLOCK);
		model.addAttribute("total", total);
		//model.addAttribute("count", count);
		
		return "../reserve/search2.jsp";
	}
	
	@RequestMapping("reserve/recipeSelect.do")
	public String reserve_recipeSelect(Model model){
		String no=model.getRequest().getParameter("no");
		
		RecipeVO vo=ReserveDAO.recipeSelectReserve(Integer.parseInt(no));
		
		model.addAttribute("vo", vo);
		return "../reserve/recipeSelect.jsp";
	}
	
	@RequestMapping("reserve/blank.do")
	public String reserve_blank(Model model){
		
		return "../reserve/blank.jsp";
	}
	
	
	
	@RequestMapping("reserve/area.do")
	public String reserve_area(Model model){
		
		
		return "../reserve/area.jsp";
	}
	@RequestMapping("reserve/areaSelect.do")
	public String reserve_areaSelect(Model model){
		String title=model.getRequest().getParameter("title");
		String areaName=model.getRequest().getParameter("areaName");
		
		
		model.addAttribute("areaT", title);
		model.addAttribute("areaName", areaName);
		return "../reserve/areaSelect.jsp";
	}
	
	
	@RequestMapping("reserve/cheif.do")
	public String reserve_cheif(Model model){
		try {
			model.getRequest().setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		
		Map map = new HashMap();
		String area=model.getRequest().getParameter("area");	
		map.put("area", area);
		
		
		//페이지
		String page=model.getRequest().getParameter("page");
		if(page==null){
			page="1";
		}
		
		int curpage=Integer.parseInt(page);
		
		int rowSize=2;
		int start=(curpage*rowSize)-(rowSize-1);
		int end=curpage*rowSize;
		
		map.put("end", end);
		map.put("start", start);
		
		int total=ReserveDAO.recipeSearchReserve(map);
		
	
		
		int BLOCK=5;
		
		int startpage=((curpage-1)/BLOCK*BLOCK)+1;
		
		int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		int allpage=total;
		
		if(endpage>allpage)
		{
			endpage=allpage;
		}
		
		
	
		List<MemberVO> list=ReserveDAO.chiefList(map);
		for(int i=0;i<list.size();i++){
			System.out.println(list.get(i).getId()+" "+list.get(i).getAddr2() +" "+ list.get(i).getPay() +" "+list.get(i).getAdmin());
		}
		model.addAttribute("list", list);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("curpage", curpage);
		model.addAttribute("allpage", allpage);
		model.addAttribute("BLOCK", BLOCK);
		model.addAttribute("total", total);
		
		return "../reserve/cheif.jsp";
	}
	
	@RequestMapping("reserve/cheifSelect.do")
	public String reserve_cheifSelect(Model model){
		String id=model.getRequest().getParameter("id");
		
		MemberVO vo=ReserveDAO.chiefSelect(id);
		
		model.addAttribute("vo", vo);
		return "../reserve/cheifSelect.jsp";
	}
	@RequestMapping("reserve/date.do")
	public String reserve_date(Model model){
		// 사용자 요청값 받기
				String strYear = model.getRequest().getParameter("strYear");
				String strMonth = model.getRequest().getParameter("strMonth");

				// 현재 날짜 읽기
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d");// 07 08 MM=>1~9
																		// => 01,09
				// 자바는 숫자표현식 => 10,8(0),16(0x)
				StringTokenizer st = new StringTokenizer(sdf.format(date), "-");

				String sy = st.nextToken();
				String sm = st.nextToken();
				String day1 = st.nextToken();

				if (strYear == null) {
					strYear = sy;
				}
				if (strMonth == null) {
					strMonth = sm;
				}

				int year = Integer.parseInt(strYear);
				int month = Integer.parseInt(strMonth);
				int day = Integer.parseInt(day1);
				
				model.addAttribute("year", year);
				model.addAttribute("month", month);
				model.addAttribute("day", day);
				String[] strWeek = { "일", "월", "화", "수", "목", "금", "토" };
				model.addAttribute("strWeek", strWeek);

				Calendar cal = Calendar.getInstance();
				// cal.set(year,month,1);
				/*
				 * cal.set(Calendar.YEAR, year); cal.set(Calendar.MONTH, month-1);
				 * cal.set(Calendar.DATE, 1);
				 */
				cal.set(year, month - 1, 1);
				//System.out.println(cal.get(Calendar.DAY_OF_WEEK));
				/*
				 * // 요일 구하기 int[] lastday={31,28,31,30,31,30, 31,31,30,31,30,31}; // 1년
				 * 1월 1일 ~ 2018년 12월 31의 총합 int total=(year-1)*365 +(year-1)/4
				 * -(year-1)/100 +(year-1)/400; //2019년 1월 ~ 7월의 총합 if((year%4==0 &&
				 * year%100!=0)||(year%400==0)) lastday[1]=29; else lastday[1]=28;
				 * 
				 * for(int i=0;i<month-1;i++) { total+=lastday[i]; }
				 * 
				 * total++;
				 * 
				 * // 요일구하기 int week=total%7;
				 */

				int week = cal.get(Calendar.DAY_OF_WEEK);
				week = week - 1;
				int lastday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
				//System.out.println("Calendar.DATE=" + cal.getActualMaximum(Calendar.DAY_OF_MONTH));
				//System.out.println(lastday);
				model.addAttribute("week", week);
				model.addAttribute("lastday", lastday);
				
				String id=model.getRequest().getParameter("id");
				
				List<ReserveVO> list=ReserveDAO.selectdate(id);
				
				int[] reday=new int[31];
				int today=day;
				for(int i=0;i<list.size();i++){
					
					String alldate=list.get(i).getRdate().substring(0, list.get(i).getRdate().indexOf(" "));
					StringTokenizer st1=new StringTokenizer(alldate,"-");
					if(strMonth.length()==1){
						strMonth="0"+strMonth;
					}
					System.out.println(strYear);
					System.out.println(strMonth);
					System.out.println("alldate"+alldate);
					java.sql.Date lidate = java.sql.Date.valueOf(alldate);
					if(st1.nextToken().equals(strYear) && st1.nextToken().equals(strMonth)){
						Map map=new HashMap();
						map.put("id", id);
						map.put("date", lidate);
						int count=ReserveDAO.selectdatecount(map);
						System.out.println(count);
						if(count==3){
							System.out.println(count);
							int k=Integer.parseInt(st1.nextToken());
							reday[k-1]=k;
						}
						
						
					}else{
						today=0;
					}
				}
				
				List<Integer> rList=new ArrayList<Integer>();
				int u=1;
				for(int k:reday) {
					
					if(k<today || Integer.parseInt(strMonth)<Integer.parseInt(sm)){
						k=u;
						rList.add(k);
						k=0;
					}else{
						rList.add(k);
					}
					
					if(u<today || Integer.parseInt(strMonth)<Integer.parseInt(sm)) u++;
					
				}
				model.addAttribute("today", today);
				model.addAttribute("rList", rList);
				/*strYear
				strMonth*/
				/*String dno = model.getRequest().getParameter("dno"); // date no => 난수로 저장됨, 1~31중 몇개
				int[] reday=new int[31];
				StringTokenizer st1=new StringTokenizer(dno,", "); // 난수를 ", "로 잘라냄
				// 1 => reday[0]=1 => reday[25]=26
				while(st1.hasMoreTokens()) {
					int k=Integer.parseInt(st1.nextToken());
					reday[k-1]=k; // 첨자 하나가 작아야됨
				}
				List<Integer> rList=new ArrayList<Integer>();
				for(int k:reday) {
					if(k<day) // 오늘 이후것만 출력
						k=0;
					rList.add(k);
				}
				model.addAttribute("rList", rList);*/
		return "../reserve/date.jsp";
	}
	@RequestMapping("reserve/time.do")
	public String reserve_time(Model model){
		String year=model.getRequest().getParameter("year");
		String month=model.getRequest().getParameter("month");
		String day=model.getRequest().getParameter("day");
		String id=model.getRequest().getParameter("id");
		
		if(month.length()==1){
			month="0"+month;
		}
		if(day.length()==1){
			day="0"+day;
		}
		String data=year+"-"+month+"-"+day;
		ReserveVO vo=new ReserveVO();
		vo.setCheifid(id);
		vo.setRdate(data);
		List<ReserveVO> list=ReserveDAO.selectTime(vo);
		/*List<String> tlist=new ArrayList<String>();
		tlist.add("아침");
		tlist.add("점심");
		tlist.add("저녁");
		
		model.addAttribute("tlist", tlist);*/
		
		for(int i=0;i<list.size();i++){
			model.addAttribute("ch"+(i+1), i);
		}
		model.addAttribute("list", list);
		model.addAttribute("data", data);
		return "../reserve/time.jsp";
	}
	
	@RequestMapping("reserve/dateSelect.do")
	public String reserve_dateSelect(Model model){
		String datedata=model.getRequest().getParameter("datedata");
		String time=model.getRequest().getParameter("time");
		
		String timekey;
		if(time.equals("아침")){
			timekey="1";
		}else if(time.equals("점심")){
			timekey="2";
		}else if(time.equals("저녁")){
			timekey="3";
		}else{
			timekey="에러";
		}
		
		model.addAttribute("datedata", datedata);
		model.addAttribute("time", time);
		model.addAttribute("timekey", timekey);
		return "../reserve/dateSelect.jsp";
	}
	
	@RequestMapping("reserve/price.do")
	public String reserve_price(Model model){
		
		return "../reserve/price.jsp";
	}
	@RequestMapping("reserve/priceSelect.do")
	public String reserve_priceSelect(Model model){
		String pricesug=model.getRequest().getParameter("pricesug");
		
		model.addAttribute("pricesug", pricesug);
		return "../reserve/priceSelect.jsp";
	}
	@RequestMapping("reserve/command.do")
	public String reserve_command(Model model){
		
		return "../reserve/command.jsp";
	}
	@RequestMapping("reserve/commandSelect.do")
	public String reserve_commandSelect(Model model){
		String commandText=model.getRequest().getParameter("commandText");
		
		
		model.addAttribute("commandText", commandText);
		return "../reserve/commandSelect.jsp";
	}
		@RequestMapping("reserve/final.do")
		public String reserve_final(Model model){
			
			try {
				model.getRequest().setCharacterEncoding("UTF-8");
			} catch (Exception e) {}
			String poster=model.getRequest().getParameter("poster");
			String no=model.getRequest().getParameter("no");
			String title=model.getRequest().getParameter("title");		//2.
			String id=model.getRequest().getParameter("id");			//()4.
			String name=model.getRequest().getParameter("name");		//3.
			String time=model.getRequest().getParameter("time");		//()6.
			String date=model.getRequest().getParameter("date");		//5.
			String price=model.getRequest().getParameter("price");		//6.
			String msg=model.getRequest().getParameter("msg");			//7.
			
			
			
			model.addAttribute("poster", poster);
			model.addAttribute("no", no);
			model.addAttribute("title", title);
			model.addAttribute("id", id);
			model.addAttribute("name", name);
			model.addAttribute("time", time);
			model.addAttribute("date", date);
			model.addAttribute("price", price);
			model.addAttribute("msg", msg);
			return "../reserve/final.jsp";
		}
	
		@RequestMapping("reserve/endReserve.do")
		public String reserve_end(Model model){
			
			try {
				model.getRequest().setCharacterEncoding("UTF-8");
			} catch (Exception e) {}
			
			HttpSession session = model.getRequest().getSession();
			String poster=model.getRequest().getParameter("poster");
			String no=model.getRequest().getParameter("no");
			String name=model.getRequest().getParameter("name");
			String title=model.getRequest().getParameter("title");		
			String id=model.getRequest().getParameter("id");			
			String time=model.getRequest().getParameter("time");		
			String date=model.getRequest().getParameter("date");		
			date=date.substring(date.indexOf(":")+2,date.indexOf("("));
			
			String price=model.getRequest().getParameter("price");		
			String msg=model.getRequest().getParameter("msg");	
			String userid=(String)session.getAttribute("id");
			/*Integer paym=(Integer)session.getAttribute("pay");
			System.out.println("@pay:"+paym);*/
			
			try{
				ReserveVO vo=new ReserveVO();
				vo.setCheifid(id);	//
				vo.setName(name);	//
				vo.setRno(Integer.parseInt(no));
				vo.setSummary(title);
				vo.setRdate(date);
				vo.setRtime(Integer.parseInt(time));
				vo.setPrice(Integer.parseInt(price));
				vo.setMsg(msg);
				vo.setUserid(userid);	//

				Map map=new HashMap();
				map.put("id", userid);
				map.put("price", price);
				ReserveDAO.reserveInsert(vo,map);
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			
			
			
			model.addAttribute("main_jsp", "../reserve/endReserve.jsp");
			return "../main/main.jsp";
		}
		@RequestMapping("reserve/myreserveList.do")
		public String reserve_myreserveList(Model model){
			String data=model.getRequest().getParameter("data");
			HttpSession session = model.getRequest().getSession();
			String id=(String)session.getAttribute("id");
			int admin=(int)session.getAttribute("admin");
			Map map=new HashMap();
			System.out.println("@@id:"+id);
			map.put("id", id);
			if(data==null){
				if(admin==2){	
					data="1";
				}else if(admin==0){
					data="3";
				}
			}
			map.put("data", data);
			System.out.println("data: "+data);
			
			String page=model.getRequest().getParameter("page");
			if(page==null){
				page="1";
			}
			
			int curpage=Integer.parseInt(page);
			
			int rowSize=5;
			int start=(curpage*rowSize)-(rowSize-1);
			int end=curpage*rowSize;
			
			map.put("end", end);
			map.put("start", start);
			
			int total=ReserveDAO.reservepage(map);
			
		
			
			int BLOCK=5;
			
			int startpage=((curpage-1)/BLOCK*BLOCK)+1;
			
			int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
			
			int allpage=total;
			
			if(endpage>allpage)
			{
				endpage=allpage;
			}
			
			
			
			
			List<ReserveVO> list=ReserveDAO.reserveList(map);
			for(ReserveVO vo:list){
				
					int len=vo.getSummary().length();
					if(len>25)
					{
						vo.setSummary(vo.getSummary().substring(0, 25)+"...");
					}
					vo.setRdate(vo.getRdate().substring(0, vo.getRdate().indexOf(" ")));

					System.out.println("@@@no : "+vo.getNo());
					System.out.println("@@@userid : "+vo.getUserid());
					System.out.println("@@@cheifid : "+vo.getCheifid());
			}
			
			
			model.addAttribute("list", list);
			model.addAttribute("data", data);
			model.addAttribute("startpage", startpage);
			model.addAttribute("endpage", endpage);
			model.addAttribute("curpage", curpage);
			model.addAttribute("allpage", allpage);
			model.addAttribute("BLOCK", BLOCK);
			model.addAttribute("total", total);
			model.addAttribute("main_jsp", "../reserve/myreserveList.jsp");
			return "../main/main.jsp";
		}
		
		
	/*	
		@RequestMapping("reserve/checkdate.do")
		public String reserve_checkdate(Model model){
			// 사용자 요청값 받기
					String strYear = model.getRequest().getParameter("strYear");
					String strMonth = model.getRequest().getParameter("strMonth");

					// 현재 날짜 읽기
					Date date = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d");// 07 08 MM=>1~9
																			// => 01,09
					// 자바는 숫자표현식 => 10,8(0),16(0x)
					StringTokenizer st = new StringTokenizer(sdf.format(date), "-");

					 String sy=st.nextToken();
					 String sm=st.nextToken();
					 String day1=st.nextToken();
					   
					 if(strYear==null)
					 {
						 strYear=sy;
					 }
					 if(strMonth==null)
					 {
						 strMonth=sm;
					 }
					   
					 int year=Integer.parseInt(strYear);
					 int month=Integer.parseInt(strMonth);
					 int day=Integer.parseInt(day1);
					   
					 model.addAttribute("year", year);
					 model.addAttribute("month", month);
					 model.addAttribute("day", day);
					   
					 String[] strWeek={"일","월","화","수","목","금","토"};
					 model.addAttribute("strWeek", strWeek);
					   

					
					 int[] lastday={31,28,31,30,31,30,
							        31,31,30,31,30,31};
					 // 1년 1월 1일 ~ 2018년 12월 31의 총합 
					 int total=(year-1)*365
							  +(year-1)/4
							  -(year-1)/100
							  +(year-1)/400;
					 //2019년 1월 ~ 7월의 총합 
					 if((year%4==0 && year%100!=0)||(year%400==0))
						 lastday[1]=29;
					 else
						 lastday[1]=28;
					   
					 for(int i=0;i<month-1;i++)
					 {
						 total+=lastday[i];
					 }
					   
					 total++;
					   
					 // 요일구하기 
					int week=total%7;	   

					System.out.println(lastday);
					model.addAttribute("week", week);
					model.addAttribute("lastday", lastday);
					
					String id=model.getRequest().getParameter("id");
					
					List<ReserveVO> list=ReserveDAO.selectdate(id);
					
					int[] reday=new int[31];
					int today=day;
					for(int i=0;i<list.size();i++){
						
						String alldate=list.get(i).getRdate().substring(0, list.get(i).getRdate().indexOf(" "));
						StringTokenizer st1=new StringTokenizer(alldate,"-");
						if(strMonth.length()==1){
							strMonth="0"+strMonth;
						}
						System.out.println(strYear);
						System.out.println(strMonth);
						System.out.println("alldate"+alldate);
						java.sql.Date lidate = java.sql.Date.valueOf(alldate);
						if(st1.nextToken().equals(strYear) && st1.nextToken().equals(strMonth)){
							Map map=new HashMap();
							map.put("id", id);
							map.put("date", lidate);
							int count=ReserveDAO.selectdatecount(map);
							System.out.println(count);
							if(count==3){
								System.out.println(count);
								int k=Integer.parseInt(st1.nextToken());
								reday[k-1]=k;
							}
							
							
						}else{
							today=0;
						}
					}
					
					List<Integer> rList=new ArrayList<Integer>();
					int u=1;
					for(int k:reday) {
						
						if(k<today || Integer.parseInt(strMonth)<Integer.parseInt(sm)){
							k=u;
							rList.add(k);
							k=0;
						}else{
							rList.add(k);
						}
						
						if(u<today || Integer.parseInt(strMonth)<Integer.parseInt(sm)) u++;
						
					}
					model.addAttribute("today", today);
					model.addAttribute("rList", rList);
					strYear
					strMonth
					String dno = model.getRequest().getParameter("dno"); // date no => 난수로 저장됨, 1~31중 몇개
					int[] reday=new int[31];
					StringTokenizer st1=new StringTokenizer(dno,", "); // 난수를 ", "로 잘라냄
					// 1 => reday[0]=1 => reday[25]=26
					while(st1.hasMoreTokens()) {
						int k=Integer.parseInt(st1.nextToken());
						reday[k-1]=k; // 첨자 하나가 작아야됨
					}
					List<Integer> rList=new ArrayList<Integer>();
					for(int k:reday) {
						if(k<day) // 오늘 이후것만 출력
							k=0;
						rList.add(k);
					}
					model.addAttribute("rList", rList);
			return "../reserve/checkdate.jsp";
		}*/
		@RequestMapping("reserve/myreserveList_ok.do")
		public String reserve_myreserveList_ok(Model model){
			try {
				model.getRequest().setCharacterEncoding("UTF-8");
			} catch (Exception e) {}
			
			String no=model.getRequest().getParameter("no");
			String comp=model.getRequest().getParameter("comp");
			System.out.println("no"+no);
			System.out.println("comp"+comp);
			
			Map map=new HashMap();
			map.put("no", no);
			if(comp.equals("확인")){
				map.put("cancel", "dont");
				ReserveDAO.reserveUpdate(map);
			}else if(comp.equals("취소")){
				map.put("cancel", "cando");
				ReserveDAO.reserveUpdate(map);
			}
			
			return "redirect:../reserve/myreserveList.do";
		}

		
		
		@RequestMapping("reserve/adminlist.do")
		public String reserve_adminlist(Model model){
			try {
				model.getRequest().setCharacterEncoding("UTF-8");
			} catch (Exception e) {}
			
			/*HttpSession session = model.getRequest().getSession();
			int admin=(int)session.getAttribute("admin");*/
			Map map=new HashMap();
			
			/*map.put("adminc", adminc);*/
			
			
			String page=model.getRequest().getParameter("page");
			if(page==null){
				page="1";
			}
			
			int curpage=Integer.parseInt(page);
			
			int rowSize=5;
			int start=(curpage*rowSize)-(rowSize-1);
			int end=curpage*rowSize;
			
			map.put("end", end);
			map.put("start", start);
			
			int total=ReserveDAO.adminpage();//reservepage(map);
			
		
			
			int BLOCK=5;
			
			int startpage=((curpage-1)/BLOCK*BLOCK)+1;
			
			int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
			
			int allpage=total;
			
			if(endpage>allpage){
				endpage=allpage;
			}
			
			
			
			
			List<ReserveVO> list=ReserveDAO.adminList(map);//reserveList(map);
			for(ReserveVO vo:list){
				
					int len=vo.getSummary().length();
					if(len>25){
						vo.setSummary(vo.getSummary().substring(0, 25)+"...");
					}
					vo.setRdate(vo.getRdate().substring(0, vo.getRdate().indexOf(" ")));

			}
			return "../reserve/adminlist.do";
		}
}
