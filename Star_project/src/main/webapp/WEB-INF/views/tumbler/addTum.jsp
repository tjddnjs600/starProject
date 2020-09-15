<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<section class="py-5">
    <div class="tumbler_container pt-50">
        <h1>텀블러 상품 등록</h1>
      <form action="/tumbler/addTum" method="post" enctype="multipart/form-data"> 
       <div class="form-group">
       <label for="tname">상품명:</label>
       <input type="text" class="form-control" placeholder="텀블러명을 입력하세요!" name="tname">
       </div>
        <div class="form-group">
       <label for="tprice">가격: </label>
       <input type="number" class="form-control" placeholder="가격을 입력하세요!" name="tprice">
       </div>
       <div class="form-group">
       <label for="ttotal">수량: </label>
       <input type="number" class="form-control" placeholder="수량을 입력하세요!" name="ttotal">
       </div>
        <div class="form-group">
       <label for="timg">이미지: </label>
       <input type="file" class="form-control" name="timg"> 
       </div>
        <div class="form-group">
       <label for="tcontent">설명: </label>
       <textarea class="form-control" name="tcontent" cols="5"></textarea>
       </div>
       
       <button type="submit" class="btn btn-primary">Submit</button>
      </form>
  </div>
  </section>
  <jsp:include page="../common/footer.jsp"></jsp:include>