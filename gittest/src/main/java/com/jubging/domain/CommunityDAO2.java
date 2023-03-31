package com.jubging.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jubging.database.SqlSessionManager;

public class CommunityDAO2 {
	
	// DB에서 연결 고리를 만들어 놓고 가져다 쓸 수 있게 sqlSession생성
		SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
		SqlSession sqlSession = sqlSessionFactory.openSession();

	public int InsertMember(Community newPost) {
		int cnt = 0;
		try {
			cnt = sqlSession.insert("insertcommunity", newPost);
			if (cnt > 0) {
				System.out.println("DAO에서는 저장 성공");
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		} // finally 끝TODO Auto-generated method stub
		return 0;
	}
	
	
	// 프로필 포스트창 타임라인 출력
	public List<Community> SelectMember(String user_id) {
		List<Community> cnt = null;

		try {
			cnt = sqlSession.selectList("com.jubging.darabase.JubgingMapper2.SelectMember", user_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;

	}


}
