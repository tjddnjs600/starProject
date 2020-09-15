<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<jsp:include page="../common/nav.jsp"></jsp:include>

<div id="map" style="width: 100%; height: 840px;"></div>

<c:set var="locinfo" />

<script type="text/javascript"
  src="//dapi.kakao.com/v2/maps/sdk.js?appkey=79ec5447a6a5a0b76b40bd26ef4d5a87"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=79ec5447a6a5a0b76b40bd26ef4d5a87&libraries=services,clusterer,drawing"></script>
<script>





    
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(37.502545, 127.024540), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    //마커를 표시할 위치와 title 객체 배열입니다 
    var json = JSON.parse('${locjson}');

    var width = [];
    var height = [];
    for(var i = 0; i<json.length; i++){
      width.push(json[i].width);
      height.push(json[i].height);
    } 
    var positions = [];
      for(var i = 0; i<json.length; i++){
        positions.push({title:'<div><p>'+json[i].place+'</p><span>'+json[i].region+'</span><p><br></p></div>', latlng: new kakao.maps.LatLng(width[i], height[i])});
       
      }


    //마커 이미지의 이미지 주소입니다
    var imageSrc = "../../resources/imgs/pin.png"; 

    for (var i = 0; i < positions.length; i ++) {

    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 

    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].title // 인포윈도우에 표시할 내용
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
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
    
};


/* var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커를 표시할 위치와 title 객체 배열입니다 
var json = JSON.parse('${locjson}');

var width = [];
var height = [];
for(var i = 0; i<json.length; i++){
  width.push(json[i].width);
  height.push(json[i].height);
} 
var positions = [];
  for(var i = 0; i<json.length; i++){
    positions.push({title:'<div><p>'+json[i].place+'</p><span>'+json[i].region+'</span><p><br></p></div>', latlng: new kakao.maps.LatLng(width[i], height[i])});
   
  }


//마커 이미지의 이미지 주소입니다
var imageSrc = "../../resources/imgs/pin.png"; 

for (var i = 0; i < positions.length; i ++) {

// 마커 이미지의 이미지 크기 입니다
var imageSize = new kakao.maps.Size(24, 35); 

// 마커 이미지를 생성합니다    
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    map: map, // 마커를 표시할 지도
    position: positions[i].latlng, // 마커를 표시할 위치
    // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
    image : markerImage // 마커 이미지 
});
var infowindow = new kakao.maps.InfoWindow({
    content: positions[i].title // 인포윈도우에 표시할 내용
});

// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
// 이벤트 리스너로는 클로저를 만들어 등록합니다 
// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
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
} */
/*  var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
  var options = { //지도를 생성할 때 필요한 기본 옵션
    center : new kakao.maps.LatLng(37.502505, 127.024807), //지도의 중심좌표.
    level : 2
  //지도의 레벨(확대, 축소 정도)
  };

  var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
  
  var locplace = '<c:out value="${loclist}"/>';
  var list = '${loclist}';
  var arrloc = new Array('${loclist}');
  var json = JSON.parse('${locjson}');
  
  
/*  var width = [];
  var height = [];
  for(var i = 0; i<json.length; i++){
    width.push(json[i].width);
    height.push(json[i].height);
  } */
  
  

  // 마커가 표시될 위치입니다
  
  /* var markerPosition  = new kakao.maps.LatLng(37.502522 , 127.024111); */ 

  // 마커를 생성합니다
  /* for(var j = 0; j<json.lenght; j++){
    var marker = new kakao.maps.Marker({
    map: map,
    position: new kakao.maps.LatLng(json[j].width, json[j].height)
     

    });
    
  }
   */


  // 마커가 지도 위에 표시되도록 설정합니다
 /*  marker.setMap(map); */
</script>
<jsp:include page="../common/footer.jsp"></jsp:include>