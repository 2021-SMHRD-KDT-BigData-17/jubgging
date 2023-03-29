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
  
  
  // 댓글
  function dropdowncoment() {
    var dropdownContent = document.querySelector(".dropdown-comment");
    dropdownContent.classList.toggle("show_comment");
  
  }
  
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
  function like() {
    const heartIcon = document.querySelector('.fas.fa-heart');
    const likeCount = document.querySelector('[name="like_cnt"]');
    const currentColor = heartIcon.style.color;
  
    if (currentColor === 'red') {
      heartIcon.style.color = 'rgb(0,0,0,0.2)';
      likeCount.textContent = Number(likeCount.textContent) - 1;
    } else {
      heartIcon.style.color = 'red';
      likeCount.textContent = Number(likeCount.textContent) + 1;
    }
  }
  
  
  
  
  //태그입력 창 열기
  function dropdown_tage() {
    document.getElementById("tage_dropdown-content").classList.toggle("show_tag");
  }
  

//이미지 업로드 
const icon = document.querySelector('.fa-file-image');
const input = document.querySelector('input[name="c_img"]');

icon.addEventListener('click', () => {
  input.click();
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
            weatherIcon.src="/img/icon/1530392_weather_sun_sunny_temperature.png";
        }
        else if(data.weather[0].icon=="01n"){
            weatherIcon.src="/img/icon/1530382_weather_night_moon_moonlight.png";
        }
        else if(data.weather[0].icon=="04n"){
            weatherIcon.src="/img/icon/1530383_moon_weather_clouds_cloudy.png";
        }
        else if(data.weather[0].main=="Clouds"){
            weatherIcon.src="/img/icon/1530369_cloudy_weather_clouds_cloud.png";
        }
        else if(data.weather[0].icon=="02d"){
            weatherIcon.src="/img/icon/1530391_clouds_sun_sunny_weather.png";
        }
        else if(data.weather[0].id==500){
            weatherIcon.src="/img/icon/1530390_sunny_rain_cloudy_weather_clouds.png";
        }
        else if(data.weather[0].main=="Rain"){
            weatherIcon.src="/img/icon/1530364_rain_storm_shower_weather.png";
        }
        else if(data.weather[0].main=="Drizzle"){
            weatherIcon.src="/img/icon/1530365_rain_cloud_drizzel_weather.png";
        }
        else if(data.weather[0].main=="Mist"){
            weatherIcon.src="/img/icon/1530368_foggy_weather_fog_clouds_cloudy.png";
        }
        else if(data.weather[0].main=="Snow"){
            weatherIcon.src="/img/icon/1530371_winter_snow_clouds_weather.png";
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
  
  
  
  //지도 확인 창
  function open_popup_map(){
    var popup = document.querySelector(".popup");
    popup.classList.toggle("show");
    var close = popup.querySelector(".close");
    close.onclick = function() {
      popup.classList.remove("show");
    };
  }
  