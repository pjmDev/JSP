<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/header.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>
<%@include file="/lib/jsp/pubLogin.jsp"%>
<script>
	function chkLogIn(){
		if(f.txtUsid.value == "" || f.txtUsid.value == null){
			alert("아이디와 패스워드를 입력해주세요");
			f.txtUsid.focus();
			return;
		}
		f.target="_self";
		f.action="loginChk.jsp";
		f.submit();
	}
	
	function goJoin(){
		f.target="_self";
		f.action="join.jsp";
		f.submit();
	}
</script>
<form name="f" method="post">

	<div style="width:550px; height:250px; padding:auto; border:1px solid #ccc; margin:auto; padding-left:250px ; padding-top:150px ; overflow:hidden; " >
		<div style="width:300px; overflow:hidden;">	
			<div style="float:left; overflow:hidden;">ID <br />
				Password
				</div>
			<div style="width:200px; float:left; padding-left:10px;">	
				<input type="text" name="txtUsid" id="txtUsid" style="width:150px;" onkeypress="if(event.keyCode==13) {chkLogIn();}" />	
				<input type="password" name="txtPassword" id="txtPassword" style="width:150px;"  onkeypress="if(event.keyCode==13) {chkLogIn();}" /> 
			</div>
			<div style="margin-top:10px; overflow:hidden; float:left; margin-left:60px;;">
				<input type="button" name="login" id="login" value="로그인" onclick="chkLogIn();" />
				<input type="button" name="login" id="login" value="회원가입" onclick="goJoin();" />
			</div>
		</div>
	</div>
	
</form>
	


<%@include file="/lib/jsp/footer.jsp"%>
