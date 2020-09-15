<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>
<section class="py-5">
  <div class="boardcontain pt-50">
  <!-- 이미지  -->
  <div class="ms_cont" style="text-align: center; margin-bottom: 50px;">
  <p>
  <img class="w_pic" src="../resources/imgs/boardQ.png" alt="boardLogo">
  </p>
  </div>
  <!-- 이미지  -->
<br>
<div class="boardQna">
<h4 style="color: #333; font-weight: bold;">고객의 소리</h4>
  <div  style=" height: 80px; margin: 50px 0 0; background-color:#f3f3f3;">
    <div class="form-group search_box"  style=" height: 40px; width: 100%; padding-top: 10px;">
    <form action="/board/blist" class="form-inline" style="width: 95%; padding-left: 30px;">
    <input type="hidden" name="pageNum" value="1">
    <input type="hidden" name="amount" value="${bListvo.cri.amount }">
    <div class="board_search">    
    <div class="input-group">
      <div class="input-group" style="width:10%; padding-right: 5px;">
      <select class="form-control" name="type" style="background-color:#007042; color:#fff;">
       <option value="twc">선택</option>
       <option value="t">제목</option>
       <option value="w">작성자</option>
       <option value="c">상세내용</option>
       <option value="tw">제목+작성자</option>
       <option value="tc">제목+상세내용</option>
       <option value="wc">작성자+상세내용</option>
      </select>
      </div>
       <input type="text" name="keyword" class="form-control" size="80" placeholder="검색하실 키워드를 입력하세요">
       <div class="input-group-append">
        <button class="btn" type="submit" style="background-color:#007042;"><i class="fa fa-search" style="font-size:20px;color:white;"></i></button> 
      </div>
      </div>
      </div>  
    </form>
    </div> 
    </div>
    <br>
      <c:if test="${mInfo ne null }">
      <div class="float-right">
        <a href="/board/write" class="btn" style="background-color:#007042; color:#fff;">글등록</a>
      </div>
      </c:if>
      <br>
      <br>
  <table class="table table-hover">
    <thead>
      <tr class="">
        <th>등록번호</th>
        <th>제목</th>
        <th style="padding-left: 50px;">작성자</th>
        <th>조회수</th>
        <th>댓글수</th>
        <th>수정일</th>
        <th>파일첨부</th>
      </tr>
    </thead>
     <tbody>
    <c:choose>
 <c:when test="${bList ne null && bList.size() != 0}">
   <c:forEach items="${bList }" var="bvo">
   <c:if test="${bvo.noticenum eq '1' }">
       <tr>
        <td style="padding-left: 30px;"><span class="badge badge-danger">공지</span></td>
        <td><a href="/board/bdetail?bno=${bvo.bno }&wSign=0&pageNum=${bListvo.cri.pageNum}&type=${bListvo.cri.type}&keyword=${bListvo.cri.keyword}">${bvo.btitle }</a></td>
        <td>${bvo.email }</td>
        <td style="padding-left: 30px;">${bvo.viewcount }</td>
        <td><span class="badge badge-pill badge-warning">${bvo.cmtcnt }</span></td>
        <td><fmt:formatDate value="${bvo.bmodd8 }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
        <td>
        <c:if test="${bvo.b_file ne 'NONE' }">
        <i class='far fa-file-image' style="margin-left: 12px;"></i>
        </c:if>
        </td>
        </tr>
          </c:if>
        </c:forEach>
      <c:forEach items="${bList }" var="bvo">
      <c:if test="${bvo.noticenum eq '0' }">
       <tr>
        <td style="padding-left: 30px;">${bvo.bno }</td>
        <td><a href="/board/bdetail?bno=${bvo.bno }&wSign=0&pageNum=${bListvo.cri.pageNum}&type=${bListvo.cri.type}&keyword=${bListvo.cri.keyword}">${bvo.btitle }</a></td>
        <td>${bvo.email }</td>
        <td style="padding-left: 30px;">${bvo.viewcount }</td>
        <td><span class="badge badge-pill badge-warning">${bvo.cmtcnt }</span></td>
        <td><fmt:formatDate value="${bvo.bmodd8 }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
        <td>
        <c:if test="${bvo.b_file ne 'NONE' }">
        <i class='far fa-file-image' style="margin-left: 12px;"></i>
        </c:if>
        </td>
      </tr>
      </c:if>
      </c:forEach>
      </c:when>
      <c:otherwise>
      <tr>
      <th colspan="6" class="text-center"><p>등록된 게시글이 없습니다!</p></th>
      </tr>
      </c:otherwise>
    </c:choose>
    </tbody>
  </table>
  <div style="height: 60px;">
  <div class="page_board">
  <ul class="pagination">
  <c:if test="${bListvo.prev }">
   <a class="page-link" href="/board/blist?pageNum=${bListvo.firstPage - 1 }&amount=${bListvo.cri.amount}&type=${bListvo.cri.type}&keyword=${bListvo.cri.keyword}"><i class='fas fa-angle-left' style='font-size:15px'></i></a>
  </c:if>
  <c:forEach begin="${bListvo.firstPage }" end="${bListvo.lastPage }" var="i">
    <a class="page-item ${bListvo.cri.pageNum == i ?'active':'' }" href="/board/blist?pageNum=${i }&amount=${bListvo.cri.amount }&type=${bListvo.cri.type}&keyword=${bListvo.cri.keyword}">${i }</a>
  </c:forEach>
  <c:if test="${bListvo.next }">
   <a class="page-link" href="/board/blist?pageNum=${bListvo.lastPage + 1 }&amount=${bListvo.cri.amount}&type=${bListvo.cri.type}&keyword=${bListvo.cri.keyword}"><i class='fas fa-angle-right' style='font-size:15px'></i></a>
  </c:if>
</ul>
</div>
</div>
</div>
</div>
</section>
 <jsp:include page="../common/footer.jsp"></jsp:include>