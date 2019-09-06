package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.MemberVO;

public class MemberDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}

	public static int IdCheck(String id) {
		int count = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			count = session.selectOne("memberIdCount", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}
	
	public static MemberVO isLogin(String id, String pwd) {
		MemberVO vo = new MemberVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			int count = session.selectOne("memberIdCount", id);
			if (count == 0)// ID가 없는 상태
			{
				vo.setMsg("NOID");
			} else {
				vo = session.selectOne("memberGetPwd", id);
				if (pwd.equals(vo.getPwd())) {
					vo.setMsg("OK");
				} else {
					vo.setMsg("NOPWD");
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return vo;

	}

	// 장바구니 갯수
	public static int wishCount(String id) {
		int total = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			total = session.selectOne("MywishCount", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return total;
	}

	// 회원가입
	public static void memberSignUp(MemberVO vo) {
		SqlSession session = ssf.openSession(true); // 업데이트니까 커밋

		try {
			session.insert("memberSignUp", vo);
		} catch (Exception e) {
			System.out.println("회원 가입 오류 발생");
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}

	// 회원 탈퇴
	public static void memberDelete(String id) {
		SqlSession session = ssf.openSession(true);

		try {
			session.insert("memberDelete", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}

	// 아이디 찾기
	public static String memIdFind(String email) {
		String msg = "";
		SqlSession session = null;
		try {
			session = ssf.openSession();
			int count = session.selectOne("memberEmailCount", email);
			if (count == 0)// EMAIL가 없는 상태
			{
				msg = "ERROR";
			} else {
				msg = session.selectOne("memIdFind", email);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return msg;
	}

	// 비밀번호 찾기
	public static String memPwdFind(String id, String email) {
		String msg = "";
		SqlSession session = null;
		try {
			session = ssf.openSession();
			int count = session.selectOne("memberIdCount", id);
			if (count == 0)// ID가 없는 상태
			{
				msg = "NOID";
			} else {
				count = session.selectOne("memberEmailCount", email);
				if (count == 1) {
					msg = session.selectOne("memPwdFind", email);
				} else {
					msg = "NOEMAIL";
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return msg;

	}

	// 회원정보 가져오기
	public static MemberVO memberAllData(String id) {
		SqlSession session = null;
		MemberVO vo = new MemberVO();
		session = ssf.openSession();
		try {
			vo = session.selectOne("selectId", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}

}
