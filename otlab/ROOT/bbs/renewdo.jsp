<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/header.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.net.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<%
	String newfilename ;
	
	Random rand = new Random();
	
	Calendar currentCalendar = Calendar.getInstance();
	
	request.setCharacterEncoding("utf-8");		
	
	MultipartRequest multi = null;
	
	int sizeLimit = 10 * 1024 * 1024 ; //10mb로 제한
	
	String savePath = request.getRealPath("/data/pac/temp/");    
	
	String savePaths = request.getRealPath("/data/pac/");    
	
	try{
		
	multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 

	//String fileName = multi.getFilesystemName("filename1");  
		
	Enumeration params = multi.getParameterNames();

	out.println("----------------------------");

	while (params.hasMoreElements()){
		String name = (String)params.nextElement();
		out.println(name + " : " +multi.getParameter(name));
	}
	System.out.println("----------------------------");
	}
	catch(Exception e){
	out.print("aa");
	}
	
%>
<form name="f" method="POST">
<%
	

	/*
	String newfilename ;
	Random rand = new Random();
	Calendar currentCalendar = Calendar.getInstance();
	request.setCharacterEncoding("utf-8");		
	MultipartRequest multi = null;
	int sizeLimit = 10 * 1024 * 1024 ; //10mb로 제한
	String savePath = request.getRealPath("/data/pac/temp/");    
	String savePaths = request.getRealPath("/data/pac/");    
	try{
		
		//out.print(fileName);
		//fileName = URLEncoder.encode(fileName);
		
	String strYear   = Integer.toString(currentCalendar.get(Calendar.YEAR));
	String strMonth  = Integer.toString(currentCalendar.get(Calendar.MONTH) + 1);
	String strDay   = Integer.toString(currentCalendar.get(Calendar.DATE));
	String strHour   = Integer.toString(currentCalendar.get(Calendar.HOUR_OF_DAY));
    String strMinute   = Integer.toString(currentCalendar.get(Calendar.MINUTE));
	String strSecond   = Integer.toString(currentCalendar.get(Calendar.SECOND));

	String strDate = strYear + strMonth + strDay + strHour + strMinute + strSecond;
	
	int nowplus = rand.nextInt(100000);
	String str_nowplus = Integer.toString(nowplus);
		newfilename = strDate + "_" + str_nowplus;
	int i = -1;
    i = fileName.lastIndexOf("."); // 파일 확장자 위치
    String realFileName = newfilename + fileName.substring(i, fileName.length());  //현재시간과 확장자 합치기
	
	File oldFile = new File(savePath + fileName);
	File newFile = new File(savePaths + realFileName);
	
	for(;;){
		boolean tf = oldFile.renameTo(newFile);
		if(tf == true){
			if(oldFile.exists()) oldFile.delete();
			break;
		}
	}

*/
%>	
<%!
public void DoAddAttf(javax.servlet.jsp.JspWriter out, MultipartRequest multi, mDB db, String bsseq, String realFileName, String originalfilename) {
	try {
		if (multi.getFilesystemName("filename1") == null)
			return;
	
		String filenames = multi.getFilesystemName("filename1");
		
		String strSQL = "select max(atno) as max_bsno from tb_bbs_attf where atbsseq = '"+bsseq+"' ";
		out.print("sql:" + strSQL);
		mRS rs = new mRS(db, strSQL);
		rs.next();
		int max_bsno = rs.intval("max_bsno") + 1;
		rs.close();
		
		out.println("<br>max" + max_bsno);
	
		strSQL = "insert into tb_bbs_attf ( atbsseq, atno , atfilename, atfilesname ) values ('"+bsseq+"', '"+max_bsno+"' , '"+originalfilename+"', '"+realFileName+"' ) ";
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

