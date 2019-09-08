<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/header.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>
<%@include file="/lib/jsp/session.jsp"%>
<%@ page import="java.io.*"%> 
<%@ page import="java.util.*" %> 
<script>
function goSave(){
	f.target = '_self';
	f.action = 'save.jsp';
	f.submit();
}
function goList(){
	f.target = '_self';
	f.action = 'list.jsp';
	f.submit();
}
function goAttfDelete(){
	f.target = '_self';
	f.action = 'attfDelete.jsp';
	f.submit();
}
</script>
<%
	chksession(out, (String) session.getAttribute("usid"));	
	String bsseq = getPara(request, "bsseq");
	String bsnumber = getPara(request,"bsnumber");
	String bstype = getPara(request, "bstype");
	mDB db = new mDB(out);
	
	String strSQL = "select * from tb_bbs where bsseq = '"+bsseq+"'";
	mRS rs = new mRS(db, strSQL);
	rs.next();
	
%>
<form name="f" method="post" enctype="multipart/form-data">
	<input type="hidden" name="bsseq" id="bsseq" value="<%=bsseq%>" />
	<input type="hidden" name="bsseq" id="bsseq" value="<%=bsseq%>" />
	<input type="hidden" name="bsnumber" id="bsnumber" value="<%=bsnumber%>" />
	<input type="hidden" name="bstype" id="bstype" value="<%=bstype%>" />
<center>
	<div>
	
		<table width="1000px">
			<tr>
				<th scope="row" style="background:#b3b3b3; border:1px solid #b3b3b3;">제목</label></th>
				<td><input type="text" id="txtBstitle" name="txtBstitle" style="width:100%;" value="<%=rs.f("bstitle")%>" ></td>
			</tr>
			
			<tr>
				<th scope="row" style="background:#b3b3b3; border:1px solid #b3b3b3;">내용</th>
				<td><textarea name="txtBstext" id="txtBstext" style="width:100%; height:300px;" ><%=rs.f("bstext")%></textarea></td>
			</tr>
			
			<tr>
				<th scope="row" style="background:#b3b3b3; border:1px solid #b3b3b3;">첨부파일</th>
				<td style="text-align:left;"><input type="file" name="filename1">
					<br /><input type="file" name="filename2">
					<br /><input type="file" name="filename3"></td>
			</tr>
		<tr>
		<th scope="row" style="background:#b3b3b3; border:1px solid #b3b3b3;">등록된 첨부파일
		</td>
		<td colspan="4" style="text-align:left; padding:5px 0; width:150px; height:15px;">
			
			<%
			rs.close();
			strSQL = "select * from tb_bbs_attf where atbsseq = '"+bsseq+"' ";
			rs = new mRS(db, strSQL);
		while(rs.next()){
		%>
		<input type="hidden" name="atbsseq" id="atbsseq" value="<%=rs.f("atbsseq")%>" />
		<input type="hidden" name="atno" id="atno" value="<%=rs.f("atno")%>" />
		<input type="hidden" name="atfilename" id="atfilename" value="<%=rs.f("atfilename")%>" />
		<% out.print(rs.f("atfilename"));  %>&nbsp;&nbsp;<input type="button" value="삭제" onclick="goAttfDelete();" /><br />
		
		<% } %>
		<td>
	</tr>
		</table>
		
		<div>
			<input type="button" value="취소" onclick="history.back();" />
			<input type="button" value="저장" onclick="goSave();" />
		</div>
		<%
		rs.close();
		db.close();
		%>
 </div>
</center>
	</form>
	
<%@include file="/lib/jsp/footer.jsp"%>
