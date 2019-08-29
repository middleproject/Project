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

	//�����Խ���
	//�Խ��Ǹ���Ʈ
	@RequestMapping("board/board_list.do")
	public String board_list(Model model) {
		//page
				String page = model.getRequest().getParameter("page");
				if(page==null) 
						page="1";
				int curpage = Integer.parseInt(page);
				//map����
				Map map = new HashMap();
				int rowSize = 5;
				int start = (curpage*rowSize)-(rowSize-1);
				int end = curpage*rowSize;
				
				map.put("start", start);
				map.put("end", end);
				map.put("categoryno", "6"); // ���� �Խ���
				
				List<BoardVO> list = BoardDAO.boardListData(map);
				
				//�������
				model.addAttribute("list", list);
				
				int totalpage = BoardDAO.boardTotalPage();
				int count = BoardDAO.boardRowCount();
				count = count-((curpage*rowSize)-rowSize);
				String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
				//jsp�� �� ����~
				model.addAttribute("today", today);
				model.addAttribute("curpage", curpage);
				model.addAttribute("totalpage", totalpage);
				model.addAttribute("count", count);
				
				model.addAttribute("main_jsp", "../board/board_list.jsp");
				return "../main/main.jsp";
	}
	//�۾���
	@RequestMapping("board/board_insert.do")
	public String board_insert(Model model) {
		String boardDis = model.getRequest().getParameter("boardDis");		// �Խ��� ���� : categoryno
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
			int size=100*1024*1024; //�ִ������� �����ִ� ���� ũ�Ⱑ 100�ް�(1024KB, 1024*1024KB=MB)
			MultipartRequest mr = new MultipartRequest(request, path, size, enctype, new DefaultFileRenamePolicy()); //���Ͼ��ε�ÿ� (������Ʈ,��������)
																			//new DefaultFileRenamePolicy() ���� ������ ������ �ڵ����� �̸�+1 ��ȯ
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
		
		if(filename==null) { //������ ���� ������ ���ε带 ���� ����
			vo.setFilename("");
			vo.setFilesize(0);
		} else { //������ �ö�� ����
			File file = new File(path+"\\"+filename);
			vo.setFilename(filename);
			vo.setFilesize((int)file.length());
		}*/
		// dao ����
		BoardDAO.boardInsert(vo);
		String returnURL = "";
		if(categoryno.equals("6")){
			returnURL =  "redirect:../board/board_list.do";
		}
		// return "redirect:../board/board_list.do"; //redirect�� do�� �Ѵ�, DispatcherServlet if�� ����
		System.out.println(" returnURL : " + returnURL);
		return returnURL;
		
	}
	//�󼼺���
	@RequestMapping("board/board_detail.do")
	public static String board_detail(Model model) {
		
		HttpSession session = model.getRequest().getSession();
		session.setAttribute("id", "hong");
		session.setAttribute("name", "ȫ�浿");
		
		String no = model.getRequest().getParameter("no");
		
		BoardVO vo = BoardDAO.boardDetailData(Integer.parseInt(no), "detail");
		model.addAttribute("vo", vo);
		// list��(��۸�Ϻ����ֱ�)
		List<BoardDAO> list = BoardDAO.replyListData(Integer.parseInt(no));
		int count = BoardDAO.replyListCount(Integer.parseInt(no));

		// �󼼺���ȿ� ����� ��� = 117��°�� deatail.jsp�ڡڡڷ� ���� ����
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		
		model.addAttribute("main_jsp", "../board/board_detail.jsp");
		return "../main/main.jsp";
	}
	
	
	//�����ϱ�
	@RequestMapping("board/board_update.do")
	public static String board_update(Model model) {
		String boardno = model.getRequest().getParameter("no");
		BoardVO vo = BoardDAO.boardDetailData(Integer.parseInt(boardno), "update");
		model.addAttribute("vo", vo);
		model.addAttribute("main_jsp", "../board/board_update.jsp"); 
		return "../main/main.jsp";
	}
	//�����ϱ�ok
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
		
		//dao���� => pwd�� �������� Ʋ������ ����
		int n = BoardDAO.boardUpdate(vo);
		model.addAttribute("no", n);
		
		return "../board/board_update_ok.jsp";
	}
	//�˻��ϱ�
	 @RequestMapping("board/find.do")
	 public static String searchData(Model model) {
			//page
			String page = "1";
			String fs = model.getRequest().getParameter("fs");	
			String textsearch = model.getRequest().getParameter("textsearch");
			
			int curpage = Integer.parseInt(page);
			//map����
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
			
			//�������
			model.addAttribute("list", list);
			
			int totalpage = BoardDAO.boardTotalPage();
			int count = BoardDAO.boardRowCount();
			
			// count�� ���� �Ѱ���
			count = count-((curpage*rowSize)-rowSize);
			
			String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			//jsp�� �� ����~
			model.addAttribute("today", today);
			model.addAttribute("curpage", curpage);
			model.addAttribute("totalpage", totalpage);
			model.addAttribute("count", count);
			
			
			
			model.addAttribute("main_jsp", "../board/board_list.jsp");
			return "../main/main.jsp";
	 }

	//��۴ޱ�
	 @RequestMapping("board/reply_insert.do")
		public String reply_insert(Model model) {

			// ��û���� �޴´�
			try {
				model.getRequest().setCharacterEncoding("UTF-8");
			} catch (Exception ex) {
			}
			HttpSession session = model.getRequest().getSession();
			session.setAttribute("id", "hong");
			session.setAttribute("name", "ȫ�浿");
			
			// freeboard-mapper�� id�� pwd�� ��� �ѱ�� ����
			String bno = model.getRequest().getParameter("bno"); //bno = boardno
			String msg = model.getRequest().getParameter("msg");
			
			
			String id = (String) session.getAttribute("id");
			String name = (String)session.getAttribute("name");
			//String name = model.getRequest().getParameter("name");
			System.out.println("bno��???"+bno);
			System.out.println("msg��???"+msg);
			System.out.println("id��???"+id);
			System.out.println("name��???"+name);

			/*HttpSession session = model.getRequest().getSession(); // ���ǿ� ������ id��
																	// pwd ������
			String id = (String) session.getAttribute("hong");
			String name = (String) session.getAttribute("ȫ�浿");*/
			
			ReplyVO vo = new ReplyVO();
			
			System.out.println(" bno : " + bno);
			System.out.println(" msg : " + msg);
			System.out.println(" name : " + name);
			
			vo.setBoardno((Integer.parseInt(bno)));
			vo.setMsg(msg);
			vo.setName(name);

			
			// DAO�� �����Ͽ� �������߰�
			BoardDAO.replyInsert(vo);
			
			// �����(X) redirect ���ȱ� ������ ����� �������� ��ġ�� 96��°�� String board_detail �޼ҵ��̴�
			return "redirect:../board/board_detail.do?no=" + bno; // ��۴޸� detail��
																	// �Ѿ���ϴϱ�

		}
	 //���۴ޱ�
	 @RequestMapping("board/reply_reinsert.do")
	 public String reply_reinsert(Model model) {
		 try {
				model.getRequest().setCharacterEncoding("UTF-8");
			} catch (Exception ex) { }
		 
		 HttpSession session = model.getRequest().getSession();
			session.setAttribute("id", "hong");
			session.setAttribute("name", "ȫ�浿");

			//msg
			String msg = model.getRequest().getParameter("msg");
			//no
			String pno = model.getRequest().getParameter("no"); //���� pno ���� ���� Ȯ���� �ȉ� �׷�id,stepã�ƾ���
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
			// group_id, group_step, group_tab �� ��������
			
		 return "redirect:../board/board_detail.do?no="+bno; //�ٽ� detail�� �Ѿ
	 }
	 
	 //��ۼ��� [��Ȯ��]
	 @RequestMapping("board/reply_update.do")
		public String reply_update(Model model) {
			try {
				model.getRequest().setCharacterEncoding("UTF-8");
			} catch (Exception ex) { }
			
			//msg
			String msg = model.getRequest().getParameter("msg");
			//no
			String no = model.getRequest().getParameter("no"); // ���� no
			//bno
			String bno = model.getRequest().getParameter("bno");
			
			//DAOó��
			ReplyVO vo = new ReplyVO();
			vo.setMsg(msg);
			vo.setBoardno(Integer.parseInt(no));
			
			//BoardDAO.replyUpdate(vo);
		
			return "redirect:../board/board_detail.do?no="+bno; //�ٽ� detail�� �Ѿ
		}
	 //�����ϱ�[��Ȯ��]
	 @RequestMapping("board/reply_delete.do")
		public String reply_delete(Model model) {
			String no = model.getRequest().getParameter("no"); // ���� no
			
			String bno = model.getRequest().getParameter("bno");
			
			//DAOó��
			BoardDAO.replyDelete(Integer.parseInt(no));
			
			return "redirect:../board/board_detail.do?no="+bno; //����� ������ �󼼷�... �ٽ� detail�� �Ѿ
		}
		@RequestMapping("board/board_delete.do")
		public String board_delete(Model model) {
			String no=model.getRequest().getParameter("no");
			model.addAttribute("boardno", no); //boardno ������ board_detail.jsp�� value="${boardno }"��
			System.out.println("no��???��������"+no);
			model.addAttribute("main_jsp", "../board/board_delete.jsp");
			return "../main/main.jsp";
		}
		@RequestMapping("board/board_delete_ok.do")
		public String board_delete_ok(Model model) {
			String no = model.getRequest().getParameter("no"); // ���� no
			String pwd = model.getRequest().getParameter("pwd");
			System.out.println(pwd);
			int res=BoardDAO.boardDelete(Integer.parseInt(no), pwd);
			model.addAttribute("res", res);
			System.out.println("res����??"+res);
			return "../board/board_delete_ok.jsp";
		}
		
		
		//--------------------------------------------------------------------------
		//JSP��ܿ��� �ڹٿͰ����� name, �ڹٽ�ũ��Ʈ������ id��!!!
		//QnA�Խ���
		//�Խ��Ǹ���Ʈ
		@RequestMapping("bQnA/qboard_list.do")
		public String qboard_list(Model model) {
			//page
			String page = model.getRequest().getParameter("page");
			if(page==null) 
					page="1";
			int curpage = Integer.parseInt(page);
			//map����
			Map map = new HashMap();
			int rowSize = 5;
			int start = (curpage*rowSize)-(rowSize-1);
			int end = curpage*rowSize;
			
			map.put("start", start);
			map.put("end", end);
			map.put("categoryno", "1"); // Q&A �Խ���
			
			
			
			List<BoardVO> list = BoardDAO.bQnAListData(map);
			
			//�������
			model.addAttribute("list", list);
			
			int totalpage = BoardDAO.boardTotalPage();
			int count = BoardDAO.boardRowCount();
			count = count-((curpage*rowSize)-rowSize);
			String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			//jsp�� �� ����~
			model.addAttribute("today", today);
			model.addAttribute("curpage", curpage);
			model.addAttribute("totalpage", totalpage);
			model.addAttribute("count", count);
			
			model.addAttribute("main_jsp", "../bQnA/qboard_list.jsp");
			return "../main/main.jsp";
		}
		//�۾���
			@RequestMapping("bQnA/qboard_insert.do")
			public String qboard_insert(Model model) {
				String boardDis = model.getRequest().getParameter("boardDis");		// �Խ��� ���� : categoryno
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
				System.out.println("�ڡڡ�ī�װ���..�Ф�?"+categoryno);
				// dao ����
				BoardDAO.bQnAInsert(vo);
				String returnURL = "";
				if(categoryno.equals("1")){
					returnURL =  "redirect:../bQnA/qboard_list.do";
				}
				
				System.out.println(" returnURL : " + returnURL);
				return returnURL;
				//return "redirect:../bQnA/qboard_list.do";
			}
			//�����ϱ�
			@RequestMapping("bQnA/qboard_update.do")
			public static String qboard_update(Model model) {
				String boardno = model.getRequest().getParameter("no");
				BoardVO vo = BoardDAO.boardDetailData(Integer.parseInt(boardno), "update");
				model.addAttribute("vo", vo);
				model.addAttribute("main_jsp", "../bQnA/qboard_update.jsp"); 
				return "../main/main.jsp";
			}
			//�����ϱ�ok
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
				
				//dao���� => pwd�� �������� Ʋ������ ����
				int n = BoardDAO.boardUpdate(vo);
				model.addAttribute("no", n);
				
				return "../bQnA/qboard_update_ok.jsp";
			}
			//�����ϱ�
			@RequestMapping("bQnA/qboard_delete.do")
			public String qboard_delete(Model model) {
				String no=model.getRequest().getParameter("no");
				model.addAttribute("boardno", no); //boardno ������ board_detail.jsp�� value="${boardno }"��
				model.addAttribute("main_jsp", "../bQnA/qboard_delete.jsp");
				return "../main/main.jsp";
			}
			//�����ϱ�ok
			@RequestMapping("bQnA/qboard_delete_ok.do")
			public String qboard_delete_ok(Model model) {
				String no = model.getRequest().getParameter("no"); // ���� no
				String pwd = model.getRequest().getParameter("pwd");
				System.out.println(pwd);
				int res=BoardDAO.boardDelete(Integer.parseInt(no), pwd);
				model.addAttribute("res", res);
				System.out.println("ok�� �Ѿ��res����??"+res);
				return "../bQnA/qboard_delete_ok.jsp";
			}
			
		//----��۴��
			
			@RequestMapping("bQnA/qboard_reply.do")
			public String qboard_reply(Model model) {
				String boardDis = model.getRequest().getParameter("boardDis");		// �Խ��� ���� : categoryno
				String boardno = model.getRequest().getParameter("no");

				model.addAttribute("boardDis", boardDis);
				model.addAttribute("boardno", boardno);
				model.addAttribute("main_jsp", "../bQnA/qboard_reply.jsp");
				
				return "../main/main.jsp";
			}
		
		//��۾���
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
				
				System.out.println("��� board��?? "+board);
				System.out.println("��� memberid��?? "+memberid);
				System.out.println("��� ����Ʈ��?? "+content);
				System.out.println("��� categoryno?? "+categoryno);
				
				BoardVO vo = new BoardVO();
				vo.setMemberid("hong");
				vo.setSubject(subject);
				vo.setContent(content);
				vo.setPwd(pwd);
				vo.setCategoryno(Integer.parseInt(categoryno));
				
				// dao ����
				BoardDAO.bQnATrueInsert(Integer.parseInt(board), vo);
		
				return "redirect:../bQnA/qboard_list.do";
	}
			
}
