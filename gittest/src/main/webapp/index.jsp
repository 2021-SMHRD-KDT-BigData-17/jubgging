<%@page import="com.jubging.domain.join"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
join user = (join) request.getAttribute("findMember");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>::Jubging::</title>
<link rel="stylesheet" href="./css/style.css" />
<script src="https://kit.fontawesome.com/369266d994.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<section class="login_main">
		<div class="box">
			<div class="inner-box">
				<div class="forms-wrap">
					<form action="./LoginCon" autocomplete="off" class="sign-in-form">
						<div class="logo">
							<a href=""><h4>Jubging</h4></a>
						</div>
						<!-- 로그인 영역 시작 -->
						<div class="heading">
							<h2>환영합니다</h2>
							<h6>아직 회원이 아니신가요?</h6>
							<a href="#" class="toggle"><strong>회원가입</strong></a>
						</div>
						<div class="actual-form">
							<div class="input-wrap">
								<input type="text" minlength="4" class="input-field"
									autocomplete="off" name="user_id" required /> <label>아이디</label>
							</div>

							<div class="input-wrap">
								<input type="password" minlength="4" class="input-field"
									autocomplete="off" name="user_pw" required /> <label>비밀번호</label>
							</div>

							<input type="submit" value="로그인" class="sign-btn" />
							<p class="text">
								아이디와 비밀번호를 잊으셨나요? <a href="#" id="open_popup"><strong>회원정보
										찾기</strong></a>
							</p>
						</div>
					</form>
					<!-- 로그인 영역 끝 -->
					<form action="JoinCon" autocomplete="off" class="sign-up-form">
						<div class="logo">
							<h4>Jubging</h4>
						</div>
						<!-- 회원가입 영역 -->
						<div class="heading">
							<h2>환영합니다.</h2>
							<h6>이미 회원이시라면?</h6>
							<a href="#" class="toggle"><strong>로그인</strong></a>
						</div>
						<div class="actual-form">
							<div class="input-wrap">
								<input type="text" minlength="4" class="input-field"
									autocomplete="off" name="user_id" required /> <label>아이디</label>
							</div>

							<div class="input-wrap">
								<input type="password" minlength="4" class="input-field"
									autocomplete="off" name="user_pw" required /> <label>비밀번호</label>
							</div>

							<div class="input-wrap">
								<input type="email" class="input-field" autocomplete="off"
									name="user_email" required /> <label>이메일</label>
							</div>



							<input type="submit" value="회원가입" class="sign-btn" />
							<p class="text">
								<a href="#"><strong>이용약관</strong></a>&nbsp;&nbsp;<a href="#"><strong>개인정보처리방침</strong></a>
							</p>
						</div>
					</form>
				</div>
				<!-- 회원가입 영역 끝 -->
				<div class="carousel">
					<div class="images-wrapper">
						<img src="./img/KakaoTalk_20230217_14145992911.png"
							class="image img-1 show" alt="" /> <img
							src="./img/AdobeStock_318592134.png" class="image img-2" alt="" />
						<img src="./img/129.png" class="image img-3" alt="" /> <img
							src="./img/AdobeStock_523835731.png" class="image img-4" alt="" />
					</div>

					<div class="text-slider">
						<div class="text-wrap">
							<div class="text-group">
								<h2>플로깅을 하는 우리는</h2>
								<h2>지속 가능한 세계를 만들어 나갑니다.</h2>
								<h2>모든 플로깅 정보는</h2>
								<h2>
									<span style="font-weight: bolder;">::줍깅-Jubging::</span> 에서
								</h2>
							</div>
						</div>

						<div class="bullets">
							<span class="active" data-value="1"></span> <span data-value="2"></span>
							<span data-value="3"></span> <span data-value="4"></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 회원 정보 찾기 POPUP -->
	<form >
		<div class="modal hidden">
			<div class="modal_background">
				<div class="modal_content">
					<i id="close" class="fa-solid fa-xmark"></i>
					<h1>회원 정보찾기</h1>
					<div class="input-wrap" style="margin-top: 20px;">
						<input type="email" class="input-field check-email" autocomplete="off"
							name="user_email" required /> <label>가입한 이메일</label>
					</div>
					
					<button type="button" class="sign-btn" onclick="submitForm()">아이디 & 비밀 번호 조회</button>
					<script>
						function submitForm() {
							
							console.log($(".check-email").val());
							$.ajax({
								url : "FindCon",
								type : "post",
								data : {
									"user_email" : $(".check-email").val()
								},
								dataType : "json",
								success : function(res){
									//console.log(userid);
									//$('.sign-btn').after(userid);
									console.log(res);
									//$('.sign-btn').after(res.user_id);
									//$('.sign-btn').after(res.user_pw);
									$(".check_id").text(res.user_id);
									$(".check_pw").text(res.user_pw);
									
								},
								error : function(){
									alert("Ajax 통신 실패!!")
								}
								})
							}
					</script> 
					<div class="user_info_modal">
						<p class="info">
							<span class="check_id">  </span> 님이 가입한
							정보입니다.
						</p>
						<div class="info_res">
							<p class="id">
								아이디 : <span class="check_id">  </span>
							</p>
							<p class="pw">
								Password : <span class="check_pw"> </span>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- 회원 정보 찾기 POPUP -->
	<!-- index 페이지 끝 -->

	<!-- Javascript file -->
	<script src="./js/app.js"></script>
	<script src="./js/jquery-3.6.4.min.js"></script>
</body>
</html>





