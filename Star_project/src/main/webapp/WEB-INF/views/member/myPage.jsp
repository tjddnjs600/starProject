<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<div class="sub_tit_wrap">
  <div class="sub_tit_bg">
    <div class="sub_tit_inner">
      <h4>
        <img alt="" src="../../../resources/imgs/ms_ttl.png">
      </h4>
      <ul class="smaps">
        <li>
          <a href="/">
            <img alt="" src="../../../resources/imgs/icon_home_w.png">
          </a>
        </li>
        <li>
          <a>
            <img alt="" src="../../../resources/imgs/icon_arrow_w.png">
          </a>
        </li>
        <li>
          <a href="/member/myPage?email=${mInfo.email }">My Starbucks</a>
        </li>
      </ul>
    </div>
  </div>
</div>

<div class="ms_cont_wrap clearfix">
  <nav class="ms_nav">
    <ul>
      <li>
        <a class="sideBar">My 리워드
          <span class="sbox_arrow_down"></span>
        </a>
        <ul>
          <li><a href="/member/history?email=${mInfo.email }">· 히스토리</a></li>
          <li><a href="/member/buyList?email=${mInfo.email }">· 텀블러 구매내역</a></li>
        </ul>
      </li>
      <li>
        <a class="sideBar">My 스타벅스 카드
          <span class="sbox_arrow_down"></span>
        </a>
        <ul>
          <li><a href="/gcard/mycard?email=${mInfo.email }">· 보유 카드</a></li>
          <li><a href="/gcard/creg">· 카드 등록</a></li>
          <li><a href="/gcard/charge?email=${mInfo.email }">· 카드 충전</a></li>
          <li><a href="/gcard/rmcard?email=${mInfo.email }">· 카드삭제</a></li>
        </ul>
      </li>
      <li>
        <a class="sideBar">My 쿠폰
          <span class="sbox_arrow_down"></span>
        </a>
        <ul>
          <li><a href="/member/mycoupon?email=${mInfo.email }">· 보유 쿠폰</a></li>
        </ul>
      </li>
      <li>
        <a class="sideBar">개인정보 관리
          <span class="sbox_arrow_down"></span>
        </a>
        <ul>
          <li><a href="/member/modInfo?email=${mInfo.email }">· 개인정보 확인 및 수정</a></li>
          <li><a id="delBtn" href="#">· 회원 탈퇴</a></li>
          <li><a href="/member/modPwd">· 비밀번호 변경</a></li>
        </ul>
      </li>
    </ul>
  </nav>
  
  
  <div class="ms_conts">
   <div class="user_index">
     <section class="user_info">
       <div class="starCount">
         <h5>My 리워드</h5>
         <figure class="user_starbg">
           <span class="totalStar">0</span>
         </figure>
         <p class="user_stat_notice">
           <strong id="sCount">0</strong>
                     개의 별★이 더 모이면<br>
            <strong id="glev"></strong><span class="gevent"> 어떻게 될까~요?</span>
         </p>
       </div>
       
       <div class="userGrade">
          <P class="user_stat">
           <span>
             <strong class="userNick">${mInfo.nick }</strong>
                         님은
           </span>
           <span>
                       현재 <strong class="grade"></strong> 이십니다.
           </span>
          </P>
          
          <div class="stat_btn">
           <ul>
             <li><a href="">My 리워드</a></li>
             <li><a href="">별 히스토리</a></li>
             <li class="btn_black"><a href="">개인정보 수정</a></li>
             <li class="btn_gray"><a href="">비밀번호 변경</a></li>
           </ul>
          </div>
       </div>
     </section>
     
     <section class="my_card">
       <div class="my_card_inner">
         <header>
           <h5>My 스타벅스 카드</h5>
           <p class="recent_card"></p>
         </header>
         <div class="my_card_cont">
          <figure>
            <img alt="" src="../../resources/imgs/001909.png">

          </figure>
          <div class="my_card_info">
            <p class="my_card_id">
              <select class="form-control" id="gnameSel" name="gname">
				        <c:forEach items="${clist }" var="gvo">
				          <option value="${gvo.gname }" class="gvoVal">${gvo.gname }</option>
				        </c:forEach>
				      </select>
            </p>
            <p class="my_card_price">
              <strong id="gprice">0</strong>원
            </p>
            <div class="my_ms_card_btns">
              <p class="my_card_btn1">
                <a href="#">카드목록</a>
              </p>
              <p class="my_card_btn2">
                <a href="#">충전하기</a>
              </p>
            </div>
          </div>
         </div>
       </div>
     </section>
   </div>
  </div>
</div>

<script>
$(function() {
  let email = '<c:out value="${mInfo.email}"/>';
  let selVal = $("#gnameSel option:selected").val();
  
  function numberFormat(inputNum) {
      return inputNum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
     } 

  function uncomma(x){
      return x.replace(/[^\d]+/g, '');
     }
  
  $.getJSON("/member/getMemInfo/"+email+".json", function(res){
     $(".totalStar").text(res.sratrcount);
      if (res.grade < 50) {
        $(".grade").text("Green Level").css("color","#0d5f34");
      } else if (res.grade < 100) {
        $(".grade").text("Gold Level").css("color","#bb9f65");
      }
      
      if ($(".grade").text() == "Green Level") {
          let upNum = (25-res.sratrcount);
          $("#sCount").text(upNum+"");
          $("#glev").text("Gold Level").css("color","#bb9f65");
          $(".gevent").text("만의 특별한 혜택이!");
      } else if ($(".grade").text() == "Gold Level") {
          let upNum = (12-res.sratrcount);
          $("#sCount").text(upNum+"");
          $("#glev").text("쿠폰");
          $(".gevent").text("이 한장 적립됩니다.");
      }
    }).fail(function(){
    });
  
  $.getJSON("/gcard/getGnum/"+selVal+"/"+email+".json", function(result){
        $("#gprice").text(numberFormat(result.gprice));
      }).fail(function(){
      });
  
  $("#gnameSel").on("change",function(){
	  let email = '<c:out value="${mInfo.email}"/>';
	  let selVal = $("#gnameSel option:selected").val();
    $.getJSON("/gcard/getGnum/"+selVal+"/"+email+".json", function(result){
        $("#gprice").text(numberFormat(result.gprice));
      }).fail(function(){
      });
  });
  
  $("#delBtn").on("click", function(e) {
    e.preventDefault();
    let input = confirm('탈퇴하시겠습니까?'); 
    if (input) {
      location.href = "/member/resign?email="+email;
    }

  });
  
});
</script>

<jsp:include page="../common/footer.jsp"></jsp:include>