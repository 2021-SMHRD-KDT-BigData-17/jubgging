<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/css/Feed.css">
    
  <title>::Jubging:: - Feed</title>
</head>

<body>
  <!-- sidebar section Start -->
  <div class="sidebar">
    <div class="sidebarOption_logo">
      <img src="../img/homelogo.png">
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
    <div class="sidebarOption">
      <i class="fa-solid fa-user"></i>
      <h2>프로필</h2>
    </div>
    <button class="sidebar_post_btn" id="sidebar_post_btn">글쓰기</button>
  </div>
    <!-- sidebar section end -->

  <!-- feed section start -->
  <!-- post box -->
  <div class="feed">
    <div class="feed_header">
      <h2>홈</h2>
    </div>
    <div class="postbox">
      <form action="" name="post">
        <div class="postbox_area">
          <span class="placeholder" name="postbox-textarea">오늘은 어떤일이 있으셨나요?</span>
          <div class="input-editable" contenteditable="true"></div> 
        </div>
        <div id="postbox_image-container_1"></div>
        <div class="location_info_map" id="open_popup_map" >
          <i class="fa-solid fa-map-location-dot"></i>
          <span>지도</span>
        </div>
        <div class="postbox_footer">
          <div class="footer-icon">
              <div class="add-img">
                <i class="far fa-file-image"></i>
              </div>
              <div class="add_map" id="add_map" onclick="add_map_info()">
                <i class="fa-solid fa-location-dot"></i>
              </div>
          </div>
        </div>
        <div class="post-limits">
          <span class="counter-limit">240</span>
          <button class="postbox_btn" type="submit">글쓰기</button>
        </div>
      </form>
    </div>
    <div class="post_list">
    </div>
  </div>
    <!-- post box end -->
    <!-- post list start-->

    <!-- post list end-->
  <!-- feed section end -->

  <!-- widget section Start -->
  <div class="widgets">
    <div class="widgets_input">
      <input type="text" placeholder="Search.." onfocus="this.placeholder=''" onblur="this.placeholder='Search..'" name="search">
      <button type="submit"><i class="fa-sharp fa-solid fa-magnifying-glass"></i></button>
    </div>
    <div class="widgets_treand_Container">
      <h2>트렌드</h2>
      <span><iframe width="385" height="240" src="https://www.youtube.com/embed/P4MunVGijbo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe></span>
    </div>
    <div class="widgets_weather_Container">
      <h2>날씨</h2>
      <div class="weather_card">
        <div class="error">
          <p>위치정보를 찾을 수 없습니다.</p>
        </div>
        <div class="weather">
          <img src="/img/icons/1530391_clouds_sun_sunny_weather.png" class="weather-icon">
          <h1 class="temp"></h1>
          <h2 class="city_result"></h2>
          <div class="details">
            <div class="col">
              <img src="/img/icons/cloud_forecast_rain_humidity_weather_icon_228446.png" alt="">
                <div class="col_text">
                <p class="humidity"></p>
                <p>습도</p>
            </div>
            <div class="col">
              <img src="/img/icons/wind_icon-icons.com_64274.png" alt="">
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
  </div>
  <!-- widget section end -->
  
  <!-- map modal popup section Start -->
<div class="modal hidden">
  <div class="modal_body">
    <i id="close" class="fa-solid fa-xmark"></i>
    <div id="map" style="width:100%;height:343px;"></div>
  </div>
</div>
<!-- modal popup section end -->
<div class="modal_sidebar hidden_sidebar_modal">
  <div class="modal_sidebar_body">
    <i id="close_modal_sidebar" class="fa-solid fa-xmark"></i>
    <div class="postbox">
      <form action="" name="post">
        <div class="postbox_area">
          <span class="placeholder" name="postbox-textarea">오늘은 어떤일이 있으셨나요?</span>
          <div class="input-editable" contenteditable="true"></div> 
        </div>
        <div id="postbox_image-container"></div>
        <div class="location_info_map" id="open_popup_map" >
          <i class="fa-solid fa-map-location-dot"></i>
          <span>지도</span>
        </div>
        <div class="postbox_footer">
          <div class="footer-icon">
              <div class="add-img">
                <i class="far fa-file-image"></i>
              </div>
              <div class="add_map" id="add_map" onclick="add_map_info()">
                <i class="fa-solid fa-location-dot"></i>
              </div>
          </div>
        </div>
        <div class="post-limits">
          <span class="counter-limit">240</span>
          <button class="postbox_btn" type="submit">글쓰기</button>
        </div>
      </form>
    </div>
  </div>
</div>





  <!-- js file section -->
  <script src="./assets/js/feed.js"></script>
  <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cc62bb43e9feeb15374bcc3b80292f46"></script>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script src="https://kit.fontawesome.com/369266d994.js" crossorigin="anonymous"></script>
</body>
</html>