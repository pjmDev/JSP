<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/header.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>
<script>
	function chkLogIn(){
		f.target="_self";
		f.action="/";
		f.submit();
		
	}
	</script>
<form name="f" method="post">
<center>
	<div>ID <input type="text" name="usid" id="usid" style="margin-top:50px; margin-left:60px;" /></div>
	
	<div>Password<input type="password" name="usid" id="usid" style="margin-top:10px; margin-left:10px;"  onkeypress="if(event.keyCode==13) {chkLogIn();}" /> </div>
	<input type="button" name="login" id="login" value="로그인" style="margin-top:10px;" />
</form>
	
</center>
<%
	mDB db = new mDB(out);
	String strSQL = "select * from tb_test  ";
	mRS rs = new mRS(db, strSQL);
	while(rs.next()){
	}
	rs.close();
	
	
%>


<%@include file="/lib/jsp/footer.jsp"%>
