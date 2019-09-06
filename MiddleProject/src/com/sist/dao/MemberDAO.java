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
			if (count == 0)// ID�� ���� ����
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

	// ��ٱ��� ����
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

	// ȸ������
	public static void memberSignUp(MemberVO vo) {
		SqlSession session = ssf.openSession(true); // ������Ʈ�ϱ� Ŀ��

		try {
			session.insert("memberSignUp", vo);
		} catch (Exception e) {
			System.out.println("ȸ�� ���� ���� �߻�");
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}

	// ȸ�� Ż��
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

	// ���̵� ã��
	public static String memIdFind(String email) {
		String msg = "";
		SqlSession session = null;
		try {
			session = ssf.openSession();
			int count = session.selectOne("memberEmailCount", email);
			if (count == 0)// EMAIL�� ���� ����
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

	// ��й�ȣ ã��
	public static String memPwdFind(String id, String email) {
		String msg = "";
		SqlSession session = null;
		try {
			session = ssf.openSession();
			int count = session.selectOne("memberIdCount", id);
			if (count == 0)// ID�� ���� ����
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

	// ȸ������ ��������
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
