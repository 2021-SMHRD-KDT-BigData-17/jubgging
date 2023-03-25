package com.jubging.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jubging.domain.MemberDAO;
import com.jubging.domain.join;

public class LoginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		join login = new join(user_id, user_pw);
		
		MemberDAO dao = new MemberDAO();
		
		join loginMember = dao.selectlogin(login);
		
		if(loginMember != null) {
			System.out.println("로그인 성공!");
			HttpSession session = request.getSession();
			session.setAttribute("user_id", loginMember);
			join syso = (join)session.getAttribute("user_id");
			System.out.println("세션에 저장된 값"+syso.getUser_id());
			response.sendRedirect("./Feed.jsp");
		}else {
			System.out.println("로그인 실패!");
			response.sendRedirect("./index.jsp");
		}
		
		
	}

}
