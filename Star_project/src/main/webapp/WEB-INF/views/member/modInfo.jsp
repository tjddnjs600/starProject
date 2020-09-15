<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<div id="joinContain">
  <div class="member_join_wrap">
    <div class="member_join_inner">
      <form action="/member/modInfo" id="modForm" method="post">
        <fieldset>
          <strong class="member_join_ttl">개인정보 확인 및 수정</strong>
          <section class="renew_joinform_v2">
            <div class="find_mem_sally"></div>
            <p class="find_form_txt">개인정보를 수정해 주세요.</p>
            <div class="renew_input_box">
              <strong>이메일</strong>
              <input type="email" class="readInput" value="${mInfo.email }" name="email" readonly>
            </div>
            <div class="renew_input_box">
              <strong>주소</strong>
              <input type="text" class="necessary" name="addr" id="addr" value="${mInfo.addr }">
            </div>
            <div class="renew_input_box">
              <strong>이름</strong>
              <input type="text" class="readInput" value="${mInfo.name }" name="name" readonly>
            </div>
            <div class="renew_input_box">
              <strong>생년월일</strong>
              <input type="text" class="necessary" name="birth" id="birth" value="${mInfo.birth }">
            </div>
            <div class="renew_input_box clearfix">
              <strong>휴대폰</strong>
              <input type="text" class="necessary" name="tel" id="tel" value="${mInfo.tel }">
            </div>
            <div class="renew_input_box clearfix">
              <strong>닉네임</strong>
              <input type="text" class="necessary" name="nick" id="nick" value="${mInfo.nick }">
            </div>
          </section>
          <p class="btn_member_login">
            <a href="#" id="modBt">수정하기</a>
          </p>
        </fieldset>
      </form>
    </div>
  </div>
</div>


<script>
$(function() {
  $("#modBt").on("click", function(e) {
    e.preventDefault();
    $("#modForm").submit();
  });
});
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>