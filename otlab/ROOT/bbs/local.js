function goSave(){
	if (f.txtBstitle.value == ""){
		alert("�������� �Է��� �ּ���");
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