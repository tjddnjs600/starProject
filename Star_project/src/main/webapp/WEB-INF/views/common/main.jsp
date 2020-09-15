<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="main_container">
  <div class="topbar">
    <div class="topbar_inner">
      <div class="slogan" style="opacity: 1;">
        <img src="../resources/imgs/main/topbar_emblem.png">
      </div>
      <div class="event_set">
        <div class="event_set1" style="opacity: 1;">
          <img src="../resources/imgs/main/topbar_blonde.png">
        </div>
        <div class="event_set2" style="opacity: 1;">
          <img src="../resources/imgs/main/topbar_lime.png">
        </div>
        <div class="event_set3" style="opacity: 1;">
          <img src="../resources/imgs/main/topbar_melon.png">
        </div>
        <div class="slogan_btn" style="opacity: 1;">
          <a href="#">자세히 보기</a>
        </div>
      </div>
    </div>
  </div>
  <section class="reward">
    <div class="reward_left"></div>
    <div class="reward_right"></div>
    <section class="line_reward">
      <div class="reward_bg">
        <img src="../resources/imgs/main/reward_logo.png">
      </div>
      <div class="reward_texbg">
        <img src="../resources/imgs/main/reward_txt.png">
      </div>
      <div class="reward_btn">
        <ul>
          <li class="reward_join">
            <a href="/member/join">회원가입</a>
          </li>
          <li class="reward_login">
            <a href="/member/login">로그인</a>
          </li>
        </ul>
      </div>
      <div class="reward_card">
        <img src="../resources/imgs/main/egiftCard_txt.png">
      </div>
      <div class="reward_card_btn">
        <ul>
          <c:if test="${mInfo ne null}">
          <li>
            <a href="/gcard/creg">카드 등록하기</a>
          </li>
          </c:if>
          <c:if test="${mInfo eq null}">
          <li>
            <a href="/member/login?page=2">카드 등록하기</a>
          </li>
          </c:if>
        </ul>
      </div>
    </section>
  </section>
  <section class="thumblr">
    <div class="thumblr_inner">
      <div class="thumblr_img_box" style="opacity: 0;"></div>
      <div class="thumblr_txt_box" style="opacity: 0;">
        <div class="thumblr_btn">
          <a href="/tumbler/listTum">자세히 보기</a>
        </div>
      </div>
    </div>
  </section>
  <section class="coffee">
    <div class="coffee_inner">
      <div class="coffee_txt1" style="opacity: 0;">pick your favorite</div>
      <div class="coffee_txt2" style="opacity: 0;">content</div>
      <div class="coffee_img"></div>
      <div class="coffee_btn" style="opacity: 0;">
        <a href="/coffee/alllist">자세히 보기</a>
      </div>
    </div>
  </section>
  <section class="store">
    <div class="store_inner">
      <div class="store_img01"></div>
      <div class="store_img02"></div>
      <div class="store_img03"></div>
      <div class="store_img04"></div>
      <div class="store_txt01" style="opacity: 0;"></div>
      <div class="store_txt02" style="opacity: 0;"></div>
      <div class="store_btn" style="opacity: 0;">
        <a href="loc/location">매장 찾기</a>
      </div>
    </div>
  </section>
</div>

<script>
setTimeout(function () {
   $(".slogan").fadeIn(1000);
},1200);

setTimeout(function () {
     $(".event_set1").fadeIn(1000);
},300);
   
    $(".event_set2").fadeIn(1000);

setTimeout(function () {
    $(".event_set3").fadeIn(1000);
},800);

setTimeout(function () {
    $(".slogan_btn").fadeIn(1000);
},1800);

$(function() {
      $(window).scroll(function(){ 
        
        var scrollPos = $(window).scrollTop();
        $('.status').html(scrollPos);
        
        if(scrollPos >= 300){  //스크롤좌표값이 200이상이면
          let thumblr = $(".thumblr_img_box");
          let thumblr_txt = $(".thumblr_txt_box");
              thumblr.animate({
          'left': '3%',
          'opacity': '1'
          },2000);
          
          thumblr_txt.animate({
            'right': '3%',
            'opacity': '1'
            },2000); 
          
        }
        
        if (scrollPos >= 800) {
          let coffee_txt1 = $(".coffee_txt1");
          let coffee_txt2 = $(".coffee_txt2");
          let coffee_btn = $(".coffee_btn");
          
          coffee_txt1.animate({
              'left': '200px',
              'opacity': '1'
              },2000);
            
            coffee_txt2.animate({
              'left': '92px',
              'opacity': '1'
              },2000);
            
            coffee_btn.animate({
              'top': '570px',
              'opacity': '1'
              },2000);
        }
        
        if (scrollPos >= 1600) {
          let store_txt01 = $(".store_txt01");
          let store_txt02 = $(".store_txt02");
          let store_btn = $(".store_btn");
          
          store_txt01.delay(500).animate({
              'right': '149px',
              'opacity': '1'
            },2000);
            
            store_txt02.delay(500).animate({
              'right': '168px',
              'opacity': '1'
              },2000);
           
            store_btn.delay(500).animate({
              'right': '402px',
              'opacity': '1'
              },2000);
            
            $(".store_img01").fadeIn(1500);
            $(".store_img02").fadeIn(1500);
            
        }
        
        if(scrollPos >= 500){
          $('i.fas').fadeIn(); //서시히 나타내기
        }else{
          $('i.fas').fadeOut(); //서서히 사라지기
        }
      });
   });

</script>