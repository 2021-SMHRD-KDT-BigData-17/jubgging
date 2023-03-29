package com.jubging.domain;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jubging.database.SqlSessionManager;
import com.jubging.domain.join;

public class MemberDAO {

	// DB에서 연결 고리를 만들어 놓고 가져다 쓸 수 있게 sqlSession생성
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();

	// 회원가입 기능 구현
	public int insertjoin(join joinMember) {
		int cnt = 0;

		try {
			cnt = sqlSession.insert("insertjoin", joinMember);
			if (cnt > 0) {
				System.out.println("DAO에서는 회원가입 성공");
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		} // finally 끝

		return cnt;
	} // insertMember 끝

	// 로그인 기능 구현
	public join selectlogin(join login) {
		join loginMember = null;
		try {
			loginMember = sqlSession.selectOne("selectlogin", login);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return loginMember;
	} // selectMember 끝

	public int insertsituation(Profile profileMember) {

		int cnt = 0;

		try {
			cnt = sqlSession.update("insertsituation", profileMember);
			if (cnt > 0) {
				System.out.println("DAO에서는 상테 메시지 수정 성공");
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		} // finally 끝

		return cnt;
	} // insertMember 끝


	public join selectfind(String user_email) {

		join findMember = null;

		try {
			findMember = sqlSession.selectOne("selectfind", user_email);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return findMember;

	}

}
