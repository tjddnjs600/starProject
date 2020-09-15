<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<section class="py-5">
	<div class="coffee_container pt-50">
		<a href="/coffee/clist?category=${cvo.category }"
			class="btn btn-secondary">목록</a>
		<ul class="smap">
			<li><a href="/"><img src="../resources/imgs/icon_home.png"></a></li>
			<li><img src="../resources/imgs/icon_arrow.png"></li>
			<li>MENU</li>
			<li><img src="../resources/imgs/icon_arrow.png"></li>
			<li>상품</li>
			<li><img src="../resources/imgs/icon_arrow.png"></li>
			<li><a href="/coffee/clist">COFFEE</a></li>
			<li><img src="../resources/imgs/icon_arrow.png"></li>
			<li><a href="/coffee/detailCof?cname=${cvo.cname }">${cvo.cname }</a></li>
		</ul>
		  <c:if test="${mInfo.grade eq '100' }">
			<div class="float-right">
				<a href="/coffee/modifyCof?cname=${cvo.cname }" class="btn moBtn" style="background-color: #007042; color: #fff;">음료 수정</a>
			</div>
			</c:if>
		<br> 
		<br>
		<div class="clearfix">
			<div class="boardQna">
				<div class="float-left">
					<img src="/images/${cvo.cimg }" id="imgCof">
				</div>
				<div class="float-right myAssignZone">
					<h4 id="cname">${cvo.cname } <br></h4>
					<p class="t1">${cvo.ccontent }</p>
				</div>
			</div>
		</div>
		
		<div class="float-right">
        <a href="/coffee/orderCof?cname=${cvo.cname }" id="corBtn" class="btn orBtn" style="background-color: #007042; color: #fff;">주문하기</a>
    </div>
    
	</div>
</section>
<script>
$(function() {
	$("#corBtn").on("click", function(e) {
		e.preventDefault();
		let email = '<c:out value="${mInfo.email}"/>';
		let cname = $("#cname").text();
		if (email == "") {
			alert('로그인 후 이용 부탁드립니다.');
		  location.href="/member/login?page=4";
		} else {
			location.href="/coffee/orderCof?cname="+cname;
		}
	});
});
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>