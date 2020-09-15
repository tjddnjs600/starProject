<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<section class="py-5">
 <div class="tumbler_container pt-50">
 <a href="/tumbler/listTum?pageNum=${cri.pageNum }&amount=${cri.amount}" class="btn btn-secondary" style='font-size: 14px; font-weight: bold;'>목록</a>
  <ul class="smap">
  <li><a href="/"><img src="../resources/imgs/icon_home.png"></a></li>
  <li><img src="../resources/imgs/icon_arrow.png"></li>
  <li>MENU</li>
  <li><img src="../resources/imgs/icon_arrow.png"></li>
  <li>상품</li>
  <li><img src="../resources/imgs/icon_arrow.png"></li>
  <li><a href="/tumbler/listTum">텀블러</a></li>
  <li><img src="../resources/imgs/icon_arrow.png"></li>
  <li><a href="/tumbler/detailTum?tname=${tvo.tname }&pageNum=${cri.pageNum}&amount=${cri.amount}">${tvo.tname }</a></li>
  </ul>
  
  <c:if test="${mInfo.grade eq '100' }">
  <div class="float-right">
   <a href="/tumbler/modifyTum?tname=${tvo.tname }&pageNum=${cri.pageNum}&amount=${cri.amount}" class="btn moBtn" style="background-color:#007042; color:#fff;">상품 수정</a>
   </div>
   </c:if>
   <br>
   <br>
   <div class="clearfix">
   <div class="boardQna">
   <div class="float-left">
    <img src="/images/${tvo.timg }" id="imgTum">
   </div>
   <div class="float-right myAssignZone">
    <h4>${tvo.tname }<br></h4>
    <p id="t1">${tvo.tcontent }</p>
    <c:if test="${mInfo.grade eq '100' }">
     <p>입고 총 수량 : <span style="color: #b7312c; font-weight: bold;">${tvo.ttotal }</span>개</p>
    </c:if>
    <p>남은 수량 : <span class="totalNum">${tvo.tcount }</span>개</p>
    <div class="number">
      <a  href="#" id="minus"><i id="amo" class='fas fa-minus' style='font-size:15px'></i></a>
        <span id="numUpDown">1</span>
      <a  href="#" id="plus"><i id="amo" class="fa fa-plus" style='font-size:15px'></i></a>
    </div>
      <p>가격 : <span id="tprice"> ${tvo.tprice }</span><span>원</span></p>
      <button type="button" class="btn" id="cartBt">장바구니</button>
   </div>
   </div>
   </div>
     <form method="post" id="tbagForm">
    <input type="hidden"  id="emailVal" name="email" value="${mInfo.email }">
    <input type="hidden"  name="tname" value="${tvo.tname }">
    <input type="hidden"  id="price" name="tprice" value="">
    <input type="hidden"  id="amount" name="tamount" value="">
    <input type="hidden"  name="pageNum" value="${cri.pageNum}">
    <input type="hidden"  name="amount" value="${cri.amount}">
    <input type="hidden"  name="timg" value="${tvo.timg }">
  </form>
   </div>
</section>
<script>
$(function(){
   
   let stat = $('#numUpDown').text();
   let totalN = $('.totalNum').text();
   let num = Number(stat,totalN);
   let tprice = $("#tprice").text();
  
   
  $('#minus').click(function(e){
    e.preventDefault();
      num--;
      let totalPrice =tprice*num;
      $("#tprice").text(totalPrice);
      if(num<=0){
        alert('입력될 수 없는 수량입니다.');
        num =1;
       }
        $('#numUpDown').text(num);
        $("#tprice").text(tprice);

       });
  
  
  $('#plus').click(function(e){
   e.preventDefault();
   if(totalN == 0){
         alert('남은 수량이 없어 구매하실 수 없습니다.');
       }else{
    num++;
    let totalPrice = tprice*num;
    $("#tprice").text(totalPrice);
    if(num> 'totalN'){
        alert('재고 수량을 초과하였습니다.');
        num=totalN;
      }
    $('#numUpDown').text(num);
       }
    });
  
  
  
  $("#cartBt").on("click",function(e){
     e.preventDefault();
     
     let email = $("#emailVal").val();
     if(email == ''){
       alert('로그인 후 이용 부탁드립니다.');
       location.href="/member/login?page=3";
     }else if(totalN == 0){
        alert('남은 수량이 없어 구매하실 수 없습니다. 다른 상품을 확인해 주세요.');
     }else{
     let isOk = confirm("장바구니로 이동하시겠습니까?");
     isOk == true ? $(document).find("#cart").val("1") : $(document).find("#cart").val("2");
     if(isOk == 1){
         $("#amount").val($("#numUpDown").text());
         $("#price").val($("#tprice").text());
         $("#tbagForm").attr("action","/tbag/addTb");
         $("#tbagForm").submit();
     }else{
       let tname = $("#amount").val($("#numUpDown").text());
       $("#price").val($("#tprice").text());
       $("#tbagForm").attr("action","/tbag/addCart");
       $("#tbagForm").submit();
       
     }   
    }
  });
});
  

</script>
<jsp:include page="../common/footer.jsp"></jsp:include>