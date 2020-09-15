<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<section class="py-5">
  <div class="container pt-50">
       <h1>QnA 등록</h1>
      <form action="/board/write" method="post" enctype="multipart/form-data">
       <div class="form-group">
       <label for="btitle">제목:</label>
       <input type="text" class="form-control" placeholder="제목을 입력하세요!" name="btitle">
       </div>
       
   <div class="form-group">
   <c:if test="${mInfo.email eq 'admin@admin.com' }">
       <select name="noticenum" class="custom-select">
        <option selected>선택하세요.</option>
        <option value="0">게시글</option>
        <option value="1">공지글</option>
       </select>
       </c:if>
      <c:if test="${mInfo.email ne 'admin@admin.com' }">
       <select name="noticenum" class="custom-select">
        <option value="0">게시글</option>
       </select>
       </c:if>
       </div> 
        <div class="form-group">
       <label for="email">등록자: </label>
       <input type="text" class="form-control" name="email" value='${mInfo.email}' readonly>
       </div>
    
        <div class="form-group">
       <label for="title">파일첨부: </label>
       <input type="file" class="form-control" name="b_file"> 
       </div>
       
        <div class="form-group">
       <label for="price">내용작성: </label>
       <textarea class="form-control" name="bcontent" cols="5"></textarea>
       </div>
       
       <button type="submit" class="btn btn-primary">등록하기</button>
      </form>

  </div>
 </section>
 <jsp:include page="../common/footer.jsp"></jsp:include>