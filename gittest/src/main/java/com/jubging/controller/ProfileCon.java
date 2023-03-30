package com.jubging.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jubging.domain.Community;
import com.jubging.domain.CommunityDAO2;
import com.jubging.domain.join;

public class ProfileCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("[ProfileCon]");

		// 0. post방식 인코딩
		request.setCharacterEncoding("UTF-8");
		// 1. 파라미터 수집
		HttpSession session = request.getSession();
		join userid = (join) session.getAttribute("user_id");
		String user_id = userid.getUser_id();
		String c_content = request.getParameter("c_content");
		String c_hashtag = request.getParameter("c_hashtag");
		String c_img = null;
		String c_date = null;
		
		
		// 2. 데이터를 Community객체에 담아주기
		Community newPost = new Community(user_id,c_content,c_hashtag,c_img,c_date);
		

		// 3-1. sql문 작성
		// 3-2. DAO 메소드 생성
		// 3-3. DAO 객체 생성
		CommunityDAO2 dao = new CommunityDAO2();
		// 3-4. DAO 메소드 호출 --> int(실행된 레코드 수)
		int cnt = dao.InsertMember(newPost);

		// 4. 명령 후 처리
		if (cnt > 0) {
			System.out.println("게시글 올리기 완료!!");
			// main.jsp 이동
			response.sendRedirect("profile_post.jsp");

		} else {
			System.out.println("게시글 올리기 실패ㅜㅜ");

			response.sendRedirect("profile_post.jsp");
		}

	}

}
