<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<section class="py-5">
   <div class="coffee_container pt-50">
      <h2>음료 주문</h2>
      
      <form action="/coffee/orderCof" method="post"
         enctype="multipart/form-data">
          <div id="coffee_visual">
            <p>${ordcoflist.cname }
              <input type="hidden" class="form-control" name="cname" value="${ordcoflist.cname }">
              <input type="hidden" class="form-control" name="cprice" value="${ordcoflist.cprice }">
              <input type="hidden" name="camount">
            </p>
        <img src="/images/${ordcoflist.cimg }">
      </div>
      
       <p id="coAmount">선택 수량</p>
      <div class="form-group" style="text-align: center">
        <a href="#" id="ppdown"><i id="amo" class='fas fa-minus' style='font-size:13px'></i></a>
          <span id="camount" style="font-size: 20px; text-align: center">0</span>
        <a href="#" id="ppup"><i id="amo" class="fa fa-plus" style='font-size:13px'></i></a>
      </div>
      <div id="amountul">
     
     </div> 
         
   <div id="gift_info_send_btns">
      <ul>
         <li class="gift_info_send_btns1">
          <a href="#" id="payBtn">뒤로</a>
         </li>
         <li class="gift_info_send_btns2">
          <a href="/cbag/cblist?email=${mInfo.email }" id="cbagBtn">장바구니 추가</a>
         </li>
      </ul>
    </div>
  </form>
 </div>
</section>

<script>
   let ppcountVal = 0;

   let cname = '<c:out value="${ordcoflist.cname }"/>'
   let cimg = '<c:out value="${ordcoflist.cimg }"/>'
   let cprice = '<c:out value="${ordcoflist.cprice}"/>'
   let realcprice = Number(cprice);
   console.log(realcprice);
   $("#ppdown").on("click", function() {

      if (ppcountVal == 0) {
         ppcountVal = 0;
      } else {
         ppcountVal--;
         $('.rediv > table:last').remove();
           }
      $("#camount").text(ppcountVal);
      $("input[name=camount]").val(ppcountVal);
   });
   
   
    $("#ppup").on("click",function() {
           ppcountVal++;
           $("#camount").text(ppcountVal);
           $("input[name=camount]").val(ppcountVal);
           let gr = $("input[name=camount]").val();
           console.log(gr);
           let onecof = '<div class="rediv">'; 
           onecof += '<table class="gift_info_tbl"><tbody id="tbody">';
           onecof += '<tr><th>상품명 </th>';
           onecof += '<td>' + cname + '</td></tr>';
           onecof += '<tr><th>상품사이즈</th>';
           onecof += '<td><div class="form-check-inline">'
           +'<input type="radio" class="form-check-input tall" name="csize'+gr+'" value="tall" id="tall'+gr+'"><label class="form-check-label">TALL</label></div>';
           onecof += '<div class="form-check-inline">';
           onecof += '<input type="radio" class="form-check-input grande" name="csize'+gr+'" value="grande" id="grande'+gr+'"><label class="form-check-label">GRANDE</label></div>';
           onecof += '<div class="form-check-inline disabled">';
           onecof += '<input type="radio" class="form-check-input venti" name="csize'+gr+'" value="venti" id="venti'+gr+'"><label class="form-check-label">VENTI</label></div></td></tr>';
           onecof += '<tr><th>상품옵션</th>';
           onecof += '<td><div class="form-check-inline">';
           onecof += '<input type="radio" class="form-check-input" id="h'+gr+'" name="hc'+gr+'" value="h"><label class="form-check-label">핫</label></div>';
           onecof += '<div class="form-check-inline"><input type="radio" class="form-check-input" id="c'+gr+'" name="hc'+gr+'" value="c"><label class="form-check-label">아이스</label></div></td></tr>';
           onecof += '<tr><th>상품가격</th>';
           onecof += '<td class="price"><span id="cpricecount'+gr+'" class="cpricecount" style="font-size: 18px; color:#006633; font-weight: bold; text-align: center;">'
               + cprice + '</span><span>원</span></td></tr>';
           onecof +='</tbody></table></div><br>';
           $("#amountul").append(onecof); 
           cpricecount();
         });

    
   function cpricecount() {
      let realcprice = Number(cprice);
      let totalprice = 0;
      for (var i = 1; i <= $("input[name=camount]").val(); i++) {
         $("#tall" + i).click(
               function() {
                  
                    for (var i = 0; i < $('.tall').length; i++) {
                       if($('.tall').eq(i).is(":checked")){
                          $(".cpricecount").eq(i).text(realcprice);
                        }
                    }
                  realcprice = Number(cprice);
               });
         $("#grande" + i).click(
               function() {
                  realcprice = realcprice + 500;
                  for (var i = 0; i < $('.grande').length; i++) {
                     if($('.grande').eq(i).is(":checked")){
                        $(".cpricecount").eq(i).text(realcprice);
                     }
                  }
                  realcprice = Number(cprice);
                  
               });
         
         $("#venti" + i).click(
               function() {
                  realcprice = realcprice + 1000;
                    for (var i = 0; i < $('.venti').length; i++) {
                       if($('.venti').eq(i).is(":checked")){
                     $(".cpricecount").eq(i).text(realcprice);
                       }
                   }
                  realcprice = Number(cprice);
               });
           }
    };
   

   

   $("#cbagBtn").on("click", function(e) {
      e.preventDefault();
      var email = '<c:out value="${mInfo.email}"/>';
       var cname = $("input[name=cname]").val();
       var cimg = '<c:out value="${ordcoflist.cimg}"/>';
       var camount = '1';
       var opcprice = [];
         var csize = [];
         var hc = [];
         var inputArr = [];
             for(var i = 1; i <= $("input[name=camount]").val(); i++){
                var inputstring = {};
               let priname = "#cpricecount"+i;
                 let sizname = "input[name=csize"+i+"]:radio:checked";
                 let hcname = "input[name=hc"+i+"]:radio:checked";
                 opcprice.push($(priname).text());
                 csize.push($(sizname).val());
                 hc.push($(hcname).val());
                 inputstring.email = email;
                 inputstring.cname = cname;
                 inputstring.cprice = opcprice[i-1];
                 inputstring.camount = camount;
                 inputstring.csize = csize[i-1];
                 inputstring.cimg = cimg;
                 inputstring.hc = hc[i-1];
                 inputArr.push(inputstring);
               }
             var datalist = JSON.stringify(inputArr)
      console.log(datalist);
      $.ajax({
         url : "/cbag/add",
         data : {datalist : datalist},
         type : "post"
      }).done(function(result){
         if(result == 1){
         let email = '<c:out value="${mInfo.email}"/>';
         location.href = '/cbag/cblist?email='+email;
         }else {
            alert("옵션을 선택해 주세요");
         }
      }).fail(function(){
    	   alert("옵션을 선택해 주세요");
        });

   });
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>