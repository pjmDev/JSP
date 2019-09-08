<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/header.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>
<script>
	function goJoin(){
		f.target="_self";
		f.action="joinsave.jsp";
		f.submit();
	}
	</script>
	<form name="f" method="post">
		<center>
			<table style="width:1000px;">
			<h3 style="text-align:left;">회원가입</h3>
			이름<input type="text" name="txtName" id="txtName" style="margin-top:10px; margin-left:50px; width:150px;"  /><br />
			ID <input type="text" name="txtUsid" id="txtUsid" style="margin-top:10px; margin-left:60px; width:150px;" /><br />
			Password<input type="password" name="txtPassword" id="txtPassword" style="margin-top:10px; margin-left:10px; width:150px;"  /><br />
			<input type="button" name="join" id="join" value="회원가입" style="margin-top:10px;" onclick="goJoin();" />
			</table>
		</center>
	</form>
<%@include file="/lib/jsp/footer.jsp"%>