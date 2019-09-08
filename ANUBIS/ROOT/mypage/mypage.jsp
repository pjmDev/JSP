<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>
<%@include file="/lib/jsp/public.jsp"%>
<%@include file="/lib/jsp/header.jsp"%>
<%@include file="/lib/jsp/session.jsp"%>
<script>
	function goMenu(lonum){
		f.lonum.value = lonum;
		f.target='_self';
		f.action='mypage.jsp?lonum='+f.lonum.value;
		f.submit();
	}
	
	function goInfo(lonum){
		//this.txtLoname.value = txtLoname;
		f.lonum.value = lonum;
		var url = "m_view.jsp?lonum="+f.lonum.value;
		window.open(url, "info", "width=400px height=600px scrollbars=yes");
	}
	function goWrite(lonum){
		f.lonum.value = lonum;
		f.target='_self';
		f.action='write.jsp?lonum='+f.lonum.value;
		f.submit();
	}
		function goDelete(lonum){
		f.lonum.value = lonum;
		f.target='_self';
		f.action='delete.jsp?lonum='+f.lonum.value;
		f.submit();
	}
	</script>

<%
	chksession(out, (String) session.getAttribute("mbemail"));
	%>
	<form name="f" method="get">
	<div style="width:900px; overflow:hidden; margin:auto;" >
		<%
	mDB db = new mDB(out);
	
	top_menu2(out,"내 사업장", 1, "1");
	left_menu(out, db, (String) session.getAttribute("mbemail"));

%>
	<input type="hidden" name="lonum" value="<%=getPara(request,"lonum")%>" />
	<div style="float:left;">
	<% 
	String strSQL = "select * from tb_menu where menuemail =  " + session.getAttribute("mbemail") + " order by menuname";
	mRS rs = new mRS(db, strSQL);
	rs.next();
	
	rs.close();
	%>
	
	<% 
	
	strSQL = "select * from tb_location where lonum = "+ getPara(request,"lonum");
	rs = new mRS(db, strSQL);
	rs.next();
	top_menu2(out,rs.f("loname"), 2, rs.f("lonum")); 
	%>
</div>
<div style="width:630px; margin-left:10px; float:left;">
<table table width="630px" cellpadding="10px" border="1">
	<tr>
		<td align="center" bgcolor="#efefef" style="width:25%;">사업장명</td> <td style="width:25%;"><%=rs.f("loname") %></td> <td align="center" bgcolor="#efefef" style="width:25%;">오픈여부</td> <td style="width:25%;"><%=rs.f("loopen") %></td>
	</tr>
	<tr>
		<td align="center" bgcolor="#efefef" style="width:25%;">대표</td> <td style="width:25%;"><%=rs.f("lohuname") %></td> <td align="center" bgcolor="#efefef" style="width:25%;">업종</td> <td style="width:25%;"><%=rs.f("loscate") %></td>
	</tr>
		<tr>
	<td align="center" bgcolor="#efefef" >대표사진</td> 
	<%
				String strSQL2 = "select * from tb_location_attf where atbsseq = "+ getPara(request,"lonum") +" and atno = '1' ";
					mRS rs2 = new mRS(db, strSQL2);
										if(rs2.next()){
					%>
						<td style="text-align:left;" colspan="4">
						<img src="/data/file/<%=rs2.f("atfilename")%>" width="100%" style="padding:0;" />
						</td>				
					<%
					}
				else{
					out.print("<td style='text-align:left;' colspan='4'>");
						out.print("이미지가 없습니다.");
						out.print("</td>");
					}
				%>
		<% rs2.close(); %>
	</tr>
	<tr>
		<td align="center" bgcolor="#efefef">전화</td> <td colspan="3"><%=rs.f("lohp") %></td>
	</tr>
	<tr>
		<td align="center" bgcolor="#efefef" colspan="4">상세정보</td>
	</tr>
	<tr>
		<td colspan="4"><%=rs.f("lotext") %></td>
	</tr>
	<tr>
		<td align="center" bgcolor="#efefef" colspan="4">사업장사진</td>
	</tr>
	<tr>
		<%
					strSQL2 = "select * from tb_location_attf where atbsseq = "+ getPara(request,"lonum") +" and atno = '2' ";
					rs2 = new mRS(db, strSQL2);
					if(rs2.next()){
					%>
						<td style="text-align:left;" colspan="4">
						<img src="/data/file/<%=rs2.f("atfilename")%>" width="100%" style="padding:0;" />
						</td>				
					<%
					}
				else{
					out.print("<td style='text-align:left;' colspan='4'>");
						out.print("이미지가 없습니다.");
						out.print("</td>");
					}
				%>
		</tr>
		<% rs2.close(); %>
	<tr>
		<%
					strSQL2 = "select * from tb_location_attf where atbsseq = "+ getPara(request,"lonum") +" and atno = '3' ";
					rs2 = new mRS(db, strSQL2);
					if(rs2.next()){
					%>
						<td style="text-align:left;" colspan="4">
						<img src="/data/file/<%=rs2.f("atfilename")%>" width="100%" style="padding:0;" />
						</td>				
					<%
					}
				else{
					out.print("<td style='text-align:left;' colspan='4'>");
						out.print("이미지가 없습니다.");
						out.print("</td>");
					}
				%>
		</tr>
		<% rs2.close(); %>
	<tr>
		<%
					strSQL2 = "select * from tb_location_attf where atbsseq = "+ getPara(request,"lonum") +" and atno = '4' ";
					rs2 = new mRS(db, strSQL2);
					if(rs2.next()){
					%>
						<td style="text-align:left;" colspan="4">
						<img src="/data/file/<%=rs2.f("atfilename")%>" width="100%" style="padding:0;" />
						</td>				
					<%
					}
				else{
					out.print("<td style='text-align:left;' colspan='4'>");
						out.print("이미지가 없습니다.");
						out.print("</td>");
					}
				%>
	
		</tr>
		<% rs2.close(); %>
	<tr>
		<td align="center" bgcolor="efefef">모바일 화면보기</td><td colspan="3"><input type="button" onclick="goInfo('<%=getPara(request,"lonum")%>');" value="보기" style="width:100px;" /></td>
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
