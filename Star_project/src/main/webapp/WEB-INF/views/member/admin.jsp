<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<section class="py-5">
	<div class="container">
	  <h3>회원리스트</h3>
	  <table class="table table-hover">
	    <thead>
	      <tr>
	        <th class="table-active">이메일</th>
	        <th class="table-active">이름</th>
	        <th class="table-active">닉네임</th>
	        <th class="table-active">가입날짜</th>
	        <th class="table-active">등급</th>
	      </tr>
	    </thead>
	    <tbody>
	     <c:forEach items="${mlist }" var="mvo">
	      <tr>
	        <td class="tumName">${mvo.email }</td>
	        <td class="tumAmount"><a href="/member/mInfo?email=${mvo.email }">${mvo.name }</a></td>
	        <td class="tprice">${mvo.nick }</td>
	        <td class="tprice">${mvo.regd8 }</td>
	        <c:if test="${mvo.grade < '50'}">
	        <td class="tprice">Green Level</td>
	        </c:if>
	        <c:if test="${mvo.grade < '100' && mvo.grade > '49'}">
	        <td class="tprice">Gold Level</td>
	        </c:if>
	      </tr>
	     </c:forEach>
	    </tbody>
	  </table>
	  
	  <div style="height: 60px;">
      <div class="page_board">
        <ul class="pagination">
          <c:if test="${pgvo.prev }">
            <li>
            <a class="page-link" href="/member/admin?pageNum=${pgvo.firstPage - 1 }&amount=${pgvo.cri.amount}"><i class='fas fa-angle-left' style='font-size:15px'></i></a>
            </li>
          </c:if>
          <c:forEach begin="${pgvo.firstPage }" end="${pgvo.lastPage }" var="i">
            <li>
            <a class="page-item ${pgvo.cri.pageNum == i ?'active':'' }" href="/member/admin?pageNum=${i }&amount=${pgvo.cri.amount }">${i }</a>
            </li>
          </c:forEach>
          <c:if test="${pgvo.next }">
            <li>
            <a class="page-link" href="/member/admin?pageNum=${pgvo.lastPage + 1 }&amount=${pgvo.cri.amount}"><i class='fas fa-angle-right' style='font-size:15px'></i></a>
            </li>
          </c:if>
        </ul>
      </div>
    </div>
	</div>
</section>

<jsp:include page="../common/footer.jsp"></jsp:include>

    