<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/header.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>


<%
	
	mDB db = new mDB(out);

	String strSQL = "select * from tb_bbs where bsseq = '"+request.getParameter("bsseq")+"' ";
	mRS rs = new mRS(db, strSQL);
	if(rs.next()){
		strSQL = "delete from tb_bbs where bsseq = "+request.getParameter("bsseq")+" ";
	if (!db.execute(strSQL)) {
		db.rollback();
		return;
		}
	String bsseq = getPara(request, "bsseq");
	
	String filePath ;
	String filename;
		strSQL = "select * from tb_bbs_attf where atbsseq = '"+bsseq+"' ";
		rs = new mRS(db, strSQL);
	try {
		while(rs.next()){
		filename = rs.f("atfilename");
		filePath = request.getRealPath("data/file/"+filename); //파일이 존재하는 실제경로
		File f = new File(filePath);
		f.delete();
		}
		
		strSQL = "delete from tb_bbs_attf where atbsseq = '"+bsseq+"' ";
		if (!db.execute(strSQL)) {
			db.rollback();
			return;
		}
		
		db.commit();
		rs.close();
		db.close();
		
	}
	catch(Exception e){
	}
		out.print("Err" + e);
		return;
	}
	
	else {
		out.print("Err" + " 항목이 존재하지 않습니다.");
		return;
	}

%>
	<form name='f' method='POST'>
	</form>
	
	<script>
		alert("삭제되었습니다.");
		f.target='_self';
		f.action = "list.jsp?bsnumber="+<%=getPara(request,"bsnumber")%>+"&bstype="+<%=getPara(request,"bstype")%> ;
		f.submit();
	</script>	
	
<%@include file="/lib/jsp/footer.jsp"%>
