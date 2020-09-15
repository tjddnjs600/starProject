<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<div class="sub_tit_wrap">
  <div class="sub_tit_bg">
    <div class="sub_tit_inner">
      <h4>
        <span class="sub_vi_title">텀블러</span>
      </h4>
      <ul class="smaps">
        <li>
          <a href="/">
            <img alt="" src="../../../resources/imgs/icon_home_w.png">
          </a>
        </li>
        <li>
          <a>
            <img alt="" src="../../../resources/imgs/icon_arrow_w.png">
          </a>
        </li>
        <li>
          <a href="#">MENU</a>
        </li>
        <li>
          <a>
            <img alt="" src="../../../resources/imgs/icon_arrow_w.png">
          </a>
        </li>
        <li>
          <a href="#">텀블러</a>
        </li>
        <li>
          <a>
            <img alt="" src="../../../resources/imgs/icon_arrow_w.png">
          </a>
        </li>
        <li>
          <a href="#">텀블러</a>
        </li>
      </ul>
    </div>
  </div>
</div>

<section class="py-5">
  <div class="tumbler_container pt-50">
  
  <div class="tagTum">
  </div>
  <br>
    <c:if test="${mInfo.email eq 'admin@admin.com' }">
      <div class="float-right">
        <a href="/tumbler/addTum" class="btn" style="background-color:#007042; color:#fff;">상품 등록</a>
      </div>
      </c:if>
      <br>
      <br>
  <div class="tumbler_container p-2 my-3" style="height:50px; border-radius:3px; background-color:#f3f3f3;">
    <h6><strong>텀블러</strong></h6>
  </div>
  <div class="container-fluid">
  <div class="row">
  <c:forEach items="${tlist }" var="tvo">
    <div class="col-sm-12 col-md-4 col-xl-3">
    <div class="timg">
    <a href="/tumbler/detailTum?tname=${tvo.tname }&pageNum=${tPageVO.cri.pageNum}&amount=${tPageVO.cri.amount}"><img src="/images/${tvo.timg }" width="250" height="270" class="scale"></a>
    </div>
     <p style="font-size:12px; font-weight:bold; padding-left:20px;">${tvo.tname }</p>
     <c:if test="${mInfo.email eq 'admin@admin.com' }">
     <form action="/tumbler/removeTum" method="post">
     <input type="hidden" name="timg" value="${tvo.timg }">
     <input type="hidden" name="tname" value="${tvo.tname }">
     <input type="hidden" name="pageNum" value="${tPageVO.cri.pageNum }">
     <input type="hidden" name="amount" value="${tPageVO.cri.amount}">
     <button type="submit" class="btn reBtn" style="background-color:#007042; color:#fff; margin-bottom: 30px; font-size: 12px">상품 삭제</button>
    </form>
    </c:if>
    </div>
    </c:forEach>
  </div>
  </div>
    <div style="height: 60px;">
  <div class="page_board">
  <ul class="pagination">
  <c:if test="${tPageVO.prev }">
   <a class="page-link" href="/tumbler/listTum?pageNum=${tPageVO.firstPage - 1 }&amount=${tPageVO.cri.amount}"><i class='fas fa-angle-left' style='font-size:15px'></i></a>
  </c:if>
  <c:forEach begin="${tPageVO.firstPage }" end="${tPageVO.lastPage }" var="i">
    <a class="page-item ${tPageVO.cri.pageNum == i ?'active':'' }" href="/tumbler/listTum?pageNum=${i }&amount=${tPageVO.cri.amount }">${i }</a>
  </c:forEach>
  <c:if test="${tPageVO.next }">
   <a class="page-link" href="/tumbler/listTum?pageNum=${tPageVO.lastPage + 1 }&amount=${tPageVO.cri.amount}"><i class='fas fa-angle-right' style='font-size:15px'></i></a>
  </c:if>
</ul>
</div>
</div>
  </div>
</section>
<jsp:include page="../common/footer.jsp"></jsp:include>