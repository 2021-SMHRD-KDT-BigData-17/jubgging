package com.jubging.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jubging.domain.Product;

public class ProductCon extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	// 서블릿이 GET 요청을 처리하는 메서드
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		// 상품 정보를 가져올 DAO나 Service 클래스를 호출하여 상품 리스트를 가져옵니다.
		List<Product> productList = getProductList();
		
		// 상품 리스트를 JSP 파일에 전달하기 위해 request 객체에 저장합니다.
		request.setAttribute("productList", productList);
		
		// JSP 파일로 forward 합니다.
		request.getRequestDispatcher("/ProductCon.jsp").forward(request, response);
	}
	
	// 상품 정보를 가져오는 메서드
	private List<Product> getProductList() {
		List<Product> productList = new ArrayList<>();
		productList.add(new Product(1, 10, "상품1", 10000, "img1.jpg"));
		productList.add(new Product(2, 20, "상품2", 20000, "img2.jpg"));
		productList.add(new Product(3, 30, "상품3", 30000, "img3.jpg"));
		return productList;
	}

}
