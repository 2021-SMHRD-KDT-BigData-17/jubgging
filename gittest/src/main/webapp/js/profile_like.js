
function dropdown() {
    document.getElementById("dropdown-content").classList.toggle("show");
}
//   //  날씨

// // Geolocation API에 액세스할 수 있는지를 확인
// if (navigator.geolocation) {
//     //위치 정보를 얻기
//     navigator.geolocation.getCurrentPosition (function(pos) {
//         const lat = pos.coords.latitude;     // 위도
//         const lon = pos.coords.longitude; // 경도
        
        
//         // 날씨
//         const apikey='e89bb3afd798d5b46c49698f627bf5eb';
//         const apiUrl = 'http://api.openweathermap.org/data/2.5/weather?'
//         const weatherIcon =document.querySelector(".weather-icon")
       
//         async function getWeather(){
//         const response = await fetch(apiUrl+`lat=`+lat+`&lon=`+lon+`&lang=kr&APPID=${apikey}`);
//         if(response.status==404){
//             document.querySelector(".weather").style.display="none";
//             document.querySelector(".error").style.display="block";
//         }else{
//             var data = await response.json();  
//             console.log(data);
//         // display weather data on webpage
//         document.querySelector(".humidity").innerHTML = data.main.humidity+"<span>&nbsp;%</span>";        
//         document.querySelector(".windy_speed").innerHTML = data.wind.speed+"<span>&nbsp;km/h</span>";        
//         document.querySelector(".city_result").innerHTML = data.name;                
//         document.querySelector(".temp").innerHTML = Math.round(Number(data.main.temp) - 273.15)+"<span>&nbsp;°C</span>";        
            
//         if(data.weather[0].main=="Clear"){
//             weatherIcon.src="/img/icon/1530392_weather_sun_sunny_temperature.png";
//         }
//         else if(data.weather[0].main=="Clouds"){
//             weatherIcon.src="/img/icon/1530369_cloudy_weather_clouds_cloud.png";
//         }
//         else if(data.weather[0].main=="Rain"){
//             weatherIcon.src="/img/icon/1530364_rain_storm_shower_weather.png";
//         }
//         else if(data.weather[0].main=="Drizzle"){
//             weatherIcon.src="/img/icon/1530365_rain_cloud_drizzel_weather.png";
//         }
//         else if(data.weather[0].main=="Mist"){
//             weatherIcon.src="/img/icon/1530368_foggy_weather_fog_clouds_cloudy.png";
//         }
//         else if(data.weather[0].main=="Snow"){
//             weatherIcon.src="/img/icon/1530371_winter_snow_clouds_weather.png";
//         }
//         document.querySelector(".weather").style.display="block";
//         document.querySelector(".error").style.display="none";

//         }

//     };
        
//         getWeather();
//     });

// } else {
//     alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
// }

// 프로필 세팅 모달창

const viewBtn = document.querySelector("#openmodal"),
    popup = document.querySelector(".popup"),
    close = popup.querySelector(".close");
    viewBtn.onclick = ()=>{
      popup.classList.toggle("show");
    };

    close.onclick = ()=>{
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






