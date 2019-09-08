package com.sist.dao;

import java.util.ArrayList;
import java.util.HashMap;
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
	public static int selectdatecount(Map map) {
		int count=0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			
			count = session.selectOne("selectdatecount", map);
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
	
	public static void reserveInsert(ReserveVO vo,Map map1){
		SqlSession session = null;
		Map map=new HashMap();
		
		try{
			session = ssf.openSession();
			int count=session.selectOne("ResCountcheck",vo.getCheifid());
			map.put("id", vo.getCheifid());
			map.put("count", count+1);
			map.put("check",0);
			
			session.update("memberResCount",map);
			session.insert("addreserve",vo);
			session.update("userpayminus", map1);
			/*session.update("cheifcheck",map);*/
			
			session.commit();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if (session != null)
				session.close();
		}
	}
	public static List<ReserveVO> reserveList(Map map){
		List<ReserveVO> list=new ArrayList<ReserveVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("reserveList", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}
	
	public static int reservepage(Map map){
		int total=0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			total = session.selectOne("reservepage", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return total;
	}
	public static void reserveUpdate(Map map){
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.update("reserveUpdate", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}
	
	public static int adminpage(){
		int total=0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			total = session.selectOne("adminpage");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return total;
	}
	
	public static List<ReserveVO> adminList(Map map){
		List<ReserveVO> list=new ArrayList<ReserveVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("adminList", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}
	public static void adminokBtn(int no,int price,String id,int check){
		SqlSession session = null;
		try {
			session = ssf.openSession();
			session.update("adminokBtn", no);
			
			Map map=new HashMap();
			map.put("id", id);
			map.put("price", price);
			if(check==2){
				session.update("cheifpayplus",map);
			}else if(check==10){
				session.update("userpayplus",map);
			}
			
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		
	}

}
