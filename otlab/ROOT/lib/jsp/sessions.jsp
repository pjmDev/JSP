<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
 
<%!


public void chksession(javax.servlet.jsp.JspWriter __out){
	try{
		javax.servlet.jsp.JspWriter _out = null;
		_out = __out;
		//if(session.getAttribute("usid").equals("")){
			_out.print("<script> alert('로그인을 하시기바랍니다'); history.back;</script>"); 
			//}
		
		}
		catch(Exception e){
		
		}
		}

public boolean chksessionbbs(String auth){
	boolean ret = false;
		if(auth == "_admin"){
		ret = true;
		}
		return ret;
		}

}

%>

