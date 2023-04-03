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

import com.jubging.domain.MemberDAO;
import com.jubging.domain.Profile;
import com.jubging.domain.join;

@MultipartConfig(location = "D:\\", // 업로드 된 파일이 저장될 위치
		fileSizeThreshold = 1024 * 1024, // 업로드 된 파일이 저장될 임계값 (1MB)
		maxFileSize = 1024 * 1024 * 5, // 업로드 가능한 파일의 최대 크기 (5MB)
		maxRequestSize = 1024 * 1024 * 10 // 요청 데이터의 최대 크기 (10MB)
)

public class saveCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		join userid = (join) session.getAttribute("user_id");
		String user_id = userid.getUser_id();
		String user_situation = request.getParameter("user_situation");
		String user_nick = request.getParameter("user_nick");
		String user_img = null;

		// 이미지 처리

		Part filePart = request.getPart("user_img");
		if (filePart != null) {
			// InputStream으로 파일 데이터를 읽어와서 바이트 배열로 변환
			InputStream fileContent = filePart.getInputStream();
			byte[] bytes = IOUtils.toByteArray(fileContent);
			
			// Base64로 인코딩된 문자열 생성
			user_img = Base64.getEncoder().encodeToString(bytes);
		}

		
		System.out.println("데이터 저장");
		Profile profileMember = new Profile(user_id, user_situation, user_nick, user_img);
		System.out.println(profileMember.toString());
		System.out.println("user_img : " + user_img);
		System.out.println("상태 메시지 : " + user_situation);
		System.out.println("닉네임 : "+ user_nick );
		join update = new join(userid.getUser_id(), userid.getUser_pw(), userid.getUser_name(), user_nick,
				userid.getUser_email(), userid.getUser_point(), user_img, userid.getUser_joindate(),
				userid.getUser_type(), user_situation);

		MemberDAO dao = new MemberDAO();

		int cnt = dao.insertsituation(profileMember);

		/* int cnt = dao.updatesituation(profileMember); */
		// 4. MemberMapper.xml에 sql문 작성

		// 5. 명령 후 처리
		// 회원가입 성공 -> joinSuccess.jsp로 이동
		// 회원가입 실패 -> main.jsp로 이동

		if (cnt > 0) {
			System.out.println("상태 메시지 변경 성공!!");
			session.setAttribute("user_id", update);
		} else {
			System.out.println("상태 메시지 변경 실패!!");
		}

		response.sendRedirect("profile_post.jsp");

	}

}
