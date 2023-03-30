package com.jubging.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.jubging.domain.MemberDAO;
import com.jubging.domain.join;

public class FindCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String user_id = null;
		String user_pw = null;
		String user_email = request.getParameter("user_email");

		if (user_email != null) {
			MemberDAO dao = new MemberDAO();
			join findMember = dao.selectfind(user_email);

			if (findMember != null) {
				user_id = findMember.getUser_id();
				user_pw = findMember.getUser_pw();
				System.out.println("회원정보 불러오기 성공!!");
				System.out.println(findMember.toString());
				HttpSession session = request.getSession();
				session.setAttribute("findMember",findMember);
				
				// String userid = "ID : " + findMember.getUser_id() + " \t pw : " + findMember.getUser_pw();
				
				Gson gson = new Gson();

				// toJson()으로 얻는 값은 String 타입 입이다.
				PrintWriter out = response.getWriter();
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				String json = gson.toJson(findMember);
				
				out.print(json);
				
			} else {
				System.out.println("회원정보 불러오기 실패!!");
			}
		} else {
			System.out.println("user_email 값이 null입니다.");
			// user_email 값이 없는 경우 처리할 코드 작성
		}

		/*
		 * HttpSession session = request.getSession(); session.setAttribute("user_id",
		 * user_id); session.setAttribute("user_pw", user_pw); join syso1 =
		 * (join)session.getAttribute("user_id"); join syso2 =
		 * (join)session.getAttribute("user_pw");
		 * System.out.println("세션에 저장된 아이디 값"+syso1.getUser_id());
		 * System.out.println("세션에 저장된 패스워드 값"+syso2.getUser_pw());
		 */
		/*
		 * request.setAttribute("user_id", user_id); request.setAttribute("user_id",
		 * user_pw); RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		 * rd.forward(request, response);
		 */
	}

}
