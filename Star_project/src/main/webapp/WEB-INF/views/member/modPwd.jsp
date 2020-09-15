<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<!-- Content section -->

<div id="joinContain">
  <div class="member_join_wrap">
    <div class="member_join_inner">
      <form action="/member/modPwd" id="modPwForm" method="post">
        <fieldset>
          <strong class="member_join_ttl">비밀번호 변경</strong>
          <section class="renew_joinform_v2">
            <div class="find_mem_sally"></div>
            <p class="find_form_txt">새로운 비밀번호로 변경 하실 수 있습니다.</p>
            <div class="renew_input_box">
              <strong>이메일</strong>
              <input type="email" id="email" class="readInput" value="${mInfo.email }" name="email" readonly>
              <p class="input_warn_text" id="chkEmail"></p>
            </div>
            <div class="renew_input_box">
            <strong>현재 비밀번호</strong>
              <input type="password" id="pwd" placeholder="비밀번호를 입력해 주세요" name="pwd">
            </div>
            <div class="renew_input_box">
            <strong>새로운 비밀번호</strong>
              <input type="password" id="npwd" placeholder="새로운 비밀번호를 입력해 주세요" name="nPwd">
            </div>
            <div class="renew_input_box">
              <input type="password" id="pwdChk" placeholder="비밀번호를 확인해 주세요">
              <p class="input_warn_text" id="chkPwd"></p>
            </div>
          </section>
          
          <p class="btn_member_login">
            <a href="#" id="modPwBt">확인</a>
          </p>
        </fieldset>
      </form>
    </div>
  </div>
</div>

<script>
$(function() {
	  $("#pwdChk").on("keyup", function() {
	      let pwd = $("#npwd").val();
	      let pwdChk = $("#pwdChk").val();
	        
	      if (pwd != pwdChk) {
	        $("#chkPwd").text("비밀번호를 확인해 주세요").css("color","red");
	      } else {
	        $("#chkPwd").text("비밀번호가 일치합니다").css("color","#0f0");
	      }
	  });
	  
	$("#modPwBt").on("click", function(e) {
		e.preventDefault();
		if ($("#pwd").val() == "" || $("#npwd").val() == "") {
			alert("비밀번호를 입력해 주세요.");
		} else if($("#chkPwd").text() == "비밀번호를 확인해 주세요"){
			alert("비밀번호를 확인해 주세요");
		} else {
			let email = $("#email").val();
			let pwd = $("#pwd").val();
			$.ajax({
				type : "get",
				url : "/member/chkPwd",
				data : {email:email , pwd:pwd} ,
				success : function(res) {
					if (res == 1) {
						$("#modPwForm").submit();
					} else {
						alert("비밀번호를 확인해 주세요");
						$("#pwd").val("");
					}
				}
			});
		}
	});
});
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>
