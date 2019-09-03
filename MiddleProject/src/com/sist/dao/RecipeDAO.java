package com.sist.dao;
import java.util.*;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.FollowVO;
import com.sist.vo.IngredetailVO;
import com.sist.vo.MsgVO;
import com.sist.vo.ReadVO;
import com.sist.vo.RecipeVO;
import com.sist.vo.WishVO;
import com.sun.org.apache.xalan.internal.xsltc.util.IntegerArray;

public class RecipeDAO {
	private static SqlSessionFactory ssf;
	static{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	public static void cateDateInsert(RecipeVO vo){
		SqlSession session =ssf.openSession(true); //commit(auto)
		session.insert("RecipeDataInsert",vo);
		session.close();
	}
	//레시피 올 데이터
	public static List<RecipeVO> recipeAllData(){
		List<RecipeVO> list = new ArrayList<RecipeVO>();
		SqlSession session = ssf.openSession();
		list = session.selectList("RecipeAllData");
		session.close();
		return list;
	}
	
	public static List<RecipeVO> recipeListData(Map map){
		List<RecipeVO> list = new ArrayList<RecipeVO>();
		SqlSession session = ssf.openSession();
		list = session.selectList("recipeListData",map);
		session.close();
		return list;
	}
	// 총 페이지
	public static int RecipeTotalPage()
	   {
		   int total=0;
		   SqlSession session=ssf.openSession();
		   total=session.selectOne("RecipeTotalPage");
		   // id=> 대소문자 구분 
		   session.close();
		   return total;
	   }
	
	public static int RecipeSearchPage(Map map)
	   {
		   int total=0;
		   SqlSession session=ssf.openSession();
		   total=session.selectOne("recipeSearchTotal",map);
		   // id=> 대소문자 구분 
		   session.close();
		   return total;
	   }
	   // 게시쿨 전체 갯수 읽기
	   public static int RecipeCount()
	   {
		   int count=0;
		   SqlSession session=ssf.openSession();
		   count=session.selectOne("RecipeCount");
		   // id=> 대소문자 구분 
		   session.close();
		   return count;
	   }
	   //Detail
	   public static RecipeVO recipeDetailData(int no){
		   RecipeVO vo = new RecipeVO();
		   SqlSession session = ssf.openSession(true);
		   session.update("hitUpdate",no);
		   
		   vo = session.selectOne("detailData",no);
		   session.close();
		   return vo;
	   }
	   // hot Recipe
	   public static List<RecipeVO> recipeHotRecipe(int num){
		   SqlSession session = ssf.openSession();
		   List<RecipeVO> list = session.selectList("HotRecipe",num);
		   session.close();
		   return list;
	   }
	   //연관된 레시피
	   public static List<RecipeVO> relateRecipe(Map map){
		   SqlSession session = ssf.openSession();
		   List<RecipeVO> list = session.selectList("tagselect",map);
		   session.close();
		   return list;
	   }
	   
	   //마트 가격
	   public static List<IngredetailVO> IngrePrice(String ingre){
		   List<IngredetailVO> list = new ArrayList<IngredetailVO>();
		   SqlSession session = null;
		   try {
			   session= ssf.openSession();
				    list = session.selectList("selectIngreDetail",ingre.trim());
			   System.out.println("검색재료:"+ingre);
			} catch (Exception e) {
				e.printStackTrace();
			} finally{
				if(session!=null) session.close();
			}
		   return list;
	   }
	   //검색 어 서칭
	   public static List<RecipeVO> recipeSearch(Map map){
		   List<RecipeVO> list = new ArrayList<RecipeVO>();
		   SqlSession session = null;
		   try {
			   session = ssf.openSession();
			   list = session.selectList("recipeSearch",map);
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				if(session!=null) session.close();
			}
		   
		   return list;
	   }
	   //팔로우 확인
	   public static int followCount(FollowVO fvo){
		   int total=0;
		   SqlSession session =null;
		   try {
			   session=ssf.openSession();
			   total = session.selectOne("followCount",fvo);
			} catch (Exception e) {
				e.printStackTrace();
			} finally{
				if(session!=null) session.close();
			}
		   return total;
	   }
	   //팔로우 추가
	   public static void followInsert(FollowVO vo){
		   FollowVO fvo = new FollowVO();
		   SqlSession session =null;
		   try {
			   session=ssf.openSession(true);
			   session.insert("followInsert",vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(session!=null) session.close();
		}
	   }
	   // 팔로우 삭제
	   public static void followDelete(FollowVO vo){
		   FollowVO fvo = new FollowVO();
		   SqlSession session =null;
		   try {
			   session=ssf.openSession(true);
			   session.delete("followDelete",vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(session!=null) session.close();
		}
	   }
	   //팔로우 찾기 
	   public static List<FollowVO> followSearch(String id){
		   List<FollowVO> list = new ArrayList<FollowVO>();
		   SqlSession session = null;
		   try {
			   session=ssf.openSession();
			   list = session.selectList("whofollow",id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(session!=null) session.close();
		}
		   return list;
	   }
	   public static List<RecipeVO> followSearchRecipe(FollowVO vo){
		   List<RecipeVO> list = new ArrayList<RecipeVO>();
		   SqlSession session = null;
		   try {
			   session=ssf.openSession();
			   list = session.selectList("madeSearchRecipe",vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(session!=null) session.close();
		}
		   return list;
	   }
	   // 레시피 wish 확인
	   public static int wishCount(int no){
		   int total=0;
		   SqlSession session = null;
		   try {
			   session=ssf.openSession();
			   total = session.selectOne("wishCount",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(session!=null) session.close();
		}
		   return total;
	   }
	   // wish 추가
	   public static void wishInsert(WishVO vo){
		   SqlSession session = null;
		   try {
			   session=ssf.openSession(true);
			   session.selectOne("wishInsert",vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	   }
	   // wish 삭제
	   public static void wishDelete(WishVO vo){
		   SqlSession session = null;
		   try {
			   session=ssf.openSession(true);
			   session.selectOne("wishDelete",vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	   }
	   //read 확인
	   public static int readCount(ReadVO vo){
		   int total=0;
		   SqlSession session =null;
		   try {
			session = ssf.openSession();
			total =session.selectOne("readCount",vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(session!=null) session.close();
		}
		   return total;
	   }
	   public static void readInsert(ReadVO vo){
		   SqlSession session = null;
		   try {
			   session = ssf.openSession(true);
			   session.insert("readInsert",vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(session!=null) session.close();
		}
	   }
	   public static List<ReadVO> readAllData(String id){
		   SqlSession session = null;
		   List<ReadVO> list = new ArrayList<ReadVO>();
		   try {
			session = ssf.openSession();
			list = session.selectList("readAllData",id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(session!=null) session.close();
		}
		   return list;
	   }
	   // wishData wishAllData
	   public static List<Integer> wishData(String id){
		   List<Integer> list = new ArrayList<Integer>();
		   SqlSession session = null;
		   try {
			   session =ssf.openSession();
			   list = session.selectList("wishData",id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(session!=null) session.close();
		}
		   return list;
	   }
	   public static RecipeVO wishAllData(int no){
		   RecipeVO vo = new RecipeVO();
		   SqlSession session = null;
		   try {
			session = ssf.openSession();
			vo = session.selectOne("wishAllData",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(session!=null) session.close();
		}
		   return vo;
	   }
	   //보낸 메세지,  받은 메세지 출력
	   public static List<MsgVO> msgSend(String id){
		   List<MsgVO> list = new ArrayList<MsgVO>();
		   SqlSession session = null;
		   try {
			session=ssf.openSession();
			list = session.selectList("msgSendData",id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		   return list;
	   }
	   public static List<MsgVO> msgReseve(String id){
		   List<MsgVO> list = new ArrayList<MsgVO>();
		   SqlSession session = null;
		   try {
			session=ssf.openSession();
			list = session.selectList("msgReserveData",id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		   return list;
	   }
	   public static int msgCount(String id) {
		   int count = 0;
		   SqlSession session = null;
		   try {
			session=ssf.openSession();
			count = session.selectOne("msgCount",id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		   return count;
	   }
	   // 메세지 보내기
	   public static void msgInsert(MsgVO vo) {
		   SqlSession session = null;
		   try {
			session=ssf.openSession(true);
			session.selectOne("msgInsert",vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
	   }
	   //메세지 확인
	   public static void msgUpdate(int msgno){
		   SqlSession session = null;
		   try {
			session=ssf.openSession(true);
			session.update("msgUpdate",msgno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(session!=null) session.close();
		}
	   }
	   public static MsgVO msgDetail(int msgno){
		   SqlSession session = null;
		   MsgVO vo = new MsgVO();
		   try {
			session=ssf.openSession();
			vo = session.selectOne("msgDetail",msgno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(session!=null) session.close();
		}
		   return vo;
	   }
	   public static void msgDelete(int no){
		   SqlSession session = null;
		   try {
			session = ssf.openSession(true);
			session.delete("msgDelete",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(session!=null) session.close();
		}
	   }
	   
	   public static void msgSendDelete(int no){
		   SqlSession session = null;
		   try {
				session = ssf.openSession(true);
				session.delete("msgSendDel",no);
			} catch (Exception e) {
				e.printStackTrace();
			} finally{
				if(session!=null) session.close();
			}
	   }
	   public static void msgReDelete(int no){
		   SqlSession session = null;
		   try {
				session = ssf.openSession(true);
				session.delete("msgResDel",no);
			} catch (Exception e) {
				e.printStackTrace();
			} finally{
				if(session!=null) session.close();
			}
	   }
	   public static MsgVO msgDelData(int no){
		   SqlSession session = null;
		   MsgVO vo = new MsgVO();
		   try {
			session = ssf.openSession();
			vo = session.selectOne("",no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		   return vo;
	   }

}
