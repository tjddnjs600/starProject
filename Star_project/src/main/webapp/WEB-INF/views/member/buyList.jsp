 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<div class="sub_tit_wrap">
  <div class="sub_tit_bg">
    <div class="sub_tit_inner">
      <h4>
        텀블러 구매내역
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
        <li>
          <a>
            <img alt="" src="../../../resources/imgs/icon_arrow_w.png">
          </a>
        </li>
        <li>
          <a href="#">텀블러 구매내역</a>
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
          <li><a href="/gcard/mycard?email=${mInfo.email }">· 보유 쿠폰</a></li>
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
    <div id="orderLsit">
      <h5></h5>
    </div>
  
  <table class="table">
	  <thead>
		  <tr id="theadTop">
			  <th>상품명</th>
			  <th>주문금액</th>
			  <th>주문수량</th>
			  <th>결제수단</th>
			  <th>결제날짜</th>
		  </tr>
	  </thead>
  <tbody>
   <c:choose>
   <c:when test="${tlist ne null && tlist.size() != 0 }">
   <c:forEach items="${tlist }" var="tovo">
    <tr>
      <td class="orList">${tovo.tname }</td>
      <td class="orList">${tovo.tallprice }</td>
      <td class="orList">${tovo.tamount }</td>
      <td class="orList">${tovo.tpay }</td>
      <td class="orList">${tovo.tbuyday }</td>
    </tr>
   </c:forEach>
   </c:when>
   <c:otherwise>
    <tr>
      <td colspan="5" style="text-align: center;">상품 주문내역이 없습니다.</td>
    </tr>
    </c:otherwise>
    </c:choose>
   </tbody>
   </table>
   
   <div style="height: 60px;">
      <div class="page_board">
        <ul class="pagination">
          <c:if test="${pgvo.prev }">
            <li>
            <a class="page-link" href="/member/buyList?pageNum=${pgvo.firstPage - 1 }&amount=${pgvo.cri.amount}&email=${mInfo.email }"><i class='fas fa-angle-left' style='font-size:15px'></i></a>
            </li>
          </c:if>
          <c:forEach begin="${pgvo.firstPage }" end="${pgvo.lastPage }" var="i">
            <li>
            <a class="page-item ${pgvo.cri.pageNum == i ?'active':'' }" href="/member/buyList?pageNum=${i }&amount=${pgvo.cri.amount }&email=${mInfo.email }">${i }</a>
            </li>
          </c:forEach>
          <c:if test="${pgvo.next }">
            <li>
            <a class="page-link" href="/member/buyList?pageNum=${pgvo.lastPage + 1 }&amount=${pgvo.cri.amount}&email=${mInfo.email }"><i class='fas fa-angle-right' style='font-size:15px'></i></a>
            </li>
          </c:if>
        </ul>
      </div>
    </div>
 </div>
 </div>
  
<jsp:include page="../common/footer.jsp"></jsp:include>
  