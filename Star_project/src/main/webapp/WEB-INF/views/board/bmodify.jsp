<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

  <section class="py-5">
    <div class="container">
    <h2>내용 수정</h2>
  <form action="/board/bmodify" id="upForm" method="post" enctype="multipart/form-data">
  <input type="hidden" class="form-control" value="${cri.pageNum }" name="pageNum">
  <input type="hidden" class="form-control" value="${cri.amount }" name="amount">
  <input type="hidden" class="form-control" value="${cri.type }" name="type">
  <input type="hidden" class="form-control" value="${cri.keyword }" name="keyword">
  <input type="hidden" name="bno" value="${bvo.bno }">
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>제목</th>
        <td><input type="text" name="btitle" value="${bvo.btitle }"></td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th>작성자</th>
        <td><input type="text" name="btitle" value="${bvo.email }" readonly></td>
      </tr>
      <tr>
         <th>조회수</th>
        <td>${bvo.viewcount }</td>
      </tr>
       <tr>
        <th>수정일</th>
        <td>${bvo.bmodd8 }</td>
      </tr>
      <tr>
         <th>상세내용</th>
        <td><textarea class="form-control" name="bcontent" cols="5">${bvo.bcontent }</textarea></td>
      </tr>
       <tr>
         <th>기존파일</th>
      <td>
       <input type="text" class="form-control" value="${bvo.b_file }" name="old_bfile">
        </td>
      </tr>
       <tr>
         <th>수정파일</th>
      <td>
       <input type="file" class="form-control" value="${bvo.b_file }" name="b_file">
        </td>
      </tr>
    </tbody>
      </table>
      <input type="hidden" class="form-control" value="" id="file" name="refile">
      <button type="submit" class="btn btn-primary" id="modBtn">수정</button>
      </form>
    </div>
  </section>
   <script>
  $(function(){
    $("#modBtn").on("click",function(e){
      e.preventDefault();
      let b_file = $(".b_file").val();
      
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
    