<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/profile_modal.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>profile_modal</title>
</head>
<body>
    <section>
        <div class="popup-outer">
            <div class="popup-box">
                <i class="fa-solid fa-x"></i>
                <div class="profile-text">
                    <img src="/profile/img/icon/profile_img.png" alt="">
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
                        <button class="cencel">취소</button>
                        <button class="save">저장</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
    
    <script src ="./js/profile_modal.js"></script>
</body>
</html>