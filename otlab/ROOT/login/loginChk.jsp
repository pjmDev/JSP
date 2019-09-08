<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>
<%@include file="/lib/jsp/pubLogin.jsp"%>

<form name="f" method="post">
	<%
	mDB db = new mDB(out);
	String usid = getPara(request, "txtUsid");
	String uspassword = getPara(request, "txtPassword");
	String usname = "";
	String usauth = "";
	int uslevel = 0;
	
	String strSQL = "select * from tb_user where usid = '"+usid+"' and uspassword = '"+uspassword+"' ";
	mRS rs = new mRS(db, strSQL);
	boolean usidchk = false;
	while(rs.next()){
	usidchk = true;
	usname = rs.f("usname");
	usauth = rs.f("usauth");
	uslevel = rs.intval("uslevel");
	}
	
	if(usidchk){
		session.setAttribute("usid", usid);
		session.setAttribute("usname", usname);
		session.setAttribute("usauth", usauth);
		session.setAttribute("uslevel", uslevel);
		
		response.sendRedirect("/intro/index.jsp");
		strSQL = " insert into tb_log ";
		strSQL += " ( usid, usip ) ";
		strSQL += " values ";
		strSQL += " ( '"+usid+"' , '"+getClientIP(request)+"' ) ";
		if (!db.execute(strSQL)) {
				db.rollback();
				return;
			}
	}
	else{
	%>
	<script>
		alert("아이디나 비밀번호를 확인해주세요");
		history.back();
		</script>
		
	<%
		}
	rs.close();
	rs=null;
	db.commit();
	db.close();
	db=null;
%>
	
	
	
</form>
	
</center>


<%@include file="/lib/jsp/footer.jsp"%>
