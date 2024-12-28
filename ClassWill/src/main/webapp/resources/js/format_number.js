/*
* 금액 포맷팅 js 파일
*/



function formatTolocaleString(selector, locale) {
	debugger;
	let elementText = $(selector).text();
	let number = parseInt(elementText);
	
	
	//숫자로 변환할 수 없느 경우 처리
	if(isNaN(number)) {
		console.error("유효한 데이터타입이 아닙니다." + elementText);
	}
	
	$(selector).text(number.toLocaleString(locale));
	console.log($(selector).text(number.toLocaleString(locale)));
}


