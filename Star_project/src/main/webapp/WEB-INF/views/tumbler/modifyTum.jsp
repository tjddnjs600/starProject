<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<section class="py-5">
    <div class="tumbler_container pt-50">
        <h2>텀블러 상품 수정</h2>
      <form action="/tumbler/modifyTum" method="post" enctype="multipart/form-data">
      <input type="hidden" class="form-control" value="${cri.pageNum }" name="pageNum">
      <input type="hidden" class="form-control" value="${cri.amount }" name="amount"> 
       <div class="form-group">
       <label for="tname">상품명:</label>
       <input type="text" class="form-control" name="tname" value="${tvo.tname }" readonly>
       </div>
        <div class="form-group">
       <label for="tprice">가격: </label>
       <input type="number" class="form-control" name="tprice" value="${tvo.tprice }">
       </div>
       <div class="form-group">
       <label for="ttotal">재고 수량: </label>
       <input type="number" class="form-control" name="tcount" value="${tvo.tcount }" readonly>
       </div>
       <div class="form-group">
       <label for="ttotal">수량 추가: </label>
       <input type="number" class="form-control" name="ttotal" value="${tvo.tcount }">
       </div>
       <div class="form-group">
       <label for="timg">기존 이미지: </label>
       <input type="text" class="form-control" value="${tvo.timg }" name="old_bfile">
       </div>
        <div class="form-group">
       <label for="timg">수정 이미지: </label>
       <input type="file" class="form-control" name="timg"> 
       </div>
        <div class="form-group">
       <label for="tcontent">설명: </label>
       <textarea class="form-control" name="tcontent" cols="5">${tvo.tcontent }</textarea>
       </div>
        <input type="hidden" class="form-control" value="" id="file" name="refile">
       <button type="submit" class="btn btn-primary" id="modBtn">수정</button>
      </form>
  </div>
  </section>
        <script>
  $(function(){
    $("#modBtn").on("click",function(e){
      e.preventDefault();
      let b_file = $("input[type=file]").val();
      
      if(b_file == ''){
        let isOk = confirm("기존파일을 삭제 하시겠습니까?");
        isOk == true ? $(document).find("#file").val("1") : $(document).find("#file").val("0");
      }else{
         $("#file").val("2")
      }
      $("form").submit();
    });
  });
  </script>
  <jsp:include page="../common/footer.jsp"></jsp:include>