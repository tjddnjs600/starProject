<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<section class="py-5">
  <div class="container">
    <div class="card_info_wrap">
      <header>
        <h5>회원 정보</h5>
      </header>
      <section class="card_regi_tbl">
        <dl class="card_regi_dl">
          <dt>
            <label>이메일</label>
          </dt>
          <dd class="info_inner">
            <p class="info_wrap" id="email">${mvo.email }</p>
          </dd>
        </dl>
        <dl class="card_regi_dl">
          <dt>
            <label>이름</label>
          </dt>
          <dd class="info_inner">
            <p class="info_wrap">${mvo.name }</p>
          </dd>
        </dl>
        <dl class="card_regi_dl">
          <dt>
            <label>닉네임</label>
          </dt>
          <dd class="info_inner">
            <p class="info_wrap">${mvo.nick }</p>
          </dd>
        </dl>
        <dl class="card_regi_dl">
          <dt>
            <label>생년월일</label>
          </dt>
          <dd class="info_inner">
            <p class="info_wrap">${mvo.birth }</p>
          </dd>
        </dl>
        <dl class="card_regi_dl">
          <dt>
            <label>성별</label>
          </dt>
          <dd class="info_inner">
            <p class="info_wrap">${mvo.gender }</p>
          </dd>
        </dl>
        <dl class="card_regi_dl">
          <dt>
            <label>주소</label>
          </dt>
          <dd class="info_inner">
            <p class="info_wrap">${mvo.addr }</p>
          </dd>
        </dl>
        <dl class="card_regi_dl">
          <dt>
            <label>휴대폰</label>
          </dt>
          <dd class="info_inner">
            <p class="info_wrap">${mvo.tel }</p>
          </dd>
        </dl>
        <dl class="card_regi_dl">
          <dt>
            <label>가입날짜</label>
          </dt>
          <dd class="info_inner">
            <p class="info_wrap">${mvo.regd8 }</p>
          </dd>
        </dl>
        <dl class="card_regi_dl">
          <dt>
            <label>등급</label>
          </dt>
          <dd class="info_inner">
            <c:if test="${mvo.grade < '50'}">
	          <p class="info_wrap">Green Level</p>
	          </c:if>
	          <c:if test="${mvo.grade < '100' && mvo.grade > '49'}">
	          <p class="info_wrap">Gold Level</p>
	          </c:if>
          </dd>
        </dl>
        <dl class="card_regi_dl">
          <dt>
            <label>별포인트</label>
          </dt>
          <dd class="info_inner">
            <p class="info_wrap">${mvo.sratrcount }</p>
          </dd>
        </dl>
        <dl class="card_regi_dl">
          <dt>
            <label>쿠폰보유갯수</label>
          </dt>
          <dd class="info_inner">
            <p class="info_wrap">${mvo.coupon }</p>
          </dd>
        </dl>
      </section>
      <div class="card_info_inner clearfix">
        <ul id="infoBtn">
          <li class="card_regi_btn1"><a id="listBt" href="/member/admin">목록</a></li>
          <li class="card_regi_btn2" id="rm"><a id="mRmBt" href="#">탈퇴시켜버리기</a></li>
        </ul>
      </div>
    </div>  
  </div>
</section>
<script>
$(function() {
	$("#mRmBt").on("click", function(e) {
		let email = $("#email").text();
		console.log(email);
		e.preventDefault();
		let input = confirm('탈퇴 시켜버리시겠습니까?');
		if (input) {
			location.href="/member/mDelete?email="+email;
		}
	});
});
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>