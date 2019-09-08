<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
 
<%!

public String getPara(HttpServletRequest req, String para_name) {
	if (req.getParameter(para_name) == null)
		return "";
	return req.getParameter(para_name);
}
public String getPara(MultipartRequest multi, String para_name) {
	if (multi.getParameter(para_name) == null)
		return "";
	return multi.getParameter(para_name);
}

public String GetLastDbKey(mDB db) {
	String ret = "";
	String strSQL = "select last_insert_id() as max_key ";
	mRS rs = new mRS(db, strSQL);
	if(rs.next()){
		ret = rs.f("max_key");
	}
	rs.close();
	return ret;
}


public class mDB {
	public Connection conn = null;
	public Statement stmt = null;
	public javax.servlet.jsp.JspWriter _out = null;

	mDB(javax.servlet.jsp.JspWriter __out){
		String DB_URL = "jdbc:mysql://dns_adress";
		String DB_USER = "/";
		String DB_PASSWORD="/";
		
		try {
			_out = __out;
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			stmt = conn.createStatement();
		}
		catch(Exception e){
		}
	}
	public void rollback() {
		try {
			conn.rollback();
		}
		catch(Exception e) {
		}
	}
	public void commit() {
		try {
			conn.commit();
		}
		catch(Exception e) {
		}
	}
	public boolean execute(String strSQL) {
		try {
			if(conn!=null) { 
				stmt.executeUpdate(strSQL);
			}
			return true;
		}
		catch(Exception e) {
			try {
				this._out.println(e);
				return false;
			}
			catch(Exception e2) {
				return false;
			}
		}
	}
	public void close() {
		try {
			if(conn!=null) { 
				conn.close(); 
				conn=null; 
			}
			if(stmt!=null) { 
				this.stmt.close(); 
				this.stmt=null; 
			}
		}
		catch(Exception e) {
		}
	}
}

public class mRS {
	ResultSet rs = null;
	
	mRS(mDB db, String strSQL){
		try {
			rs = db.stmt.executeQuery(strSQL);
		}
		catch(Exception e) {
		
		}
	}
	
	public boolean next() {	
		try {
			return this.rs.next();	
		}
		catch(Exception e) {
			return false;
		}
	}
	
	public String f(String col_name){
		try {
			return this.rs.getString(col_name);
		}
		catch(Exception e) {
			return "";
		}
	}
	public int intval(String col_name){
		try {
			return this.rs.getInt(col_name);
		}
		catch(Exception e) {
			return 0;
		}
	}
	
	public String fnbsp(String col_name){
		try {
			if(this.rs.getString(col_name) == null){
				return " ";
			}
			else{
				return this.rs.getString(col_name);
			}
		}
		catch(Exception e) {
			return e.toString();
		}
	}
	
	
	public void close() {
		try {
			if(rs!=null) {
				this.rs.close();
				this.rs=null;
			}
		}
		catch(Exception e) {
		}
	}
}

%>

