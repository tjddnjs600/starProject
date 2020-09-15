<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<!-- 로그인 페이지  -->
<div id="contain">
  <div class="login_bg_wrap">
    <div class="member_wrap">
      <div class="member_inner">
        <form action="/member/login" method="post" id="loginForm">
        <input type="hidden" name="page" value="${param.page }">
          <fieldset>
            <strong class="new_login_ttl">로그인</strong>
            <div class="joinform">
              <p class="form_txt">별다방에 오신 것을 환영합니다.</p>
              <div class="renew_input_box">
                <input type="email" class="email_input mb10" placeholder="아이디를 입력해 주세요" name="email">
                <input type="password" class="pwd_input mb10" placeholder="비밀번호를 입력해 주세요" name="pwd">
                <p class="btn_member_login">
                  <a class="btn_login" href="#">로그인</a>
                </p>
                <p class="warn_text">
                  * 타 사이트와 비밀번호를 동일하게 사용할 경우 도용의 위험이 있으므로, 
                                    정기적인 비밀번호 변경을 해주시길 바랍니다.
                </p>
              </div>
              <div class="login_btn_wrap clearfix">
                <ul>
                  <li><a href="/member/join">회원가입</a></li>
                  <li><a href="">아이디 찾기</a></li>
                  <li><a href="">비밀번호 찾기</a></li>
                </ul>
              </div>
            </div>
          </fieldset>
        </form>
      </div>
    </div>
  </div>
</div>
<script>
$(function name() {
  $(".btn_login").on("click", function(e) {
    e.preventDefault();
    $("#loginForm").submit();
  });
});
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>

    