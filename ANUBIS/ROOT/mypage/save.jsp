<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<script src="local.js" type="text/javascript" charset='utf-8'></script>
	<form name="f" method="POST">
<%
	request.setCharacterEncoding("utf-8");
	MultipartRequest multi = null;
	int sizeLimit = 10 * 1024 * 1024 ; //10mb로 제한
	String savePath = request.getRealPath("data/file");    
	
try{
		multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 
	}catch (Exception e) {
		e.printStackTrace();
	} 

	String bsseq = getPara(multi, "lonum");
	String bstitle = getPara(multi, "txtBstitle");
	mDB db = new mDB(out);
		
	
	boolean IsFound = true;
	String strSQL = "select * from tb_location where lonum = "+getPara(multi, "lonum") ;
	mRS rs = new mRS(db, strSQL);
	if(rs.next()){
	IsFound = false;
	}
	rs.close();
	

if(IsFound){
	
	strSQL  = "insert into tb_location ";
	strSQL += "(";
	strSQL += "loname, lohuname, loscate, lohp, lotext ";
 	strSQL += ") ";
	strSQL += "values ";
	strSQL += "(";
	strSQL += " '"+getPara(multi,"txtLoname")+"', ";
	strSQL += " '"+getPara(multi,"txtLohuname")+"', ";
	strSQL += " '"+getPara(multi,"txtLoscate")+"', ";
	strSQL += " '"+getPara(multi,"txtLohp")+"', ";
	strSQL += " '"+getPara(multi,"txtLotext")+"', ";
  strSQL += ")";
  
  
  bsseq = GetLastDbKey(db);
}

else {
	
	strSQL  = "update tb_location set ";
	strSQL += "loname = '"+getPara(multi,"txtLoname")+"', lohuname = '"+getPara(multi,"txtLohuname")+"', ";
 	strSQL += "loscate = '"+getPara(multi,"txtLoscate")+"', lohp = '"+getPara(multi,"txtLohp")+"', ";
	strSQL += "lotext = '"+getPara(multi,"txtLotext")+"' ";
	strSQL += " where lonum = '"+getPara(multi,"lonum")+"'";
	
	
}
  //out.print(strSQL);
 
 		if (!db.execute(strSQL)) {
			db.rollback();
			return;
		}
		
		
	DoAddAttf(out, multi, db, bsseq, "1", "1");	
	
	DoAddAttf(out, multi, db, bsseq, "2", "2");	
	
	DoAddAttf(out, multi, db, bsseq, "3", "3");	
	
	DoAddAttf(out, multi, db, bsseq, "4", "4");	
	%>
	
	
	
	<%!
public void DoAddAttf(javax.servlet.jsp.JspWriter out, MultipartRequest multi, mDB db, String bsseq, String num, String number) {
	try {
		if (multi.getFilesystemName("filename" + num) == null)
			return;
	
		String filename = multi.getFilesystemName("filename" + num);
		
		String strSQL = "select max(atno) as max_bsno from tb_location_attf where atbsseq = '"+bsseq+"' ";
		out.print("sql:" + strSQL);
		mRS rs = new mRS(db, strSQL);
		rs.next();
		int max_bsno = rs.intval("max_bsno") + 1;
		rs.close();
			
		out.println("<br>max" + max_bsno);
		
		strSQL = "insert into tb_location_attf ( atbsseq, atno , atfilename ) values ('"+bsseq+"', '"+max_bsno+"' , '"+filename+"' ) ";
		out.println(strSQL);
		if (!db.execute(strSQL)) {
			db.rollback();
			return;
		}
	}
	catch(Exception e){
	}
}

%>

		</form>
	<%
		
		db.close();
		db = null;
	%>
<script charset='utf-8'>
	alert("저장되었습니다.");	
	
	f.target='_self';
	f.action='/mypage/mypage.jsp?lonum='+<%=getPara(multi,"lonum")%>;
	f.submit();
</script>