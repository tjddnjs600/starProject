<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>

<section class="py-5">
  <div class="container">
    <h1>결제페이지!!!!</h1>
    <button class="btn btn-primary" id="closeBt">확인</button>
  </div>
</section>

<script>
$(function(){
	$("#closeBt").on("click", function() {
		close();
	});
});
</script>
</body>
</html>