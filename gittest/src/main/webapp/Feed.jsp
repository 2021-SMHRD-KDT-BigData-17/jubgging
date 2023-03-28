<%@page import="com.jubging.domain.join"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
join user_id = (join) session.getAttribute("user_id");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./css/Feed.css">

<title>::Jubging:: - Feed</title>
<style type="text/css">
a:link {
	color: red;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: blue;
	text-decoration: underline;
}
</style>
</head>

<body>
	<!-- sidebar section Start -->
	<div class="sidebar">
		<div class="sidebarOption_logo">
			<img src="./img/homelogo.png">
		</div>
		<div class="sidebarOption active">
			<i class="fa-solid fa-house-chimney active"></i>
			<h2>홈</h2>
		</div>
		<div class="sidebarOption">
			<i class="fa-sharp fa-solid fa-magnifying-glass"></i>
			<h2>탐색하기</h2>
		</div>
		<div class="sidebarOption">
			<i class="fa-solid fa-envelope"></i>
			<h2>쪽지</h2>
		</div>
		<div class="sidebarOption">
			<i class="fa-solid fa-store"></i>
			<h2>스토어</h2>
		</div>
		<a href="./profile_post.jsp">
			<div class="sidebarOption">
				<i class="fa-solid fa-user"></i>
				<h2>프로필</h2>
			</div>
		</a>
		<div class="profile_btn" onclick="dropdown()">
			<div class="user_info">
				<img src="./img/129.png" class="user_profile_img"
					style="width: 55px; height: 55px;">
				<div class="name">
					<p class="user_nick"><%=user_id.getUser_id()%></p>
					<p class="user_id">
						@<%=user_id.getUser_id()%></p>
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

	<!-- feed section start -->
	<!-- post box -->
	<div class="feed">
		<div class="feed_header">
			<h2>홈</h2>
		</div>
		<div class="postbox">
			<form action="./CommunirtyCon">
				<div class="input_box" >
					<!-- <div class="postbox_area"  >
						<span class="placeholder">무슨 일이 일어나고 있나요?</span>
						<div class="input editable" contenteditable="true"
							spellcheck="false" ></div>
						<div class="input readonly" contenteditable="true"
							spellcheck="false"></div>
					</div>  -->
					<!-- <form action="./CommunirtyCon"> -->
					<input type="text" name ="c_content">
					<button type="submit">글쓰기</button>  -->
					<!-- </form> -->
					<div id="postbox_image-container_1"></div>
					<div class="tag" name="c_hashtag"></div>
					
				</div>
				<div class="postbox_footer">
					<div class="footer-icon">
						<div class="add-img" name="c_img">
							<i class="far fa-file-image"></i>
						</div>
						<div class="add_map" id="add_map">
							<i class="fa-solid fa-location-dot"></i>
						</div>
						<div class="add_tage" onclick="dropdown_tage()">
							<i class="fa-regular fa-hashtag"></i>
						</div>
					</div>
					<div class="post-limits">
						<span class="counter-limit">240</span>
						<button class="postbox_btn" type="submit">글쓰기</button>
					</div>
				</div>
			<!-- </form> -->
			<div class="tag_wrapper" id="tage_dropdown-content">
				<div class="title">
					<i class="fa-solid fa-tags"></i>
					<h2>태그</h2>
				</div>
				<div class="tag_content">
					<p>원하는 태그를 입력 해주세요</p>
					<div class="tag_box">
						<ul>
							<input type="text" name="c_hashtag">
						</ul>
					</div>
					<div class="tag_details">
						<p>
							<span>_</span>개의 태그까지 추가할 수 있습니다
						</p>
						<button id="add_postboxTags" name="c_hashtag" onclick="addTags()">태그 추가</button>
						<button id="tag_allremove">전체 삭제</button>
					</div>
				</div>
			</div>
			</form>
		</div>
		<!-- post box end -->
		<!-- post list start-->


		<!-- post list end-->
	</div>
	<!-- feed section end -->

	<!-- widget section Start -->
	<div class="widgets">
		<div class="widgets_input">
			<input type="text" placeholder="Search.."
				onfocus="this.placeholder=''" onblur="this.placeholder='Search..'"
				name="search">
			<button type="submit">
				<i class="fa-sharp fa-solid fa-magnifying-glass"></i>
			</button>
		</div>
		<div class="widgets_treand_Container">
			<h2>트렌드</h2>
			<span><iframe width="385" height="240"
					src="https://www.youtube.com/embed/P4MunVGijbo"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
					allowfullscreen></iframe></span>
		</div>
		<div class="widgets_weather_Container">
			<h2>날씨</h2>
			<div class="weather_card">
				<div class="error">
					<p>위치정보를 찾을 수 없습니다.</p>
				</div>

				<div class="weather">
					<img src="./img/icon/1530391_clouds_sun_sunny_weather.png"
						class="weather-icon">
					<h1 class="temp"></h1>
					<h2 class="city_result"></h2>
					<div class="details">
						<div class="col">
							<img
								src="./img/icon/cloud_forecast_rain_humidity_weather_icon_228446.png"
								alt="">
							<div class="col_text">
								<p class="humidity"></p>
								<p>습도</p>
							</div>
							<div class="col">
								<img src="./img/icon/wind_icon-icons.com_64274.png" alt="">
								<div class="col_text">
									<p class="windy_speed"></p>
									<p>풍속</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- widget section end -->

		<!-- map popup section Start -->
		<div class="popup">
			<header>
				<div class="close">
					<i class="fa-solid fa-xmark"></i>
				</div>
			</header>
			<div class="content"></div>
		</div>
		<!-- popup section end -->

		<!-- js file section -->
		<script src="./js/feed.js"></script>
		<script
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cc62bb43e9feeb15374bcc3b80292f46"></script>
		<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
		<script src="https://kit.fontawesome.com/369266d994.js"
			crossorigin="anonymous"></script>
</body>
</html>