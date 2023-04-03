package com.jubging.domain;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jubging.database.SqlSessionManager;

public class JgDAO {
	
	/* DB에서 연결 고리를 만들어 놓고 가져다 쓸 수 있게 sqlSession생성 */
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();

	public List<Jgnam> Selectjn() {
		List<Jgnam> cnt = null;

		try {
			cnt = sqlSession.selectList("com.jubging.darabase.JubgingMapper1.Selectjn");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;

	}
	

	
}
