<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/header.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>
<%@include file="/lib/jsp/session.jsp"%>
<%@include file="/lib/jsp/public.jsp"%>
<script>
	function goWrite(){
		f.target='_self';
		f.action='write.jsp';
		f.submit();
	}
	function goSearch(){
		f.target='_self';
		f.action='list.jsp';
		f.submit();
	}
</script>
<%
	chksession(out, (String) session.getAttribute("mbemail"));
%>
	<form name="f" method="GET">
		<%
		top_menu(out,mname(getPara(request,"bsnumber")));
		%>
			<input type="hidden" value="" />
			<input type="hidden" name="bstype" value="<%=getPara(request,"bstype")%>" />
			<input type="hidden" name="bsnumber" value="<%=getPara(request,"bsnumber")%>" />
			<center>
			<br />
		<table class="bbs" style="height:*;" cellspacing="0">
			<div style="width:900px; text-align:right;">
			<select name="selBsname" />
				<option value="bstitle">제목</option>
				<option value="bsusname">글쓴이</option>
			</select>
		<input type="text" name="txtSearch" id="txtSearch" value="<%=getPara(request, "txtSearch")%>" /> <input type="button" onclick="goSearch();" value="검색" />
		</div>
			
	<%
		mDB db = new mDB(out);
		String strSQL ="";
		if(getPara(request,"txtSearch") == null || getPara(request, "txtSearch") == ""){
			strSQL = "select *, date_format(bssydt,'%Y-%m-%d') as sydt from tb_bbs where bsnumber = '"+getPara(request,"bsnumber")+"' and bstype = '"+getPara(request,"bstype")+"' ";
		}
		else {
			strSQL = "select *, date_format(bssydt,'%Y-%m-%d') as sydt from tb_bbs where "+getPara(request, "selBsname")+" like '%"+getPara(request,"txtSearch")+"%' ";
			strSQL += "and bsnumber = '"+getPara(request,"bsnumber")+"' and bstype = '"+getPara(request,"bstype")+"'";
		}
		mRS rs = new mRS(db, strSQL);
		int no = 0;
		//out.print(strSQL);
	%>		
			<tr>
				<th scope="col" style='width:80px;' >순번</th>
				<th scope="col" style='width:*;'>제목</th>
				<th scope="col" style='width:100px;'>게시자</th>
				<th scope="col" style='width:120px;'>등록일자</th>
				<th scope="col" style='width:80px;'>조회수</th>
			</tr>
			
			<% 	while(rs.next()){
					no++;
					String seq = rs.f("bsseq"); %>
			<tr>
				<td style="text-align:center;"><% out.print(no); %></td>
				<td align='left'>
					<a href="view.jsp?bsseq=<%=seq%>&bsnumber=<%=getPara(request,"bsnumber")%>&bstype=<%=getPara(request,"bstype")%>" style='cursor:pointer;'><% out.print(rs.f("bstitle")); %></a></td>
				<td style="text-align:center;">
					<% out.print(rs.f("bsusname")); %>
				</td>
				<td style="text-align:center;">
					<% out.print(rs.f("sydt")); %>
				</td>
				<td style="text-align:center;"><% out.print(rs.f("bshit"));%></td>
			</tr>
			<%
			}
			rs.close();
			%>
		</table>
				<div width="1000px">
					<%
						if(chksessionbbs((String) session.getAttribute("mbauth"))){
						out.print("<input type='button' value='글쓰기' onclick='goWrite();' style='margin-top:10px;' />");
						}
						%>
			</div>
			</center>
		</form>
		
<%@include file="/lib/jsp/footer.jsp"%>