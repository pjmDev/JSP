<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/header.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<form name="f" method="POST">
<%
	request.setCharacterEncoding("utf-8");		
	MultipartRequest multi = null;
	int sizeLimit = 10 * 1024 * 1024 ; //10mb로 제한
	String savePath = request.getRealPath("data/file");    
	try{
		multi=new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 
	}catch (Exception e) {
		e.printStackTrace();
	} 

	String bsseq = getPara(multi, "bsseq");
	String bsnumber = getPara(multi, "bsnumber");
	String bstype = getPara(multi, "bstype");
	String bstitle = getPara(multi, "txtBstitle");

	mDB db = new mDB(out);
	boolean IsFound = false;
	String strSQL = "select * from tb_bbs where bsseq = '"+bsseq+"' ";
	//out.println("strSQL" + strSQL);
	mRS rs = new mRS(db, strSQL);
	if(rs.next()){
		IsFound = true;
	}
	rs.close();
	if(IsFound){
		strSQL = "update tb_bbs set bstitle='"+ getPara(multi, "txtBstitle")+"', bsopcd = '"+session.getAttribute("mbemail")+"' , bsopname = '"+session.getAttribute("mbname")+"', ";
		strSQL += " bstext='"+getPara(multi, "txtBstext")+"', bssydt=now() where bsseq = '"+bsseq+"' ";
		//out.println("<br>strSQL" + strSQL);
		if (!db.execute(strSQL)) {
			db.rollback();
			return;
		}
	}
	else{
		strSQL = "insert into tb_bbs ( bstitle, bsusid, bsusname , bstext , bswrdt , bssydt, bsnumber, bstype ) ";
		strSQL += "values ('"+getPara(multi, "txtBstitle")+"', '"+session.getAttribute("mbemail")+"' , '"+session.getAttribute("mbname")+"' ,'"+getPara(multi, "txtBstext")+"', now() , now(), '"+getPara(multi, "bsnumber")+"', 'b' )"; 
		
		//out.println("<br>strSQL" + strSQL);
		if (!db.execute(strSQL)) {
			db.rollback();
			return;
		}
		
		bsseq = GetLastDbKey(db);
	}
	
	DoAddAttf(out, multi, db, bsseq, "1");
	DoAddAttf(out, multi, db, bsseq, "2");
	DoAddAttf(out, multi, db, bsseq, "3");

/*
	String filename1 = multi.getFilesystemName("filename1");
	String filename2 = multi.getFilesystemName("filename2");
	String filename3 = multi.getFilesystemName("filename3");
	
	
	String title = multi.getParameter("txtBstitle"); 
	int count = 0; 
	String regip = request.getRemoteAddr();

	
	strSQL = "select max(atno) as max_bsno from tb_bbs_attf where atbsseq = '"+bsseq+"' ";
	out.println("sql:" + strSQL);
	rs = new mRS(db, strSQL);
	rs.next();
	int max_bsno = rs.intval("max_bsno") + 1;
	rs.close();
	
	out.println("<br>max" + max_bsno);
	

	strSQL = "insert into tb_bbs_attf ( atbsseq, atno , atfilename ) values ('"+bsseq+"', '"+max_bsno+"' , '"+filename1+"' ) ";
	out.println(strSQL);
	if (!db.execute(strSQL)) {
		db.rollback();
		return;
	}
	db.commit();
	db.close();
	*/

%>	
<%!
public void DoAddAttf(javax.servlet.jsp.JspWriter out, MultipartRequest multi, mDB db, String bsseq, String num) {
	try {
		if (multi.getFilesystemName("filename" + num) == null)
			return;
	
		String filename = multi.getFilesystemName("filename" + num);
		
		String strSQL = "select max(atno) as max_bsno from tb_bbs_attf where atbsseq = '"+bsseq+"' ";
		out.println("sql:" + strSQL);
		
		mRS rs = new mRS(db, strSQL);
		rs.next();
		int max_bsno = rs.intval("max_bsno") + 1;
		rs.close();
		
		//out.println("<br>max" + max_bsno);
	
		strSQL = "insert into tb_bbs_attf ( atbsseq, atno , atfilename ) values ('"+bsseq+"', '"+max_bsno+"' , '"+filename+"' ) ";
		//out.println(strSQL);
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
<script>
	f.target='_self';
	f.action='view.jsp?bsseq=<%=bsseq%>&bsnumber=<%=bsnumber%>&bstype=<%=bstype%>';
	f.submit();
</script>
<%@include file="/lib/jsp/footer.jsp"%>
