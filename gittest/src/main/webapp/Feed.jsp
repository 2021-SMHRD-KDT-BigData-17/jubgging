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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
    
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
    <div class="sidebarOption">
      <i class="fa-solid fa-house-chimney"></i>
      <a href="./Feed.jsp"><h2>홈</h2></a>
    </div>
    <div class="sidebarOption">
      <i class="fa-sharp fa-solid fa-magnifying-glass"></i>
      <a href="./search.jsp"><h2>탐색하기</h2></a>
    </div>
    <div class="sidebarOption">
      <i class="fa-solid fa-envelope"></i>
      <a href="./todayspick.jsp"><h2>Today's Pick!</h2></a>
    </div>
    <div class="sidebarOption">
      <i class="fa-solid fa-user"></i>
      <a href="./profile_post.jsp"><h2>프로필</h2></a>
    </div>
    <div class="profile_btn" onclick="dropdown()">
      <div class="user_info">
        <img src="./img/129.png" class="user_profile_img" style="width: 55px; height: 55px;">
        <div class="name">
          <p class="user_nick"><%=user_id.getUser_nick() %></p>
          <p class="user_id">@<%=user_id.getUser_id() %></p>
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
      <form>
        <div class="input_box">
          <div class="postbox_area">
            <textarea name="" cols="40" rows="5" placeholder="무슨 일이 일어나고 있나요?"></textarea>
            <div class="tag"></div>
          </div> 
        </div>     
        <div class="postbox_image-container"></div>
        <div class="postbox_footer">
          <div class="footer-icon">
            <div class="add-img">
              <i class="far fa-file-image"><input type="file" name="c_img" style="display: none;" accept="image/*"></i>
            </div>
            <div class="add_map">
              <i class="fa-solid fa-location-dot"></i>
            </div>
            <div class="add_tage" onclick="dropdown_tage()">
              <i class="fa-regular fa-hashtag"></i>
            </div>
          </div>
          <div class="post-submit">
            <button class="postbox_btn" type="submit">글쓰기</button>
          </div>
        </div>  
      </form>
      <div class="tag_wrapper" id="tage_dropdown-content">
        <div class="title">
          <i class="fa-solid fa-tags"></i>
          <h2>태그</h2>
        </div>
          <div class="tag_content">
            <div class="tag_box">
              <form action="">
                <ul><input type="text" name="" placeholder="원하는 태그를 입력 해 주세요"></ul>
                <div class="tag_details">
                  <button id="add_postboxTags">태그 추가</button>
                </div>
             </form>
            </div>
          </div> 
      </div>   
    </div>
    <!-- post box end -->
    <!-- post list start-->
    <div class="post_list">
      <div class="post_list_box">
        <div class="content">
          <div class="post_profile" style="float: left;">
            <img src="./img/129.png" alt="">
          </div>
          <div class="user_name_time">
            <h5 name="user_nick">
              <%=user_id.getUser_nick() %>
              <p name="user_id">@<%=user_id.getUser_nick() %></p>
            </h5>
            <h6><i class="far fa-clock" name="c_date"></i>25 mins</h6>
            <i class="fa-solid fa-trash-can"></i>
          </div>
          <div class="content_text" name="post-content">
            <span>a 태그는 링크를 걸어주는 태그로 href, target, rel 속성이 있다. 각 속성에는 다양한 속성값이 있다. id와 class 속성은 body 영역에서 사용할 수 있는데 모든 태그에서 사용할 수 있다. id 속성은 고유한 이름이며, class 속성은 중복해서 이름을 지정할 수 있다.</span>
          </div>
          <div class="img_post_bx">
            <img src="./img/AdobeStock_523835731.png" alt="">
          </div>
          <div class="post_card_social_data">
            <div class="post_social_card">
              <i class="fas fa-comment"></i>
              <span name="comment_cnt">0</span><!-- 댓글 수-->
            </div>
            <div class="post_social_card">
              <i class="fas fa-heart"></i>
              <span name="like_cnt">0</span>
            </div>
            <div class="post_social_card" >
              <i class="fa-solid fa-map-location-dot"></i>
            </div>
          </div>
          <div class="dropdown-comment">
            <form>
              <input type="text" name="commentInput">
              <button class="commentBtn" type="submit" value="댓글입력">댓글입력</button>
            </form>
          </div>
          <div class="comment_list">
            <div class="dropdown-comment_list">
              <div class="post_profile" style="float: left;">
                <img src="./img/129.png" alt="">
              </div>
              <div class="user_name_time_comment">
                <h5 name="user_nick">
                  admin
                  <p name="user_id">@admin</p>
                  <h6><i class="far fa-clock" name="c_date"></i>25 mins</h6>
                  <i class="fa-solid fa-trash-can"></i>
                </h5>
              </div>
              <div class="comment_text">
                <span>테스트입니다.</span>
              </div>
            </div>
            <div class="dropdown-comment_list">
              <div class="post_profile" style="float: left;">
                <img src="./img/129.png" alt="">
              </div>
              <div class="user_name_time_comment">
                <h5 name="user_nick">
                  admin
                  <p name="user_id">@admin</p>
                  <h6><i class="far fa-clock" name="c_date"></i>25 mins</h6>
                  <i class="fa-solid fa-trash-can"></i>
                </h5>
              </div>
              <div class="comment_text">
                <span>테스트입니다.</span>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="post_list_box">
        <div class="content">
          <div class="post_profile" style="float: left;">
            <img src="./img/129.png" alt="">
          </div>
          <div class="user_name_time">
            <h5 name="user_nick">
              admin
              <p name="user_id">@admin</p>
            </h5>
            <h6><i class="far fa-clock" name="c_date"></i>25 mins</h6>
            <i class="fa-solid fa-trash-can"></i>
          </div>
          <div class="content_text" name="post-content">
            <span>a 태그는 링크를 걸어주는 태그로 href, target, rel 속성이 있다. 각 속성에는 다양한 속성값이 있다. id와 class 속성은 body 영역에서 사용할 수 있는데 모든 태그에서 사용할 수 있다. id 속성은 고유한 이름이며, class 속성은 중복해서 이름을 지정할 수 있다.</span>
          </div>
          <div class="img_post_bx">
            <img src="./img/AdobeStock_523835731.png" alt="">
          </div>
          <div class="post_card_social_data">
            <div class="post_social_card">
              <i class="fas fa-comment"></i>
              <span name="comment_cnt">0</span><!-- 댓글 수-->
            </div>
            <div class="post_social_card">
              <i class="fas fa-heart"></i>
              <span name="like_cnt">0</span>
            </div>
            <div class="post_social_card" >
              <i class="fa-solid fa-map-location-dot"></i>
            </div>
          </div>
          <div class="dropdown-comment">
            <form>
              <input type="text" name="commentInput">
              <button class="commentBtn" type="submit" value="댓글입력">댓글입력</button>
            </form>
          </div>
          <div class="comment_list">
            <div class="dropdown-comment_list">
              <div class="post_profile" style="float: left;">
                <img src="./img/129.png" alt="">
              </div>
              <div class="user_name_time_comment">
                <h5 name="user_nick">
                  admin
                  <p name="user_id">@admin</p>
                  <h6><i class="far fa-clock" name="c_date"></i>25 mins</h6>
                  <i class="fa-solid fa-trash-can"></i>
                </h5>
              </div>
              <div class="comment_text">
                <span>테스트입니다.</span>
              </div>
            </div>
            <div class="dropdown-comment_list">
              <div class="post_profile" style="float: left;">
                <img src="./img/129.png" alt="">
              </div>
              <div class="user_name_time_comment">
                <h5 name="user_nick">
                  admin
                  <p name="user_id">@admin</p>
                  <h6><i class="far fa-clock" name="c_date"></i>25 mins</h6>
                  <i class="fa-solid fa-trash-can"></i>
                </h5>
              </div>
              <div class="comment_text">
                <span>테스트입니다.</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- post list end-->
  </div>
  <!-- feed section end -->

  <!-- widget section Start -->
  <div class="widgets">
    <div class="widgets_product_Container">
      <div class="widgets_header">
        <h2>친환경 상품</h2>
      </div>
      <div class="wrapper">
        <div class="item swiper-container">
          <!-- Additional required wrapper -->
          <div class="item_wrapper swiper-wrapper">
            <!-- Slides -->
            <div class="item_slide swiper-slide">Slide 1</div>
            
          </div>
          <!-- If we need pagination -->
          <div class="item_pagination swiper-pagination"></div>
        
          <!-- If we need navigation buttons -->
          <div class="item_prev swiper-button-prev"></div>
          <div class="item_next swiper-button-next"></div>
        
          <!-- If we need scrollbar -->
          <div class="item_scrollbar swiper-scrollbar"></div>
        </div>
      </div>  
    </div>
    
    <div class="widgets_weather_Container">
    <div class="widgets_header">
      <h2>날씨</h2>
    </div>  
    <div class="weather_card">
      <div class="error">
        <p>위치정보를 찾을 수 없습니다.</p>
      </div>
      <div class="weather">
        <img src="./img/icon/1530391_clouds_sun_sunny_weather.png" class="weather-icon">
        <h1 class="temp"></h1>
        <h2 class="city_result"></h2> 
        <div class="details">
          <div class="col">
            <img src="./img/icon/cloud_forecast_rain_humidity_weather_icon_228446.png" alt="">
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
    <div class="close"><i class="fa-solid fa-xmark"></i></div>
  </header>
  <div class="modal_content">
    <div class="map" style="width:380px;height:280px;"></div>
  </div>
</div>

<!-- popup section end -->

  <!-- js file section -->
  <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cc62bb43e9feeb15374bcc3b80292f46"></script>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script src="https://kit.fontawesome.com/369266d994.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>






<script>

  //사이드 바 안의 로그아웃 메뉴
function dropdown() {
    var dropdownContent = document.getElementById("dropdown-content");
    dropdownContent.classList.toggle("show");
  }
  
  
  
  function logout() {
    var dropdownContent = document.getElementById("dropdown-content");
    dropdownContent.classList.remove("show");
    // '로그아웃' 삭제 수행
  }
  
  
  // 댓글창 보이기




  // 사이드바 링크 활성화 부분//
  const links = document.querySelectorAll('.sidebarOption a');

  const currentUrl = window.location.href;
  
  links.forEach(link => {
    if (link.href === currentUrl) {
      link.classList.add('active');
    } else {
      link.classList.add('default');
    }
  }); 
  
  
  // 좋아요 색깔 , 숫자
  const heartIcons = document.querySelectorAll('.fas.fa-heart');
    const likeCounts = document.querySelectorAll('[name="like_cnt"]');
    let isLiked = [];

    for (let i = 0; i < heartIcons.length; i++) {
    isLiked.push(false); // Initialize all isLiked variables to false
    heartIcons[i].addEventListener('click', function() {
    if (!isLiked[i]) {
        heartIcons[i].style.color = 'red';
        likeCounts[i].textContent = Number(likeCounts[i].textContent) + 1;
        isLiked[i] = true;
      } else {
        heartIcons[i].style.color = 'rgb(0,0,0,0.2)';
        likeCounts[i].textContent = Number(likeCounts[i].textContent) - 1;
        isLiked[i] = false;
      }
      });
    }
  
  
  
  //태그입력 창 열기
  function dropdown_tage() {
    document.getElementById("tage_dropdown-content").classList.toggle("show_tag");
  }


// 파일 선택 창 열기 및 이미지 프리뷰, 이미지 삭제
document.querySelector('.add-img').addEventListener('click', function() {
    document.querySelector('input[name="c_img"]').click();
});

document.querySelector('input[name="c_img"]').addEventListener('change', function(event) {
    var file = event.target.files[0];
    var reader = new FileReader();
    reader.onload = function(e) {
        var img = document.createElement('img');
        img.src = e.target.result;
        document.querySelector('.postbox_image-container').innerHTML = '';
        document.querySelector('.postbox_image-container').appendChild(img);
        
        var icon = document.createElement('i');
        icon.classList.add('fa-solid', 'fa-xmark');
        icon.addEventListener('click', function() {
            document.querySelector('.postbox_image-container').removeChild(img);
            document.querySelector('.postbox_image-container').removeChild(icon);
        });
        
        document.querySelector('.postbox_image-container').appendChild(icon);
    };
    reader.readAsDataURL(file);
});

  //날씨 정보 기능 
  // Geolocation API에 액세스할 수 있는지를 확인
  if (navigator.geolocation) {
    //위치 정보를 얻기
    navigator.geolocation.getCurrentPosition (function(pos) {
        const lat = pos.coords.latitude;     // 위도
        const lon = pos.coords.longitude; // 경도
        
        const apikey='e89bb3afd798d5b46c49698f627bf5eb';
        const apiUrl = 'http://api.openweathermap.org/data/2.5/weather?'
        const weatherIcon =document.querySelector(".weather-icon")
       
        async function getWeather(){
        const response = await fetch(apiUrl+`lat=`+lat+`&lon=`+lon+`&lang=kr&APPID=${apikey}`);
        if(response.status==404){
            document.querySelector(".weather").style.display="none";
            document.querySelector(".error").style.display="block";
        }else{
            var data = await response.json();  
            console.log(data);
        // display weather data on webpage
        
        document.querySelector(".humidity").innerHTML = data.main.humidity+"<span>&nbsp;%</span>";        
        document.querySelector(".windy_speed").innerHTML = data.wind.speed+"<span>&nbsp;km/h</span>";        
        document.querySelector(".city_result").innerHTML = data.name;                
        document.querySelector(".temp").innerHTML = Math.round(Number(data.main.temp) - 273.15)+"<span>&nbsp;°C</span>";        
            
        if(data.weather[0].main=="Clear"){
            weatherIcon.src="./img/icon/1530392_weather_sun_sunny_temperature.png";
        }
        else if(data.weather[0].icon=="01n"){
            weatherIcon.src="./img/icon/1530382_weather_night_moon_moonlight.png";
        }
        else if(data.weather[0].icon=="04n"){
            weatherIcon.src="./img/icon/1530383_moon_weather_clouds_cloudy.png";
        }
        else if(data.weather[0].main=="Clouds"){
            weatherIcon.src="./img/icon/1530369_cloudy_weather_clouds_cloud.png";
        }
        else if(data.weather[0].icon=="02d"){
            weatherIcon.src="./img/icon/1530391_clouds_sun_sunny_weather.png";
        }
        else if(data.weather[0].id==500){
            weatherIcon.src="./img/icon/1530390_sunny_rain_cloudy_weather_clouds.png";
        }
        else if(data.weather[0].main=="Rain"){
            weatherIcon.src="./img/icon/1530364_rain_storm_shower_weather.png";
        }
        else if(data.weather[0].main=="Drizzle"){
            weatherIcon.src="./img/icon/1530365_rain_cloud_drizzel_weather.png";
        }
        else if(data.weather[0].main=="Mist"){
            weatherIcon.src="./img/icon/1530368_foggy_weather_fog_clouds_cloudy.png";
        }
        else if(data.weather[0].main=="Snow"){
            weatherIcon.src="./img/icon/1530371_winter_snow_clouds_weather.png";
        } 
        document.querySelector(".weather").style.display="block";
        document.querySelector(".error").style.display="none";
  
        }
  
        
    };
        
        getWeather();
        
    });
        
  
  } else {
    alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
  }
  
  //게시물 및 댓글 삭제


// user_id 가 맞을때만 삭제되도록 조건을 넣어야 한다.




//지도 확인 기능
var popup = document.querySelector(".popup");

// Select all the map location icon elements
var mapLocationIcons = document.querySelectorAll(".fa-map-location-dot");

// Add a click event listener to each map location icon
mapLocationIcons.forEach(function(mapLocationIcon) {
  mapLocationIcon.addEventListener("click", function() {
    // Toggle the visibility of the popup
    popup.classList.toggle("show");

    // Create the map
    var mapContainer = popup.querySelector('.map');
    var mapOption = {
      center: new kakao.maps.LatLng(37.56675, 126.97870), //위도 경도 수정부분
      level: 3,
      mapTypeId : kakao.maps.MapTypeId.ROADMAP
    }; 
    var map = new kakao.maps.Map(mapContainer, mapOption);
    var mapTypeControl = new kakao.maps.MapTypeControl();

    // 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

    // Add a marker to the map
    var marker = new kakao.maps.Marker({
      position: new kakao.maps.LatLng(37.56675, 126.97870), //마커 생성 위도 경도 수정 부분 
      draggable: true,
      map: map
    });

    // Add a click listener to the popup's close button
    var close = popup.querySelector(".close");
    close.onclick = function() {
      // Remove the popup from the page
      popup.classList.remove("show");

      // Remove the map and marker objects
      marker.setMap(null);
      map = null;
    };
  });
});


</script>
</body>
</html>