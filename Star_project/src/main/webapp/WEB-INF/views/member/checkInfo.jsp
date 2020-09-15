<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<!-- Content section -->
<section class="py-5">
  <div class="container">
    <h1>회원 정보 확인</h1>
    <form action="/member/login" method="post">
    <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
      <div class="form-group">
        <label for="email">Email: </label> 
        <input type="email" class="form-control" placeholder="Enter email" name="email" value="${email }">
      </div>
      <div class="form-group">
        <label for="pwd">Password:</label> 
        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd" value="${pwd }">
      </div>
       <c:if test="${not empty err_msg }">
           <div class="form-group">
             <p class="text-danger">
              <c:choose>
               <c:when test="${err_msg eq 'Bad credentials'  }">
                 <c:set var="errMsg" value="비밀번호가 정확하지 않습니다!"/>
               </c:when>
               <c:when test="${err_msg eq 'User is disabled' }">
              <c:set var="errMsg" value="계정이 비활성화 되어 있습니다!"/>
            </c:when>
            <c:otherwise>
              <c:set var="errMsg" value="관리자에게 문의하세요!"/>
            </c:otherwise>
              </c:choose>
              ${errMsg }
          </p>
        </div>
       </c:if>
      <button type="submit" class="btn btn-primary">확인</button>
    </form>
  </div>
</section>
<jsp:include page="../common/footer.jsp"></jsp:include>