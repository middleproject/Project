package com.sist.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.*;


public class BoardDAO {
	//파싱
	 private static SqlSessionFactory ssf;
			static {
				try {
					//xml파일 읽기
					Reader reader=Resources.getResourceAsReader("Config.xml");
					// ClassPath = > src인식
					// ssf => 파싱내용 저장 끝!
					ssf = new SqlSessionFactoryBuilder().build(reader);	
				} catch (Exception ex) {
					ex.printStackTrace();
				}
	   }
		  
	   // 게시판리스트
	   public static List<BoardVO> boardListData(Map map) {
		   List<BoardVO> list = new ArrayList<BoardVO>();
		   
		   // db연결
		   SqlSession session = ssf.openSession();
		   list = session.selectList("boardListData",map);
	
		   // db해제
		   session.close();
		   return list;
	   }
	   //글쓰기
	   public static void boardInsert(BoardVO vo) {
		   SqlSession session = ssf.openSession(true);
		   System.err.println("글쓰기 확인 ok");
		   System.out.println("아이디는?"+vo.getMemberid());
		   System.out.println("이름은?"+vo.getName());
		   System.out.println("제목은?"+vo.getSubject());
		   System.out.println("내용은?"+vo.getContent());
		   System.out.println("카테고리 번호는?"+vo.getCategoryno());
		   session.insert("boardInsert",vo);
		   session.close();
	   }
	   
	   //총페이지 읽기
	 /*  public static int boardTotalPage() {
		   int total=0;
		   SqlSession session = ssf.openSession();
		   total=session.selectOne("boardTotalPage");
		   session.close();
		   return total;
	   }*/
	   public static int boardTotalPage(Map map) {
		   int total = 0;
		   SqlSession session = null;
		   try {
			// 연결(getConnection)
			   session = ssf.openSession();
			// sql문장 전송
			   total = session.selectOne("boardTotalPage", map);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			// 반환(disConnection)
			if(session!=null)
			session.close();
		}
		   return total;
	   }
	   //게시물 전체갯수 읽기
	   public static int boardRowCount(Map map) {
		   int count=0;
		   SqlSession session = ssf.openSession();
		   count=session.selectOne("boardRowCount",map);
		   session.close();
		   return count;
	   }
	   //상세보기
	   public static BoardVO boardDetailData(int no, String type) {
		   BoardVO vo = new BoardVO();
		   SqlSession session = ssf.openSession();
		   if(type.equals("detail")) {
			   session.update("hit",no);
			   session.commit();
		   }
		   vo = session.selectOne("boardDetailData",no);
		   session.close();
		   return vo;
	   }
	   //수정하기
	   public static int boardUpdate(BoardVO vo) {
		   int no=0;
		   SqlSession session = ssf.openSession();
		   //비번확인
		   String pwd = session.selectOne("boardGetPwd", vo.getBoardno());
		   if(pwd.equals(vo.getPwd())) {
			   no = vo.getBoardno();
			   session.update("boardUpdate", vo);
			   session.commit();   
		   } 
		   session.close();
		   return no;
	   }
	   
	   // 검색하기★★★★★★★★★★
	   public static List<BoardVO> boardListDataTEST(Map map) {
		   List<BoardVO> list = new ArrayList<BoardVO>();
		   
		   // db연결
		   SqlSession session = ssf.openSession();
		   list = session.selectList("boardListDataTEST",map);
		   
		   // db해제
		   session.close();
		   return list;
	   }
	   
	   
	 //댓글올리기
	   public static void replyInsert(ReplyVO vo) {
		   SqlSession session = ssf.openSession(true);
		   session.insert("replyInsert",vo); // (sql아이디명칭,vo) mapper의 sql문 실행함
		   								//== vo값받는곳이 Model이라 모델로감
		   session.close();
	   }
	   

	   //댓글가지고오기
	   public static List<BoardDAO> replyListData(int bno) {
		   SqlSession session = ssf.openSession(true);
		   List<BoardDAO> list = session.selectList("replyListData",bno); //목록받을때 selectList
		   session.close();
		   return list;
	   }
	   
	   //댓글갯수가져오기
	   public static int replyListCount(int bno) {
		   SqlSession session = ssf.openSession(true);
		   int count = session.selectOne("replyListCount",bno); //한개받을때 selectOne *#{} 값 잊지말기
		   session.close();
		   return count;
	   }
	   public static void replyReInsert(int root, ReplyVO vo) { //root = 아까 받았던 pno다 
		   SqlSession session = ssf.openSession(true); 
		   
		   // 4개 호출하기
		   // 1 정보
		   ReplyVO pvo = session.selectOne("replyParentInfo",root); //mapper 106
		   System.out.println(pvo.getGroup_id());
		   // 2 step증가
		   session.update("replyStepIncrement",pvo); //mapper 112
		   // 3 insert 값채우기
		   vo.setGroup_id(pvo.getGroup_id()); //pvo = 상위권
		   vo.setGroup_step(pvo.getGroup_step()+1); 
		   vo.setGroup_tab(pvo.getGroup_tab()+1);
		   vo.setRoot(root);
		   session.insert("replyReInsert",vo); //mapper 118
		   // 4 depth 증가
		   session.update("replyDepthIncrement",root); //mapper 131
		   

		   System.out.println(pvo);
		   System.out.println(vo);
		   System.out.println(root);
		   
		   //트랜잭션 : 일괄처리!!! 
		   session.commit(); 
		   session.close();
	   }
	   
	   public static void replyUpdate(ReplyVO vo) {
		   SqlSession session = ssf.openSession(true);
		   session.update("replyUpdate",vo); // (sql아이디명칭,vo) mapper의 sql문 실행함
		   								//== vo값받는곳이 Model이라 모델로감
		   session.close();
	   }
	   
	   //삭제하기----------------------------------------------------------------------------
	   public static void replyDelete(int no) {
		   SqlSession session = ssf.openSession();
		   ReplyVO vo = session.selectOne("replyGetDepth",no);
		   if(vo.getDepth()==0) {
			   session.delete("replyDelete",no);
		   } else {
			   ReplyVO fvo = new ReplyVO();
			   fvo.setMsg("<font color=grey>[！]관리자가 삭제한 게시글 입니다</font>");
			   fvo.setReplyno(no);
			   session.update("replyDataUpdate",fvo);
		   }
		   session.update("replyDepthDecrement",vo.getRoot());
		   session.commit(); //커밋을 맨마지막에 일괄처리 : 트랜잭션
		   session.close();
	   }
	   public static int boardDelete(int no, String pwd) {
		   int result=0;
		   SqlSession session = ssf.openSession(); //db열기
		   String db_pwd=session.selectOne("boardGetPwd",no); //비번얻어오기
		   System.out.println("db의 비번은 뭘까용?"+db_pwd);
		 
		   if(db_pwd.equals(pwd)) {
			   
			   BoardVO pvo = session.selectOne("bQnARead",no); //mapper 106
			   BoardVO vo = new BoardVO();
			   System.out.println(" getDepth : " + pvo.getDepth());
			   if(pvo.getDepth() == 0 ){

				   result=1;
				   session.delete("boardReplyDelete",no);
				   session.delete("boardDelete",no);
				   System.out.println(" getDepth : " + pvo.getRoot());
				   
				   session.update("bQnADepthDecrement",pvo.getRoot());
				   session.commit();
				   
			   } else {
				  result=1;
				  vo.setName("");
				  vo.setContent("<font color=grey>[！]관리자가 삭제한 게시글 입니다</font>");
				  vo.setPwd(pwd);
				  vo.setSubject("<font color=grey>[！]관리자가 삭제한 게시글 입니다</font>");
				  vo.setBoardno(no);
				  
				  session.update("boardUpdate", vo);
				  session.commit();   
				   
			   }
			   
		   }
		   
		   /*
		   if(db_pwd.equals(pwd)) {
			   result=1;
			   session.delete("boardReplyDelete",no);
			   session.delete("boardDelete",no);
			   session.commit();
		   }
		   */
		   session.close(); //db닫기
		   return result;
	   }
	   
	   //-------------------------------------------------------------------------------------
	   //QnA게시판
	   // 게시판리스트
	   public static List<BoardVO> bQnAListData(Map map) {
		   List<BoardVO> list = new ArrayList<BoardVO>();
		   
		   // db연결
		   SqlSession session = ssf.openSession();
		   list = session.selectList("bQnAListData",map);
	
		   // db해제
		   session.close();
		   return list;
	   }
	   //★수정하기★
	   public static int QnAUpdate(BoardVO vo) {
		   int no=0;
		   SqlSession session = ssf.openSession();
		   //비번확인
		   String pwd = session.selectOne("boardGetPwd", vo.getBoardno());
		   if(pwd.equals(vo.getPwd())) {
			   no = vo.getBoardno();
			   session.update("boardUpdate", vo);
			   session.commit();   
		   } 
		   session.close();
		   return no;
	   }
	   public static int QnATotalPage(Map map) {
		   int total = 0;
		   SqlSession session = null;
		   try {
			// 연결(getConnection)
			   session = ssf.openSession();
			// sql문장 전송
			   total = session.selectOne("QnATotalPage", map);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			// 반환(disConnection)
			if(session!=null)
			session.close();
		}
		   return total;
	   }
	   //게시물 전체갯수 읽기
	   public static int QnARowCount(Map map) {
		   int count=0;
		   SqlSession session = ssf.openSession();
		   count=session.selectOne("QnARowCount",map);
		   session.close();
		   return count;
	   }
	   
	   //답글올리기
	   public static void bQnAInsert(BoardVO vo) {
		   SqlSession session = ssf.openSession(true);
		   session.insert("bQnAInsert",vo); // (sql아이디명칭,vo) mapper의 sql문 실행함
		   								//== vo값받는곳이 Model이라 모델로감
		   System.out.println("BoardDAO의 session은?"+session);
		   session.close();
		   
	   } 
	    
	 //답글가지고오기
	   public static List<BoardDAO> bQnARead(int cno) {
		   SqlSession session = ssf.openSession(true);
		   List<BoardDAO> list = session.selectList("bQnARead",cno); //목록받을때 selectList
		   System.out.println("list는 뭡니까"+list);
		   session.close();
		   return list;
	   }
	
	   public static void bQnATrueInsert(int root, BoardVO vo) { //root = 아까 받았던 pno다 
		   SqlSession session = ssf.openSession(true); 
		   
		   // 4개 호출하기
		   // 1 정보
		   BoardVO pvo = session.selectOne("bQnARead",root); //mapper 106
		   System.out.println(pvo.getGroupid());
		   // 2 step증가
		   session.update("bQnAPlus",pvo); //mapper 112
		   // 3 insert 값채우기
		   vo.setGroupid(pvo.getGroupid()); //pvo = 상위권
		   vo.setGroupstep(pvo.getGroupstep()+1); 
		   vo.setGrouptab(pvo.getGrouptab()+1);
		   vo.setRoot(root);
		   session.insert("bQnATrueInsert",vo); //mapper 118
		   // 4 depth 증가
		   session.update("bQnADepthplus",root); //mapper 131
		   

		   System.out.println(pvo);
		   System.out.println(vo);
		   System.out.println(root);
		   
		   //트랜잭션 : 일괄처리!!! 
		   session.commit(); 
		   session.close();
	   
	   }
	   
	   //첨부파일게시판
	   public static List<DataBoardVO> databoardListData(Map map) {
		   List<DataBoardVO> list = new ArrayList<DataBoardVO>();
		   
		   // db연결
		   SqlSession session = ssf.openSession();
		   list = session.selectList("databoardListData",map);
	
		   // db해제
		   session.close();
		   return list;
	   }

	   //글쓰기
	   public static void dataInsert(DataBoardVO vo) {
		   SqlSession session = ssf.openSession(true);
		   System.out.println("dataInsert 1");
		   session.insert("dataInsert",vo);
		   
		   
		   
		   System.out.println("dataInsert 2");
		  
		   session.close();
	   }
	   
	   public static int dataTotalPage(Map map) {
		   int total = 0;
		   SqlSession session = null;
		   try {
			// 연결(getConnection)
			   session = ssf.openSession();
			// sql문장 전송
			   total = session.selectOne("dataTotalPage", map);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			// 반환(disConnection)
			if(session!=null)
			session.close();
		}
		   return total;
	   }
	   //게시물 전체갯수 읽기
	   public static int dataRowCount(Map map) {
		   int count=0;
		   SqlSession session = ssf.openSession();
		   count=session.selectOne("dataRowCount",map);
		   session.close();
		   return count;
	   }
	   //상세보기
	   public static DataBoardVO dataDetailData(int no, String type) {
		   DataBoardVO vo = new DataBoardVO();
		   SqlSession session = ssf.openSession();
		   if(type.equals("detail")) {
			   session.update("datahit",no);
			   session.commit();
		   }
		   vo = session.selectOne("dataDetailData",no);
		   System.out.println("이름은?"+vo.getName());
		   session.close();
		   return vo;
	   }
	   //수정하기
	   public static int dataUpdate(DataBoardVO vo) {
		   int no=0;
		   SqlSession session = ssf.openSession();
		   //비번확인
		   String pwd = session.selectOne("dataGetPwd", vo.getNo());
		   if(pwd.equals(vo.getPwd())) {
			   no = vo.getNo();
			   session.update("dataUpdate", vo);
			   session.commit();   
		   } 
		   session.close();
		   return no;
	   }
}
