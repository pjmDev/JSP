<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>
<%@include file="/lib/jsp/public.jsp"%>
<%@include file="/lib/jsp/session.jsp"%>

	<script>
	function chkLogIn(){
		f.target="_self";
		f.action="/login/loginChk.jsp";
		f.submit();
		
	}
	</script>
	
<form name="f" method="post">
<center>
	<table style="width:1000px;">
		<br /><br /><br /><br />
		
		<img src="/data/image/logo.png" style="margin-top:100px;" />
		
		<div>E-mail<input type="text" name="txtUsid" id="txtUsid" style="margin-top:10px; margin-left:35px; width:150px;" onkeypress="if(event.keyCode==13) {chkLogIn();}" /></div>	
		<div>Password<input type="password" name="txtPassword" id="txtPassword" style="margin-top:10px; margin-left:10px; width:150px;"  onkeypress="if(event.keyCode==13) {chkLogIn();}" /> </div>
		<input type="button" name="login" id="login" value="로그인" style="margin-top:10px;" onclick="chkLogIn();" />
	</table>
</form>
	
</center>
	


