package com.jubging.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jubging.database.SqlSessionManager;

public class JgbukDAO {

	/* DB에서 연결 고리를 만들어 놓고 가져다 쓸 수 있게 sqlSession생성 */
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	
	public List<jgbuk> Selectjb() {
		List<jgbuk> cnt = null;

		try {
			cnt = sqlSession.selectList("com.jubging.darabase.JubgingMapper1.Selectjb");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;

	}
	
}
