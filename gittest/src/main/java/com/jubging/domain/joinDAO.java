package com.jubging.domain;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jubging.database.SqlSessionManager;

public class joinDAO {

	// DB에서 연결 고리를 만들어 놓고 가져다 쓸 수 있게 sqlSession생성
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	// 회원가입 기능 구현
	public int insertjoin(join joinMember) {
		int cnt = 0;
		
		try {
			cnt = sqlSession.insert("insertjoin", joinMember);
			if(cnt>0) {
				System.out.println("DAO에서는 회원가입 성공");
				sqlSession.commit();
			}else {
				sqlSession.rollback();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		} // finally 끝
		
		return cnt;
	} // insertMember 끝

}
