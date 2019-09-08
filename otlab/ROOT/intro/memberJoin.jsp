<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<%

Connection conn = null;
PreparedStatement pstmt = null;

String jdbc_driver = "com.mysql.jdbc.Driver";
String jdbc_url = "jdbc:mysql://iclab.andong.ac.kr/otlab_db";

try{
	Class.forName(jdbc_driver);
	conn = DriverManager.getConnection(jdbc_url,"root","1q2w3e4r!");
	
	String sql = "insert into jdbc_test values(?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,request.getParameter("username"));
	pstmt.setString(2,request.getParameter("id"));
	pstmt.setString(3,request.getParameter("password"));
	pstmt.setString(4,request.getParameter("email"));
	pstmt.setString(5,request.getParameter("ph"));
	pstmt.setString(6,request.getParameter("birth"));
	pstmt.setString(7,request.getParameter("studentnum"));
	pstmt.setString(8,request.getParameter("sex"));
	
	if(request.getParameter("username") != null){
		pstmt.executeUpdate();
	}
}
	catch(Exception e){
		System.out.println("1");
		System.out.println(e);
}
%>

<html>
<head><title>Member Join</title></head>
<body>
<center>
<H2>회원가입</H2>
<HR>

<form name=form1 method=post action=memberJoin.jsp>
<table border=1 >
<tr>
	<td>이름</td>
	<td><input type=text size=20 name=username></td>
</tr>
<tr>
	<td>아이디</td>
	<td><input type=text size=20 name=id></td>
</tr>
<tr>
	<td>비밀번호</td>
	<td><input type=text size=20 name=password></td>
</tr>
<tr>
	<td>학번</td>
	<td><input type=text size=20 name=studentnum></td>
</tr>
<tr>
	<td>전화번호</td>
	<td><input type=text size=20 name=ph></td>
</tr>
<tr>
	<td>이메일</td>
	<td><input type=text size=20 name=email></td>
</tr>
<tr>
	<td>생년월일</td>
	<td><input type="date" size=20 name=birth></td>
</tr>
<tr>
	<td>성별</td>
	<td>
<input type="radio" name=sex value="남">남
<input type="radio" name=sex value="여">여

</td>
</tr>
<tr><td colspan=2 align=center>
	<input type=submit value="등록">
	</td></tr>
</table> 
</form>
<HR>
</center>
# 등록 목록<P>
<%
	try{
		String sql = "select username,id,password,email,ph,birth,studentnum,sex from member";
		
		pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		int i=1;
		
		while(rs.next()) {
			out.println(i+" : "+rs.getString(1)+","+rs.getString("username")+"<BR>");
			i++;
		}
		
		rs.close();
		pstmt.close();
		conn.close();
	}

	catch(Exception e){
		System.out.println("2");
		System.out.println(e);
	}
%>
</body>
</html>