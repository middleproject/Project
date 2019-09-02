package com.sist.model;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;
import java.sql.*;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.lf5.viewer.configure.MRUFileManager;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
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
				
				int totalpage = BoardDAO.boardTotalPage(map);
				int count = BoardDAO.boardRowCount(map);
				
				count = count-((curpage*rowSize)-rowSize);
				String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
				//jsp�� �� ����~
				model.addAttribute("today", today);
				model.addAttribute("curpage", curpage);
				model.addAttribute("totalpage", totalpage);
				model.addAttribute("count", count);
				model.addAttribute("categoryno","6");
				
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
	
		} catch (Exception ex) { }
		String name = model.getRequest().getParameter("name");
		String subject = model.getRequest().getParameter("subject");
		String content = model.getRequest().getParameter("content");
		String pwd = model.getRequest().getParameter("pwd");
		String categoryno = model.getRequest().getParameter("categoryno");
		
		System.out.println("�� �Ʒ��δ� Model�� �� Ȯ�Ρ���������");
		System.out.println("name��?"+name);
		System.out.println("subject��?"+subject);
		System.out.println("content��?"+content);
		System.out.println("pwd��?"+pwd);
		System.out.println("categoryno��?"+categoryno);
	
		BoardVO vo = new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		vo.setCategoryno(Integer.parseInt(categoryno));
	
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
		String name=model.getRequest().getParameter("name");
		String subject=model.getRequest().getParameter("subject");
		String content=model.getRequest().getParameter("content");
		String pwd=model.getRequest().getParameter("pwd");
		String no=model.getRequest().getParameter("boardno");
		
		BoardVO vo = new BoardVO();
		vo.setName(name);
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
			
			System.out.println(" fs : " + fs);
			System.out.println(" textsearch : " + textsearch);
			
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
			map.put("categoryno", "6");
			
			List<BoardVO> list = BoardDAO.boardListDataTEST(map);
			
			//�������
			model.addAttribute("list", list);
			
			int totalpage = BoardDAO.boardTotalPage(map);
			int count = BoardDAO.boardRowCount(map);
			
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
			} catch (Exception ex) {}
			
			String bno = model.getRequest().getParameter("bno"); //bno = boardno
			String msg = model.getRequest().getParameter("msg");
			
			HttpSession session = model.getRequest().getSession();
			String id = (String) session.getAttribute("id");
			String name = (String)session.getAttribute("name");
			
			
			System.out.println("--------- bno : " + bno );
			System.out.println("--------- msg : " + msg );
			System.out.println("--------- id : " + id );
			System.out.println("--------- name : " + name );
			
			
			
			ReplyVO vo = new ReplyVO();
			vo.setBoardno((Integer.parseInt(bno)));
			vo.setMsg(msg);
			vo.setId(id);
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

			//msg
			String msg = model.getRequest().getParameter("msg");
			//no
			String pno = model.getRequest().getParameter("no"); //���� pno ���� ���� Ȯ���� �ȉ� �׷�id,stepã�ƾ���
			//bno
			String bno = model.getRequest().getParameter("bno");
			
			HttpSession session = model.getRequest().getSession();
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
	 
	 //��ۼ���
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
			System.out.println("msg��?"+msg);
			System.out.println("no��?"+no);
			System.out.println("bno��?"+bno);
			//DAOó��
			ReplyVO vo = new ReplyVO();
			vo.setMsg(msg);
			vo.setReplyno(Integer.parseInt(no));
			
			BoardDAO.replyUpdate(vo);
		
			return "redirect:../board/board_detail.do?no="+bno; //�ٽ� detail�� �Ѿ
		}
	 //�����ϱ�
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
			model.addAttribute("main_jsp", "../board/board_delete.jsp");
			return "../main/main.jsp";
		}
		@RequestMapping("board/board_delete_ok.do")
		public String board_delete_ok(Model model) {
			String no = model.getRequest().getParameter("no"); // ���� no
			String pwd = model.getRequest().getParameter("pwd");
			// System.out.println(pwd);
			
			int res=BoardDAO.boardDelete(Integer.parseInt(no), pwd);
			model.addAttribute("res", res);
			System.out.println("res����??"+res);
			
			return "../board/board_delete_ok.jsp";
		}
		
		
		//=========================================================================================================
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
			
			int totalpage = BoardDAO.QnATotalPage(map);
			int count = BoardDAO.QnARowCount(map);
			count = count-((curpage*rowSize)-rowSize);
			String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			//jsp�� �� ����~
			model.addAttribute("today", today);
			model.addAttribute("curpage", curpage);
			model.addAttribute("totalpage", totalpage);
			model.addAttribute("count", count);
			model.addAttribute("categoryno", "1");
			
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
				String name = model.getRequest().getParameter("name");
				String subject = model.getRequest().getParameter("subject");
				String content = model.getRequest().getParameter("content");
				String pwd = model.getRequest().getParameter("pwd");
				String categoryno = model.getRequest().getParameter("categoryno");
			
				BoardVO vo = new BoardVO();
				vo.setMemberid(memberid);
				vo.setName(name);
				vo.setSubject(subject);
				vo.setContent(content);
				vo.setPwd(pwd);
				vo.setCategoryno(Integer.parseInt(categoryno));
				System.out.println("memberidmemberidmemberidmemberid"+memberid);
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
				String name=model.getRequest().getParameter("name");
				String subject=model.getRequest().getParameter("subject");
				String content=model.getRequest().getParameter("content");
				String pwd=model.getRequest().getParameter("pwd");
				String no=model.getRequest().getParameter("boardno");
				
				BoardVO vo = new BoardVO();
				vo.setName(name);
				vo.setSubject(subject);
				vo.setContent(content);
				vo.setPwd(pwd);
				vo.setBoardno(Integer.parseInt(no));
				
				//dao���� => pwd�� �������� Ʋ������ ����
				int n = BoardDAO.QnAUpdate(vo);
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
				String name = model.getRequest().getParameter("name");
				String subject = model.getRequest().getParameter("subject");
				String content = model.getRequest().getParameter("content");
				String pwd = model.getRequest().getParameter("pwd");
				String categoryno = model.getRequest().getParameter("categoryno");
				
				System.out.println("��� board��?? "+board);	
				System.out.println("��� ����Ʈ��?? "+content);
				System.out.println("��� categoryno?? "+categoryno);
				
				BoardVO vo = new BoardVO();
				vo.setName(name);
				vo.setSubject(subject);
				vo.setContent(content);
				vo.setPwd(pwd);
				vo.setCategoryno(Integer.parseInt(categoryno));
				
				System.out.println("�� �Ʒ��δ� QnA�� ��=========");
				System.out.println("name��???"+name);
				System.out.println("=========================");
				
				// dao ����
				BoardDAO.bQnATrueInsert(Integer.parseInt(board), vo);
		
				return "redirect:../bQnA/qboard_list.do";
	}
			//=========================================================================================================
			//JSP��ܿ��� �ڹٿͰ����� name, �ڹٽ�ũ��Ʈ������ id��!!!
			//÷�����ϰԽ���	
			@RequestMapping("databoard/databoard_list.do")
			public String databoard_list(Model model) {
				
				String page = model.getRequest().getParameter("page");
				if(page==null) 
						page="1";
				int curpage = Integer.parseInt(page);
				
				Map map = new HashMap();
				int rowSize = 5;
				int start = (curpage*rowSize)-(rowSize-1);
				int end = curpage*rowSize;
				
				map.put("start", start);
				map.put("end", end);
			
				List<DataBoardVO> list = BoardDAO.databoardListData(map);
				
				model.addAttribute("list", list);
				
				int totalpage = BoardDAO.dataTotalPage(map);
				int count = BoardDAO.dataRowCount(map);
				count = count-((curpage*rowSize)-rowSize);
				String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

				model.addAttribute("today", today);
				model.addAttribute("curpage", curpage);
				model.addAttribute("totalpage", totalpage);
				model.addAttribute("count", count);
				
				model.addAttribute("main_jsp", "../databoard/databoard_list.jsp");
				return "../main/main.jsp";
			}

		//�۾���
		@RequestMapping("databoard/databoard_insert.do")
		public String dataInsert(Model model) {
	
			model.addAttribute("main_jsp", "../databoard/databoard_insert.jsp");
			return "../main/main.jsp";
		}
		@RequestMapping("databoard/databoard_insert_ok.do") 
		public String dataInsert_ok(Model model) {
			
			try {
				model.getRequest().setCharacterEncoding("UTF-8");
				String path="c:\\upload";
				String enctype="UTF-8";
				int size=100*1024*1024; //�ִ������� �����ִ� ���� ũ�Ⱑ 100�ް�(1024KB, 1024*1024KB=MB)
				
				MultipartRequest mr = new MultipartRequest(model.getRequest(), path, size, enctype, new DefaultFileRenamePolicy()); //���Ͼ��ε�ÿ� (������Ʈ,��������)
																				//new DefaultFileRenamePolicy() ���� ������ ������ �ڵ����� �̸�+1 ��ȯ
				String name = mr.getParameter("name");
				String subject = mr.getParameter("subject");
				String content = mr.getParameter("content");
				String pwd = mr.getParameter("pwd");
				
				DataBoardVO vo = new DataBoardVO();
				
				vo.setName(name);
				vo.setSubject(subject);
				vo.setContent(content);
				vo.setPwd(pwd);

				String filename=mr.getOriginalFileName("upload");
				
				if(filename==null) { //������ ���� ������ ���ε带 ���� ����
					vo.setFilename("");
					vo.setFilesize(0);
				} else { //������ �ö�� ����
					File file = new File(path+"\\"+filename);
					vo.setFilename(filename);
					vo.setFilesize((int)file.length());
				}
				// dao ����
				BoardDAO.dataInsert(vo);
			} catch (Exception ex) { }
			return "redirect:../databoard/databoard_list.do"; //redirect�� do�� �Ѵ�, DispatcherServlet if�� ����
		}
		
		
	
		@RequestMapping("databoard/databoard_detail.do")
		public static String dataDetailData(Model model) {
			String no = model.getRequest().getParameter("no");
			
			DataBoardVO vo = BoardDAO.dataDetailData(Integer.parseInt(no), "detail");
			model.addAttribute("vo", vo);
			
			// list��(��۸�Ϻ����ֱ�)
		
			int count = BoardDAO.replyListCount(Integer.parseInt(no));
			System.out.println("ddddcount"+count);
			model.addAttribute("count", count);
			
			model.addAttribute("main_jsp", "../databoard/databoard_detail.jsp");
			return "../main/main.jsp";
		}
		//�����ϱ�
		@RequestMapping("databoard/databoard_update.do")
		public static String dataUpdate(Model model) {
			String no = model.getRequest().getParameter("no");
			DataBoardVO vo = BoardDAO.dataDetailData(Integer.parseInt(no), "update");
			model.addAttribute("vo", vo);
			model.addAttribute("main_jsp", "../databoard/databoard_update.jsp"); 
			return "../main/main.jsp";
		}
		//�����ϱ�ok
		@RequestMapping("databoard/databoard_update_ok.do")
		public String dataUpdate_ok(Model model) {
			try {
				model.getRequest().setCharacterEncoding("UTF-8");
			} catch (Exception ex) {		
			}
			String name=model.getRequest().getParameter("name");
			String subject=model.getRequest().getParameter("subject");
			String content=model.getRequest().getParameter("content");
			String pwd=model.getRequest().getParameter("pwd");
			String no=model.getRequest().getParameter("no");
			
			DataBoardVO vo = new DataBoardVO();
			vo.setName(name);
			vo.setSubject(subject);
			vo.setContent(content);
			vo.setPwd(pwd);
			vo.setNo(Integer.parseInt(no));
			
			//dao���� => pwd�� �������� Ʋ������ ����
			int n = BoardDAO.dataUpdate(vo);
			model.addAttribute("no", n);
			
			return "../databoard/databoard_update_ok.jsp";
		}
}
