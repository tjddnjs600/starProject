<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<div class="sub_tit_wrap">
  <div class="sub_tit_bg">
    <div class="sub_tit_inner">
      <h4>
        <span class="sub_vi_title">커피</span>
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
          <a href="#">음료</a>
        </li>
        <li>
          <a>
            <img alt="" src="../../../resources/imgs/icon_arrow_w.png">
          </a>
        </li>
        <li>
          <a href="#">커피</a>
        </li>
      </ul>
    </div>
  </div>
</div>

<section class="py-5">
  <div class="coffee_container pt-50">
    <div class="tagTum">
    </div>
    <br>
    <c:if test="${mInfo.email eq 'admin@admin.com' }">
      <div class="float-right">
        <a href="/coffee/addCof" class="btn"
          style="background-color: #007042; color: #fff;">음료 등록</a>
      </div>
    </c:if>
    <br> <br>


    <div class="coffee_container p-2 my-3"
      style="height: 50px; border-radius: 3px; background-color: #f3f3f3;">
      <h6>
        <strong>커피</strong>
      </h6>
    </div>
    <div class="container-fluid">
      <div class="row">
        <c:forEach items="${clist }" var="clist">
          <div class="col-sm-12 col-md-4 col-xl-3">
          <div class="timg">
            <a href="/coffee/detailCof?cname=${clist.cname }"><img src="/images/${clist.cimg }" width="250" height="270" class="scale"></a>
          </div>
            <p style="font-size: 12px; font-weight: bold; padding-left: 20px;">${clist.cname }</p>
            <c:if test="${mInfo.email eq 'admin@admin.com' }">
              <form action="/coffee/removeCof" method="post">
                <input type="hidden" name="timg" value="${clist.cimg }"> <input
                  type="hidden" name="tname" value="${clist.cname }">
                <button type="submit" class="btn reBtn"
                  style="background-color: #007042; color: #fff; margin-bottom: 30px; font-size: 12px">삭제</button>
              </form>
            </c:if>
          </div>
        </c:forEach>
      </div>
    </div>
  </div>
</section>






<jsp:include page="../common/footer.jsp"></jsp:include>