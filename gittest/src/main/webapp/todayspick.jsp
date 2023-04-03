<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="./css/todayspick.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
      integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
      crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="./css/swiper-bundle.min.css">
    <title>todayspick</title>
</head>
<body>
<section>
  <div class="container">
    <div class="slide-container">
      <div class="card-wrapper swiper-wrapper">
        <div class="card swiper-slide">
          <div class="image-box">
            <a href="./bulletinboard_jeannam.jsp"><img src="./img/dongcheon.jpg" alt=""></a>
          </div>
          <div class="profile_details">
            <img src="./img/badge.png" alt="">
            <div class="name_region">
              <h3 class="name">동천</h3>
              <h4 class="region">전라남도 순천</h4>
            </div>
          </div>
        </div>
        <div class="card swiper-slide">
          <div class="image-box">
            <a href="./bulletinboard_jeannam.jsp"><img src="./img/bonghwa.jpg" alt=""></a>
          </div>
          <div class="profile_details">
            <img src="./img/badge.png" alt="">
            <div class="name_region">
              <h3 class="name">봉화산 둘레길</h3>
              <h4 class="region">전라남도 순천</h4>
            </div>
          </div>
        </div>
        <div class="card swiper-slide">
          <div class="image-box">
            <a href="./bulletinboard_jeannam.jsp"><img src="./img/jogyesan.jpg" alt=""></a>
          </div>
          <div class="profile_details">
            <img src="./img/badge.png" alt="">
            <div class="name_region">
              <h3 class="name">조계산 등산로</h3>
              <h4 class="region">전라남도 순천</h4>
            </div>
          </div>
        </div>
        <div class="card swiper-slide">
          <div class="image-box">
            <a href="./bulletinboard_jeanbuk.jsp"><img src="./img/waterfogload.jpg" alt=""></a>
          </div>
          <div class="profile_details">
            <img src="./img/badge.png" alt="">
            <div class="name_region">
              <h3 class="name">옥정호 물안개길</h3>
              <h4 class="region">전라북도 임실</h4>
            </div>
          </div>
        </div>
        <div class="card swiper-slide">
          <div class="image-box">
            <a href="./bulletinboard_jeanbuk.jsp"><img src="./img/mysan.jpg" alt=""></a>
          </div>
          <div class="profile_details">
            <img src="./img/badge.png" alt="">
            <div class="name_region">
              <h3 class="name">마이산 도립공원</h3>
              <h4 class="region">전라북도 진안</h4>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
    <div class="swiper-pagination"></div>
  </div>
</section>
  <script src="./js/swiper-bundle.min.js"></script>
  <script src="./js/todayspick.js"></script>
  
</body>

</html>

