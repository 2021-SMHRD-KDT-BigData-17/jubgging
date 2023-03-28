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
  <link rel="stylesheet" href="./css/profile_like.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <title>::Jubging:: - Profile</title>

</head>

<body>
  <!-- sidebar section Start -->
  <div class="sidebar">
    <div class="sidebarOption_logo">
      <img src="./img/homelogo.png">
    </div>
    <div class="sidebarOption">
      <i class="fa-solid fa-house-chimney"></i>
      <h2>홈</h2>
    </div>
    <div class="sidebarOption">
      <i class="fa-sharp fa-solid fa-magnifying-glass"></i>
      <a href="./search.jsp"><h2>탐색하기</h2></a>
    </div>
    <div class="sidebarOption">
      <i class="fa-solid fa-envelope"></i>
      <h2>TODAY'S PICK</h2>
    </div>
    <div class="sidebarOption">
      <i class="fa-solid fa-store"></i>
      <h2>스토어</h2>
    </div>
    <div class="sidebarOption">
      <i class="fa-solid fa-user"></i>
      <a class="color" href="./profile_post.jsp"><h2>프로필</h2></a>
    </div>
    <div class="profile_btn" onclick="dropdown()">
      <div class="user_info">
        <img src="./img/129.png" class="user_profile_img" style="width: 55px; height: 55px;">
        <div class="name">
          <p class="user_nick"><%=user_id.getUser_id()%></p>
          <p class="user_id">@<%=user_id.getUser_id()%></p>
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

  <!-- profile box -->

  <section>
    <div class="profile_header"></div>
    <div class="profile_post_follow_bx">
      <div class="profile_bx">
        <div class="profile_card">
          <img src="./img/icon/profile_img.png" alt="" class="profile_img">
          <h5 name="user_nick"><%=user_id.getUser_id()%></h5>
          <h6 name="usesr_id">@<%=user_id.getUser_id()%></h6>
          <address>
            <a href="#">
              <i class="fa-solid fa-location-dot"></i>
              Sun Cheon
            </a>
            <a href="#">
              <i class="fa-solid fa-earth-asia"></i>
            </a>
          </address>
          <p>Nature, plogging, Happy</p>
        </div>
        <div class="activity_bx">
          <div class="activity_card_bx">
            <i class="fas fa-eye"></i>
            <h6>Activity</h6>
          </div>
          <div class="activity_card_bx">
            <i class="fas fa-bolt"></i>
            <h6>Moments</h6>
          </div>
          <div class="activity_card_bx">
            <i class="fas fa-user-friends"></i>
            <h6>Friends</h6>
          </div>
          <div id="openmodal"  class="activity_card_bx">
            <i  class="fas fa-cog"></i>
            <h6>Edit Profile</h6>
          </div>
        </div>
      </div>
      <div class="post_follow_bx">
        <div class="post">
          <nav>
            <ul>
              <li><a class = "postnav" href="./profile_post.jsp">Post</a></li>
              <li><a class = "likenav" href="#">Like</a></li>
            </ul>
            <i class="fas fa-ellipsis-h"></i>
          </nav>
          <div class="post_main_bx">
            <div class="post_card_bx">
              <div class="post_profile">
                <img src="./img/profile_2.png" alt="">
              </div>
              <div class="content">
                <div class="user_name_time">
                  <h5 name="user_nick">
                    plogger
                    <p name="user_id">@plogger_1004</p>
                  </h5>
                  <h6><i class="far fa-clock" name="c_date"></i>25 mins</h6>
                </div>
                <div class = "content_text_bx">
                  <span class = "content_text">조례호수공원에서 4월 7일에 플로깅 하실 분..!</span>
                </div>
                <div class="post_card_social_data">
                  <div class="post_social_card">
                    <i class="fas fa-comment"></i>
                    <span name="comment_cnt">20</span><!-- 댓글 수-->
                  </div>
                  <div class="post_social_card">
                    <i class="fas fa-heart"></i>
                    <span name="like_cnt">1004</span>
                  </div>
                  <div class="post_social_card">
                    <i class="fas fa-share"></i>
                  </div>
                </div>
              </div>
            </div>
            <div class="post_card_bx">
              <div class="post_profile">
                <img src="./img/profile_3.png" alt="">
              </div>
              <div class="content">
                <div class="user_name_time">
                  <h5 name="user_nick">
                    earthlover
                    <p name="user_id">@earthlove_125</p>
                  </h5>
                  <h6><i class="far fa-clock" name="c_date"></i>2 hours</h6>
                </div>
                <div class = "content_text_bx">
                  <span class = "content_text">제주도에 플로깅 하러 왔습니다. 날씨 좋네요</span>
                </div>
                <div class="image_post_bx">
                  <img src="./img/jeju_1.jpg" alt="">
                  <img src="./img/forest.jpg" alt="">
                </div>
                <div class="post_card_social_data">
                  <div class="post_social_card">
                    <i class="fas fa-comment"></i>
                    <span name="comment_cnt">120</span><!-- 댓글 수-->
                  </div>
                  <div class="post_social_card">
                    <i class="fas fa-heart"></i>
                    <span name="like_cnt">10.4k</span>
                  </div>
                  <div class="post_social_card">
                    <i class="fas fa-share"></i>
                  </div>
                </div>
              </div>
            </div>
            <div class="post_card_bx">
              <div class="post_profile">
                <img src="./img/profile_5.png" alt="">
              </div>
              <div class="content">
                <div class="user_name_time">
                  <h5 name="user_nick">
                    nature001
                    <p name="user_id">@nature0001</p>
                  </h5>
                  <h6><i class="far fa-clock" name="c_date"></i>2 hours</h6>
                </div>
                <div class = "content_text_bx">
                <span class = "content_text">오늘 플로깅 하기 좋은 날이구만!</span>
                </div>
                <div class="image_post_bx">
                  <img src="./img/forest.jpg" alt="">
                  <img src="./img/sky.jpg" alt="">
                </div>
                <div class="post_card_social_data">
                  <div class="post_social_card">
                    <i class="fas fa-comment"></i>
                    <span name="comment_cnt">120</span><!-- 댓글 수-->
                  </div>
                  <div class="post_social_card">
                    <i class="fas fa-heart"></i>
                    <span name="like_cnt">10.4k</span>
                  </div>
                  <div class="post_social_card">
                    <i class="fas fa-share"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      <div class="tag_bx">
        <div class="trend_for_you">
          <nav>
            <h6>Trands for you  <i class="fas fa-cog"></i> </h6>  
          </nav>
          <div class="trend_bx">
            <div class="rate">
              <li><a href="#">#today weather <br><p>937k posts</p></a><i class="fas fa-chevron-down"></i></li>
              <div class="interest">
                <button class="smile"><i class="fas fa-smile"></i> Interested</button>
                <button class="frown"><i class="fas fa-frown"></i> Not Interested</button>
              </div>
            </div>
            <div class="rate">
              <li><a href="#">#plogging <br><p>1.37k posts</p></a><i class="fas fa-chevron-down"></i></li>
              <div class="interest">
                <button class="smile"><i class="fas fa-smile"></i> Interested</button>
                <button class="frown"><i class="fas fa-frown"></i> Not Interested</button>
              </div>
            </div>
            <div class="rate">
              <li><a href="#">#dongcheon <br><p>3.2k posts</p></a><i class="fas fa-chevron-down"></i></li>
              <div class="interest">
                <button class="smile"><i class="fas fa-smile"></i> Interested</button>
                <button class="frown"><i class="fas fa-frown"></i> Not Interested</button>
              </div>
            </div>
            <div class="rate">
              <li><a href="#">#분리수거 <br><p>7.1k posts</p></a><i class="fas fa-chevron-down"></i></li>
              <div class="interest">
                <button class="smile"><i class="fas fa-smile"></i> Interested</button>
                <button class="frown"><i class="fas fa-frown"></i> Not Interested</button>
              </div>
            </div>
            <div class="rate">
              <li><a href="#">#떡잎마을 방범대 <br><p>3.1k posts</p></a><i class="fas fa-chevron-down"></i></li>
              <div class="interest">
                <button class="smile"><i class="fas fa-smile"></i> Interested</button>
                <button class="frown"><i class="fas fa-frown"></i> Not Interested</button>
              </div>
            </div>
            <a href="./search.jsp"><button class="see_more">SEE MORE</button></a>
          </div>          
        </div> 
      </div>
    </div>
  </section>

  <!-- Profile setting modal -->
 
  <div class="popup">
    <header>
      <div class="close"><i class="fa-solid fa-xmark"></i></div>
    </header>
    <div class="content">
        <div class="profile-text">
          <div class="imgbox">
            <img src="./img/icon/profile_img.png" alt="">
          </div>
            <div class="upload">
                <div class="round">
                  <input type="file">
                  <i class="fas fa-camera" style="color:#fff"></i>
              </div>
            </div>
            <div class="text">
                <span class="name">Smhrd</span>
                <span class="profile_content">
                    Nature, plogging, Happy
                </span>
            </div>
        </div>
        <form action="saveCon">
            <textarea class ="nickarea" placeholder ="닉네임을 입력하세요"></textarea>
            <textarea class ="profilearea" name ="user_situation" placeholder ="프로필 내용을 입력하세요"></textarea>
            <div class="button">
                <button class="save" type="sumbit">저장</button>
            </div>
          </form>
    </div>
  </div>

  <!-- js file section -->
  <script src="./js/profile_like.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script src="https://kit.fontawesome.com/369266d994.js" crossorigin="anonymous"></script>
</body>

</html>