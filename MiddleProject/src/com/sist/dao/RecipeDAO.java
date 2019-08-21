package com.sist.dao;

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
}
