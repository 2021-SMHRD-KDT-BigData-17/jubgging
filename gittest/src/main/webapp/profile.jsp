<%@page import="com.jubging.domain.join"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% join user_id = (join)session.getAttribute("user_id");%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="./css/profile.css">
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
      <i class="fa-solid fa-house-chimney active"></i>
      <h2>홈</h2>
    </div>
    <div class="sidebarOption">
      <i class="fa-sharp fa-solid fa-magnifying-glass"></i>
      <h2>탐색하기</h2>
    </div>
    <div class="sidebarOption">
      <i class="fa-solid fa-envelope"></i>
      <h2>TODAY'S PICK</h2>
    </div>
    <div class="sidebarOption">
      <i class="fa-solid fa-store"></i>
      <h2>스토어</h2>
    </div>
    <div class="sidebarOption active">
      <i class="fa-solid fa-user"></i>
      <h2>프로필</h2>
    </div>
    <div class="profile_btn" onclick="dropdown()">
      <div class="user_info">
        <img src="./img/129.png" class="user_profile_img" style="width: 55px; height: 55px;">
        <div class="name">
          <p class="user_nick">admin</p>
          <p class="user_id">@admin</p>
        </div>
        <div class="user_profile_op">
          <i class="fa-solid fa-angles-down"></i>
        </div>
      </div>
    </div>
    <div class="sidebar_dropdown-content" id="dropdown-content">
      <p>로그아웃</p>
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
          <h5 name="user_nick"><%= user_id.getUser_id() %></h5>
          <h6 name="usesr_id"><%= user_id.getUser_id() %></h6>
          <address>
            <a href="#">
              <i class="fa-solid fa-location-dot"></i>
              Sun Cheon
            </a>
            <a href="#">
              <i class="fa-solid fa-earth-asia"></i>
            </a>
          </address>
          <p>Nature, ploging, Happy</p>
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
              <li><a href="#">Post</a></li>
              <li><a href="#">Like</a></li>
            </ul>
            <i class="fas fa-ellipsis-h"></i>
          </nav>
          <div class="post_main_bx">
            <div class="post_card_bx">
              <div class="post_profile">
                <img src="./img/icon/profile_img.png" alt="">
              </div>
              <div class="content">
                <div class="user_name_time">
                  <h5 name="user_nick">
                    smhrd
                    <p name="user_id">@smhrd_12345</p>
                  </h5>
                  <h6><i class="far fa-clock" name="c_date"></i>25 mins</h6>
                </div>
                <h3>Very good word...</h3>
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
                <img src="./img/icon/profile_img.png" alt="">
              </div>
              <div class="content">
                <div class="user_name_time">
                  <h5 name="user_nick">
                    smhrd
                    <p name="user_id">@smhrd_12345</p>
                  </h5>
                  <h6><i class="far fa-clock" name="c_date"></i>2 hours</h6>
                </div>
                <h3>Have a nice day!</h3>
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
            <div class="post_card_bx">
              <div class="post_profile">
                <img src="./img/icon/profile_img.png" alt="">
              </div>
              <div class="content">
                <div class="user_name_time">
                  <h5 name="user_nick">
                    smhrd
                    <p name="user_id">@smhrd_12345</p>
                  </h5>
                  <h6><i class="far fa-clock" name="c_date"></i>2 hours</h6>
                </div>
                <h3>전작인 너의 이름은.과 날씨의 아이와는 세계관이 연결되진 않으며, 새로운 세계관을 배경으로 한 새로운 작품이라고 한다. 다만, 앞선 두 작품의 캐릭터들의 등장여부에 대해서는 기자회견에서 명확한 답변을 내놓지 않아 느슨하게나마 연결될 가능성도 있어 보인다.[8]</h3>
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
              <li><a href="#">#ploging <br><p>1.37k posts</p></a><i class="fas fa-chevron-down"></i></li>
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
            <button class="see_more">SEE MORE</button>
          </div>
          
        </div> 
        <div class="you_should_follow trend_for_you"></div> 
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
            <div class="upload">
              <img src="./img/icon/profile_img.png" alt="">
                <div class="round">
                  <input type="file">
                  <i class="fas fa-camera" style="color:#fff"></i>
              </div>
            </div>
            <div class="text">
                <span class="name">Smhrd</span>
                <span class="profile_content">
                    Nature, ploging, Happy
                </span>
            </div>
        </div>
        <form action="#">
            <textarea placeholder="프로필 내용을 입력하세요"></textarea>
            <div class="button">
                <a href="CencelCon"><button class="cencel">취소</button></a>
                <a href="SaveCon"><button class="save">저장</button></a>
            </div>
        </form>
    </div>
  </div>


  <!-- js file section -->
  <script src="./js/profile.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script src="https://kit.fontawesome.com/369266d994.js" crossorigin="anonymous"></script>
</body>

</html>