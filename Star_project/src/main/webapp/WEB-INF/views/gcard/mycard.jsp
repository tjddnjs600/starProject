<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<div class="sub_tit_wrap">
  <div class="sub_tit_bg">
    <div class="sub_tit_inner">
      <h4>
                 보유 카드
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
          <a href="/gcard/creg">CARD</a>
        </li>
        <li>
          <a>
            <img alt="" src="../../../resources/imgs/icon_arrow_w.png">
          </a>
        </li>
        <li>
          <a href="/gcard/mycard?email=${mInfo.email }">보유 카드</a>
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
    <section class="my_index_slide">
      <header>
        <h5 class="userName">${mInfo.name }님의 별다방카드</h5>
      </header>
      <article class="my_slide_wrap">
        <div class="my_slider">
          <div class="swiper-container">
            <figure class="swiper_img" style="z-index: 10;">
              <img alt="" src="../../resources/imgs/001909.png">
            </figure>
            <div class="card-actions"></div>
            <div class="my_slider_txt">
              <div class="my_slider_txt_l">
                <select class="form-control" id="gnameSel" name="gname">
                <c:forEach items="${clist }" var="gvo">
                  <option value="${gvo.gname }" class="gvoVal">${gvo.gname }</option>
                </c:forEach>
                </select>
                <p id="gnum"></p>
              </div>
              <div class="my_slider_txt_r">
                                잔액 <strong class="en" id="gprice">0</strong>원
                <ul class="my_card_btns">
                  <li class="card_charge_btn"><a href="/gcard/charge?email=${mInfo.email }">카드 충전</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </article>
    </section>
  </div>
</div>

<script>
$(function() {
  let email = '<c:out value="${mInfo.email}"/>';
  let selVal = $("#gnameSel option:selected").val();
  
  $.getJSON("/gcard/getGnum/"+selVal+"/"+email+".json", function(result){
      console.log("result");
      $("#gnum").text(result.gnum);
      $("#gprice").text(numberFormat(result.gprice));
    }).fail(function(){
    });

	$("#gnameSel").on("change",function(){
	  let selVal = $("#gnameSel option:selected").val();
	  $.getJSON("/gcard/getGnum/"+selVal+"/"+email+".json", function(result){
	      console.log("result");
	      $("#gnum").text(result.gnum);
	      $("#gprice").text(numberFormat(result.gprice));
	    }).fail(function(){
	    });
	});
	
	  function numberFormat(inputNum) {
	      return inputNum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	     } 

	  function uncomma(x){
	      return x.replace(/[^\d]+/g, '');
	     }
  
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