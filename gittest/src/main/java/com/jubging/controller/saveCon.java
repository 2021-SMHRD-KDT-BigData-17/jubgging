package com.jubging.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jubging.domain.MemberDAO;
import com.jubging.domain.Profile;
import com.jubging.domain.join;

public class saveCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		join userid = (join) session.getAttribute("user_id");
		String user_id = userid.getUser_id();
		String user_situation = request.getParameter("user_situation");
		String user_nick = request.getParameter("user_nick");
		
		System.out.println("데이터 저장");
		Profile profileMember = new Profile(user_id,user_situation,user_nick);
		System.out.println(profileMember.toString());
		join update = new join(userid.getUser_id(), userid.getUser_pw(), userid.getUser_name(), user_nick,
				userid.getUser_email(),userid.getUser_point(),userid.getUser_img(),userid.getUser_joindate(),
				userid.getUser_type(),user_situation);
		
		MemberDAO dao = new MemberDAO();
		
		int cnt = dao.insertsituation(profileMember);
		
		/* int cnt = dao.updatesituation(profileMember); */
		// 4. MemberMapper.xml에 sql문 작성
		
		// 5. 명령 후 처리
		// 회원가입 성공 -> joinSuccess.jsp로 이동
		// 회원가입 실패 -> main.jsp로 이동
		
		
		if(cnt>0) {
			System.out.println("상태 메시지 변경 성공!!");
			session.setAttribute("user_id", update);
		}else {
			System.out.println("상태 메시지 변경 실패!!");
		}
		
		response.sendRedirect("profile_post.jsp");
		
	}

}


