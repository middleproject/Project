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
	//�Ľ�
	 private static SqlSessionFactory ssf;
			static {
				try {
					//xml���� �б�
					Reader reader=Resources.getResourceAsReader("Config.xml");
					// ClassPath = > src�ν�
					// ssf => �Ľ̳��� ���� ��!
					ssf = new SqlSessionFactoryBuilder().build(reader);	
				} catch (Exception ex) {
					ex.printStackTrace();
				}
	   }
		  
	   // �Խ��Ǹ���Ʈ
	   public static List<BoardVO> boardListData(Map map) {
		   List<BoardVO> list = new ArrayList<BoardVO>();
		   
		   // db����
		   SqlSession session = ssf.openSession();
		   list = session.selectList("boardListData",map);
	
		   // db����
		   session.close();
		   return list;
	   }
	   //�۾���
	   public static void boardInsert(BoardVO vo) {
		   SqlSession session = ssf.openSession(true);
		   System.err.println("�۾��� Ȯ�� ok");
		   System.out.println("���̵��?"+vo.getMemberid());
		   System.out.println("�̸���?"+vo.getName());
		   System.out.println("������?"+vo.getSubject());
		   System.out.println("������?"+vo.getContent());
		   System.out.println("ī�װ� ��ȣ��?"+vo.getCategoryno());
		   session.insert("boardInsert",vo);
		   session.close();
	   }
	   
	   //�������� �б�
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
			// ����(getConnection)
			   session = ssf.openSession();
			// sql���� ����
			   total = session.selectOne("boardTotalPage", map);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			// ��ȯ(disConnection)
			if(session!=null)
			session.close();
		}
		   return total;
	   }
	   //�Խù� ��ü���� �б�
	   public static int boardRowCount(Map map) {
		   int count=0;
		   SqlSession session = ssf.openSession();
		   count=session.selectOne("boardRowCount",map);
		   session.close();
		   return count;
	   }
	   //�󼼺���
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
	   //�����ϱ�
	   public static int boardUpdate(BoardVO vo) {
		   int no=0;
		   SqlSession session = ssf.openSession();
		   //���Ȯ��
		   String pwd = session.selectOne("boardGetPwd", vo.getBoardno());
		   if(pwd.equals(vo.getPwd())) {
			   no = vo.getBoardno();
			   session.update("boardUpdate", vo);
			   session.commit();   
		   } 
		   session.close();
		   return no;
	   }
	   
	   // �˻��ϱ�ڡڡڡڡڡڡڡڡڡ�
	   public static List<BoardVO> boardListDataTEST(Map map) {
		   List<BoardVO> list = new ArrayList<BoardVO>();
		   
		   // db����
		   SqlSession session = ssf.openSession();
		   list = session.selectList("boardListDataTEST",map);
		   
		   // db����
		   session.close();
		   return list;
	   }
	   
	   
	 //��ۿø���
	   public static void replyInsert(ReplyVO vo) {
		   SqlSession session = ssf.openSession(true);
		   session.insert("replyInsert",vo); // (sql���̵��Ī,vo) mapper�� sql�� ������
		   								//== vo���޴°��� Model�̶� �𵨷ΰ�
		   session.close();
	   }
	   

	   //��۰��������
	   public static List<BoardDAO> replyListData(int bno) {
		   SqlSession session = ssf.openSession(true);
		   List<BoardDAO> list = session.selectList("replyListData",bno); //��Ϲ����� selectList
		   session.close();
		   return list;
	   }
	   
	   //��۰�����������
	   public static int replyListCount(int bno) {
		   SqlSession session = ssf.openSession(true);
		   int count = session.selectOne("replyListCount",bno); //�Ѱ������� selectOne *#{} �� ��������
		   session.close();
		   return count;
	   }
	   public static void replyReInsert(int root, ReplyVO vo) { //root = �Ʊ� �޾Ҵ� pno�� 
		   SqlSession session = ssf.openSession(true); 
		   
		   // 4�� ȣ���ϱ�
		   // 1 ����
		   ReplyVO pvo = session.selectOne("replyParentInfo",root); //mapper 106
		   System.out.println(pvo.getGroup_id());
		   // 2 step����
		   session.update("replyStepIncrement",pvo); //mapper 112
		   // 3 insert ��ä���
		   vo.setGroup_id(pvo.getGroup_id()); //pvo = ������
		   vo.setGroup_step(pvo.getGroup_step()+1); 
		   vo.setGroup_tab(pvo.getGroup_tab()+1);
		   vo.setRoot(root);
		   session.insert("replyReInsert",vo); //mapper 118
		   // 4 depth ����
		   session.update("replyDepthIncrement",root); //mapper 131
		   

		   System.out.println(pvo);
		   System.out.println(vo);
		   System.out.println(root);
		   
		   //Ʈ����� : �ϰ�ó��!!! 
		   session.commit(); 
		   session.close();
	   }
	   
	   public static void replyUpdate(ReplyVO vo) {
		   SqlSession session = ssf.openSession(true);
		   session.update("replyUpdate",vo); // (sql���̵��Ī,vo) mapper�� sql�� ������
		   								//== vo���޴°��� Model�̶� �𵨷ΰ�
		   session.close();
	   }
	   
	   //�����ϱ�----------------------------------------------------------------------------
	   public static void replyDelete(int no) {
		   SqlSession session = ssf.openSession();
		   ReplyVO vo = session.selectOne("replyGetDepth",no);
		   if(vo.getDepth()==0) {
			   session.delete("replyDelete",no);
		   } else {
			   ReplyVO fvo = new ReplyVO();
			   fvo.setMsg("<font color=grey>[��]�����ڰ� ������ �Խñ� �Դϴ�</font>");
			   fvo.setReplyno(no);
			   session.update("replyDataUpdate",fvo);
		   }
		   session.update("replyDepthDecrement",vo.getRoot());
		   session.commit(); //Ŀ���� �Ǹ������� �ϰ�ó�� : Ʈ�����
		   session.close();
	   }
	   public static int boardDelete(int no, String pwd) {
		   int result=0;
		   SqlSession session = ssf.openSession(); //db����
		   String db_pwd=session.selectOne("boardGetPwd",no); //���������
		   System.out.println("db�� ����� �ְ��ڱ� �ȵ�?"+db_pwd);
		 
		   if(db_pwd.equals(pwd)) {
			   System.out.println("dbno  �ȵ�?"+no );
				 
			   BoardVO pvo = session.selectOne("bQnARead",no); 
			   BoardVO vo = new BoardVO();
			   System.out.println(" getDepth : " + pvo.getDepth());
			   if(pvo.getDepth() == 0 ){

				   result=1;
				   session.delete("boardReplyDelete",no);
				   session.delete("boardDelete",no);
				   System.out.println(" getDepth �ְ��ڱ� �ȵ�: " + pvo.getRoot());
				   
				   session.update("bQnADepthDecrement",pvo.getRoot());
				   session.commit();
				   
			   } else {
				  result=1;
				  vo.setName("");
				  vo.setContent("<font color=grey>[��]�����ڰ� ������ �Խñ� �Դϴ�</font>");
				  vo.setPwd(pwd);
				  vo.setSubject("<font color=grey>[��]�����ڰ� ������ �Խñ� �Դϴ�</font>");
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
		   session.close(); //db�ݱ�
		   return result;
	   }
	   
	   //-------------------------------------------------------------------------------------
	   //QnA�Խ���
	   // �Խ��Ǹ���Ʈ
	   public static List<BoardVO> bQnAListData(Map map) {
		   List<BoardVO> list = new ArrayList<BoardVO>();
		   
		   // db����
		   SqlSession session = ssf.openSession();
		   list = session.selectList("bQnAListData",map);
	
		   // db����
		   session.close();
		   return list;
	   }
	   //�ڼ����ϱ��
	   public static int QnAUpdate(BoardVO vo) {
		   int no=0;
		   SqlSession session = ssf.openSession();
		   //���Ȯ��
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
			// ����(getConnection)
			   session = ssf.openSession();
			// sql���� ����
			   total = session.selectOne("QnATotalPage", map);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			// ��ȯ(disConnection)
			if(session!=null)
			session.close();
		}
		   return total;
	   }
	   //�Խù� ��ü���� �б�
	   public static int QnARowCount(Map map) {
		   int count=0;
		   SqlSession session = ssf.openSession();
		   count=session.selectOne("QnARowCount",map);
		   session.close();
		   return count;
	   }
	   
	   //��ۿø���
	   public static void bQnAInsert(BoardVO vo) {
		   SqlSession session = ssf.openSession(true);
		   session.insert("bQnAInsert",vo); // (sql���̵��Ī,vo) mapper�� sql�� ������
		   								//== vo���޴°��� Model�̶� �𵨷ΰ�
		   System.out.println("BoardDAO�� session��?"+session);
		   session.close();
		   
	   } 
	    
	 //��۰��������
	   public static List<BoardDAO> bQnARead(int cno) {
		   SqlSession session = ssf.openSession(true);
		   List<BoardDAO> list = session.selectList("bQnARead",cno); //��Ϲ����� selectList
		   System.out.println("list�� ���ϱ�"+list);
		   session.close();
		   return list;
	   }
	
	   public static void bQnATrueInsert(int root, BoardVO vo) { //root = �Ʊ� �޾Ҵ� pno�� 
		   SqlSession session = ssf.openSession(true); 
		   
		   // 4�� ȣ���ϱ�
		   // 1 ����
		   BoardVO pvo = session.selectOne("bQnARead",root); //mapper 106
		   System.out.println(pvo.getGroupid());
		   // 2 step����
		   session.update("bQnAPlus",pvo); //mapper 112
		   // 3 insert ��ä���
		   vo.setGroupid(pvo.getGroupid()); //pvo = ������
		   vo.setGroupstep(pvo.getGroupstep()+1); 
		   vo.setGrouptab(pvo.getGrouptab()+1);
		   vo.setRoot(root);
		   session.insert("bQnATrueInsert",vo); //mapper 118
		   // 4 depth ����
		   session.update("bQnADepthplus",root); //mapper 131
		   

		   System.out.println(pvo);
		   System.out.println(vo);
		   System.out.println(root);
		   
		   //Ʈ����� : �ϰ�ó��!!! 
		   session.commit(); 
		   session.close();
	   
	   }
	   
	   //÷�����ϰԽ���
	   public static List<DataBoardVO> databoardListData(Map map) {
		   List<DataBoardVO> list = new ArrayList<DataBoardVO>();
		   
		   // db����
		   SqlSession session = ssf.openSession();
		   list = session.selectList("databoardListData",map);
	
		   // db����
		   session.close();
		   return list;
	   }

	   //�۾���
	   public static void dataInsert(DataBoardVO vo) {
		   SqlSession session = ssf.openSession(true); 
		   System.out.println("------------- 3 ");
		   session.insert("dataInsert",vo);
		   session.close();
	   }
	   
	   public static int dataTotalPage(Map map) {
		   int total = 0;
		   SqlSession session = null;
		   try {
			// ����(getConnection)
			   session = ssf.openSession();
			// sql���� ����
			   total = session.selectOne("dataTotalPage", map);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			// ��ȯ(disConnection)
			if(session!=null)
			session.close();
		}
		   return total;
	   }
	   //�Խù� ��ü���� �б�
	   public static int dataRowCount(Map map) {
		   int count=0;
		   SqlSession session = ssf.openSession();
		   count=session.selectOne("dataRowCount",map);
		   session.close();
		   return count;
	   }
	   //�󼼺���
	   public static DataBoardVO dataDetailData(int no, String type) {
		   DataBoardVO vo = new DataBoardVO();
		   SqlSession session = ssf.openSession();
		   if(type.equals("detail")) {
			   session.update("datahit",no);
			   session.commit();
		   }
		   vo = session.selectOne("dataDetailData",no);
		   System.out.println("�̸���?"+vo.getName());
		   session.close();
		   return vo;
	   }
	   //�����ϱ�
	   public static int dataUpdate(DataBoardVO vo) {
		   int no=0;
		   SqlSession session = ssf.openSession();
		   //���Ȯ��
		   String pwd = session.selectOne("dataGetPwd", vo.getNo());
		   System.out.println("DB�� �Է� ��й�ȣ���� �����?"+pwd);
		   if(pwd.equals(vo.getPwd())) {
			   no = vo.getNo();
			   session.update("dataUpdate", vo);
			   session.commit();   
		   } 
		   session.close();
		   return no;
	   }
	   
	   //��ۿø���
	   public static void datareplyInsert(DataBoardReplyVO vo) {
		   SqlSession session = ssf.openSession(true);
		   session.insert("datareplyInsert",vo); // (sql���̵��Ī,vo) mapper�� sql�� ������
		   								//== vo���޴°��� Model�̶� �𵨷ΰ�
		   session.close();
	   }
	   

	   //��۰��������
	   public static List<BoardDAO> datareplyListData(int bno) {
		   SqlSession session = ssf.openSession(true);
		   List<BoardDAO> list = session.selectList("datareplyListData",bno); //��Ϲ����� selectList
		   session.close();
		   return list;
	   }
	   
	   //��۰�����������
	   public static int datareplyListCount(int bno) {
		   SqlSession session = ssf.openSession(true);
		   int count = session.selectOne("datareplyListCount",bno); 
		   session.close();
		   return count;
	   }
	   public static void datareplyReInsert(int root, DataBoardReplyVO vo) { 
		   SqlSession session = ssf.openSession(true); 
		   
		   // 4�� ȣ���ϱ�
		   // 1 ����
		   DataBoardReplyVO pvo = session.selectOne("datareplyParentInfo",root); 
		   // 2 step����
		   session.update("datareplyStepIncrement",pvo); 
		   // 3 insert ��ä���
		   vo.setGroup_id(pvo.getGroup_id()); 
		   vo.setGroup_step(pvo.getGroup_step()+1); 
		   vo.setGroup_tab(pvo.getGroup_tab()+1);
		   vo.setRoot(root);
		   session.insert("datareplyReInsert",vo); 
		   // 4 depth ����
		   session.update("datareplyDepthIncrement",root); //mapper 131
		   

		   System.out.println(pvo);
		   System.out.println(vo);
		   System.out.println(root);
		   
		   //Ʈ����� : �ϰ�ó��!!! 
		   session.commit(); 
		   session.close();
	   }
	   
	   public static void datareplyUpdate(DataBoardReplyVO vo) {
		   SqlSession session = ssf.openSession(true);
		   session.update("datareplyUpdate",vo); // (sql���̵��Ī,vo) mapper�� sql�� ������
		   								//== vo���޴°��� Model�̶� �𵨷ΰ�
		   session.close();
	   }
	   //�����ϱ�----------------------------------------------------------------------------
	   public static void datareplyDelete(int no) {
		   SqlSession session = ssf.openSession();
		   ReplyVO vo = session.selectOne("datareplyGetDepth",no);
		   if(vo.getDepth()==0) {
			   session.delete("datareplyDelete",no);
		   } else {
			   DataBoardReplyVO fvo = new DataBoardReplyVO();
			   fvo.setMsg("<font color=grey>[��]�����ڰ� ������ �Խñ� �Դϴ�</font>");
			   fvo.setNo(no);
			   session.update("datareplyDataUpdate",fvo);
		   }
		   session.update("datareplyDepthDecrement",vo.getRoot());
		   session.commit(); //Ŀ���� �Ǹ������� �ϰ�ó�� : Ʈ�����
		   session.close();
	   }
	   public static int databoardDelete(int no, String pwd) {
		   int result=0;
		   SqlSession session = ssf.openSession(); //db����
		   String db_pwd=session.selectOne("dataGetPwd",no); //���������
		   System.out.println("db�� ����� �����?��....."+db_pwd);
		   
		   if(db_pwd.equals(pwd)) {
			   result = 1;
			   session.delete("databoardReplyDelete",no);
			   session.delete("databoardDelete",no);
			   session.commit();
		   }
		   session.close();
		   return result;
	   }
	   
	   //�����Ǵ�� 0904
	   public static void recipereplyInsert(DataBoardReplyVO vo) {
		   SqlSession session = ssf.openSession(true);
		   session.insert("recipereplyInsert",vo); 
			System.out.println("============ �� �Ʒ��� DAO�Դϴ�");
		   System.out.println("DAO�� Bno�ǰ���???"+vo.getBno());
		   System.out.println("DAO�� Name�ǰ���???"+vo.getName());
		   System.out.println("DAO�� ID�ǰ���???"+vo.getId());
		   session.close();
	   }
	   //��۰��������
	   public static List<BoardDAO> recipereplyListData(int bno) {
		   SqlSession session = ssf.openSession(true);
		   List<BoardDAO> list = session.selectList("recipereplyListData",bno); //��Ϲ����� selectList
		   session.close();
		   return list;
	   }
	 //�����ϱ�
	   public static void recipereplyDelete(int no) {
		   SqlSession session = ssf.openSession();
		   System.out.println(no);
		   session.delete("recipereplyDelete",no);
		   session.commit(); 
		   session.close();
	   }
	   public static void recipereplyUpdate(DataBoardReplyVO vo) {
		   SqlSession session = ssf.openSession(true);
		   System.out.println("session�ǰ���?"+session);
		   session.update("datareplyUpdate",vo); 
		   session.close();
	   }
	   //==============
	   
	   // �Խ��Ǹ���Ʈ
	   public static List<ImgBoardVO> imgListData(Map map) {
		   List<ImgBoardVO> list = new ArrayList<ImgBoardVO>();
		   
		   // db����
		   SqlSession session = ssf.openSession();
		   list = session.selectList("imgListData",map);
	
		   // db����
		   session.close();
		   return list;
	   }
	   //�۾���
	   public static void imgInsert(ImgBoardVO vo) {
		   System.err.println("�۾��� Ȯ�� ok---1");
		   SqlSession session = ssf.openSession(true); 
		   System.err.println("�۾��� Ȯ�� ok---2");
		   session.insert("imgInsert",vo);
		   System.err.println("�۾��� Ȯ�� ok---3");


		   System.out.println("�̸���?"+vo.getName());
		   System.out.println("������?"+vo.getContent());
		   session.close();
	   }
	   
	   public static int imgTotalPage(Map map) {
		   int total = 0;
		   SqlSession session = null;
		   try {
			   session = ssf.openSession();
			   total = session.selectOne("imgTotalPage", map);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if(session!=null)
			session.close();
		}
		   return total;
	   }
	   public static int imgRowCount(Map map) {
		   int count=0;
		   SqlSession session = ssf.openSession();
		   count=session.selectOne("imgRowCount",map);
		   session.close();
		   return count;
	   }
	   
	   //imgDelete
	   public static void imgDelete(int no) {
		   SqlSession session = ssf.openSession();
		   session.delete("imgDelete",no);
		   session.commit(); 
		   session.close();
	   }
	   //imgUpdate
	   public static int imgUpdate(ImgBoardVO vo) {
		   int no=0;
		   SqlSession session = ssf.openSession();
		   //���Ȯ��
		   String pwd = session.selectOne("imgGetPwd", vo.getNo());
		   System.out.println("pwd��� �����"+pwd);
		   if(pwd.equals(vo.getPwd())) {
			   no = vo.getNo();
			   session.update("imgUpdate", vo);
			   session.commit();   
		   } 
		   session.close();
		   return no;
	   }
	   
	   //
	   public static ImgBoardVO imgdata(int no, String type) {
		   ImgBoardVO vo = new ImgBoardVO();
		   SqlSession session = ssf.openSession();
		   vo = session.selectOne("imgdata",no);
		   System.out.println(vo.getName());
		   System.out.println(vo.getFilename());
		   System.out.println(vo.getContent());
		   session.close();
		   return vo;
	   }
}
