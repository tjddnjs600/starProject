<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<footer class="footer">
  <div class="copyright">
    <a class="terms" href="#">개인정보처리방침</a> 
    <a class="terms" href="#">영상정보처리기기 운영관리 방침</a> 
    <a class="terms" href="#">홈페이지 이용약관</a> 
    <a class="terms" href="#">위치정보 이용약관</a> 
    <a class="terms" href="#">스타벅스 카드 이용약관</a> 
    <a class="terms" href="#">비회원 이용약관</a> 
    <a class="terms" href="#">윤리경영 핫라인</a> 
    <br> 
  <div class="btn">
    <a class="btn-link" href="#">찾아오시는 길</a> 
    <a class="btn-link" href="#">신규입점제의</a> 
    <a class="btn-link" href="#">사이트 맵</a> 
  </div>
    <br>
    <ul class="info">
      <li>사업자등록번호:000-00-00000</li>
      <li>별다방 팀: 명동권 유단비 이혜림 조성원</li>
      <li>TEL:02-0000-0000</li>
      <li>팀장:명동권</li>
    </ul>
    <span class="end">ⓒ 2020 Starbucks Coffee Company. All Rights Reserved.</span>
  </div>

</footer>






<script>
let msg = '<c:out value="${msg}"/>';
if (msg != '') {
  alert(msg);
}
</script>
</body>
</html>