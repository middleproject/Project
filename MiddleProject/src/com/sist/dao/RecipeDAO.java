package com.sist.dao;
import java.util.*;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.RecipeVO;

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
		   SqlSession session = ssf.openSession();
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
	   public static List<RecipeVO> relateRecipe(Map map){
		   SqlSession session = ssf.openSession();
		   List<RecipeVO> list = session.selectList("tagselect",map);
		   session.close();
		   return list;
	   }

}
