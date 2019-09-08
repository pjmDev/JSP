function goSave(){
	if (f.txtBstitle.value == ""){
		alert("글제목을 입력해 주세요");
		f.txtBstitle.focus();
		return;
	}
	
	f.target = '_self';
	f.action = 'save2.jsp';
	f.submit();
}
function goList(){
	f.target = '_self';
	f.action = 'list.jsp';
	f.submit();
}
function goAttfDelete(){
	f.target = '_self';
	f.action = 'attfDelete.jsp';
	f.submit();
}