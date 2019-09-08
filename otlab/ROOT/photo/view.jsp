<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/header.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>
<%@include file="/lib/jsp/session.jsp"%>
<%@include file="/lib/jsp/public.jsp"%>

<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.lang.String" %>
<%@ page import="java.sql.*" %>
<script>
	function goWrite(){
		f.target='_self';
		f.action='write.jsp';
		f.submit();
	}
	function goList(){
		f.target='_self';
		f.action='list.jsp';
		f.submit();
	}
	function goDelete(){
		f.target='_self';
		f.action='delete.jsp';
		f.submit();
	}
	function onDownload(idx){
		var o = document.getElementBtId("ifm_filedown");
		o.src = "attfDownload.jsp?idx="+idx;
	}
	
	
	</script>
	
<form name="f" method="POST">

	<%
		top_menu(out,"포토게시판");		
		%>	
		
<table width="900px"  >
		
<%
	Gap(out, 1);
	String bsseq = getPara(request,"bsseq");

	mDB db = new mDB(out);
	String strSQL = "update tb_bbs set bshit = bshit+1 where bsseq = '"+bsseq+"' ";		
	
	if (!db.execute(strSQL)) {
	db.rollback();
	return;
	}
	db.commit();

	strSQL = "select * from tb_bbs where bsseq = '"+bsseq+"' ";

	mRS rs = new mRS(db, strSQL);
	String bsnumber = "";
	while(rs.next()){
	bsnumber = rs.f("bsnumber");
%>

<input type="hidden" name="bsnumber" id="bsnumber" value="<%=bsnumber%>" />
<input type="hidden" name="bstype" id="bstype" value="<%=getPara(request,"bstype")%>" />
<input type="hidden" name="bsseq" id="bsseq" value="<%=bsseq%>" />

<div style="width:900px; margin:auto; ">
<table width="900px" cellspacing="0">
	<tr>
		<td style="padding:5px 0; border-top:2px solid #666; border-bottom:1px solid #666; border-right:1px solid #666; width:150px; height:15px;">
			제&nbsp;목
		</td>
		<td colspan="3" style="text-align:left; padding:5px 0; border-top:2px solid #666; border-bottom:1px solid #666; width:850px; height:15px; padding-left:5px;">
			<% out.print(rs.f("bstitle")); %>
		</td>
	</tr>
	<tr>
		<td style="padding:5px 0; border-bottom:2px solid #666; border-right:1px solid #666; width:150px; height:15px;">
		 작성자
		</td>
		<td style="text-align:left; padding:5px 0; border-bottom:2px solid #666; width:350px; height:15px; padding-left:5px;">
			<% out.print(rs.f("bsusname")); out.print("<font font-size='0.5em'>("); out.print(rs.f("bssydt")); out.print(")<font>"); %>
		</td>
		<td style="padding:5px 0; border-left:1px solid #666; border-right:1px solid #666; border-bottom:2px solid #666; width:150px; height:15px;">
			조회수
		</td>
		<td style="text-align:left; padding:5px 0; border-bottom:2px solid #666; width:350px; height:15px; padding-left:5px;">
			<% out.print(rs.f("bshit")); %>
		</td>
	</tr>
	
	<tr>
		<td colspan="4" style="text-align:left; padding:5px 0; border-bottom:1px solid #666; width:150px; height:15px;">
		<% out.print(rs.f("bstext")+"<br />"); 
		
			strSQL = "select * from tb_bbs_attf where atbsseq = '"+bsseq+"' order by atno ";
			mRS rs2 = new mRS(db, strSQL);
			while(rs2.next()){
								
				if(chkExtension(rs2.f("atfilename"))){
					out.print("<img src='/data/photo/"+rs2.f("atfilename")+"' width='100%;' height='600px' /><br />");
				}
			}
			
			rs2.close();
		%>
		<td>
	</tr>
	<tr>
		<td style="padding:5px 0; border-right:1px solid #666; border-bottom:2px solid #666; width:150px; height:15px;">첨부파일
		</td>
		<td colspan="4" style="text-align:left; padding:5px 0; border-bottom:1px solid #666; border-bottom:2px solid #666; width:150px; height:15px; padding-left:5px;">
			
			<%
			rs.close();
			strSQL = "select * from tb_bbs_attf where atbsseq = '"+bsseq+"' order by atno ";
			rs = new mRS(db, strSQL);
		while(rs.next()){
		%>
		<a href="attfDownload.jsp?filename=<%= rs.f("atfilename") %>" ><% out.print(rs.f("atfilename"));  %></a><br />
		
		<% } %>
		<td>
	</tr>
		<%	}	%>
				</table>
		<div>
			<%
			out.print("<input type='button' value='목록' onclick='goList();' /> ");
			if(chksessionbbs((String) session.getAttribute("usauth")) ){
				out.print("<input type='button' value='수정' onclick='goWrite();' /> ");
				out.print("<input type='button' value='삭제' onclick='goDelete();' /> ");
			}
			rs.close();
			db.close();
			%>

		</div>
		</table>
	</div>
</form>
<%@include file="/lib/jsp/footer.jsp"%>

<%!
	public boolean chkExtension(String Extension){
	try{
		boolean ret = false;
		//int leng;
		
		String word1 = Extension.split("[.]")[0];
		String word2 = Extension.split("[.]")[1];
		String[] Exten = {"jpg", "png", "peg", "gif", "jpeg"};
		//leng = Extension.length();
		for(int i=0; i<Exten.length; i++){
			if(word2.equals(Exten[i])){
				ret = true;
				return ret;
			}
		}
		return ret;
	}
	catch(Exception e){ return false; }
	}
%>

<!--if(Exten[i].equals(Extension.substring( leng-3, leng ))){-->