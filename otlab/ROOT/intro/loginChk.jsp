<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>

<form name="f" method="post">
	<%
	mDB db = new mDB(out);
	String usid = getPara(request, "txtUsid");
	String uspassword = getPara(request, "txtPassword");
	String usname = "";
	String usauth = "";
	
	String strSQL = "select * from tb_user where usid = '"+usid+"' and uspassword = '"+uspassword+"' ";
	mRS rs = new mRS(db, strSQL);
	boolean usidchk = false;
	while(rs.next()){
	usidchk = true;
	usname = rs.f("usname");
	usauth = rs.f("usauth");
	}
	
	
	if(usidchk){
		session.setAttribute("usid", usid);
		session.setAttribute("usname", usname);
		session.setAttribute("usauth", usauth);
		response.sendRedirect("/intro/index.jsp");
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
%>
	
	
	
</form>
	
</center>


<%@include file="/lib/jsp/footer.jsp"%>
