<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
 
<%!


public void chksession(javax.servlet.jsp.JspWriter __out, String usid){
	try{
		javax.servlet.jsp.JspWriter _out = null;
		_out = __out;
		if(usid == null){
			usid = "";
		}		
		if(usid.equals("")){
			_out.print("<script> alert('로그인을 하시기바랍니다'); location.href='/login/login.jsp';</script>"); 
			}
		}
	catch(Exception e){
	}
}

public boolean chksessionbbs(String usauth){
	boolean ret = false;
	if(usauth == null){
		usauth = "";
	}
	if(usauth.equals("_admin") || usauth.equals("_user")){
		ret = true;
	}
	return ret;
}
%>

