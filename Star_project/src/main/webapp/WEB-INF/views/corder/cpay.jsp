<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>


<div class="sub_tit_wrap">
  <div class="sub_tit_bg">
    <div class="sub_tit_inner">
      <h4>
        <span class="sub_vi_title">음료결제</span>
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
          <a href="#">ORDER</a>
        </li>
        <li>
          <a>
            <img alt="" src="../../../resources/imgs/icon_arrow_w.png">
          </a>
        </li>
        <li>
          <a href="#">COFFEE</a>
        </li>
        <li>
          <a>
            <img alt="" src="../../../resources/imgs/icon_arrow_w.png">
          </a>
        </li>
        <li>
          <a href="#">음료 결제</a>
        </li>
      </ul>
    </div>
  </div>
</div>

<section class="py-5">
  <div class="cpay_container pt-50">
   <br>
   <br>
  <form id="payForm" method="post">
  <input type="hidden" name="totalcofprice" value="" id="totalcofprice">
  <input type="hidden" name="couChk" id="chkVal" value="0">
  <table class="table table-hover">
    <thead>
      <tr id="cpayTop">
        <th class="table-active">음료</th>
        <th class="table-active">가격</th>
        <th class="table-active">사이즈</th>
        <th class="table-active">HOT/ICE</th>
      </tr>
    </thead>
    <tbody>
     <c:forEach items="${cplist }" var="cpvo">
      <input type="hidden" class="cbagno" name="cbagno" value="${cpvo.cbagno }">
      <tr>
        <td class="cname textaline">${cpvo.cname }</td>
        <td class="cprice textaline">${cpvo.cprice }</td>
        <td class="csize textaline">${cpvo.csize }</td>
        <td class="hc textaline">${cpvo.hc }</td>
      </tr>
     </c:forEach>
    </tbody>
  </table>
  <div id="pay_title">
    <h5>주문 정보</h5>
  </div>
  <table class="table table-hover">
      <tr>
        <th class="table-active">쿠폰사용</th>
        <td class="coutd">
          <p>보유쿠폰 : <span id="couCount"></span>개</p>
          <input type="checkbox" class="form-check-input" id="chk">
        </td>
      </tr>
      <tr>
        <th class="table-active">총 결제금액</th>
        <td>
          <p><span id="totalCprice"></span>원</p>
        </td>
      </tr>
      <tr>
        <th class="table-active">배송지 정보</th>
        <td>
          <label class="form-check-label">
                &nbsp; &nbsp; &nbsp;<input type="checkbox" class="form-check-input" id="adChk">주문자 정보와 동일
              </label>
          <div class="form-group">
               <label for="name">이름:</label>
               <input type="text" class="form-control adInput" id="name" name="name">
          </div>
          <div class="form-group">
               <label for="tel">연락처:</label>
               <input type="text" class="form-control adInput" id="tel" name="tel">
          </div>
          <div class="form-group">
               <label for="addr">주소:</label>
               <input type="text" class="form-control adInput" id="addr" name="addr">
               <input type="hidden" id="email" name="email" value="${mInfo.email }">
          </div>
        </td>
      </tr>
      <tr id="chPay">
        <th class="table-active">결제수단</th>
        <td>
          <div class="form-check-inline">
                 <label class="form-check-label">
                   <input type="radio" class="form-check-input radio" id="cCard" value="신용카드" name="cpay">신용카드
                 </label>
               </div>
               <div class="form-check-inline">
                 <label class="form-check-label">
                   <input type="radio" class="form-check-input radio" id="stCard" value="스타벅스 카드" name="cpay">스타벅스 카드
                 </label>
               </div>
               <div class="form-check-inline disabled">
                 <label class="form-check-label">
                   <input type="radio" class="form-check-input radio" id="bank" value="무통장입금" name="cpay">무통장입금
                 </label>
               </div>
        </td>
      </tr>
      <tr>
        <th colspan="2">
          <a href="#" id="payBt" class="tpayBtn">주문하기</a>
        </th>
      </tr>
  </table>
  </form>
  </div>
</section>
<script src="/resources/js/cpay.js"></script>
<script>
$(function() {
	 let email = '<c:out value="${mInfo.email}"/>';
	 
	$.getJSON("/member/getCoupon/"+email+".json", function(res) {
		$("#couCount").text(res);
	}).fail(function() {
		
	});
	
   let totalPrice = 0;
   for (var i = 0; i < $(".cprice").length; i++) {
      console.log($(".cprice").eq(i).text());
      totalPrice += Number($(".cprice").eq(i).text());
   }
   
   $(document).on("click", "#chk", function() {
      let check = $("#chk").is(":checked");
      let couCount = Number($("#couCount").text());
      if (couCount > 0) {
         if (check) {
              $("#chkVal").val("1");
               totalPrice = totalPrice - 4100;
             } else {
               $("#chkVal").val("0");
               totalPrice = totalPrice + 4100;
             }
           $("#totalCprice").text(totalPrice);
           $("#totalcofprice").val(totalPrice);
           $("#payPrice").text(Number($("#gprice").text())-Number(totalPrice));
       } else {
          alert("쿠폰이 없습니다");
       }
      
    });
   
   $("#totalCprice").text(totalPrice);
   $("#totalcofprice").val(totalPrice);
   
   
  
  $("#adChk").on("click", function(){
      if($("#adChk").is(":checked")){
         if (email == "") {
            alert("로그인");
          }
         $.getJSON("/member/getAddr/"+email+".json", function(result){
               $("#name").val(result.name);
               $("#tel").val(result.tel);
               $("#addr").val(result.addr);
             }).fail(function(){
                alert("정보가져오기 실패");
             });
      }else{
          $(".adInput").val("");
      }
  });
   
   $(".radio").on("click", function() {
      if ($(this).val() == "신용카드") {
         cCard();
      } else if ($(this).val() == "스타벅스 카드") {
         $.ajax({
               url : "/gcard/getName",
               type : "get",
               data : {
                 email : email
               },
               success : function(res) {
                 starCard(res, email);
               }
             });
      } else if ($(this).val() == "무통장입금") {
         bank();
      }
   });
   
   $(document).on("change","#sel",function() {
      let selVal = $("#sel option:selected").val();
      getCinfo(email, selVal);
   });
   
   $(document).on("change","#sel2",function() {
      let selVal = $("#sel2 option:selected").val();
      ranNum(selVal);
   });
   
   $(document).on("click","#payBt",function() {
      let radVal = $('.radio:checked').val();
      console.log(radVal);
      if (radVal == "신용카드") {
           paysubmit()
          winopoen($("#payForm"));
      } else if (radVal == "스타벅스 카드") {
         if (Number($("#gprice").text()) < Number($("#totalCprice").text())) {
            alert("잔액부족");
         } else {
            let gPrice = '<input type="hidden" name="gprice" value="'+$("#payPrice").text()+'">';
           let cbagnoVal ='';
           let cpriceVal ='<input type="hidden" name="cprice" value="';
           let cprice = '';
           let cnameVal ='<input type="hidden" name="cname" value="';
           let cname = '';
           let csizeVal ='<input type="hidden" name="csize" value="';
           let csize = '';
           let hcVal ='<input type="hidden" name="hc" value="';
           let hc = '';
           let cbagnum = '<c:out value="${cpvo.cbagno}"/>';
           
             for (let i = 0; i < $(".cbagno").length; i++) {
                console.log(cbagnum);       
                cbagnoVal = $(".cbagno").eq(i).val();
                console.log(cbagnoVal);
                cprice += cpriceVal+$(".cprice").eq(i).text()+'">';
                 cname += cnameVal+$(".cname").eq(i).text()+'">';
                 csize += csizeVal+$(".csize").eq(i).text()+'">';
                 hc += hcVal+$(".hc").eq(i).text()+'">';
                 
             }
             
           $("#payForm").append(cbagnoVal);
           $("#payForm").append(cprice);
           $("#payForm").append(cname);
           $("#payForm").append(csize);
           $("#payForm").append(hc);
           $("#payForm").append(gPrice);
           $("#payForm").attr("action","/corder/starCard");
            $("#payForm").submit();
         }
      } else if (radVal == "무통장입금") {
         paysubmit()
          $("#payForm").submit();
      }
         
   });
   
   
});
</script>

<jsp:include page="../common/footer.jsp"></jsp:include>