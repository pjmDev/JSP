<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/header.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>

	<form name="f" method="post">
	<%
	mDB db = new mDB(out);
	String usid = getPara(request, "txtUsid");
	String uspassword = getPara(request, "txtPassword");
	String usname = getPara(request, "txtName");
	
	if(usid == null || uspassword == null || usname == null )
		out.print("<script>alert('입력정보를 모두 입력해주세요.'); history.back; </script>");
	
	String strSQL = " insert into tb_user (usid, uspassword, usname, usauth) values ( '"+usid+"', '"+uspassword+"', '"+usname+"', '_user' ) ";
	if (!db.execute(strSQL)) {
			db.rollback();
			return;
		}
	db.commit();
	db.close();
	%>
	</form>
<script>
	alert("회원가입이 완료되셨습니다.");
	f.target = "_self";
	f.action = "/index.jsp";
	f.submit();
	</script>

<%@include file="/lib/jsp/footer.jsp"%>
