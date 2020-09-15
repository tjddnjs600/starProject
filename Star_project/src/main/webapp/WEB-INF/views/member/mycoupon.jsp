<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<div class="sub_tit_wrap">
  <div class="sub_tit_bg">
    <div class="sub_tit_inner">
      <h4>
                보유 쿠폰
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
          <a href="/member/mypage?email=${mInfo.email }">My Starbucks</a>
        </li>
        <li>
          <a>
            <img alt="" src="../../../resources/imgs/icon_arrow_w.png">
          </a>
        </li>
        <li>
          <a href="#">보유 쿠폰</a>
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
     <section class="my_card">
       <div class="my_card_inner">
         <header>
           <h5>My 스타벅스 쿠폰</h5>
           <p class="recent_card"></p>
         </header>
         <div class="my_card_cont">
          <figure class="imgbackground">
            <img alt="" src="../../resources/imgs/couponimg.png">
          </figure>
          <div class="my_card_info">
            <p class="my_card_id">
            </p>
            <p class="my_card_price">
              <strong id="gprice">${coup }</strong>장
            </p>
            <div class="my_ms_card_btns">
              <p class="my_card_btn1">
                <a href="/coffee/alllist">커피구매</a>
              </p>
              <p class="my_card_btn2">
                <a href="/tumbler/listTum">텀블러구매</a>
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