<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<section class="py-5">
	<div class="coffee_container pt-50">
		<h2>음료 수정</h2>
		<form action="/coffee/modifyCof" method="post"
			enctype="multipart/form-data">
			<div class="form-group">
				<label for="cname">상품명:</label> <input type="text"
					class="form-control" name="cname" value="${cvo.cname }">
			</div>
			<div class="form-group">
       <label for="category" name="category" value="${cvo.category }">카테고리:</label>
       <select name="category">
          <option value="COFFEE">COFFEE</option>
          <option value="BLENDED">BLENDED</option>
          <option value="TEA">TEA</option>
       </select>
       </div> 
			<div class="form-group">
				<label for="cprice">가격: </label> <input type="number"
					class="form-control" name="cprice" value="${cvo.cprice }">
			</div>
			<div class="form-group">
       <label for="option" name="hc" value="${cvo.hc }">옵션:</label>
       <input type="checkbox" class="form-control" name="hc" value="hc">핫&아이스
       <input type="checkbox" class="form-control" name="hc" value="h">핫
       <input type="checkbox" class="form-control" name="hc" value="c">아이스
       </div>
			<div class="form-group">
				<label for="cimg">기존 이미지: </label> <input type="text"
					class="form-control" value="${cvo.cimg }" name="old_bfile">
			</div>
			<div class="form-group">
				<label for="cimg">수정 이미지: </label> <input type="file"
					class="form-control" name="cimg">
			</div>
			<div class="form-group">
				<label for="ccontent">설명: </label>
				<textarea class="form-control" name="ccontent" cols="5">${cvo.ccontent }</textarea>
			</div>
			<input type="hidden" class="form-control" value="" id="file"
				name="refile">
			<button type="submit" class="btn btn-primary" id="cmodBtn">수정</button>
		</form>
	</div>
</section>

  <script>
  $(function(){
    $("#cmodBtn").on("click",function(e){
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