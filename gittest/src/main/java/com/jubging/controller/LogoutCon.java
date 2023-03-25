package com.jubging.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 세션에 저장되어있는 로그인 정보를 삭제 후 main.jsp으로 이동!!
		HttpSession session = request.getSession();
		session.removeAttribute("loginMember");
		response.sendRedirect("index.jsp");
	}

}
