<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<section class="py-5">
   <div class="coffee_container pt-50">
      <h2>음료 주문 수정</h2>
      
      <form action="/cbag/cbagmod" method="post"
         enctype="multipart/form-data">
           <div id="coffee_visual">
           <p>${cbdetail.cname }
            <input type="hidden" name="email" value="${cbdetail.email }">
            <input type="hidden" name="cbagno" value="${cbdetail.cbagno }">
            <input type="hidden" name="cname" value="${cbdetail.cname }">
            <input type="hidden" name="cprice">
           </p>
          <img src="/images/${cbdetail.cimg }">
         </div>
         <p id="coAmount"><span>상품 가격 : </span>
         <span id="camount" style="font-size: 20px; text-align: center"> ${cbdetail.cprice }</span>
         <span>원</span>
         <input type="hidden" class="form-control" name="recprice" value="${cbdetail.cprice }">
         </p>
          
      <div id="amountul">
       <div class="rediv">
        <table class="gift_info_tbl">
          <tbody id="tbody">
            <tr>
              <th>상품 사이즈</th>
              <td>
              <div class="form-check-inline">
              <input type="radio" class="form-check-input tall" name="csize" value="tall" id="tall">
              <label class="form-check-label">TALL</label></div>
              <div class="form-check-inline">
              <input type="radio" class="form-check-input tall" name="csize" value="grande" id="grande">
              <label class="form-check-label">GRANDE</label></div>
              <div class="form-check-inline">
              <input type="radio" class="form-check-input tall" name="csize" value="venti" id="venti">
              <label class="form-check-label">VENTI</label></div>
              </td>
            </tr>
             <tr>
              <th>상품 옵션</th>
              <td>
              <div class="form-check-inline">
              <input type="radio" class="form-check-input" id="h" name="hc" value="h">
              <label class="form-check-label">핫</label></div>
              <div class="form-check-inline">
              <input type="radio" class="form-check-input" id="c" name="hc" value="c">
              <label class="form-check-label">아이스</label></div>
              </td>
             </tr>
             <tr>
              <th>상품 가격</th>
              <td class="price">
              <span id="cpricecount" class="cpricecount" style="font-size: 18px; color:#006633; font-weight: bold; text-align: center;">
               ${cbdetail.cprice }</span><span>원</span>
               </td></tr>

          </tbody>
        </table>
       </div>
      </div> 
         
      <div id="gift_info_send_btns">
          <button type="submit" class="btn" id="cbagmodBtn">수정 완료</button>
    </div>
      </form>
   </div>
</section>
<script>

     let cprice = '<c:out value="${cbdetail.cprice}"/>';
    let realcprice = Number(cprice);
    let totalprice = 0;
    let csize = '<c:out value="${cbdetail.csize}"/>';
    let hc = '<c:out value="${cbdetail.hc}"/>';
    
    
    if(csize == 'tall'){
      $("#tall").attr("checked","checked");
      $("input[name=recprice]").val(realcprice);
      $("input[name=cprice]").val(realcprice);
    }else if (csize == 'grande'){
      $("#grande").attr("checked","checked");
      realcprice = realcprice - 500;
      $("input[name=recprice]").val(realcprice);
      $("input[name=cprice]").val(realcprice);
    }else if (csize == 'venti'){
      $("#venti").attr("checked","checked");
      realcprice = realcprice - 1000;
      $("input[name=recprice]").val(realcprice);
      $("input[name=cprice]").val(realcprice);
    }
    
    if(hc == 'h'){
      $("#h").attr("checked","checked");
    }else if(hc == 'c'){
      $("#c").attr("checked","checked");
    }
    
    
      $("#tall").click(
          function() {
            $("#cpricecount").text(realcprice);
            $("input[name=cprice]").val(realcprice);
            realcprice = realcprice;
          });
      $("#grande").click(
          function() {
            realcprice = realcprice + 500;
            $("#cpricecount").text(realcprice);
            $("input[name=cprice]").val(realcprice);
            realcprice = realcprice - 500;
          });
      $("#venti").click(
          function() {
            realcprice = realcprice + 1000;
            $("#cpricecount").text(realcprice);
            $("input[name=cprice]").val(realcprice);
            realcprice = realcprice - 1000;
          });
    

  

  
  /* $("#testBtn").on("click", function() {
      inputdata();
  }); */  
  

  

/*   $("#cbagmodBtn").on("click", function(e) {
    e.preventDefault();
        var csize = $("input[name=csize]:checked").val();
        var cprice = $("#cpricecount").text();
        var hc = $("input[name=hc]:checked").val();
        var cbagno = '<c:out value="${cbdetail.cbagno}"/>';
        var email = '<c:out value="${mInfo.email}"/>';
       
     
    $.ajax({
      url : "/cbag/cbagmod",
      data : {csize:csize,cprice:cprice,hc:hc,cbagno:cbagno,email:email},
      type : "post"
    }).done(function(){
            
          }).fail(function(){
              alert("실패");
            });

  }); */
</script>