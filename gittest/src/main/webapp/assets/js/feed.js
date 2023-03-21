
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
            weatherIcon.src="/img/icons/1530392_weather_sun_sunny_temperature.png";
        }
        else if(data.weather[0].icon=="01n"){
            weatherIcon.src="/img/icons/1530382_weather_night_moon_moonlight.png";
        }
        else if(data.weather[0].icon=="04n"){
            weatherIcon.src="/img/icons/1530383_moon_weather_clouds_cloudy.png";
        }
        else if(data.weather[0].main=="Clouds"){
            weatherIcon.src="/img/icons/1530369_cloudy_weather_clouds_cloud.png";
        }
        else if(data.weather[0].icon=="02d"){
            weatherIcon.src="/img/icons/1530391_clouds_sun_sunny_weather.png";
        }
        else if(data.weather[0].main=="Rain"){
            weatherIcon.src="/img/icons/1530364_rain_storm_shower_weather.png";
        }
        else if(data.weather[0].main=="Drizzle"){
            weatherIcon.src="/img/icons/1530365_rain_cloud_drizzel_weather.png";
        }
        else if(data.weather[0].main=="Mist"){
            weatherIcon.src="/img/icons/1530368_foggy_weather_fog_clouds_cloudy.png";
        }
        else if(data.weather[0].main=="Snow"){
            weatherIcon.src="/img/icons/1530371_winter_snow_clouds_weather.png";
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


// post box 안에  글쓰기 기능
const placeHolder = document.querySelector('.placeholder');
const input = document.querySelector('.input-editable');
const counterLimit = document.querySelector('.counter-limit');
const postBtn = document.querySelector('.postbox_btn');

const limit = 240;

input.addEventListener('input', function() {
  const inputLength = input.textContent.length;
  if (inputLength > 0) {
    placeHolder.style.display = 'none';
    const limitNum = limit - inputLength;
    counterLimit.textContent = limitNum;
    counterLimit.style.visibility = 'visible';
    postBtn.classList.toggle('active', limitNum >= 0);
    if (limitNum < 0) {
      input.textContent = input.textContent.slice(0, limit);
      counterLimit.style.color = 'red';
    } else {
      counterLimit.style.color = 'black';
    }
  } else {
    placeHolder.style.display = 'block';
    counterLimit.textContent = limit;
    counterLimit.style.visibility = 'hidden';
    postBtn.classList.remove('active');
  }
});


// 최대 업로드 가능한 이미지 수
const MAX_IMAGES = 4;

document.querySelector('.add-img').addEventListener('click', function() {
  const imageContainers = document.querySelectorAll('[id^="postbox_image-container_"]');
  const imageContainerCount = imageContainers.length;
  const imageContainer = imageContainers[imageContainerCount - 1];
  let containerId = 'postbox_image-container_' + imageContainerCount;
  if (imageContainer.childElementCount >= MAX_IMAGES) {
    alert('최대 이미지 업로드 수를 초과하였습니다.');
    return;
  }

  const fileInput = document.createElement('input');
  fileInput.type = 'file';
  fileInput.accept = 'image/*';
  fileInput.multiple = true; // 여러 장의 이미지 선택 가능
  fileInput.addEventListener('change', function() {
    const files = fileInput.files;
    const newImageCount = files.length + imageContainer.childElementCount;
    if (newImageCount > MAX_IMAGES) {
      alert('최대 이미지 업로드 수를 초과하였습니다.');
      return;
    }

    // 이미지 컨테이너 ID 변경
    containerId = 'postbox_image-container_' + newImageCount;
    imageContainer.id = containerId;

    for (let i = 0; i < files.length; i++) { // 선택한 이미지 수 만큼 반복
      const file = files[i];
      const reader = new FileReader();
      reader.addEventListener('load', function() {
        const image = new Image();
        image.src = reader.result;
        image.onload = function() {
          const canvas = document.createElement('canvas');
          const ctx = canvas.getContext('2d');
          canvas.width = 520;
          canvas.height = (image.height / image.width) * canvas.width;
          ctx.drawImage(image, 0, 0, canvas.width, canvas.height);
          const imgData = canvas.toDataURL('image/jpeg');
          const imgWrapper = document.createElement('div');
          imgWrapper.classList.add('img-wrapper');
          const imgElement = document.createElement('img');
          imgElement.src = imgData;
          imgElement.style.maxWidth = '100%';
          const closeButton = document.createElement('i');
          closeButton.classList.add('fa-solid', 'fa-xmark');
          closeButton.id = 'close_up';
          // 이미지 삭제 이벤트 리스너 등록
        closeButton.addEventListener('click', function() {
  imageContainer.removeChild(imgWrapper);
  if (imageContainer.childElementCount === 0) {
    containerId = 'postbox_image-container_1';
    imageContainer.id = containerId;
  } else {
    containerId = 'postbox_image-container_' + imageContainer.childElementCount;
    imageContainer.id = containerId;
  }
});

          imgWrapper.appendChild(imgElement);
          imgWrapper.appendChild(closeButton);
          imageContainer.appendChild(imgWrapper);
        }
      });
      reader.readAsDataURL(file);
    }
  });
  fileInput.click();
});

// 지도 기능
function add_map_info() {
if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(
    function (pos) {
        const lat1 = pos.coords.latitude;
        const lon1 = pos.coords.longitude;

        const openPopup = document.getElementById("open_popup_map");
        const modal = document.querySelector(".modal");
        const closeBtn = modal.querySelector("#close");

    const openModal = () => {
    modal.classList.remove("hidden");
    var mapContainer = document.getElementById("map");
    var options = {
        center: new kakao.maps.LatLng(lat1, lon1),
        level: 3,
        mapTypeId: kakao.maps.MapTypeId.ROADMAP
};
    var map = new kakao.maps.Map(mapContainer, options);
    var mapTypeControl = new kakao.maps.MapTypeControl();
    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
    var zoomControl = new kakao.maps.ZoomControl();
    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
    
    var marker = new kakao.maps.Marker({
        position: new kakao.maps.LatLng(lat1, lon1),
        map: map
    });
    function relayout() {
        map.relayout();
    }
        relayout();
};

    const closeModal = () => {
    modal.classList.add("hidden");
};
    closeBtn.addEventListener("click", closeModal);
    openPopup.addEventListener("click", openModal);

    alert("위치정보를 지도에 표시하였습니다.");
},
    function (error) {
    alert("위치정보를 찾을 수 없습니다. " + error.message);
    }
    );
} else {
    alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.");
}
};


// 글내용과 이미지 같이 넣는 기능
const form = document.querySelector('form[name="post"]'); // 글쓰기 폼
const inputEditable = form.querySelector('.input-editable'); // 글쓰기 내용 입력란
const postList = document.querySelector('.post_list'); // 글 목록
const placeholder = document.querySelector('span[name="postbox-textarea"]');

function addNewPost() {
  const newPost = document.createElement('div'); // 새로운 글을 생성하여 post_list에 추가
  newPost.classList.add('post_add');
  newPost.innerHTML = `
    <div class="post_body">
      <div class="post_header">
        <div class="post_avatar">
          <img src="/img/129.png" alt="" name>
        </div>
        <div class="post_headerText">
          <h3 id="nickname">admin
            <span id="userID">@admin</span>
          </h3>
        </div>
      </div>
      <div class="post_headerDescription">${inputEditable.innerHTML}</div>
      <div id="postlist_image-container_1"></div>
      <div class="post_footer">
        <i class="fa-regular fa-comment">&nbsp;100</i>
        <i class="fa-regular fa-heart">&nbsp;100</i>
      </div>
    </div>
  `;
  
  const postImageContainer = newPost.querySelector('#postlist_image-container_1');
  const inputImageContainer = document.querySelector('#postbox_image-container_1');
  
  if (inputImageContainer && inputImageContainer.querySelector('img')) {
    const newImage = inputImageContainer.querySelector('img').cloneNode(true);
    postImageContainer.appendChild(newImage);
  }

  postList.insertBefore(newPost, postList.firstChild);
  inputEditable.innerHTML = '';
  placeholder.style.display = 'inline-block'; // placeholder 보이기
}

form.addEventListener('submit', function(event) {
  event.preventDefault(); // 기본 이벤트 동작 방지
  addNewPost();
});

const writeButton = document.querySelector('.write-button');
writeButton.addEventListener('click', function() {
  addNewPost();
  placeholder.style.display = 'inline-block'; // placeholder 보이기
});

inputEditable.addEventListener('input', function() {
  if (inputEditable.textContent.length > 0) {
    placeholder.style.display = 'none'; // placeholder 숨기기
  } else {
    placeholder.style.display = 'inline-block'; // placeholder 보이기
  }
});