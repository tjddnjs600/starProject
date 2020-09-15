<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="mInfo" value="${mInfo }" scope="session"/>
<div id="gnb">
  <div class="gnb-wrap">
    <div class="gnb-wrap-inner">
      <h1 class="logo">
        <a href="/"><img src="../resources/imgs/logo.jpg" alt="logo"></a>
      </h1>
      <nav class="util-nav">
        <ul>
          <c:if test="${mInfo ne null}">
          <li class="fMenu"><a href="/member/logout">Sign Out</a></li>
          </c:if>
          <c:if test="${mInfo eq null}">  
          <li class="fMenu"><a href="/member/login">Sign In</a></li>
          </c:if>
          <c:if test="${mInfo.grade eq '100' }">  
          <li><a href="/member/admin">Admin Page</a></li>
          </c:if>
          <c:if test="${mInfo ne null && mInfo.grade < 100}">
          <li><a href="/member/myPage?email=${mInfo.email }">My Starbucks</a></li>
          </c:if>
          <c:if test="${mInfo eq null}">
          <li><a href="/member/login?page=1">My Starbucks</a></li>
          </c:if>
          <li><a href="/loc/locsearch">Find a Store</a></li>
        </ul>
      </nav>
      <p class="btn-search">
        <a href="#"></a>
      </p>
      <nav class="gnb-nav">
        <div class="gnb-nav-inner">
          <ul>
            <li>
              <a class="gmenu" href="">MENU</a>
              <div class="gnb-sub-wrap">
                <div class="gnb-sub">
                  <div class="gnb-sub-inner clearfix">
                    <ul>
                      <li class="gnb-sub-title"><a href="/coffee/alllist">음료</a></li>
                      <li><a href="/coffee/clist?category=COFFEE">커피</a></li>
                      <li><a href="/coffee/clist?category=TEA">티</a></li>
                      <li><a href="/coffee/clist?category=BLENDED">블렌디드</a></li>
                    </ul>
                    <ul>
                      <li class="gnb-sub-title"><a href="/tumbler/listTum">텀블러</a></li>
                    </ul>
                  </div>
                </div>
                <div class="gnb_sub_txbg"></div>
              </div>
            </li>
            <li>
              <a class="gmenu" href="/loc/location">STORE</a>
              <div class="gnb-sub-wrap">
                <div class="gnb-sub">
                  <div class="gnb-sub-inner">
                    <ul>
                      <li class="gnb-sub-title"><a href="/loc/location">매장찾기</a></li>
                      <li><a href="/loc/location">매장보기</a></li>
                      <li><a href="/loc/locsearch">가까운 매장 찾기</a></li>
                    </ul>
                  </div>
                </div>
                <div class="gnb_sub_txbg"></div>
              </div>
            </li>
            <c:if test="${mInfo ne null }">
            <li>
              <a class="gmenu" href="/gcard/creg">CARD</a>
              <div class="gnb-sub-wrap">
                <div class="gnb-sub">
                  <div class="gnb-sub-inner">
                    <ul>
                      <li class="gnb-sub-title"><a href="/gcard/creg">카드</a></li>
                      <li><a href="/gcard/creg">카드 등록</a></li>
                      <li><a href="/gcard/charge?email=${mInfo.email }">카드 충전</a></li>
                      <li><a href="/gcard/mycard?email=${mInfo.email }">카드 보기</a></li>
                    </ul>
                  </div>
                </div>
                <div class="gnb_sub_txbg"></div>
              </div>
            </li>
            </c:if>
            <c:if test="${mInfo eq null }">
            <li>
              <a class="gmenu" href="/member/login?page=2">CARD</a>
              <div class="gnb-sub-wrap">
                <div class="gnb-sub">
                  <div class="gnb-sub-inner">
                    <ul>
                      <li class="gnb-sub-title"><a href="/member/login?page=2">카드</a></li>
                      <li><a href="/member/login?page=2">카드 등록</a></li>
                      <li><a href="/member/login?page=2">카드 충전</a></li>
                      <li><a href="/member/login?page=2">카드 보기</a></li>
                    </ul>
                  </div>
                </div>
                <div class="gnb_sub_txbg"></div>
              </div>
            </li>
            </c:if>
            <li>
              <a class="gmenu" href="">ORDER</a>
              <div class="gnb-sub-wrap">
                <div class="gnb-sub">
                  <div class="gnb-sub-inner">
                    <ul>
                      <li class="gnb-sub-title"><a href="">주문하기</a></li>
                      <li><a href="/coffee/alllist">커피</a></li>
                      <li><a href="/tumbler/listTum">텀블러</a></li>
                    </ul>
                    <ul>
                      <li class="gnb-sub-title"><a href="">장바구니</a></li>
                      <li><a href="/cbag/cblist?email=${mInfo.email }">커피</a></li>
                      <li><a href="/tbag/toList?email=${mInfo.email }">텀블러</a></li>
                    </ul>
                  </div>
                </div>
                <div class="gnb_sub_txbg"></div>
              </div>
            </li>
            <li>
              <a class="gmenu" href="/board/blist">NOTICE</a>
              <div class="gnb-sub-wrap">
                <div class="gnb-sub">
                  <div class="gnb-sub-inner">
                    <ul>
                      <li class="gnb-sub-title"><a href="" id="newWIn">게시판</a></li>
                      <li><a href="">공지사항</a></li>
                      <li><a href="">고객센터</a></li>
                      <li><a href="">자유게시판</a></li>
                    </ul>
                  </div>
                </div>
                <div class="gnb_sub_txbg"></div>
              </div>
            </li>
          </ul>
        </div>
      </nav>
    </div>
  </div>
</div>
