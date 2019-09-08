﻿<%@ page language="java" contentType="text/html; charset=UTF-8" %>   
<%@ page import="java.io.*"%> 
<%@ page import="java.text.*" %> 
<%@ page import="java.lang.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.net.*" %>     
<%     
	request.setCharacterEncoding("UTF-8");         
	String savePath = request.getRealPath("/data/file/");    
	String filename = request.getParameter("filename") ;           // 서버의 실제 파일명
	String orgfilename = filename ;              
	
	
	InputStream in = null;     
	OutputStream os = null;     
	File file = null;     
	boolean skip = false;     
	String client = "";         
	
	try{                  

		try{
       file = new File(savePath, filename);             
       in = new FileInputStream(file);         
    }catch(FileNotFoundException fe){             
       skip = true;         
    }                         
    	   
    client = request.getHeader("User-Agent");           
    
    response.reset() ;        
    response.setContentType("application/octet-stream");       
    response.setHeader("Content-Description", "JSP Generated Data");             
    if(!skip){                             // IE             
    	if(client.indexOf("MSIE") != -1){                 
      	response.setHeader ("Content-Disposition", "attachment; filename="+new String(orgfilename.getBytes("KSC5601"),"ISO8859_1"));               
      }
      else{                 
      	orgfilename = new String(orgfilename.getBytes("utf-8"),"iso-8859-1");                   
      	response.setHeader("Content-Disposition", "attachment; filename=\"" + orgfilename + "\"");                 
      	response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");             
      }                             
          
    	response.setHeader ("Content-Length", ""+file.length() );                         
    	os = response.getOutputStream();             
    	byte b[] = new byte[(int)file.length()];             
    	int leng = 0;                           
    	while( (leng = in.read(b)) > 0 ){                 
    		os.write(b,0,leng);             
    	}
    	out.print("<form name='f' method='POST'>");
    	out.print("<input type='text' name='filesize' value='"+(int)file.length()+"' /> ");
    	out.print("<input type='text' name='savePath' value='"+savePath+"' /> ");
    	out.print("</form>");
    }
    else{             
    	response.setContentType("text/html;charset=UTF-8");             
      out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");           
    }                   
        
    in.close();         
    os.close();       
    }catch(Exception e){       
    	e.printStackTrace();     
    } 

%> 
