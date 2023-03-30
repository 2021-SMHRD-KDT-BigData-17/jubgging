package com.jubging.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jubging.domain.Community;
import com.jubging.domain.CommunityDAO;
import com.jubging.domain.join;



public class CommunirtyCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		// 파라미터 수집 (c_content,c_hashtag,user_id)
		String c_content = request.getParameter("c_content");
		String c_hashtag = request.getParameter("c_hashtag");
		String c_img = request.getParameter("c_img");
		String c_date = null;
		
		HttpSession session = request.getSession();
		join userid = (join) session.getAttribute("user_id");
		
		String user_id = userid.getUser_id();
		// 2. 받아온 값을 묵어주기
		
		Community Community = new Community(c_content,c_hashtag,user_id, c_img, c_date);
		
		System.out.println(Community.toString());
		
		CommunityDAO dao = new CommunityDAO();
		
		int cnt = dao.insertcommunity(Community);
		
		if(cnt>0) {
			System.out.println("데이터 저장 성공");
			response.sendRedirect("Feed.jsp");
		}else {
			System.out.println("데이터 저장 실패!!");
			response.sendRedirect("Feed.jsp");
		}
		
	}

}
