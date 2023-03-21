package com.jubging.database;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {

	// SqlSessionFactory : SqlSession 생성(Connection객체를 생성)
	static SqlSessionFactory sqlSessionFactory;

	// static : 객체 호출할때 무조건 자동으로 한번 실행되는 영역
	static {

		try {
			String resource = "com/jubging/database/config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			// DB 연결을 미리 해놓음(connection Pool : CP)
			// DB 연결 할때마다 낭비되는 자원을 아낄 수 있음
			// Connection 객체를 미리 만들어 놓고 빌려쓰고 반납하는 형식으로
			// DB 관리 하게 됨 --> MyBatis 프레임워크
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

		} catch (Exception e) {
			e.printStackTrace();
		}

	} // static 끝
	
	// sqlSessionFactory를 DAO에서 사용할 수 있게 하는 메소드
	public static SqlSessionFactory getSqlSession() {
		
		
		return sqlSessionFactory;
	}
}