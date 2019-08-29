package com.sist.model;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.Model;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

@Controller("BoardModel")
public class BoardModel {

	//자유게시판
	//게시판리스트
	@RequestMapping("board/board_list.do")
	public String board_list(Model model) {
		//page
				String page = model.getRequest().getParameter("page");
				if(page==null) 
						page="1";
				int curpage = Integer.parseInt(page);
				//map저장
				Map map = new HashMap();
				int rowSize = 5;
				int start = (curpage*rowSize)-(rowSize-1);
				int end = curpage*rowSize;
				
				map.put("start", start);
				map.put("end", end);
				map.put("categoryno", "6"); // 자유 게시판
				
				List<BoardVO> list = BoardDAO.boardListData(map);
				
				//목록전송
				model.addAttribute("list", list);
				
				int totalpage = BoardDAO.boardTotalPage();
				int count = BoardDAO.boardRowCount();
				count = count-((curpage*rowSize)-rowSize);
				String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
				//jsp로 값 전송~
				model.addAttribute("today", today);
				model.addAttribute("curpage", curpage);
				model.addAttribute("totalpage", totalpage);
				model.addAttribute("count", count);
				
				model.addAttribute("main_jsp", "../board/board_list.jsp");
				return "../main/main.jsp";
	}
	//글쓰기
	@RequestMapping("board/board_insert.do")
	public String board_insert(Model model) {
		String boardDis = model.getRequest().getParameter("boardDis");		// 게시판 구분 : categoryno
		model.addAttribute("boardDis", boardDis);
		model.addAttribute("main_jsp", "../board/board_insert.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("board/board_insert_ok.do") 
	public String board_insert_ok(Model model) {
		try {
			model.getRequest().setCharacterEncoding("UTF-8");
/*			String path="c:\\upload";
			String enctype="UTF-8";
			int size=100*1024*1024; //최대한으로 들어갈수있는 파일 크기가 100메가(1024KB, 1024*1024KB=MB)
			MultipartRequest mr = new MultipartRequest(request, path, size, enctype, new DefaultFileRenamePolicy()); //파일업로드시에 (리퀘스트,저장폴더)
																			//new DefaultFileRenamePolicy() 같은 파일이 들어오면 자동으로 이름+1 변환
*/			
		} catch (Exception ex) { }
		String memberid = model.getRequest().getParameter("memberid");
		String subject = model.getRequest().getParameter("subject");
		String content = model.getRequest().getParameter("content");
		String pwd = model.getRequest().getParameter("pwd");
		String categoryno = model.getRequest().getParameter("categoryno");
	
		BoardVO vo = new BoardVO();
		vo.setMemberid("hong");
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		vo.setCategoryno(Integer.parseInt(categoryno));
		
/*		String filename=mr.getOriginalFileName("upload");
		
		if(filename==null) { //파일이 없기 때문에 업로드를 안한 상태
			vo.setFilename("");
			vo.setFilesize(0);
		} else { //파일이 올라온 상태
			File file = new File(path+"\\"+filename);
			vo.setFilename(filename);
			vo.setFilesize((int)file.length());
		}*/
		// dao 전송
		BoardDAO.boardInsert(vo);
		String returnURL = "";
		if(categoryno.equals("6")){
			returnURL =  "redirect:../board/board_list.do";
		}
		// return "redirect:../board/board_list.do"; //redirect라 do를 한다, DispatcherServlet if문 참조
		System.out.println(" returnURL : " + returnURL);
		return returnURL;
		
	}
	//상세보기
	@RequestMapping("board/board_detail.do")
	public static String board_detail(Model model) {
		
		HttpSession session = model.getRequest().getSession();
		session.setAttribute("id", "hong");
		session.setAttribute("name", "홍길동");
		
		String no = model.getRequest().getParameter("no");
		
		BoardVO vo = BoardDAO.boardDetailData(Integer.parseInt(no), "detail");
		model.addAttribute("vo", vo);
		// list로(댓글목록보내주기)
		List<BoardDAO> list = BoardDAO.replyListData(Integer.parseInt(no));
		int count = BoardDAO.replyListCount(Integer.parseInt(no));

		// 상세보기안에 댓글을 출력 = 117번째줄 deatail.jsp★★★로 값을 보냄
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		
		model.addAttribute("main_jsp", "../board/board_detail.jsp");
		return "../main/main.jsp";
	}
	
	
	//수정하기
	@RequestMapping("board/board_update.do")
	public static String board_update(Model model) {
		String boardno = model.getRequest().getParameter("no");
		BoardVO vo = BoardDAO.boardDetailData(Integer.parseInt(boardno), "update");
		model.addAttribute("vo", vo);
		model.addAttribute("main_jsp", "../board/board_update.jsp"); 
		return "../main/main.jsp";
	}
	//수정하기ok
	@RequestMapping("board/board_update_ok.do")
	public String board_update_ok(Model model) {
		try {
			model.getRequest().setCharacterEncoding("UTF-8");
		} catch (Exception ex) {		
		}
		String name=model.getRequest().getParameter("memberid");
		String subject=model.getRequest().getParameter("subject");
		String content=model.getRequest().getParameter("content");
		String pwd=model.getRequest().getParameter("pwd");
		String no=model.getRequest().getParameter("boardno");
		
		BoardVO vo = new BoardVO();
		vo.setMemberid(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		vo.setBoardno(Integer.parseInt(no));
		
		//dao연결 => pwd가 맞을때와 틀릴때로 나뉨
		int n = BoardDAO.boardUpdate(vo);
		model.addAttribute("no", n);
		
		return "../board/board_update_ok.jsp";
	}
	//검색하기
	 @RequestMapping("board/find.do")
	 public static String searchData(Model model) {
			//page
			String page = "1";
			String fs = model.getRequest().getParameter("fs");	
			String textsearch = model.getRequest().getParameter("textsearch");
			
			int curpage = Integer.parseInt(page);
			//map저장
			Map map = new HashMap();
			int rowSize = 5;
			int start = (curpage*rowSize)-(rowSize-1);
			int end = curpage*rowSize;
			
			map.put("start", start);
			map.put("end", end);
			map.put("fs", fs);
			map.put("textsearch", textsearch);
			map.put("categoryno", 6);
			
			List<BoardVO> list = BoardDAO.boardListDataTEST(map);
			
			//목록전송
			model.addAttribute("list", list);
			
			int totalpage = BoardDAO.boardTotalPage();
			int count = BoardDAO.boardRowCount();
			
			// count가 글의 총갯수
			count = count-((curpage*rowSize)-rowSize);
			
			String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			//jsp로 값 전송~
			model.addAttribute("today", today);
			model.addAttribute("curpage", curpage);
			model.addAttribute("totalpage", totalpage);
			model.addAttribute("count", count);
			
			
			
			model.addAttribute("main_jsp", "../board/board_list.jsp");
			return "../main/main.jsp";
	 }

	//댓글달기
	 @RequestMapping("board/reply_insert.do")
		public String reply_insert(Model model) {

			// 요청값을 받는다
			try {
				model.getRequest().setCharacterEncoding("UTF-8");
			} catch (Exception ex) {
			}
			HttpSession session = model.getRequest().getSession();
			session.setAttribute("id", "hong");
			session.setAttribute("name", "홍길동");
			
			// freeboard-mapper의 id와 pwd는 어떻게 넘길까 생각
			String bno = model.getRequest().getParameter("bno"); //bno = boardno
			String msg = model.getRequest().getParameter("msg");
			
			
			String id = (String) session.getAttribute("id");
			String name = (String)session.getAttribute("name");
			//String name = model.getRequest().getParameter("name");
			System.out.println("bno는???"+bno);
			System.out.println("msg는???"+msg);
			System.out.println("id는???"+id);
			System.out.println("name는???"+name);

			/*HttpSession session = model.getRequest().getSession(); // 세션에 저장한 id와
																	// pwd 얻어오기
			String id = (String) session.getAttribute("hong");
			String name = (String) session.getAttribute("홍길동");*/
			
			ReplyVO vo = new ReplyVO();
			
			System.out.println(" bno : " + bno);
			System.out.println(" msg : " + msg);
			System.out.println(" name : " + name);
			
			vo.setBoardno((Integer.parseInt(bno)));
			vo.setMsg(msg);
			vo.setName(name);

			
			// DAO에 연결하여 데이터추가
			BoardDAO.replyInsert(vo);
			
			// 결과값(X) redirect 날렸기 때문에 댓글을 가져오는 위치는 96번째줄 String board_detail 메소드이다
			return "redirect:../board/board_detail.do?no=" + bno; // 댓글달면 detail로
																	// 넘어가야하니까

		}
	 //대댓글달기
	 @RequestMapping("board/reply_reinsert.do")
	 public String reply_reinsert(Model model) {
		 try {
				model.getRequest().setCharacterEncoding("UTF-8");
			} catch (Exception ex) { }
		 
		 HttpSession session = model.getRequest().getSession();
			session.setAttribute("id", "hong");
			session.setAttribute("name", "홍길동");

			//msg
			String msg = model.getRequest().getParameter("msg");
			//no
			String pno = model.getRequest().getParameter("no"); //상위 pno 값이 아직 확정이 안됌 그룹id,step찾아야함
			System.out.println("pno="+pno);
			//bno
			String bno = model.getRequest().getParameter("bno");
			//HttpSession session = model.getRequest().getSession();
			String id = (String)session.getAttribute("id");
			String name= (String)session.getAttribute("name");
			
			ReplyVO vo = new ReplyVO();
			vo.setBoardno(Integer.parseInt(bno));
			vo.setMsg(msg);
			vo.setId(id);
			vo.setName(name);
			
			BoardDAO.replyReInsert(Integer.parseInt(pno), vo);
			// group_id, group_step, group_tab 을 가져오기
			
		 return "redirect:../board/board_detail.do?no="+bno; //다시 detail로 넘어감
	 }
	 
	 //댓글수정 [미확인]
	 @RequestMapping("board/reply_update.do")
		public String reply_update(Model model) {
			try {
				model.getRequest().setCharacterEncoding("UTF-8");
			} catch (Exception ex) { }
			
			//msg
			String msg = model.getRequest().getParameter("msg");
			//no
			String no = model.getRequest().getParameter("no"); // 본인 no
			//bno
			String bno = model.getRequest().getParameter("bno");
			
			//DAO처리
			ReplyVO vo = new ReplyVO();
			vo.setMsg(msg);
			vo.setBoardno(Integer.parseInt(no));
			
			//BoardDAO.replyUpdate(vo);
		
			return "redirect:../board/board_detail.do?no="+bno; //다시 detail로 넘어감
		}
	 //삭제하기[미확인]
	 @RequestMapping("board/reply_delete.do")
		public String reply_delete(Model model) {
			String no = model.getRequest().getParameter("no"); // 본인 no
			
			String bno = model.getRequest().getParameter("bno");
			
			//DAO처리
			BoardDAO.replyDelete(Integer.parseInt(no));
			
			return "redirect:../board/board_detail.do?no="+bno; //댓글은 무조건 상세로... 다시 detail로 넘어감
		}
		@RequestMapping("board/board_delete.do")
		public String board_delete(Model model) {
			String no=model.getRequest().getParameter("no");
			model.addAttribute("boardno", no); //boardno 값으로 board_detail.jsp의 value="${boardno }"값
			System.out.println("no는???ㅅㅄㅄㅂ"+no);
			model.addAttribute("main_jsp", "../board/board_delete.jsp");
			return "../main/main.jsp";
		}
		@RequestMapping("board/board_delete_ok.do")
		public String board_delete_ok(Model model) {
			String no = model.getRequest().getParameter("no"); // 본인 no
			String pwd = model.getRequest().getParameter("pwd");
			System.out.println(pwd);
			int res=BoardDAO.boardDelete(Integer.parseInt(no), pwd);
			model.addAttribute("res", res);
			System.out.println("res값은??"+res);
			return "../board/board_delete_ok.jsp";
		}
		
		
		//--------------------------------------------------------------------------
		//JSP뷰단에서 자바와관련은 name, 자바스크립트관련은 id다!!!
		//QnA게시판
		//게시판리스트
		@RequestMapping("bQnA/qboard_list.do")
		public String qboard_list(Model model) {
			//page
			String page = model.getRequest().getParameter("page");
			if(page==null) 
					page="1";
			int curpage = Integer.parseInt(page);
			//map저장
			Map map = new HashMap();
			int rowSize = 5;
			int start = (curpage*rowSize)-(rowSize-1);
			int end = curpage*rowSize;
			
			map.put("start", start);
			map.put("end", end);
			map.put("categoryno", "1"); // Q&A 게시판
			
			
			
			List<BoardVO> list = BoardDAO.bQnAListData(map);
			
			//목록전송
			model.addAttribute("list", list);
			
			int totalpage = BoardDAO.boardTotalPage();
			int count = BoardDAO.boardRowCount();
			count = count-((curpage*rowSize)-rowSize);
			String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			//jsp로 값 전송~
			model.addAttribute("today", today);
			model.addAttribute("curpage", curpage);
			model.addAttribute("totalpage", totalpage);
			model.addAttribute("count", count);
			
			model.addAttribute("main_jsp", "../bQnA/qboard_list.jsp");
			return "../main/main.jsp";
		}
		//글쓰기
			@RequestMapping("bQnA/qboard_insert.do")
			public String qboard_insert(Model model) {
				String boardDis = model.getRequest().getParameter("boardDis");		// 게시판 구분 : categoryno
				model.addAttribute("boardDis", boardDis);
				model.addAttribute("main_jsp", "../bQnA/qboard_insert.jsp");
				return "../main/main.jsp";
			}
			@RequestMapping("bQnA/qboard_insert_ok.do") 
			public String qboard_insert_ok(Model model) {
				try {
					model.getRequest().setCharacterEncoding("UTF-8");	
				} catch (Exception ex) { }
				String memberid = model.getRequest().getParameter("memberid");
				String subject = model.getRequest().getParameter("subject");
				String content = model.getRequest().getParameter("content");
				String pwd = model.getRequest().getParameter("pwd");
				String categoryno = model.getRequest().getParameter("categoryno");
			
				BoardVO vo = new BoardVO();
				vo.setMemberid("hong");
				vo.setSubject(subject);
				vo.setContent(content);
				vo.setPwd(pwd);
				vo.setCategoryno(Integer.parseInt(categoryno));
				System.out.println("★★★카테고리는..ㅠㅠ?"+categoryno);
				// dao 전송
				BoardDAO.bQnAInsert(vo);
				String returnURL = "";
				if(categoryno.equals("1")){
					returnURL =  "redirect:../bQnA/qboard_list.do";
				}
				
				System.out.println(" returnURL : " + returnURL);
				return returnURL;
				//return "redirect:../bQnA/qboard_list.do";
			}
			//수정하기
			@RequestMapping("bQnA/qboard_update.do")
			public static String qboard_update(Model model) {
				String boardno = model.getRequest().getParameter("no");
				BoardVO vo = BoardDAO.boardDetailData(Integer.parseInt(boardno), "update");
				model.addAttribute("vo", vo);
				model.addAttribute("main_jsp", "../bQnA/qboard_update.jsp"); 
				return "../main/main.jsp";
			}
			//수정하기ok
			@RequestMapping("bQnA/qboard_update_ok.do")
			public String qboard_update_ok(Model model) {
				try {
					model.getRequest().setCharacterEncoding("UTF-8");
				} catch (Exception ex) {		
				}
				String name=model.getRequest().getParameter("memberid");
				String subject=model.getRequest().getParameter("subject");
				String content=model.getRequest().getParameter("content");
				String pwd=model.getRequest().getParameter("pwd");
				String no=model.getRequest().getParameter("boardno");
				
				BoardVO vo = new BoardVO();
				vo.setMemberid(name);
				vo.setSubject(subject);
				vo.setContent(content);
				vo.setPwd(pwd);
				vo.setBoardno(Integer.parseInt(no));
				
				//dao연결 => pwd가 맞을때와 틀릴때로 나뉨
				int n = BoardDAO.boardUpdate(vo);
				model.addAttribute("no", n);
				
				return "../bQnA/qboard_update_ok.jsp";
			}
			//삭제하기
			@RequestMapping("bQnA/qboard_delete.do")
			public String qboard_delete(Model model) {
				String no=model.getRequest().getParameter("no");
				model.addAttribute("boardno", no); //boardno 값으로 board_detail.jsp의 value="${boardno }"값
				model.addAttribute("main_jsp", "../bQnA/qboard_delete.jsp");
				return "../main/main.jsp";
			}
			//삭제하기ok
			@RequestMapping("bQnA/qboard_delete_ok.do")
			public String qboard_delete_ok(Model model) {
				String no = model.getRequest().getParameter("no"); // 본인 no
				String pwd = model.getRequest().getParameter("pwd");
				System.out.println(pwd);
				int res=BoardDAO.boardDelete(Integer.parseInt(no), pwd);
				model.addAttribute("res", res);
				System.out.println("ok로 넘어가는res값은??"+res);
				return "../bQnA/qboard_delete_ok.jsp";
			}
			
		//----답글답글
			
			@RequestMapping("bQnA/qboard_reply.do")
			public String qboard_reply(Model model) {
				String boardDis = model.getRequest().getParameter("boardDis");		// 게시판 구분 : categoryno
				String boardno = model.getRequest().getParameter("no");

				model.addAttribute("boardDis", boardDis);
				model.addAttribute("boardno", boardno);
				model.addAttribute("main_jsp", "../bQnA/qboard_reply.jsp");
				
				return "../main/main.jsp";
			}
		
		//답글쓰기
			@RequestMapping("bQnA/qboard_reply_ok.do") 
			public String qboard_reply_ok(Model model) {
				try {
					model.getRequest().setCharacterEncoding("UTF-8");	
				} catch (Exception ex) { }
				String board = model.getRequest().getParameter("bno");
				String memberid = model.getRequest().getParameter("memberid");
				String subject = model.getRequest().getParameter("subject");
				String content = model.getRequest().getParameter("content");
				String pwd = model.getRequest().getParameter("pwd");
				String categoryno = "1";
				
				System.out.println("답글 board는?? "+board);
				System.out.println("답글 memberid는?? "+memberid);
				System.out.println("답글 컨텐트는?? "+content);
				System.out.println("답글 categoryno?? "+categoryno);
				
				BoardVO vo = new BoardVO();
				vo.setMemberid("hong");
				vo.setSubject(subject);
				vo.setContent(content);
				vo.setPwd(pwd);
				vo.setCategoryno(Integer.parseInt(categoryno));
				
				// dao 전송
				BoardDAO.bQnATrueInsert(Integer.parseInt(board), vo);
		
				return "redirect:../bQnA/qboard_list.do";
	}
			
}
