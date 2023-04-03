package com.jubging.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jubging.domain.Community;
import com.jubging.domain.JgDAO;
import com.jubging.domain.Jgnam;

public class JgnamCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String jn_idx1 = request.getParameter("jn_idx");
		int jn_idx = Integer.parseInt(jn_idx1); 
		String jn_name = request.getParameter("jn_name");
		String jn_ringk = request.getParameter("jn_ringk");
	
		
		Jgnam JN = new Jgnam(jn_idx,jn_name,jn_ringk);
		
		JgDAO dao = new JgDAO();
		
		List<Jgnam> cnt = dao.Selectjn();
		
		if(cnt != null) {
			System.out.println("리스트 불러오기 성공");
			
			for (Jgnam j : cnt) {
				System.out.println(j.getJn_idx());
				System.out.println(j.getJn_name());
				System.out.println(j.getJn_ringk());
			}
		}else {
			System.out.println("리스트 불러오기 실패");
		}
		
		
		
	}

}
