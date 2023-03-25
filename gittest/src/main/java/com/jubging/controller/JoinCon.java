package com.jubging.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jubging.domain.join;
import com.jubging.domain.MemberDAO;

public class JoinCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 0. post방식으로 넘어온 데이터 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 1. 파라미터 수집(email,pw,tel,address)
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_email = request.getParameter("user_email");
		// 2. 받아온 값을 Member객체에 묶어 담아주기
		join joinMember = new join(user_id,user_pw,user_email);
		// 받아온 값 확인
		System.out.println(joinMember.toString());
		// 3-1. DAO에 메소드 생성
		// 3-2. DAO 객체 생성
		MemberDAO dao = new MemberDAO();
		// 3-3. DAO 객체에 매게뱐수 담기
		// 3-4. DAO 메소드의 결과(반환)이 int형이나 객체 형태로 되면 다시 담아주기
		int cnt = dao.insertjoin(joinMember);
		// 4. MemberMapper.xml에 sql문 작성
		
		
		// 5. 명령 후 처리
		// 회원가입 성공 -> joinSuccess.jsp로 이동
		// 회원가입 실패 -> main.jsp로 이동
		if(cnt>0) {
			System.out.println("JoinCon : 회원가입 성공!!");
			response.sendRedirect("index.jsp");
		}else {
			System.out.println("JoinCon : 회원가입 실패!!");
			response.sendRedirect("index.jsp");
		}
	}

}
