<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/header.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>
<%@include file="/lib/jsp/pubLogin.jsp"%>

	<form name="f" method="post">
	<%
	mDB db = new mDB(out);
	String usid = getPara(request, "txtUsid");
	String uspassword = getPara(request, "txtPassword");
	String usname = getPara(request, "txtName");
	String usph = getPara(request, "txtPhone");
	String usidload = null;
	
	if(usid == null || uspassword == null || usname == null )
		out.print("<script>alert('입력정보를 모두 입력해주세요.'); history.back; </script>");
	
	String strSQL = " SELECT usid from tb_user;";
	mRS rs = new mRS(db, strSQL);
	Boolean idoverl = false;
	while(rs.next()){
		usidload = rs.f("usid");
		if(usidload.equals(usid)){
		out.print("<script>");
		out.print("alert('중복 된 id가 있습니다.');");
		out.print("history.back();");
		out.print("</script>");
		idoverl = true;
		break;
		}
	}
	if(!idoverl){
		strSQL = " insert into tb_user ";
		strSQL+= " ( usid, uspassword, usname, usauth, uslevel, usip, usdate";
		if(!(usph==null)){
			strSQL+= ", usph";
		}
		strSQL+= ")";
		strSQL+= " values ";
		strSQL+= " ( '"+usid+"', '"+uspassword+"', '"+usname+"', '_user', 30, '"+getClientIP(request)+"', '2018-11-02 ";
		if(!(usph==null)){
			strSQL+= "', '"+usph;
		}
		strSQL+= "' )";
		out.print(strSQL);
		if (!db.execute(strSQL)) {
			db.rollback();
			return;
		}
		out.print("<script>");
		out.print("alert('회원가입이 완료되셨습니다.');");
		out.print("f.target = '_self';");
		out.print("f.action = '/index.jsp';");
		out.print("f.submit();");
		out.print("</script>");
	}
	rs.close();
	db.commit();
	db.close();
	%>
	</form>


<%@include file="/lib/jsp/footer.jsp"%>
