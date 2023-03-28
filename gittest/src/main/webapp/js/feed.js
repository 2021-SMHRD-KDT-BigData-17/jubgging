//사이드 바 안의 로그아웃 메뉴
function dropdown() {
  var dropdownContent = document.getElementById("dropdown-content");
  dropdownContent.classList.toggle("show");
}

function logout() {
  var dropdownContent = document.getElementById("dropdown-content");
  dropdownContent.classList.remove("show");
  // 로그아웃 란 삭제 수행
}
//태그입력 창 열기
function dropdown_tage() {
  document.getElementById("tage_dropdown-content").classList.toggle("show_tag");
}
// 태그 입력창 기능
const ul = document.querySelector("ul"),
inputTag = ul.querySelector("input");
cntTag = document.querySelector(".tag_details span")

let maxTags =10,
tags =[];

counntTag();

function counntTag(){
  inputTag.focus();
  cntTag.innerText = maxTags - tags.length
}

function createTag() {
  ul.querySelectorAll("li").forEach(li => li.remove());
  tags.slice().reverse().forEach(tag=>{
    let liTag =`<li>${tag} <i class="fa-regular fa-x" onclick="removeTag(this, '${tag}')"></i></li>`;
    ul.insertAdjacentHTML("afterbegin",liTag);
  });
  counntTag();
}

function removeTag(element, tag){
  let indexTag = tags.indexOf(tag);
  tags=[...tags.slice(0,indexTag), ...tags.slice(indexTag +1)];
  element.parentElement.remove();
  counntTag();
}
function addTag(e){
  if(e.key == "Enter"){
    let tag = e.target.value.replace(/\s+/g, ' ');
    if(tag.length>1 && !tags.includes(tag)){
      if(tags.length<10){
        tag.split(',').forEach(tag => {
          tags.push(tag);
          createTag();
        });
      }
    }
    e.target.value ="";
  }
}
inputTag.addEventListener("keyup",addTag);
const TagRemove = document.getElementById('tag_allremove')
TagRemove.addEventListener("click",()=>{
  tags.length=0;
  ul.querySelectorAll("li").forEach(li =>li.remove());
  counntTag();
});

function addTags() {
  const tagContainer = document.querySelector('.tag');
  tagContainer.innerHTML = '';

  tags.forEach(tag => {
    const tagElement = document.createElement('div');
    tagElement.classList.add('tag-item');
    tagElement.textContent = tag;
    tagContainer.appendChild(tagElement);
  });
}
/*// post box 안에  input 기능
const editableInput = document.querySelector(".editable"),
readonlyInput = document.querySelector(".readonly"),
placeholder = document.querySelector(".placeholder"),
counterLimit = document.querySelector(".counter-limit"),
postboxBtn = document.querySelector(".postbox_btn");

editableInput.onkeyup =(e)=>{
  let element = e.target;
  checkInput(element);
  
}
editableInput.onkeypress =(e)=>{
  let element = e.target;
  checkInput(element);
  placeholder.style.display ="none";
  
}
function checkInput(element){
  let maxLength=240;
  let currentLength = element.innerText.length;
  let textTag = element.innerHTML;

  if (currentLength <= 0) {
    // Set placeholder style display to block
    placeholder.style.display ="block";
    counterLimit.style.display="none";
    postboxBtn.classList.remove("active")
  } else {
    // Set placeholder style display to none
    counterLimit.style.display="block";
    placeholder.style.display ="none";
    postboxBtn.classList.add("active")
  }
  counterLimit.innerText=maxLength-currentLength;

  if(currentLength>maxLength){
    let overText = element.innerText.substr(maxLength);
    overText= `<span class="highlight">${overText}</span>`;
    textTag = element.innerText.substr(0,maxLength)+overText;
    readonlyInput.style.zIndex="1";
    counterLimit.style.color = "#e0245e"
    postboxBtn.classList.remove("active")
  }else{
    readonlyInput.style.zIndex="-1";
    counterLimit.style.color = "#333"
  }
  readonlyInput.innerHTML=textTag;
}*/

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
          weatherIcon.src="./img/icons/1530383_moon_weather_clouds_cloudy.png";
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



// 지도 확인 창
// const viewBtn = document.querySelector(".location_info_map"),
//     popup = document.querySelector(".popup"),
//     close = popup.querySelector(".close");
//     viewBtn.onclick = ()=>{
//       popup.classList.toggle("show");
//     }
//     close.onclick = ()=>{
//       viewBtn.click();
//     }



// // post box 안에 이미지 업로드 기능 
// // 최대 업로드 가능한 이미지 수 4장
// const MAX_IMAGES = 4;

// document.querySelector('.add-img').addEventListener('click', function() {
//   const imageContainers = document.querySelectorAll('[id^="postbox_image-container_"]');
//   const imageContainerCount = imageContainers.length;
//   const imageContainer = imageContainers[imageContainerCount - 1];
//   let containerId = 'postbox_image-container_' + imageContainerCount;
//   if (imageContainer.childElementCount >= MAX_IMAGES) {
//     alert('최대 이미지 업로드 수를 초과하였습니다.');
//     return;
//   }

//   const fileInput = document.createElement('input');
//   fileInput.type = 'file';
//   fileInput.accept = 'image/*';
//   fileInput.multiple = true; // 여러 장의 이미지 선택 가능
//   fileInput.addEventListener('change', function() {
//     const files = fileInput.files;
//     const newImageCount = files.length + imageContainer.childElementCount;
//     if (newImageCount > MAX_IMAGES) {
//       alert('최대 이미지 업로드 수를 초과하였습니다.');
//       return;
//     }

//     // 이미지 컨테이너 ID 변경
//     containerId = 'postbox_image-container_' + newImageCount;
//     imageContainer.id = containerId;

//     for (let i = 0; i < files.length; i++) { // 선택한 이미지 수 만큼 반복
//       const file = files[i];
//       const reader = new FileReader();
//       reader.addEventListener('load', function() {
//         const image = new Image();
//         image.src = reader.result;
//         image.onload = function() {
//           const canvas = document.createElement('canvas');
//           const ctx = canvas.getContext('2d');
//           canvas.width = 520;
//           canvas.height = (image.height / image.width) * canvas.width;
//           ctx.drawImage(image, 0, 0, canvas.width, canvas.height);
//           const imgData = canvas.toDataURL('image/jpeg');
//           const imgWrapper = document.createElement('div');
//           imgWrapper.classList.add('img-wrapper');
//           const imgElement = document.createElement('img');
//           imgElement.src = imgData;
//           imgElement.style.maxWidth = '100%';
//           const closeButton = document.createElement('i');
//           closeButton.classList.add('fa-solid', 'fa-xmark');
//           closeButton.id = 'close_up';
//           // 이미지 삭제 이벤트 리스너 등록
//         closeButton.addEventListener('click', function() {
//   imageContainer.removeChild(imgWrapper);
//   if (imageContainer.childElementCount === 0) {
//     containerId = 'postbox_image-container_1';
//     imageContainer.id = containerId;
//   } else {
//     containerId = 'postbox_image-container_' + imageContainer.childElementCount;
//     imageContainer.id = containerId;
//   }
// });

//           imgWrapper.appendChild(imgElement);
//           imgWrapper.appendChild(closeButton);
//           imageContainer.appendChild(imgWrapper);
//         }
//       });
//       reader.readAsDataURL(file);
//     }
//   });
//   fileInput.click();
// });

// // 지도 기능
// function add_map_info() {
// if (navigator.geolocation) {
//     navigator.geolocation.getCurrentPosition(
//     function (pos) {
//         const lat1 = pos.coords.latitude;
//         const lon1 = pos.coords.longitude;

//         const openPopup = document.getElementById("open_popup_map");
//         const modal = document.querySelector(".modal");
//         const closeBtn = modal.querySelector("#close");

//     const openModal = () => {
//     modal.classList.remove("hidden");
//     var mapContainer = document.getElementById("map");
//     var options = {
//         center: new kakao.maps.LatLng(lat1, lon1),
//         level: 3,
//         mapTypeId: kakao.maps.MapTypeId.ROADMAP
// };
//     var map = new kakao.maps.Map(mapContainer, options);
//     var mapTypeControl = new kakao.maps.MapTypeControl();
//     map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
//     var zoomControl = new kakao.maps.ZoomControl();
//     map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
    
//     var marker = new kakao.maps.Marker({
//         position: new kakao.maps.LatLng(lat1, lon1),
//         map: map
//     });
//     function relayout() {
//         map.relayout();
//     }
//         relayout();
// };

//     const closeModal = () => {
//     modal.classList.add("hidden");
// };
//     closeBtn.addEventListener("click", closeModal);
//     openPopup.addEventListener("click", openModal);

//     alert("위치정보를 지도에 표시하였습니다.");
// },
//     function (error) {
//     alert("위치정보를 찾을 수 없습니다. " + error.message);
//     }
//     );
// } else {
//     alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.");
// }
// };
  