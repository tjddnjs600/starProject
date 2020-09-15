<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

  <section class="py-5">
    <div class="container">
      <h2>상세내용</h2>
      <input type="hidden" value="${mInfo.email }" name="email" id="minfoemail">
      <a href="/board/blist?pageNum=${cri.pageNum}&type=${cri.type}&keyword=${cri.keyword}" class="btn btn-secondary">목록</a>
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>제목</th>
        <td>${bvo.btitle }</td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th>작성자</th>
        <td>${bvo.email }</td>
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
        <td>${bvo.bcontent }</td>
      </tr>
       <tr>
         <th>첨부파일</th>
        <td>
        <c:if test="${bvo.b_file ne 'NONE' }">
          <img src="/images/${bvo.b_file }" width="300">
        </c:if>
        <c:if test="${bvo.b_file eq 'NONE' }">
                  이미지가 없습니다.
        </c:if>
        </td>
      </tr>
    </tbody>
   <c:if test="${mInfo.email eq bvo.email || mInfo.email eq 'admin@admin.com' }">
    <tfoot>
    <tr>
      <td colspan="6">
      <a href="/board/bmodify?bno=${bvo.bno }&wSign=0&pageNum=${cri.pageNum}&type=${cri.type}&keyword=${cri.keyword}" class="btn btn-light" id="upBtn">수정</a>
      <button type="button" class="btn btn-dark" id="delBtn">삭제</button>
      </td>
    </tr>
    </tfoot>
     </c:if>
      </table>
       <form action="/board/bremove" id="reForm" method="post">
      <input type="hidden" name="bno" value="${bvo.bno }">
      <input type="hidden" name="bfile" value="${bvo.b_file }">
      <input type="hidden" name="pageNum" value="${cri.pageNum }">
      <input type="hidden" name="amount" value="${cri.amount }">
      <input type="hidden" name="type" value="${cri.type }">
      <input type="hidden" name="keyword" value="${cri.keyword }">
     </form>
     
     <!-- 댓글 -->
     <c:if test="${mInfo ne null }">
     <div class="input-group mt-3">
        <input type="text" id="cmtInput" class="form-control"
          placeholder="댓글을 입력해주세요.">
        <div class="input-group-append">
          <button class="btn btn-primary" type="button" id="cmtOkBtn">등록</button>
          <button class="btn btn-danger" onclick="clearcomment()">취소</button>
        </div>
      </div>
      </c:if>
    <div id="cmtList">
      <ul class="nav nav-pills nav-justified">
        <li class="nav-item">작성자</li>
        <li class="nav-item">댓글내용</li>
        <li class="nav-item">작성일</li>
        <li class="nav-item">수정/삭제</li>
      </ul>
    </div>
    <div id="cmtPaging"></div>
    <!-- The Modal -->
    <div class="modal" id="myModal">
      <div class="modal-dialog">
        <div class="modal-content">

          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title">작성자</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>

          <!-- Modal body -->
          <div class="modal-body">내용</div>

          <!-- Modal footer -->
          <div class="modal-footer">
            <button type="button" id="modOkBtn" class="btn btn-primary">확인</button>
          </div>

        </div>
      </div>
    </div>
    </div>
    
    
 </section>
 <script src="/resources/js/comment.js"></script>
 <script>
 
 function clearcomment(){
	   document.getElementById('cmtInput').value = '';
	 };
 
 $(function(){
	 $("#delBtn").on("click",function(e){
		 e.preventDefault();
		 $("#reForm").submit();
	 });
	 

	 
 let cmt_writer = '<c:out value="${mInfo.email}"/>';
 console.log(cmt_writer);
 let cmt_bno = '<c:out value="${bvo.bno}"/>';
 console.log(cmt_bno);
 
 listComment(cmt_bno,1);
 $(document).on("click", "#cmtPaging li a", function(e){
       e.preventDefault();
       listComment(cmt_bno,$(this).attr("href"));
     });
 
 $("#cmtOkBtn").on("click", function() {
   let cmt_comment = $("#cmtInput").val();
   console.log(cmt_comment);
       if(cmt_comment == null || cmt_comment == ''){
          alert("댓글 내용을 입력해주세요!");
          return false;
       }else{
          let cmtData = {bno:cmt_bno,writer:cmt_writer,comm:cmt_comment};
          console.log(cmtData);
          $.ajax({
             type: "post",
             url:"/comment/new",
             data: JSON.stringify(cmtData),
             contentType:"application/json; charset:utf-8"
          }).done(function(result){
             alert(result);
             listComment(cmt_bno);                  
          });
       }  
 });
 
 $(document).on("click",".delBtn",function(){
     let cno = $(this).data("cno");
     removeComment(cno,cmt_bno);
   });
 
 $(document).on("click", ".cmtReBtn", function() {
   let cmt_comment = $("cmtInput").val();
   removeComment(cmtInput);
 });
 
 $(document).on("click",".modBtn",function(){
     let parentsUl = $(this).closest("ul");
     let writer = $(parentsUl).find("li:first-child").text();
     let comm = $(parentsUl).find("li:nth-child(2)").text();
     let cno = $(parentsUl).find("li:last-child button:first-child").data("cno");
     transferToModal(writer,comm,cno);
  });
 
 $(document).on("click","#modOkBtn",function(){         
     let comm = $(document).find("#modInput").val();
     let cno = $(document).find("#modInput").data("cno");
     modifySubmit(cmt_bno,comm,cno);
     $(document).find(".close").click();
   });
 
 });
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>

