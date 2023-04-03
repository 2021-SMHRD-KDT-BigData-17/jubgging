<%@page import="java.io.FileOutputStream"%>
<%@page import="java.util.Base64"%>
<%@page import="com.jubging.domain.Community"%>
<%@page import="com.jubging.domain.CommunityDAO2"%>
<%@page import="com.jubging.domain.Jgnam"%>
<%@page import="java.util.List"%>
<%@page import="com.jubging.domain.JgDAO"%>
<%@page import="com.jubging.domain.join"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
join user_id = (join) session.getAttribute("user_id");
%>

<%
JgDAO dao = new JgDAO();
List<Jgnam> jeonnam = dao.Selectjn();
%>

<%
CommunityDAO2 dao1 = new CommunityDAO2();
List<Community> com = dao1.SelectMember(user_id.getUser_id());
%>


<%
// 한 페이지에 보여줄 데이터의 개수
int itemsPerPage = 10;

// 전체 데이터의 개수
int totalCount = jeonnam.size();

// 현재 페이지 번호
int currentPage = 1;
if (request.getParameter("page") != null) {
    currentPage = Integer.parseInt(request.getParameter("page"));
}

// 시작 인덱스
int startIndex = (currentPage - 1) * itemsPerPage;

// 끝 인덱스
int endIndex = Math.min(startIndex + itemsPerPage - 1, totalCount - 1);

// 총 페이지 수
int totalPages = (int) Math.ceil((double) totalCount / itemsPerPage);
%>
	
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="./css/bulletinboard.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <title>bulletinboard</title>
</head>

<body>
  <!-- sidebar section Start -->
  <div class="sidebar">
    <div class="sidebarOption_logo">
      <img src="./img/homelogo.png">
    </div>
    <div class="sidebarOption">
      <i class="fa-solid fa-house-chimney"></i>
      <a href="./Feed.jsp">
        <h2>HOME</h2>
      </a>
    </div>
    <div class="sidebarOption">
      <i class="fa-sharp fa-solid fa-magnifying-glass"></i>
      <a href="./search.jsp">
        <h2>TREND</h2>
      </a>
    </div>
    <div class="sidebarOption">
      <i class="fa-solid fa-envelope"></i>
      <a href="./todayspick.jsp">
        <h2 class = trendBtn>TODAY'S PICK</h2>
      </a>
    </div>
    <div class="sidebarOption">
      <i class="fa-solid fa-user"></i>
      <a href="./profile_post.jsp">
        <h2>PROFILE</h2>
      </a>
    </div>
    <div class="profile_btn" onclick="dropdown()">
      <div class="user_info">
      <% 
if(user_id.getUser_img() != null){
	byte[] imageData = Base64.getDecoder().decode(user_id.getUser_img());
	
	// 바이트 배열을 파일로 저장
	String imageFileName = "user_img_" + user_id.getUser_id() + ".jpg";
	String imagePath = request.getServletContext().getRealPath("/img/") + "user_img_" + user_id.getUser_id() + ".jpg"; // 이미지 파일 경로
     FileOutputStream fos = new FileOutputStream(imagePath);
     fos.write(imageData);
     fos.close();
     
     String imageUrl = request.getContextPath() + "/img/user_img_" + user_id.getUser_id() + ".jpg";
	
%>
          <img src="<%= imageUrl %>" alt="" class="user_profile_img" style="width: 55px; height: 55px;">
<%} else{%>
          <img src="./img/icon/profile_img.png" alt="" class="user_profile_img" style="width: 55px; height: 55px;">
<%} %>
        <div class="name">
          <p class="user_nick"><%= user_id.getUser_nick() %></p>
          <p class="user_id">@<%= user_id.getUser_id() %></p>
        </div>
        <div class="user_profile_op">
          <i class="fa-solid fa-angles-down"></i>
        </div>
      </div>
    </div>
    <div class="sidebar_dropdown-content" id="dropdown-content">
      <a href="LogoutCon"><p onclick="logout()">로그아웃</p></a>
    </div>
  </div>
  <!-- sidebar section end -->


  <!-- 게시물 섹션 -->

  <section>
    <div class="bulletinboard_header">
      <div class="header_text">
        <h2>전라남도</h2>
      </div>
    </div>
    <div class="board_list_wrap">
      <table class="board_list">
        <caption>게시판 목록</caption>
        <thead>
          <tr>
            <th>번호</th>
            <th>제목</th>
            <th>글쓴이</th>
            <th>작성일</th>
          </tr>
        </thead>
        <tbody>
					<%
					for (int i = startIndex; i <= endIndex; i++) {
					%>
					<tr>
						<td class="num"><%=jeonnam.get(i).getJn_idx()%></td>


						<td class="tit"><a href="<%=jeonnam.get(i).getJn_ringk()%>"><%=jeonnam.get(i).getJn_name()%></a></td>
						<td>관리자</td>
						<td>2023-03-30</td>
					</tr>
					<%
					}
					%>
					
				</tbody>
			</table>
			
			<div class="paging">
			    <% if (currentPage > 1) { %>
			        <a href="?page=<%=currentPage-1%>">이전</a>
			    <% } else{%>
			    	<a href="">이전</a>
			    	<a href="">1</a>
			    <%} %>
			    <% int startPage = Math.max(currentPage - 5, 1);
			       int endPage = Math.min(startPage + 9, totalPages);
			       if (startPage > 1) { %>
			        <a href="?page=1">1</a>
			        <% if (startPage > 2) { %>
			            <span>...</span>
			        <% } %>
			    <% } %>
			    <% for (int i = startPage; i <= endPage; i++) { %>
			        <% if (i == currentPage) { %>
			            <strong><%=i%></strong>
			        <% } else { %>
			            <a href="?page=<%=i%>"><%=i%></a>
			        <% } %>
			    <% } %>
			    <% if (endPage < totalPages) { %>
			        <% if (endPage < totalPages - 1) { %>
			            <span>...</span>
			        <% } %>
			        <a href="?page=<%=totalPages%>"><%=totalPages%></a>
			    <% } %>
			    <% if (currentPage < totalPages) { %>
			        <a href="?page=<%=currentPage+1%>">다음</a>
			    <% }else{%>
			    	<a href=""><%=currentPage%></a>
			    	<a href="">다음</a>
			    <%} %>
			</div>
			
		</div>
  </section>
  <section>
  <div id='wrap'>
      <footer>
        <nav>
            <a href='#' target='_blank'>Blog</a> |
            <a href='https://github.com/2021-SMHRD-KDT-BigData-17/jubging' target='_blank'>Github</a>
        </nav>
        <p>
            <span>팀 : 떡잎방범대</span><br/>
            <span>이메일 : leaf0000@gmail.com</span><br/>
            <span> &copy; 2023 Jubging. All Rights Reserved.</span>
        </p>
    </footer>
  </div>
  </section>






















  <!-- js file section -->
  <script>
    function dropdown() {
      document.getElementById("dropdown-content").classList.toggle("show");
    }

    // 프로필 세팅 모달창

    const viewBtn = document.querySelector("#openmodal"),
      popup = document.querySelector(".popup"),
      close = popup.querySelector(".close");
    viewBtn.onclick = () => {
      popup.classList.toggle("show");
    };

    close.onclick = () => {
      viewBtn.click();
    };

    // 사이드바 기능

    const links = document.querySelectorAll('.sidebarOption a');

    const currentUrl = window.location.href;

    links.forEach(link => {
      if (link.href === currentUrl) {
        link.classList.add('active');
      } else {
        link.classList.add('default');
      }
    });

    const buttons = document.querySelectorAll('button');
    const selectedButton = document.querySelector('.selected');
    const selectedIndex = Array.from(buttons).indexOf(selectedButton);

    function moveLeft() {
      if (selectedIndex > 0) {
        selectedButton.classList.remove('selected');
        buttons[selectedIndex - 1].classList.add('selected');
      }
    }

    function moveRight() {
      if (selectedIndex < buttons.length - 1) {
        selectedButton.classList.remove('selected');
        buttons[selectedIndex + 1].classList.add('selected');
      }
    }

    document.addEventListener('keydown', function (event) {
      if (event.key === 'ArrowLeft') {
        moveLeft();
      } else if (event.key === 'ArrowRight') {
        moveRight();
      }
    });
  
  </script>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script src="https://kit.fontawesome.com/369266d994.js" crossorigin="anonymous"></script>
</body>

</html>