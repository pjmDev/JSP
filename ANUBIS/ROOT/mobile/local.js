//---------------------------
	function goSave(lonum){
		//this.txtLoname.value = txtLoname;
		f.lonum.value = lonum
		f.target='_self';
		f.action='save.php';
		f.submit();
	}

	function goWrite(){
		//this.txtLoname.value = txtLoname;
		alert("Write");
		f.target='_self';
		f.action='write.php';
		f.submit();
	}
	
	
	function goUpdate(lonum){
		//this.txtLoname.value = txtLoname;
		f.lonum.value = lonum;
		alert("Update");
		f.target='_self';
		f.action='write.php';
		f.submit();
	}
	
	
	function goDelete(lonum){
		//this.txtLoname.value = txtLoname;
		f.lonum.value = lonum;
		alert("Delete");
		f.target='_self';
		f.action='Delete.php';
		f.submit();
	}