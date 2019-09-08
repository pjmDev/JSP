<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/header.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>
<%@include file="/lib/jsp/pubLogin.jsp"%>
<script>
	function goJoin(){
		if(f.txtName.value == "" || f.txtName.value == null){
			alert("이름을 입력하시기 바랍니다.");
			f.txtBstitle.focus();
			return;
		}else if(f.txtUsid.value == "" || f.txtUsid.value == null){
			alert("ID를 입력하시기 바랍니다.");
			f.txtBstitle.focus();
			return;
		}else if(f.txtPassword.value == "" || f.txtPassword.value == null){
			alert("비밀번호를 입력하시기 바랍니다.");
			f.txtBstitle.focus();
			return;
		}else if(f.txtPassword.value.length < 2){
			alert("비밀번호가 짧습니다.(8자리 이상)");
			f.txtBstitle.focus();
			return;
		}else if(f.txtPassword.value != f.txtPassword2.value){
			alert("비밀번호가 다릅니다.");
			f.txtBstitle.focus();
			return;
		}
		
		f.target="_self";
		f.action="joinsave.jsp";
		f.submit();
	}
	</script>
	<form name="f" method="post">
		<center>
		
			<div style="width:1000px;">
			<h3 style="text-align:left;">회원가입 <span style="text-align:left;  font-size:10px;">( *표시는 필수입력 사항입니다. )</span></h3>
			<span style="text-align:left; display:inline-block; width:120px;">ID *</span>
			<input type="text" name="txtUsid" id="txtUsid" style="margin-top:10px; margin-left:50px; margin-right:250px; width:150px;" /><br />
			
			<span style="text-align:left; display:inline-block; width:120px;">Password *</span>
			<input type="password" name="txtPassword" id="txtPassword" style="margin-top:10px; margin-left:50px; margin-right:250px; width:150px;"  /><br />
			
			<span style="text-align:left; display:inline-block; width:120px;">Password 확인 *</span>
			<input type="password" name="txtPassword2" id="txtPassword2" style="margin-top:10px; margin-left:50px; margin-right:250px; width:150px;"  /><br /><br /><br /><br />
			
			<span style="text-align:left; display:inline-block; width:120px;">이름 *</span>
			<input type="text" name="txtName" id="txtName" style="margin-top:10px; margin-left:50px; margin-right:250px; width:150px;"  /><br />
			
			<span style="text-align:left; display:inline-block; width:120px;">연락처</span>
			<input type="text" name="txtPhone" id="txtPhone" style="margin-top:10px; margin-left:50px; margin-right:250px; width:150px;"  /><br />
			<br /><br />
			<input type="button" name="join" id="join" value="회원가입" style="margin-top:10px;" onclick="goJoin();" />
			</div>
		</center>
	</form>
<%@include file="/lib/jsp/footer.jsp"%>