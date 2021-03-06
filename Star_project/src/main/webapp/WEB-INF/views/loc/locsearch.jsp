<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

 <style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>

<div class="map_wrap">
    <div id="map" style="width:100%;height:840px;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    주변매장 찾기
                    <button type="button" id="searchbtn">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=79ec5447a6a5a0b76b40bd26ef4d5a87&libraries=services"></script>
<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(37.511653, 127.081142), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

var map = new kakao.maps.Map(mapContainer, mapOption); 


$("#searchbtn").on("click",function(e){
   
   
   e.preventDefault();
   
   
   var placedata={};
   
   navigator.geolocation.getCurrentPosition(function(pos) {
        var latitude = pos.coords.latitude;
        var longitude = pos.coords.longitude;
   
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };  

        var map = new kakao.maps.Map(mapContainer, mapOption); 
        
   placedata["width"]=latitude;
   placedata["height"]=longitude;
   $.ajax({
      url: "/loc/locsearch",
      dataType:"json",
      type:"post",
      contentType : "application/json",
      data: JSON.stringify(placedata),
      success: function(result){
         //var json = JSON.parse(result); 
           var imageSrc = "../../resources/imgs/pin.png";
           for(key in result){
              if(key == "maplist"){
                 for(i = 0; i<result[key].length; i++){
                    var place = result[key][i].PLACE;
                    var region = result[key][i].REGION;
                    var str = '<li>'+place+'<br>'+region+'</li><br>';
                  $("#placesList").append(str);
                  var imageSize = new kakao.maps.Size(24, 35); 

                   // 마커 이미지를 생성합니다    
                   var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 

                   // 마커를 생성합니다
                   
                   var marker = new kakao.maps.Marker({
                       map: map, // 마커를 표시할 지도
                       position: new kakao.maps.LatLng(result[key][i].WIDTH,result[key][i].HEIGHT), // 마커를 표시할 위치
                       // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                       image : markerImage // 마커 이미지 
                   });
                   var infowindow = new kakao.maps.InfoWindow({
                       content: result[key][i].PLACE // 인포윈도우에 표시할 내용
                   });
                   kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
                   kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
                 } // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
                  // 이벤트 리스너로는 클로저를 만들어 등록합니다 
                  // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
                  
                  }

                  //인포윈도우를 표시하는 클로저를 만드는 함수입니다 
                  function makeOverListener(map, marker, infowindow) {
                  return function() {
                      infowindow.open(map, marker);
                  };
                  }

                  //인포윈도우를 닫는 클로저를 만드는 함수입니다 
                  function makeOutListener(infowindow) {
                  return function() {
                      infowindow.close();
                  };
                  
              }
           }
   }
   }).fail(function(){
        alert("실패");
    });

});
});


</script>
<jsp:include page="../common/footer.jsp"></jsp:include>