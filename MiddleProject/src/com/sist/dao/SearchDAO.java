package com.sist.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.IngreVO;
import com.sist.vo.IngredetailVO;


public class SearchDAO {
	 private static SqlSessionFactory ssf;
	   static
	   {
		   
		   try
		   {
			   
			   Reader reader=Resources.getResourceAsReader("Config.xml");
			   ssf=new SqlSessionFactoryBuilder().build(reader);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
	   }
	   
	   public static void IngreInsert(IngreVO vo)
	   {
		   SqlSession session=ssf.openSession(true);
		   try
		   {
			   session.insert("IngreInsert",vo);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
	   }
	   public static List<IngreVO> IngreListData()
	   {
		   List<IngreVO> list=new ArrayList<IngreVO>();
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("IngreListData");
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return list;
	   }
	   public static List<String> IngredetailData(int ino) {
			List<String> list = new ArrayList<String>();
			SqlSession session = null;
			try {
				session = ssf.openSession();
				list = session.selectList("ingredetailData", ino);
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				if (session != null)
					session.close();
			}
			return list;
		}
}

