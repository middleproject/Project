package com.sist.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.MemberVO;
import com.sist.vo.RecipeVO;
import com.sist.vo.ReserveVO;

public class ReserveDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	public static RecipeVO recipeSelectReserve(int no) {
		RecipeVO vo=new RecipeVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			vo = session.selectOne("recipeSelectReserve", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}
	public static int recipeSearchReserve(Map map) {
		int total=0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			total = session.selectOne("recipeSearchReserve", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return total;
	}
	public static List<MemberVO> chiefList(Map map) {
		List<MemberVO> list=new ArrayList<MemberVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("chiefList", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}
	public static MemberVO chiefSelect(String id) {
		MemberVO vo=new MemberVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			vo = session.selectOne("chiefSelect", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}
	public static List<ReserveVO> selectdate(String id) {
		List<ReserveVO> list=new ArrayList<ReserveVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("selectdate", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}
	public static int selectdatecount(String id) {
		int count=0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			count = session.selectOne("selectdatecount", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}
	public static List<ReserveVO> selectTime(ReserveVO vo) {
		List<ReserveVO> list=new ArrayList<ReserveVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("selectTime", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}
}
