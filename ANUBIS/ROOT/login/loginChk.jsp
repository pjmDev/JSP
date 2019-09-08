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
	<%
	mDB db = new mDB(out);
	String mbemail = getPara(request, "txtUsid");
	String mbpassword = getPara(request, "txtPassword");
	String mbname = "";
	String mbnum = "";
	String mbauth = "";
	
	String strSQL = "select * from tb_member where mbemail = '"+mbemail+"' and mbpassword = '"+mbpassword+"' ";
	mRS rs = new mRS(db, strSQL);
	boolean usidchk = false;
	while(rs.next()){
	usidchk = true;
	mbnum = rs.f("mbnum");
	mbname = rs.f("mbname");
	mbauth = rs.f("mbauth");
	}
	
	
	if(usidchk){
		session.setAttribute("mbemail", mbemail);
		session.setAttribute("mbname", mbname);
		session.setAttribute("mbauth", mbauth);
		response.sendRedirect("/mypage/mypage.jsp");
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
