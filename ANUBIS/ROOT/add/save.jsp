<%@include file="/lib/jsp/db.jsp"%>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<script src="local.js" type="text/javascript" charset='utf-8'></script>
	<form name="f" method="POST">
<%
	request.setCharacterEncoding("utf-8");
	mDB db = new mDB(out);
		
	
	boolean IsFound = true;
	String strSQL = "select * from tb_location where lonum = "+getPara(request, "lonum") ;
	mRS rs = new mRS(db, strSQL);
	if(rs.next()){
	IsFound = false;
	}
	rs.close();
	

if(IsFound){
	
	strSQL  = "insert into tb_location ";
	strSQL += "(";
	strSQL += "loname, lobcate, loscate, lolat, lolong, lohp, loemail, lohuname ";
 	strSQL += ") ";
	strSQL += "values ";
	strSQL += "(";
	strSQL += " '"+getPara(request,"txtLoname")+"', ";
	strSQL += " '"+getPara(request,"selLobcate")+"', ";
	strSQL += " '"+getPara(request,"selmcate")+"', ";
	//strSQL += " '"+getpara(request,"selscate")+"', ";
	strSQL += " '"+getPara(request,"txtLolat")+"', ";
	strSQL += " '"+getPara(request,"txtLolong")+"', ";
	strSQL += " '"+getPara(request,"txtLohp")+"', ";
	strSQL += " '"+(String) session.getAttribute("mbemail")+"', ";
	strSQL += " '"+getPara(request,"txtLohuname")+"' ";
  strSQL += ")";
  
}

else {
	
	strSQL  = "update tb_location set ";
	strSQL += "loname = '"+getPara(request,"txtLoname")+"', lobcate = '"+getPara(request,"selLobcate")+"', ";
 	strSQL += "lomcate = '"+getPara(request,"selmcate")+"', loscate = '"+getPara(request,"selscate")+"', ";
	strSQL += "lolat = '"+getPara(request,"txtLolat")+"', lolong = '"+getPara(request,"txtLolong")+"', ";
	strSQL += "lohp = '"+getPara(request,"txtLohp")+"', loemail = '"+(String) session.getAttribute("mbemail")+"' ";
	strSQL += " where lonum = '"+getPara(request,"lonum")+"'";
	
}
  out.print(strSQL);
 
 		if (!db.execute(strSQL)) {
			db.rollback();
			return;
		}
	%>
		</form>
	<%
		
		db.close();
		db = null;
	%>
<script>
	alert("저장되었습니다.");	
	f.target='_self';
	f.action='/mypage/mypage.jsp';
	f.submit();
</script>