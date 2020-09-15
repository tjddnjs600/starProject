<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<!-- Content section -->
<section class="py-5">
  <div class="container">
    <h1>정보확인</h1>
    <form action="/member/certify" method="post">
      <input type="hidden" value="${mInfo.email }" name="email">
     
      <div class="form-group">
        <label for="pwd">Password:</label> 
        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
      </div>
       
      <button type="submit" class="btn btn-primary">확인</button>
    </form>
  </div>
</section>
<jsp:include page="../common/footer.jsp"></jsp:include>
