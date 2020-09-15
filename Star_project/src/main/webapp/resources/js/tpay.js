function starCard(res,email) {
	$("#chPay").nextAll().remove();
	let trTag = '<tr><th class="table-active">스타벅스 카드</th>'
	+ '<td><div class="form-group"><label for="sel1">카드이름:</label>'
	+ '<select class="form-control" id="sel" name="gname">';
	for (let gname of res) {
		trTag += '<option value="'+gname.gname+'" class="gvoVal">'+gname.gname+'</option>';
	}
	trTag += '</select><p id="gnum"></p><p>잔액 : <span id="gprice"></span>원</p>'
		+'<p>결제 후 잔액 : <span id="payPrice">0</span>원</p></div></td></tr>'
		+'<tr><th colspan="2"><a href="#" id="payBt" class="tpayBtn">결제하기</a></th></tr>';
	$("#chPay").after(trTag);
	let selVal = $("#sel option:selected").val();
	getCinfo(email, selVal,totalPrice);
}

function getCinfo(email, selVal) {
	let totalPrice = $("#totalPrice").text();
	console.log("totalPrice: "+totalPrice);
	$.getJSON("/gcard/getGnum/"+selVal+"/"+email+".json", function(result){
	    $("#gnum").text(result.gnum);
	    $("#gprice").text(result.gprice);
	    $("#payPrice").text(Number($("#gprice").text())-Number(totalPrice));
	}).fail(function(){
	});
}

function bank() {
	$("#chPay").nextAll().remove();
	let trTag = '<tr><th class="table-active">무통장 입금</th>'
		+ '<td><div class="form-group"><label for="sel1">은행선택:</label>'
		+ '<select class="form-control" id="sel2" name="gname">'
		+'<option class="gvoVal" selected>은행선택</option>'
		+'<option value="신한" class="gvoVal">신한은행</option>'
		+'<option value="국민" class="gvoVal">국민은행</option>'
		+'<option value="우리" class="gvoVal">우리은행</option>'
		+'</select></div><p>계좌번호 : <input id="bnkNum" name="bnkNum" size="15" readonly></p></td></tr>'
		+'<tr><th colspan="2"><a href="#" id="payBt" class="tpayBtn">결제하기</a></th></tr>';
	$("#chPay").after(trTag);
	
}

function ranNum(bVal) {
	let ran = Math.random();
	let num1 = 0;
	let num2 = 0;
	let num3 = 0;
	
	if (bVal == "신한") {
		num1 = "110";
		num2 = Math.floor( ran * 100 );
		if (num2 < 10) {
			num2 = "00"+num2;
		}else if (num2 < 100 || num2 > 10) {
			num2 = "0"+num2;
		}
		num3 = Math.floor( ran * 100000 );
		if (num3 < 10) {
			num3 = "00000"+num3;
		}else if(num3 < 100){
			num3 = "0000"+num3;
		}else if (num3 < 1000) {
			num3 = "000"+num3;
		}else if (num3 < 10000) {
			num3 = "00"+num3;
		}else if (num3 < 100000) {
			num3 = "0"+num3;
		}
	} else if (bVal == "국민") {
		num1 = 54523;
		num2 = Math.floor(ran*10);
		if (num2 < 10) {
			num2 = "0"+num2;
		}
		num3 = Math.floor(ran * 10000);
		if(num3 < 10){
			num3 = "0000"+num3;
		}else if (num3 < 100) {
			num3 = "000"+num3;
		}else if (num3 < 1000) {
			num3 = "00"+num3;
		}else if (num3 < 10000) {
			num3 = "0"+num3;
		}
	} else if (bVal == "우리") {
		num1 = 2678;
		num2 = Math.floor(ran*10);
		if (num2 < 10) {
			num2 = "0"+num2;
		}
		num3 = Math.floor( ran * 100000 );
		if (num3 < 10) {
			num3 = "00000"+num3;
		}else if(num3 < 100){
			num3 = "0000"+num3;
		}else if (num3 < 1000) {
			num3 = "000"+num3;
		}else if (num3 < 10000) {
			num3 = "00"+num3;
		}else if (num3 < 100000) {
			num3 = "0"+num3;
		}
	}
	let bankNum = num1+"-"+num2+"-"+num3;
	if (bVal == "은행선택") {
	$("#bnkNum").val("");
	} else {
	$("#bnkNum").val(bankNum);
	}
}

function cCard() {
	$("#chPay").nextAll().remove();
	let trTag = '<tr><th class="table-active">카드결제</th>'
		+'<td><p>신용카드 결제</p></td></tr>'
		+'<tr><th colspan="2"><a href="#" id="payBt" class="tpayBtn">결제하기</a></th></tr>';
	
	$("#chPay").after(trTag);
}


function winopoen(fromid) {
	let w = 400;
	let h = 480;
	let x = (window.screen.width / 2) - (w / 2);
	let y = (window.screen.height / 2) - (h / 2);
	
    let uri = "/torder/Creditcard";
    let popupName = "popwin";
    let options = "width="+w+" , height="+h+" , top="+y+" , left="+x;
     
    openDialog(uri, popupName, options, function(win) {
        fromid.submit();
    });

    
}

function openDialog(uri, name, options, closeCallback) {
    let win = window.open(uri, name, options);
    let interval = window.setInterval(function() {
        try {
            if (win == null || win.closed) {
                window.clearInterval(interval);
                closeCallback(win);
            }
        }
        catch (e) {
        }
    }, 500);
    return win;
};


function paysubmit() {
	let tbgnoVal ='';
    let tpriceVal ='<input type="hidden" name="tprice" value="';
    let tprice = '';
    let tamountVal ='<input type="hidden" name="tamount" value="';
    let tamount = '';
    let tnameVal ='<input type="hidden" name="tname" value="';
    let tname = '';
    
      for (let i = 0; i < $(".tbagno").length; i++) {
          
          tbgnoVal = $(".tbagno").eq(i).val();
          tprice += tpriceVal+$(".tprice").eq(i).text()+'">';
          tamount += tamountVal+$(".tumAmount").eq(i).text()+'">';
          tname += tnameVal+$(".tumName").eq(i).text()+'">';
          
      }
      
    $("#payForm").append(tbgnoVal);
    $("#payForm").append(tprice);
    $("#payForm").append(tamount);
    $("#payForm").append(tname);
    $("#payForm").attr("action","/torder/other");
}



