﻿<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import="java.io.*"%>
<%@include file="/lib/jsp/db.jsp"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>


	<form name="f" method="post">
	
	
	<input type="text" name="bsseq" id="bsseq" value="<%=getPara(multi, "bsseq")%>" />
	<input type="text" name="bsnumber" id="bsnumber" value="<%=getPara(multi, "bsnumber")%>" />
	<input type="text" name="bstype" value="<%=getPara(multi, "bstype")%>">
<%
	request.setCharacterEncoding("utf-8");		
	MultipartRequest multi = null;
	int sizeLimit = 10 * 1024 * 1024 ; //10mb로 제한
	String savePath = request.getRealPath("data/file/");    
	try{
		multi=new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 
	}catch (Exception e) {
		e.printStackTrace();
	} 


	String atbsseq = getPara(multi, "atbsseq");
	String atno = getPara(multi, "atno");
	String filename = getPara(multi, "atfilesname");   
	String filePath = request.getRealPath("data/file/"+filename); //파일이 존재하는 실제경로

	try {
   File f = new File(filePath);
   if(f.exists()){ 
   f.delete();
   
	mDB db = new mDB(out);
		String strSQL = "delete from tb_bbs_attf where atbsseq = '"+atbsseq+"' and atno = '"+atno+"' ";
	out.print(strSQL);
	if (!db.execute(strSQL)) {
		db.rollback();
		return;
		}
   db.commit();
   db.close();
   %>
   <script language='javascript'>
   alert('파일이 삭제되었습니다.'); 
   f.target='_self'; 
   f.action='write.jsp' 
   f.submit();
   </script>
   <%
   }
 		else{
 	    response.setContentType("text/html;charset=UTF-8");             
      out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");           
      }
   }
   	catch(Exception e){
	}
	
	
%>

</form>




