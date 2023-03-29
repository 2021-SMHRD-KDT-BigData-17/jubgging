const inputs = document.querySelectorAll(".input-field");
const toggle_btn = document.querySelectorAll(".toggle");
const main = document.querySelector(".login_main");
const bullets = document.querySelectorAll(".bullets span");
const images = document.querySelectorAll(".image");

inputs.forEach((inp) => {
  inp.addEventListener("focus", () => {
    inp.classList.add("active");
  });
  inp.addEventListener("blur", () => {
    if (inp.value != "") return;
    inp.classList.remove("active");
  });
});

toggle_btn.forEach((btn) => {
  btn.addEventListener("click", () => {
    main.classList.toggle("sign-up-mode");
  });
});


let index = 1; // 시작 인덱스

function moveSlider() {
  let currentImage = document.querySelector(`.img-${index}`);
  images.forEach((img) => img.classList.remove("show"));
  currentImage.classList.add("show");

  const textSlider = document.querySelector(".text-group");
  textSlider.style.transform = `translateY(${-(index - 1) * 2.2}rem)`;

  bullets.forEach((bull) => bull.classList.remove("active"));
  bullets[index - 1].classList.add("active");

  index++; // 다음 인덱스로 변경

  if (index > bullets.length) {
    index = 1; // 인덱스 초기화
  }
}

let intervalId = setInterval(moveSlider, 3000); // 3초마다 moveSlider 함수 호출

bullets.forEach((bullet) => {
  bullet.addEventListener("click", function () {
    clearInterval(intervalId); // 클릭 시 자동 슬라이드 정지
    index = this.dataset.value; // 클릭한 인덱스로 변경
    moveSlider(); // 슬라이드 이동
    intervalId = setInterval(moveSlider, 4000); // 다시 자동 슬라이드 시작
  });
});


const openPopup = document.getElementById('open_popup');
const modal = document.querySelector(".modal");
const closeBtn = modal.querySelector("#close");
const openModal = () =>{
  modal.classList.remove("hidden");
}
const closeModal =() =>{
  modal.classList.add("hidden");
}
closeBtn.addEventListener("click",closeModal);
openPopup.addEventListener("click",openModal);
