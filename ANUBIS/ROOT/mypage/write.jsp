<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>
<%@include file="/lib/jsp/public.jsp"%>
<%@include file="/lib/jsp/header.jsp"%>
<%@include file="/lib/jsp/session.jsp"%>
<%@ page import="java.io.*"%> 
<%@ page import="java.util.*" %> 

<script>
	function goMenu(lonum){
		f.lonum.value = lonum;
		f.target='_self';
		f.action='mypage.jsp?lonum='+f.lonum.value;
		f.submit();
	}
	function goSave(){
		f.target='_self';
		f.action='save.jsp';
		f.submit();
	}
		
	</script>

<%
	chksession(out, (String) session.getAttribute("mbemail"));
	%>
	<form name="f" method="post" enctype="multipart/form-data">
		<input type="hidden" name="lonum" value="<%=getPara(request,"lonum")%>" />
		<input type="hidden" name="atfilename" value="<%=getPara(request,"atfilename")%>" />
		<input type="hidden" name="atno" value="<%=getPara(request,"atno")%>" />
		<input type="hidden" name="atbsseq" value="<%=getPara(request,"atbsseq")%>" />
	<div style="width:900px; overflow:hidden; margin:auto;" >
		<%
	mDB db = new mDB(out);
	
	top_menu2(out,"내 사업장", 1, "1");
	left_menu(out, db, (String) session.getAttribute("mbemail"));

%>
	
	<div style="float:left;">
	<% 
	
	String strSQL = "select * from tb_location where lonum = "+ getPara(request,"lonum");
	mRS rs = new mRS(db, strSQL);
	rs.next();
	top_menu3(out,rs.f("loname"), 2, rs.f("lonum")); 
	
	%>
</div>
<div style="width:630px; margin-left:10px; float:left;">
			<table width="630px" cellpadding="10px" border="1" border-collapse: collapse>
				<tr>
					<td align="center" bgcolor="#efefef" style="width:25%;">사업장명</td> 
					<td style="width:25%;"><input type="text" name="txtLoname" value="<%=rs.f("loname")%>" /></td> 
					
					
					<td align="center" bgcolor="efefef" style="width:25%;">오픈여부</td> 
					<td></td>
				</tr>
				<tr>
					<td align="center" bgcolor="#efefef">대표</td> 
					<td><input type="text" name="txtLohuname" value="<%=rs.f("lohuname")%>" /></td> 
					<td align="center" bgcolor="#efefef">업종</td> 
					<td><input type="text" name="txtLoscate" value="<%=rs.f("loscate")%>" /></td>
				</tr>
				
				<tr>
					<td align="center" bgcolor="#efefef">대표사진</td>
					<td style="text-align:left;" colspan="3">
						<input type="file" name="filename1" />
						</td>
				</tr>
				
				<tr>
					<td align="center" bgcolor="#efefef">전화</td> 
					<td colspan="3"><input type="text" name="txtLohp" value="<%=rs.f("lohp")%>" style="width:120px;" /></td>
				</tr>
				<tr>
					<td colspan="4" align="center" bgcolor="#efefef">상세정보</td>
				</tr>
				<tr>
					<td colspan="4"><textarea name="txtLotext" style="width:100%; height:250px;" /><%=rs.f("lotext")%></textarea></td>
				</tr>
			
				<tr>
					<td colspan="4" align="center" bgcolor="#efefef">사업장사진</td>
				</tr>
				<tr>
					<td colspan="4"><input type="file" name="filename2" /></td>
				</tr>
				<tr>
					<td colspan="4"><input type="file" name="filename3" /></td>
				</tr>
				<tr>
					<td colspan="4"><input type="file" name="filename4" /></td>
				</tr>
				
			</table>
	</div>
</div>
</form>
<%
	rs.close();
	
	db.close();
%>
<%@include file="/lib/jsp/footer.jsp"%>
