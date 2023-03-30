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

public class ComUplodCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		String user_id = request.getParameter("user_id");
		String c_content = request.getParameter("c_content");
		String c_hashtag = request.getParameter("c_hashtag");
		String c_date = request.getParameter("c_date");
		String c_img = request.getParameter("c_img");
		
		Community community = new Community(c_content,c_hashtag,user_id,c_img,c_date);
		
		CommunityDAO dao = new CommunityDAO();
		
		Community com = dao.selectcommunity(community);
		
		
		if(com != null) {
			System.out.println("타임라인 데이터 불러오기 성공!!");
			System.out.println(com.toString());
		}else {
			System.out.println("타임라인 데이터 불러오기 실패!!");
		}
		
	}

}
