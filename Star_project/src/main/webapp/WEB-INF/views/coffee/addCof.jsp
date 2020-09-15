<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<section class="py-5">
    <div class="coffee_container pt-50">
        <h1>음료 등록</h1>
      <form action="/coffee/addCof" method="post" enctype="multipart/form-data">
       
      <div class="form-group">
       <label for="category">카테고리:</label>
       <select name="category">
          <option value="COFFEE">COFFEE</option>
          <option value="BLENDED">BLENDED</option>
          <option value="TEA">TEA</option>
       </select>
       </div> 
       <div class="form-group">
       <label for="cname">상품명:</label>
       <input type="text" class="form-control" placeholder="상품명을 등록해주세요." name="cname">
       </div>
        <div class="form-group">
       <label for="cprice">가격: </label>
       <input type="number" class="form-control" placeholder="가격을 입력하세요!" name="cprice">
       </div>
       <div class="form-group">
       <label for="ctotal">수량: </label>
       <input type="number" class="form-control" placeholder="수량을 입력하세요!" name="ctotal">
       </div>
       <div class="form-group">
       <label for="option">옵션:</label>
       <input type="checkbox" class="form-control" name="hc" value="hc">핫&아이스
       <input type="checkbox" class="form-control" name="hc" value="h">핫
       <input type="checkbox" class="form-control" name="hc" value="c">아이스
       </div> 
        <div class="form-group">
       <label for="cimg">이미지: </label>
       <input type="file" class="form-control" name="cimg"> 
       </div>
        <div class="form-group">
       <label for="ccontent">설명: </label>
       <textarea class="form-control" name="ccontent" cols="5"></textarea>
       </div>
       
       <button type="submit" class="btn btn-primary">Submit</button>
      </form>
  </div>
  </section>
  <jsp:include page="../common/footer.jsp"></jsp:include>