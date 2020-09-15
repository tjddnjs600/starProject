 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<div class="sub_tit_wrap">
  <div class="sub_tit_bg">
    <div class="sub_tit_inner">
      <h4>
        <span class="sub_vi_title">장바구니</span>
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
          <a href="#">텀블러</a>
        </li>
        <li>
          <a>
            <img alt="" src="../../../resources/imgs/icon_arrow_w.png">
          </a>
        </li>
        <li>
          <a href="#">장바구니</a>
        </li>
      </ul>
    </div>
  </div>
</div>


<section class="py-5">
  <div class="tbag_container pt-50">
   <br>
   <br>
    <div id="orderLsit">
      <h5>장바구니에 담긴 주문 내역을 확인 후 결제를 진행해 주세요.</h5>
      <p>체크박스를 선택한 후 주문 버튼을 눌러주세요.</p>
      <p>30,000원 이상 구매시 쿠폰이 1장 지급됩니다.</p>
    </div>
 <form id="myform" method="post">
   <input type="hidden" id="email" class="email" name="email" value="${mInfo.email }">
  <table class="table">
  <thead>
  <tr id="theadTop">
  <th>
  <div>
  <input type="checkbox" name="egiftCard_shopBag_ck_all" id="ckAll" class="ez-hide">
  </div>
  </th>
  <th>상품이미지</th>
  <th>상품명</th>
  <th>주문금액</th>
  <th>주문수량</th>
  <th>주문취소</th>
  </tr>
  </thead>
  <tbody>
   <c:forEach items="${tbagList }" var="tbvo">
    <c:if test="${mInfo.grade eq '100' || mInfo.email eq tbvo.email}">
    <tr id="tbadyAll">
      <td>
        <input type="checkbox"  id="check1" class="checkbox" name="check" value="${tbvo.tbagno }">
      </td>
      <td ><img src="/images/${tbvo.timg }" style="width:100px"></td>
      <td id="tname">${tbvo.tname }
      <input type="hidden" id="tname" name="tname" class="tname" value="${tbvo.tname }">
      </td>
      <td id="tprice" class="tprice">${tbvo.tprice }
      </td>
      <td id="amountAll">
        <a href="#" class="minus"><i id="amo" class='fas fa-minus' style='font-size:13px'></i></a>
        <span class="numUpDown">${tbvo.tamount }</span>
        <input type="hidden" id="totalNum" class="totalNum" value="${tbvo.tto }"> 
        <input type="hidden" id="price" class="price" value="${tbvo.price }">
        <a href="#" class="plus"><i id="amo" class="fa fa-plus" style='font-size:13px'></i></a>
      </td>
     <td><a href="/tbag/removeTb?tbagno=${tbvo.tbagno }&email=${mInfo.email}"><i class='fas fa-times' style='font-size:20px' id="rebox"></i></a></td>
    </tr>
   </c:if>
  </c:forEach>
     <c:if test="${mInfo.email eq ''}">
    <tr>
      <td rowspan="6">로그인 후 이용해 주세요 .</td>
    </tr>
   </c:if>
   <c:if test="${mInfo.email eq '' && tbvo.email eq null}">
    <tr>
      <td rowspan="6">주문하신 상품 내역이 없습니다.</td>
    </tr>
   </c:if>
   </tbody>
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
      <li class="btns_1"><a href="#" class="btn_present_continue" id="selectRe">선택 상품 삭제하기</a></li>
      <li class="btns_2"><a href="#" class="btn_payment" id="orderBt">선택 상품 결제하기</a></li>
    </ul>
  </div>
 </div>
</section>
  <script>
  $(function(){
     
	  $('.minus').click(function(e){
	         e.preventDefault();
	         let stat = $(this).parents("td").find('.numUpDown').text(); 
	         let totalN = $(this).parents("td").find('#totalNum').val();  
	         let num = Number(stat); 
	         let price =  $(this).parents("td").find("#price").val();
	         
	           num--;
	           let totalPrice = price*num;
	           
	           $(this).parents("td").prev("#tprice").text(totalPrice);
	           
	           if(num<=0){
	             alert('입력될 수 없는 수량입니다.');
	             num =1;
	             $(this).parents("td").find('.numUpDown').text(num);
	             $(this).parents("td").prev("#tprice").text(price);
	            }
	           $(this).parents("td").find('.numUpDown').text(num);
	           
	           
	           let tprice = 0;
	           for (let i = 0; i < $(".checkbox").length; i++) {
	                 if($(".checkbox").eq(i).is(":checked")){
	                   tprice += Number($(".tprice").eq(i).text());
	                 }
	            }
	           
	           $("#total").text(tprice);
	         });
       
      $('.plus').click(function(e){
        e.preventDefault();
        let stat = $(this).closest("td").find('.numUpDown').text(); 
        let totalN = $(this).closest("td").find('#totalNum').val();  
        let num = Number(stat); 
        let price = $(this).closest("td").find("#price").val();

         num++;
         let totalPrice = price*num;
         
        $(this).closest("td").prev("#tprice").text(totalPrice);
         
         if(num > totalN){
             alert('재고 수량을 초과하였습니다.');
             num=totalN;
           }
         $(this).parents("td").find('.numUpDown').text(num);
         
         let tprice = 0;
         for (let i = 0; i < $(".checkbox").length; i++) {
               if($(".checkbox").eq(i).is(":checked")){
                 tprice += Number($(".tprice").eq(i).text());
               }
          }
         
         $("#total").text(tprice);
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
          console.log(add);
          $("#total").text(add);

          }else {
          let minus = Number($("#total").text())- Number(totalprice);
          console.log(minus);
          $("#total").text(minus);
        }
      });
    

    
    /*  선택상품 삭제 */
    $("#selectRe").on("click", function(){
       
       let hdVal='';
        for (let i = 0; i < $(".checkbox").length; i++) {
             if($(".checkbox").eq(i).is(":checked")){
               hdVal =$(".checkbox").eq(i).val();
             }
           }
             
             $("#myform").append(hdVal);
             $("#myform").attr("action","/tbag/removeTb");
             $("#myform").submit();
    }); 
    

    /* 선택상품 주문하기_update*/
    $("#orderBt").on("click", function(){
       let email = '<c:out value="${mInfo.email}"/>'
       let tbgnoVal ='';
       let tpriceVal ='<input type="hidden" name="tprice" value="';
       let tprice = '';
       let tamountVal ='<input type="hidden" name="tamount" value="';
       let tamount = '';
       let tnameVal ='<input type="hidden" name="tname" value="';
       let tname = '';
        for (let i = 0; i < $(".checkbox").length; i++) {
            if($(".checkbox").eq(i).is(":checked")){
                    tbgnoVal =$(".checkbox").eq(i).val();
                    tprice+=tpriceVal+$(".tprice").eq(i).text()+'">';
                    tamount+=tamountVal+$(".numUpDown").eq(i).text()+'">';
                    tname+=tnameVal+$(".tname").eq(i).text()+'">';
            }
          }
        
        $("#myform").append(tbgnoVal);
        $("#myform").append(tprice);
        $("#myform").append(tamount);
        $("#myform").append(tname);
        $("#myform").attr("action","/tbag/modifyTb");
        $("#myform").submit();
    });
    
  });
  </script>
<jsp:include page="../common/footer.jsp"></jsp:include>
  