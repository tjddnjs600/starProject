function removeComment(cno,bno){
	$.ajax({
		url: "/comment/"+cno,
		type: "delete"
	}).done(function(result){
		alert(result);
		listComment(bno);
	});
}
function modifySubmit(bno,comm,cno){
	let modData = {comm:comm,cno:cno};
	$.ajax({
		url: "/comment/"+cno,
		type: "put",
		data: JSON.stringify(modData),
		contentType: "application/json; charset=utf-8"
	}).done(function(result){
		listComment(bno);
	});
}
function transferToModal(writer,comm,cno){
	$(document).find(".modal-title").text(writer);
	let modInput = '<input class="form-control" data-cno="'+cno+'" type="text" value="'+comm+'" id="modInput">';
	$(document).find(".modal-body").html(modInput);	
}
function displayTime(cmodd8){
	let today = new Date();
	let changeModd8 = new Date(cmodd8);
	
	let todayYear = today.getFullYear();
	let todayMonth = today.getMonth()+1; // 0~11
	let todayDate = today.getDate();
	
	let modYear = changeModd8.getFullYear();
	let modMonth = changeModd8.getMonth()+1;
	let modDate = changeModd8.getDate();
	
	let modHour = changeModd8.getHours();
	let modMin = changeModd8.getMinutes();
	let modSec = changeModd8.getSeconds();
	
	let hour = (modHour > 9 ? "" :"0") + modHour;
	let min = (modMin > 9 ? "" : "0") + modMin;
	let sec = (modSec > 9 ? "" : "0") + modSec;
	let month = (modMonth > 9 ? "" : "0") + modMonth;
	let day = (modDate > 9 ? "" : "0") + modDate;
	console.log(hour+":"+min+":"+sec);
	
	let diff = todayYear == modYear && todayMonth == modMonth && todayDate == modDate;
	let dateStr = modYear+"-"+month+"-"+day;
	let timeStr = hour+":"+min+":"+sec;
	console.log(dateStr + " / " + timeStr);
	return diff ? timeStr : dateStr + " " + timeStr;
}
function printListComment(listArr,cmtTotal,page){
	$("#cmtList ul:first-child").nextAll().remove();
	for (let cvo of listArr) {
		console.log(cvo.comment);
		let ulTag = '<ul class="nav nav-pills nav-justified">';
		ulTag += '<li class="nav-item">'+cvo.writer+'</li>';
		ulTag += '<li class="nav-item">'+cvo.comm+'</li>';
		ulTag += '<li class="nav-item">'+displayTime(cvo.cmodd8)+'</li>';
		if(cvo.writer == $("#minfoemail").val()){
		ulTag += '<li class="nav-item"><button data-toggle="modal" data-target="#myModal" class="btn btn-outline-warning modBtn" data-cno="'+cvo.cno+'">수정</button>';
		ulTag += '<button class="btn btn-outline-danger delBtn" data-cno="'+cvo.cno+'">삭제</button></li></ul>';
		}else{
			ulTag += '<li class="nav-item"></li>';
		}
		$("#cmtList").append(ulTag);
	}
	printCmtPaging(cmtTotal,page);
}
function printCmtPaging(cmtTotal,page){
	let cmtPagingObj = '<ul class="pagination">';
	let endPagingNum = Math.ceil(page/10.0)*10;
	let beginPagingNum = endPagingNum - 9;
	let prev = beginPagingNum != 1;
	let next = false;
	
	if(endPagingNum*10 >= cmtTotal){
		endPagingNum = Math.ceil(cmtTotal/10.0);		
	}else{
		next = true;
	}
	
	if(prev){
		cmtPagingObj += '<li class="page-item">';
		cmtPagingObj += '<a class="page-link" href="'+(beginPagingNum-1)+'">Prev</a></li>';
	}
	for (var i = beginPagingNum; i <= endPagingNum ; i++) {
		let classActive = page == i ? ' active' : '';
		cmtPagingObj += '<li class="page-item'+classActive+'">';
		cmtPagingObj += '<a class="page-link" href="'+i+'">'+i+'</a></li>';
	}
	if(next){
		cmtPagingObj += '<li class="page-item">';
		cmtPagingObj += '<a class="page-link" href="'+(endPagingNum+1)+'">Next</a></li>';
	}
	cmtPagingObj += '</ul>';
	$("#cmtPaging").html(cmtPagingObj);
}
function listComment(param_bno,page){
	let pageNo = page> 1 ? page : 1;
	$.getJSON("/comment/list/"+param_bno+"/"+pageNo+".json",function(cdto){
		printListComment(cdto.clist,cdto.cmtCnt,pageNo);
	}).fail(function(){
		alert("댓글 리스트 출력 실패");
	});
}