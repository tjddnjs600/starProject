 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<div class="sub_tit_wrap">
  <div class="sub_tit_bg">
    <div class="sub_tit_inner">
  
   <h4><span class="sub_vi_title">장바구니</span></h4>
  
    <ul class="smaps">
      <li><a href="/"><img src="../resources/imgs/icon_home.png"></a></li>
      <li><img src="../resources/imgs/icon_arrow.png"></li>
      <li><a href="#">ORDER</a></li>
      <li><img src="../resources/imgs/icon_arrow.png"></li>
      <li><a href="#">음료</a></li>
      <li><img src="../resources/imgs/icon_arrow.png"></li>
      <li><a href="/tbag/toList">음료 장바구니</a></li>
    </ul>
   </div>
 </div>
</div>
  <br>
<section class="py-5">
 <div class="tbag_container pt-50">
  <br>
  <br>
    <div id="orderLsit">
     <h5>장바구니에 담긴 주문 내역을 확인 후 결제를 진행해 주세요.</h5>
     <p>체크박스를 선택한 후 주문 버튼을 눌러주세요.</p>
     <p>10,000원 이상 구매시 별포인트가 1개 적립됩니다.</p>
     <p>쿠폰사용시 총 결제 금액에서 4,100원 이 차감됩니다.</p>
  </div>
  <form method="post" id="cofmyform">
   <table class="table">
    <thead>
      <tr id="theadTop">
      <th>
       <div>
        <input type="checkbox" name="egiftCard_shopBag_ck_all" id="ckAll" class="ez-hide">
       </div>
      </th>
      <th>음료이미지</th>
      <th>상품명</th>
      <th>주문금액</th>
      <th>음료옵션</th>
      <th>주문취소</th>
     </tr>
    </thead>
    <tbody>
    <c:forEach items="${cbaglist }" var="cbvo" varStatus="i">
    <input type="hidden" value="${cbvo.cprice }" id="price${i.index }">
     <tr id="tbadyAll">
       <td>
        <input type="checkbox"  id="check1" class="checkbox" name="check" value="${cbvo.cbagno }">
      </td>
      <td onclick="location.href='/cbag/cbdetail?cbagno=${cbvo.cbagno}'"><img src="/images/${cbvo.cimg }" style="width:100px"></td>
      <td style="padding-top: 40px;">${cbvo.cname }</td>
      <td id="tprice" class="tprice" style="padding-top: 40px;">${cbvo.cprice }</td>
      <td id="hc" class="amount" style="padding-top: 40px;">${cbvo.hc }
       <input type="hidden" value="${cbvo.camount }" name="camount">
      </td>
      <td><a href="/cbag/delchk?cbagno=${cbvo.cbagno }&email=${mInfo.email}"><i class='fas fa-times' style='font-size:20px; padding-top: 30px; color: #006633;'></i></a></td>
    </tr>
    <input type="hidden" id="price" class="price" value="${cbvo.cprice }"> 
     </c:forEach>
   </tbody>
     <c:if test="${cbaglist.size() == 0 && mInfo.email ne null}">
     <tr>
      <td colspan="6" style="text-align: center; font-size:15px; font-weight: bold;">주문하신 상품 내역이 없습니다.</td>
     </tr>
    </c:if>
   <c:if test="${mInfo.email eq null}">
     <tr>
      <td colspan="6" style="text-align: center; font-size:15px; font-weight: bold;">
              로그인 후 이용 부탁드립니다.
        <p><a href="/member/login">로그인 바로가기</a></p>
      </td>
     </tr>
    </c:if>
  </table>
 </form>
   <section class="m_myCard_wrap">
   <div class="myCart_total">
    <p>선택된 최종 결제 금액 : 
    <span id="total" class="checkedTotalAmount_MOBILE">0</span>
         원</p>
   </div>
  </section>
  <div class="egiftCard_shopBag_btnZone02">
    <ul>
    <li class="btns_1"><a href="#" class="btn_present_continue" id="cbdelbtn">선택 상품 삭제하기</a></li>
    <li class="btns_2"><a href="#" class="btn_payment" id="cpaybtn">선택 상품 결제하기</a></li>
    </ul>
  </div>
 </div>
</section>
<script>
$(function() {

  let email = '<c:out value="${mInfo.email}"/>';
  
  $("#cbdelbtn").on("click",function(){
     $("#cofmyform").attr("action","/cbag/delchk?email="+email);
      $("#cofmyform").submit();
  });
  let cbagno = '<c:out value="${cbvo.cbagno}"/>';
  
  $.getJSON("/member/chkGrade/"+email+".json", function(result){
    }).fail(function(){
    });
  
  $.getJSON("/member/chkStPoint/"+email+".json", function(result){
    }).fail(function(){
    });
  
  
  
  /* 전체 체크 */
  $("#ckAll").click(function(){ 
    if($("#ckAll").prop("checked")) { 
      $("input[type=checkbox]").prop("checked",true); 
      let tprice = 0;
      for (let i = 0; i < $(".checkbox").length; i++) {
          if($(".checkbox").eq(i).is(":checked")){
            tprice += Number($(".tprice").eq(i).text());
          }
     }
    $("#total").text(tprice);
      } else { 
        $("input[type=checkbox]").prop("checked",false); } 
    let tprice = 0;
    for (let i = 0; i < $(".checkbox").length; i++) {
        if($(".checkbox").eq(i).is(":checked")){
          tprice += Number($(".tprice").eq(i).text());
        }
   }
  $("#total").text(tprice);
      });
 
  
  /* 체크박스 price 합산 */
  $(".checkbox").change(function() {
  let totalprice = $(this).parents('td').nextAll('#tprice').text();
  if ($(this).is(":checked")) {       
    let add = Number($("#total").text())+ Number(totalprice);
    $("#total").text(add);

    }else {
    let minus = Number($("#total").text())- Number(totalprice);
    $("#total").text(minus);
  }
 });

  $("#cbdelbtn").on("click", function(){
      
	  let cbgnoVal = "";
	  let emailVal = '<input type="hidden" name="email" value="'+email+'">';
      for (let i = 0; i < $(".checkbox").length; i++) {
          if($(".checkbox").eq(i).is(":checked")){
                  cbgnoVal += '<input type="hidden" name="cbagnum" value="'+$(".checkbox").eq(i).val()+'">';
          }
        }
            
            $("#cofmyform").append(emailVal);
            $("#cofmyform").append(cbgnoVal);
            $("#cofmyform").attr("action","/cbag/delall");
            $("#cofmyform").submit();
   }); 
  
  $("#cpaybtn").on("click",function(){
      let email = '<c:out value="${mInfo.email}"/>'
      let cbgnoVal = "";

       for (let i = 0; i < $(".checkbox").length; i++) {
           if($(".checkbox").eq(i).is(":checked")){
                   cbgnoVal += '<input type="hidden" name="cbagnum" value="'+$(".checkbox").eq(i).val()+'">';
           }
         }
       
       $("#cofmyform").append(cbgnoVal);
       $("#cofmyform").attr("action","/cbag/cplist");
       $("#cofmyform").submit();
   });
  
}); 
</script>
 
<jsp:include page="../common/footer.jsp"></jsp:include>
 