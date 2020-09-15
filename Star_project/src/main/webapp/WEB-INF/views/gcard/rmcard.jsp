<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<div class="sub_tit_wrap">
  <div class="sub_tit_bg">
    <div class="sub_tit_inner">
      <h4>
                카드삭제/잔액이전
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
          <a href="/gcard/rmcard?email=${mInfo.email }">카드삭제/잔액이전</a>
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
        <form action="/gcard/rmcard" method="post" id="rmCard">
        <input type="hidden" name="email" value="${mInfo.email }">
        <table>
            <tr>
              <th>삭제 카드 선택</th>
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
              <th>카드 잔액</th>
              <td>
                <p>잔액 : <span class="cp" id="gprice"></span>원</p>
              </td>
            </tr>
       </table>
        <ul class="charge_tbl_btns">
        <li class="charge_tbl_btn1"><a href="#" id="rmCardBt">삭제하기</a></li>
        </ul>
       </form>
       </article>
    </div>
  </div>
</div>

<script>
$(function() {
  let email = '<c:out value="${mInfo.email}"/>';
  let seVal = $("#sel option:selected").val();

  $.getJSON("/gcard/getGnum/"+seVal+"/"+email+".json", function(result){
        $("#gnum").text(result.gnum);
        $("#gprice").text(result.gprice);
      }).fail(function(){
      });
  
  $("#sel").on("change",function(){
    let selVal = $("#sel option:selected").val();
    $.getJSON("/gcard/getGnum/"+selVal+"/"+email+".json", function(result){
        $("#gnum").text(result.gnum);
        $("#gprice").text(result.gprice);
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
  
  $("#rmCardBt").on("click", function(e) {
    e.preventDefault();
    let gname = $("#sel").val();
    let removeCard = confirm("카드를 삭제 하시겠습니까?");
    if (removeCard) {
        if (Number($("#gprice").text()) > 0) {
          let transfer = confirm("잔액 이전을 하시겠습니까?");
          if (transfer) {
            location.href = "/gcard/transfer?gprice="+$("#gprice").text()+"&email="+email+"&gname="+gname;
          }else{
            $("#rmCard").submit();
          }
        }else{
          $("#rmCard").submit();
        }
    }
  });

});
</script>

<jsp:include page="../common/footer.jsp"></jsp:include>