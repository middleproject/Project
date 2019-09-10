package com.sist.dao;

import java.util.*;

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
	public static String memberDelete(String id, String pwd) {
		MemberVO vo = new MemberVO();
		String msg = "";
		SqlSession session = null;

		try {
			session = ssf.openSession(true);
			vo = session.selectOne("memberGetPwd", id);
			if (vo.getPwd().equals(pwd)) {
				session.delete("memberDelete", id);
				msg = "OK";
			} else {
				msg = "FAIL";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}

		return msg;
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

		try {
			session = ssf.openSession();
			vo = session.selectOne("selectId", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}

	// 회원수정하기
	public static void memberModify(MemberVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.update("memModify", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

	}

	// 캐시충전하기
	public static void memPayUpdate(Map map) {
		SqlSession session = null;

		try {
			session = ssf.openSession(true);
			session.update("memPayUpdate", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}

	// 현재 보유 캐시 확인
	public static int memChkPay(String id) {
		SqlSession session = null;
		int pay = 0;

		try {
			session = ssf.openSession();
			pay = session.selectOne("memChkPay", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return pay;
	}

	// 쉐프 찾기
	public static List<MemberVO> chefAllData() {
		List<MemberVO> list = new ArrayList<MemberVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("chefAllData");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}
}
