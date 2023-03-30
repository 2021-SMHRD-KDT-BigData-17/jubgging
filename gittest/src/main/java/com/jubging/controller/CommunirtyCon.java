package com.jubging.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.io.IOUtils;

import com.jubging.domain.Community;
import com.jubging.domain.CommunityDAO;
import com.jubging.domain.join;


@MultipartConfig(
	    location = "D:\\upimg", // 업로드 된 파일이 저장될 위치
	    fileSizeThreshold = 1024 * 1024, // 업로드 된 파일이 저장될 임계값 (1MB)
	    maxFileSize = 1024 * 1024 * 5, // 업로드 가능한 파일의 최대 크기 (5MB)
	    maxRequestSize = 1024 * 1024 * 10 // 요청 데이터의 최대 크기 (10MB)
	)
public class CommunirtyCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		// 파라미터 수집 (c_content,c_hashtag,user_id)
		String c_content = request.getParameter("c_content");
		String c_hashtag = request.getParameter("c_hashtag");
		String c_img = null;
		String c_date = null;
		
		HttpSession session = request.getSession();
		join userid = (join) session.getAttribute("user_id");
		
		String user_id = userid.getUser_id();
		
		// 이미지 처리
		
		
		  Part filePart = request.getPart("c_img"); if(filePart != null) { InputStream
		  fileContent = filePart.getInputStream(); byte[] bytes =
		  IOUtils.toByteArray(fileContent); c_img =
		  Base64.getEncoder().encodeToString(bytes); }
		 
		
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
