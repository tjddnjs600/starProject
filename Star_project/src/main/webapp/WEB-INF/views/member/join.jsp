<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<!-- Content section -->

<div id="joinContain">
  <div class="member_join_wrap">
    <div class="member_join_inner">
      <form action="/member/join" id="joinForm" method="post">
        <fieldset>
          <strong class="member_join_ttl">회원가입</strong>
          <section class="renew_joinform_v2">
            <div class="find_mem_sally"></div>
            <p class="find_form_txt">회원정보를 입력해 주세요</p>
            <div class="renew_input_box">
              <input type="email" id="chkemail" placeholder="이메일을 입력해 주세요" name="email">
              <p class="input_warn_text" id="chkEmail"></p>
            </div>
            <div class="renew_input_box">
              <input type="password" id="pwd" placeholder="비밀번호를 입력해 주세요" name="pwd">
            </div>
            <div class="renew_input_box">
              <input type="password" id="pwdChk" placeholder="비밀번호를 확인해 주세요">
              <p class="input_warn_text" id="chkPwd"></p>
            </div>
          </section>
          <section class="renew_joinform_v2">
            <div class="renew_input_box clearfix">
              <strong>이름(필수)</strong>
              <input type="text" name="name" id="name" class="nofix_name necessary" placeholder="이름">
              <div class="form-check-inline radioinner">
                <label class="form-check-label radioBt" for="radio1">
                  <input type="radio" class="form-check-input" id="radio1" name="gender" value="남" checked>
                  <span class="rval">남</span>
                </label>
              </div>
              <div class="form-check-inline radioinner">
                <label class="form-check-label radioBt" for="radio2">
                  <input type="radio" id="radio2" name="gender" value="여">
                  <span class="rval">여</span>
                </label>
              </div>
            </div>
            <div class="renew_input_box clearfix">
              <strong>생년월일(필수)</strong>
              <input type="text" class="necessary" name="birth" id="birth" maxlength="8" placeholder="생년월일8자리">
            </div>
            <div class="renew_input_box clearfix">
              <strong>주소(필수)</strong>
              <button type="button" id="schBtn">주소검색</button>
              <input type="text" class="necessary" name="addr" id="addr" placeholder="주소">
            </div>
            <div class="renew_input_box clearfix">
              <strong>휴대폰(필수)</strong>
              <input type="text" class="necessary" name="tel" id="tel" placeholder="전화번호">
            </div>
          </section>
          <section class="renew_joinform_v2">
            <div class="renew_input_box clearfix">
              <strong>닉네임(선택)</strong>
              <div class="mem_agreement_wrap">
                <h5>선택적 개인정보 수집동의 및 이용약관</h5>
                <input type="checkbox" id="check" value="something">
                <div class="mem_purpose_area">
                 <div class="mCustomScrollBox">
                   <p>
                               본인은 (주)별다방코리아(이하 “회사”라 합니다)가 제공하는 콜 마이 네임 서비스(이하 “서비스”라 합니다)를 
                               이용하기 위해, 다음과 같이 “회사”가 본인의 개인정보를 수집·이용하는 것에 동의합니다.
                   </p>
                   <p class="strongP">
                                 ※ 귀하께서는 개인정보 수집·이용에 대한 동의를 거부하실 수 있으나, 
                                 동의를 거부하실 경우 서비스 이용을 하실 수 없습니다.
                   </p>
                 </div>
                </div>
              </div>
              <input type="text" name="nick" id="nick" placeholder="닉네임">
            </div>
          </section>
          <p class="join_txt2">＊ 선택항목은 입력하지 않거나 동의하지 않아도 회원 가입이 가능합니다.</p>
          <p class="btn_member_login">
            <a href="#" id="submitBt">가입하기</a>
          </p>
        </fieldset>
      </form>
    </div>
  </div>
</div>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

function sample6_execDaumPostcode() {
	let width = 500; //팝업의 너비
	let height = 600; //팝업의 높이
    new daum.Postcode({
    	  width: width, 
        height: height,
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            let addr = ''; // 주소 변수
            let extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("addr").value += extraAddr + " ";
            
            } else {
                document.getElementById("addr").value += '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            //document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("addr").value += addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr").focus();
        }
    }).open({
    	left: (window.screen.width / 2) - (width / 2),
      top: (window.screen.height / 2) - (height / 2)
    });
}


$(function() {
	
	$("#schBtn").on("click", function(){
		sample6_execDaumPostcode()
	});

	
  $("#chkemail").on("blur", function() {
    let emailVal = $("#chkemail").val();
    $.ajax({
      url : "/member/checkEmail",
      type : "get",
      data : {
        email : emailVal
      },
      success : function(result) {
        if (result > 0) {
          $("#chkEmail").text("중복된 이메일 입니다").css(
              "color", "#f00");
        } else {
          $("#chkEmail").text("사용가능한 이메일 입니다").css(
              "color", "#0f0");
        }
      }
    });
  });
  
  
  $("#pwdChk").on("keyup", function() {
      let pwd = $("#pwd").val();
      let pwdChk = $("#pwdChk").val();
        
      if (pwd != pwdChk) {
        $("#chkPwd").text("비밀번호를 확인해 주세요").css("color","red");
      } else {
        $("#chkPwd").text("비밀번호가 일치합니다").css("color","#0f0");
      }
      
  });
  

  $("#submitBt").on("click",function(e){
    e.preventDefault();
    let necessary = $(".necessary");
    let check = $("#check").is(":checked"); 
    
    if ($("#chkPwd").text() == "비밀번호를 확인해 주세요") {
      alert("비밀번호를 확인해 주세요");
      $("#pwd").focus();
    } else if ($("#chkEmail").text() == "중복된 이메일 입니다") {
      alert("이메일을 확인해 주세요");
      $("#chkemail").focus();
    } else if (necessary.val() == "" || necessary.val() == null) {
      alert("회원정보를 입력해 주세요");
      $(this).focus();
    } else if ($("#nick").val() != "") {
      if (check) {
            $("#joinForm").submit();
          } else {
            alert("약관 동의를 해주세요");
          }
    } else {
      $("#joinForm").submit();
    }

  });
});
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>