<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/header.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>
<script>
	function chkLogIn(){
		f.target="_self";
		f.action="loginChk.jsp";
		f.submit();
		
	}
	</script>
<form name="f" method="post">
<center>
	<table style="width:1000px;">
		<h3 style="text-align:left;">로그인</h3>
		<div>ID <input type="text" name="txtUsid" id="txtUsid" style="margin-top:10px; margin-left:58px; width:150px;" onkeypress="if(event.keyCode==13) {chkLogIn();}" /></div>	
		<div>Password<input type="password" name="txtPassword" id="txtPassword" style="margin-top:10px; margin-left:10px; width:150px;"  onkeypress="if(event.keyCode==13) {chkLogIn();}" /> </div>
		<input type="button" name="login" id="login" value="로그인" style="margin-top:10px;" onclick="chkLogIn();" />
	</table>
</form>
	
</center>

<%@include file="/lib/jsp/footer.jsp"%>
