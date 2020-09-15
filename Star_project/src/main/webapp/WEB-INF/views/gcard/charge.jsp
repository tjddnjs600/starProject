<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<div class="sub_tit_wrap">
  <div class="sub_tit_bg">
    <div class="sub_tit_inner">
      <h4>
              카드 충전
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
          <a href="/gcard/charge?email=${mInfo.email }">카드 충전</a>
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
    <div class="card_charge_wrap">
      <article>
        <form action="/gcard/charge" method="post" id="charging">
        <input type="hidden" name="email" value="${mInfo.email }">
        <table>
            <tr>
              <th>충전 카드 선택</th>
              <td>
                <div class="sel_wrap">
                  <select class="user_sel_wrap" id="sel" name="gname">
                    <c:forEach items="${clist }" var="gvo">
                    <option value="${gvo.gname }" class="gvoVal">${gvo.gname }</option>
                    </c:forEach>
                  </select>
                  <div class="user_card_wrap clearfix">
                    <figure>
                      <img alt="" src="../../resources/imgs/001909.png">
                    </figure>
                    <p>
                      <strong><span id="gnum"></span></strong>
                    </p>
                  </div>
                </div>
              </td>
            </tr>
            <tr>
              <th>충전 금액 선택</th>
              <td>
                <p>충전후 총 잔액 : <span class="cp" id="gprice"></span>원</p>
                 <div class="form-check-inline">
                   <label class="form-check-label" for="radio1">
                     <input type="radio" class="form-check-input radio" id="radio1" name="gprice" value="100000">10만원
                   </label>
                 </div>
                 <div class="form-check-inline">
                   <label class="form-check-label" for="radio2">
                     <input type="radio" class="form-check-input radio" id="radio2" name="gprice" value="50000">5만원
                   </label>
                 </div>
                 <div class="form-check-inline">
                   <label class="form-check-label">
                     <input type="radio" class="form-check-input radio" id="radio3" name="gprice" value="30000">3만원
                   </label>
                 </div>
                 <div class="form-check-inline">
                   <label class="form-check-label">
                     <input type="radio" class="form-check-input radio" id="radio4" name="gprice" value="10000">1만원
                   </label>
                 </div>
                 <div class="form-check-inline">
                   <label class="form-check-label">
                     <input type="radio" class="form-check-input radio" id="radio5" name="gprice" value="">직접입력
                   </label>
                 </div>
                 <div class="form-check-inline">
                   <label class="form-check-label">
                     <input type="text" id="gpriceSel" class="form-control" size="1" maxlength="2">
                   </label>
                 </div>
              </td>
            </tr>
       </table>
       <ul class="charge_tbl_btns">
        <li class="charge_tbl_btn1"><a href="#" id="cahrgeBt">충전하기</a></li>
       </ul>
       </form>
       </article>
    </div>
  </div>
</div>
<script src="/resources/js/tpay.js"></script>
<script>
$(function() {
  let email = '<c:out value="${mInfo.email}"/>';
  let selVal = $("#sel option:selected").val();
  
  $.getJSON("/gcard/getGnum/"+selVal+"/"+email+".json", function(result){
        console.log("result");
        $("#gnum").text(result.gnum);
        $("#gprice").text(result.gprice);
        cPrice(result.gprice);
      }).fail(function(){
      });
  
  $("#sel").on("change",function(){
    let selVal = $("#sel option:selected").val();
    $.getJSON("/gcard/getGnum/"+selVal+"/"+email+".json", function(result){
        console.log("result");
        $("#gnum").text(result.gnum);
        $("#gprice").text(result.gprice);
        cPrice(result.gprice);
      }).fail(function(){
      });
  });
  
  function cPrice(gprice) {
  
    $("#radio5").on("click", function() {
      let price = $("#gprice").text();
      $("#gpriceSel").focus();
      $("#gpriceSel").on("keyup", function() {
         let selectPrice = $("#gpriceSel").val();
         if ($("#gpriceSel").val() == "") {
            $("#radio5").val();
         }else {
            $("#radio5").val(Number(selectPrice)*10000);
         }
         $("#gprice").text(gprice+Number($("#radio5").val()));
      });
    });
    
    $(".radio").on("click", function() {
      let price = $("#gprice").text();
      let pPrice = $(this).val();
      let totalPrice = gprice+Number(pPrice);
      $("#gprice").text(totalPrice);
    });
  }
  
  $("#delBtn").on("click", function(e) {
    e.preventDefault();
    let input = confirm('탈퇴하시겠습니까?'); 
    if (input) {
      location.href = "/member/resign?email="+email;
    }
  });
  
  $("#cahrgeBt").on("click", function(e) {
	  let check = $(".radio").is(":checked"); 
	  if (check) {
		  e.preventDefault();
		    winopoen($("#charging"));
		} else {
			alert("충전금액을 선택해 주세요");
		}
    
  });

});
</script>

<jsp:include page="../common/footer.jsp"></jsp:include>