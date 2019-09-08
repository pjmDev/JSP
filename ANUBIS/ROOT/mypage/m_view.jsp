<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>
<%@include file="/lib/jsp/public.jsp"%>
<%@include file="/lib/jsp/session.jsp"%>


<%
	//chksession(out, (String) session.getAttribute("mbemail"));
	%>
	
	
		<%
	mDB db = new mDB(out);

%>

	<div>
	<% 
	
	
	//top_menu2(out,"엑스칼리버", 2); 
	
	String strSQL = "select * from ";
	strSQL += " ( select * from  tb_location where lonum = '"+getPara(request,"lonum")+"' ) aa ";
	strSQL += " left outer join tb_location_attf bb on aa.lonum = bb.atbsseq ";
	mRS rs = new mRS(db, strSQL);
	rs.next();
	%>
</div>
<div style="width:100%; float:left;">
			<table width="100%" cellpadding="10px" border="1" border-collapse: collapse>
				<tr>
					<td align="center" bgcolor="#efefef" style="width:25%">사업장명</td> <td style="width:25%"><%=rs.f("loname")%></td> <td align="center" bgcolor="efefef" style="width:25%">오픈여부</td><td style="width:25%"><%=rs.f("loopen")%></td>
				</tr>
				<tr>
					<td align="center" bgcolor="#efefef">대표</td> <td><%=rs.f("lohuname")%></td> <td align="center" bgcolor="efefef">업종</td> <td><%=rs.f("loscate")%></td>
				</tr>
				<tr>
					<td colspan="4" style="padding:0;"><img src="/data/file/<%=rs.f("atfilename")%>" style="width:100%;" alt="main"/></td>
				</tr>
				<tr>
					<td align="center" bgcolor="#efefef">EVENT</td><td colspan="3">닭살볶음, 모듬튀김 Sale</td>
				</tr>
				<tr>
					<td align="center" bgcolor="#efefef">전화</td> <td colspan="3"><%=rs.f("lohp")%></td>
				</tr>
				<tr>
					<td colspan="4" align="center" bgcolor="efefef">상세정보</td>
				</tr>
				<tr>
					<td colspan="4"><%=rs.f("lotext")%></td>
				</tr>

				<tr>
					<td colspan="4" align="center" bgcolor="efefef">사업장사진</td>
				</tr>
				<%
				
				rs.close();	
					
					strSQL = "select * from tb_location_attf where atbsseq =  '" + getPara(request,"lonum") + "' order by atno";
					rs = new mRS(db, strSQL);
					int cnt=0;
					while(rs.next()){
						if(cnt>0){
					%>
					<tr>
						<td colspan="4" style="padding:0;"><img src="/data/file/<%=rs.f("atfilename")%>" style="width:100%; height:300px;" alt="main"/></td>
					</tr>
					<%
						}
						cnt++;
					}
					rs.close();	
					%>
			</table>
	</div>