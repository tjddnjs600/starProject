<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>


<div class="sub_tit_wrap">
  <div class="sub_tit_bg">
    <div class="sub_tit_inner">
      <h4>
        <span class="sub_vi_title">텀블러 결제</span>
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
          <a href="#">TUMBLR</a>
        </li>
        <li>
          <a>
            <img alt="" src="../../../resources/imgs/icon_arrow_w.png">
          </a>
        </li>
        <li>
          <a href="#">텀블러 결제</a>
        </li>
      </ul>
    </div>
  </div>
</div>

<section class="py-5">
  <div class="tpay_container pt-50">
   <br>
   <br>
  <form id="payForm" method="post">
  <input type="hidden" name="totalPrice" value="">
  <table class="table table-hover">
    <thead>
      <tr id="tpayTop">
        <th class="table-active">상품이름</th>
        <th class="table-active">상품수량</th>
        <th class="table-active">상품가격</th>
      </tr>
    </thead>
    <tbody>
     <c:forEach items="${tlist }" var="tvo">
      <input type="hidden" class="tbagno" name="tbagno" value="${tvo.tbagno }">
      <tr id="tbadyAll">
        <td class="tumName textaline">${tvo.tname }</td>
        <td class="tumAmount textaline">${tvo.tamount }</td>
        <td class="tprice textaline">${tvo.tprice }</td>
      </tr>
     </c:forEach>
    </tbody>
  </table>
  <div class="order-area">
  <div id="pay_title">
    <h5>주문 정보</h5>
  </div>
  <table class="table table-hover">
       <tr>
        <th class="table-active">총 결제금액</th>
        <td>
          <p><span id="totalPrice"></span>원</p>
        </td>
      </tr>
      <tr class="tpay_info">
        <th class="name">주문하시는 분</th>
        <td>
          &nbsp; &nbsp; &nbsp;<input type="checkbox" class="form-check-input" id="adChk">주문자 정보와 동일
          <input type="text" class="form-control adInput" id="name" name="name">
        </td>
      </tr>
      <tr class="tpay_info">
        <th class="tel">연락처</th>
        <td>
          <input type="text" class="form-control adInput" id="tel" name="tel">
        </td>
      <tr class="tpay_info">
        <th class="addr">주소</th>
          <td>
            <input type="text" class="form-control adInput" id="addr" name="addr">
            <input type="hidden" id="email" name="email" value="${mInfo.email }">
          </td>
      </tr>
       <tr id="chPay">
        <th class="method">결제수단</th>
        <td>
          <div class="form-check-inline">
            <label class="form-check-label">
              <input type="radio" class="form-check-input radio" id="cCard" value="신용카드" name="tpay">신용카드
            </label>
          </div>
          <div class="form-check-inline">
            <label class="form-check-label">
              <input type="radio" class="form-check-input radio" id="stCard" value="스타벅스 카드" name="tpay">스타벅스 카드
            </label>
          </div>
          <div class="form-check-inline disabled">
            <label class="form-check-label">
              <input type="radio" class="form-check-input radio" id="bank" value="무통장입금" name="tpay">무통장입금
            </label>
          </div>
        </td>
      </tr>
      <tr>
        <th colspan="2" class="tpayth">
          <a href="#" id="payBt" class="tpayBtn">결제하기</a>
        </th>

      </tr>
  </table>
  </div>
  </form>
</div>

</section>
<script src="/resources/js/tpay.js"></script>
<script>
$(function() {

  console.log($(".tprice").length);
  let totalPrice = 0;
  console.log(totalPrice);
  for (var i = 0; i < $(".tprice").length; i++) {
    console.log($(".tprice").eq(i).text());
    totalPrice += Number($(".tprice").eq(i).text());
  }
  console.log(totalPrice);
  $("#totalPrice").text(totalPrice);
  $("input[name=totalPrice]").val(totalPrice);
  
  let email = '<c:out value="${mInfo.email}"/>';
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
    
    if ($(".adInput").val() == "") {
      alert("주문자 정보를 입력해 주세요");
    } else{
    
      if (radVal == "신용카드") {
        paysubmit()
        winopoen($("#payForm"));
      } else if (radVal == "스타벅스 카드") {
        if (Number($("#gprice").text()) < Number($("#totalPrice").text())) {
          alert("잔액부족");
        } else {
          let gPrice = '<input type="hidden" name="gprice" value="'+$("#payPrice").text()+'">';
          let tbgnoVal ='';
          let tpriceVal ='<input type="hidden" name="tprice" value="';
          let tprice = '';
          let tamountVal ='<input type="hidden" name="tamount" value="';
          let tamount = '';
          let tnameVal ='<input type="hidden" name="tname" value="';
          let tname = '';
          
            for (let i = 0; i < $(".tbagno").length; i++) {
                
                tbgnoVal = $(".tbagno").eq(i).val();
                tprice += tpriceVal+$(".tprice").eq(i).text()+'">';
                tamount += tamountVal+$(".tumAmount").eq(i).text()+'">';
                tname += tnameVal+$(".tumName").eq(i).text()+'">';
                
            }
            
          $("#payForm").append(tbgnoVal);
          $("#payForm").append(tprice);
          $("#payForm").append(tamount);
          $("#payForm").append(tname);
          $("#payForm").append(gPrice);
          $("#payForm").attr("action","/torder/starCard");
          $("#payForm").submit();
        }
      } else if (radVal == "무통장입금") {
          paysubmit()
          if ($("#bnkNum").val()=="") {
             alert("은행을 선택해 주세요");
           } else {
              $("#payForm").submit();
           }
      }
    } 
  });
  
  
});
</script>

<jsp:include page="../common/footer.jsp"></jsp:include>