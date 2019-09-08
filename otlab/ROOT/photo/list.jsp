<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/header.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>
<%@include file="/lib/jsp/session.jsp"%>
<%@include file="/lib/jsp/public.jsp"%>

<script>
	function goWrite(){
		f.target='_self'
		f.action='write.jsp'
		f.submit();
	}
	function goSearch(){
		f.target='_self';
		f.action='list.jsp';
		f.submit();
	}
</script>
<%
	mDB db = new mDB(out);
	//chksession(out, (String) session.getAttribute("usid"));
	
	int totCnt = 0; // 게시물 전체 수  
	int totalPage = 0; // 총 페이지수  
	int pageCnt = 5;  // 한페이지에 보여질 게시물수  
	int pageGroup = 5; // 한페이지에 보여질 페이지 수  
	//int pageNo = 0;  // 현재페이지  
	int currentPage = (request.getParameter("pageNo")) == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));  
	//현재 화면에서 보여질 페이지의 스타트 번호  
	int startPageNum = currentPage % pageGroup == 0 ? (currentPage / pageGroup -1) * pageGroup + 1 : (currentPage / pageGroup) * pageGroup + 1;  
	int endPageNum = startPageNum + pageGroup; //현재 화면에서 보여질 페이지의 마지막 번호  
  
	int startRow = currentPage * pageCnt - pageCnt;   // Limit 시작  
	int endRow = pageCnt; 
	String strSQL = "";
	
	
	if(getPara(request,"txtSearch") == null || getPara(request, "txtSearch") == ""){
		strSQL = " select count(*) bscnt from tb_bbs where bsnumber='"+getPara(request,"bsnumber")+"' and bstype='"+getPara(request,"bstype")+"'";
		mRS rs = new mRS(db,strSQL);
		if(rs.next()) {

			totCnt = rs.intval("bscnt");
		}
		rs.close();
	}
	else{
		strSQL = " select count(*) bscnt from tb_bbs where "+getPara(request, "selBsname")+" like '%"+getPara(request,"txtSearch")+"%' ";
		strSQL += " and bsnumber = '"+getPara(request,"bsnumber")+"' and bstype = '"+getPara(request,"bstype")+"' ";
		mRS rs = new mRS(db,strSQL);
		if(rs.next()) {
			totCnt = rs.intval("bscnt");
		}
		rs.close();
	}
	
	
	totalPage = totCnt / pageCnt + (totCnt % pageCnt == 0 ? 0:1 );  
%>





		<form name="f" method="GET">
		<%
		top_menu(out,"포토게시판");
		%>
			<input type="hidden" name="bsnumber" value="<%=getPara(request,"bsnumber")%>">
			<input type="hidden" name="bstype" value="<%=getPara(request,"bstype")%>">
			<center>
			<br />
		<table style="width:900px;">
			<div style="width:900px; text-align:right;">
			<select name="selBsname" />
				<option value="bstitle">제목</option>
				<option value="bsusname">글쓴이</option>
			</select>
		<input type="text" name="txtSearch" id="txtSearch" value="<%=getPara(request,"txtSearch")%>" /> <input type="button" onclick="goSearch();" value="검색" />
		</div>
		<hr style="width:900px; " />
		
		<tr>
			<td></td><td></td><td></td><td></td>
		</td>
			
	<%
		
		int no = 0;
		String atfilename = "";
		if(getPara(request,"txtSearch") == null || getPara(request, "txtSearch") == ""){
			strSQL = "select * from (select *, date_format(bssydt,'%Y-%m-%d') as sydt from tb_bbs where bsnumber = '"+getPara(request,"bsnumber")+"' and bstype = '"+getPara(request, "bstype")+"') bs ";
			strSQL+= " left outer join (select * from tb_bbs_attf where atno = '1') at on bs.bsseq = at.atbsseq ";
			strSQL += " order by sydt desc limit "+startRow+", "+endRow+" ";
		}
		else {
			strSQL = "select * from (select *, date_format(bssydt,'%Y-%m-%d') as sydt from tb_bbs where "+getPara(request, "selBsname")+" like '%"+getPara(request,"txtSearch")+"%' and bsnumber = '"+getPara(request,"bsnumber")+"' and bstype = 'p') bs ";
			strSQL+= " left outer join (select * from tb_bbs_attf where atno = '1') at on bs.bsseq = at.atbsseq ";
			strSQL += " order by sydt desc limit "+startRow+", "+endRow+" ";
		}
		mRS rs = new mRS(db, strSQL);
	%>	
		<tr>
			<% 	while(rs.next()){
					String bsseq = rs.f("bsseq"); 
					%>
				<td width="170px">
			<span>
			<a href="view.jsp?bsseq=<%=bsseq%>&bsnumber=<%=getPara(request,"bsnumber")%>&bstype=<%=getPara(request,"bstype")%>" style='cursor:pointer;'><img src="/data/photo/<%=rs.f("atfilename")%>" width="150px" height="160px" border="0" /></a>
				<% out.print("<br />"+rs.f("bstitle"));%>
				<% out.print("<br />"+rs.f("sydt"));%>
			<span>
				</td>
			<%	
			if(no == 4){
					out.print("</tr>"); 
					out.print("<tr>");
					no = 0;}
			no++;
			}
			rs.close();
			%>
		</tr>
		</table>
		<%
		if( startPageNum - pageGroup > 0 )  
		    //out.println(startPageNum - pageGroup);  
		    out.println("<a href=list.jsp?bsnumber="+getPara(request,"bsnumber")+"&bstype="+getPara(request,"bstype")+"&txtSearch="+getPara(request,"txtSearch")+"&selBsname="+getPara(request,"selBsname")+"&pageNo=" + (startPageNum - 1) + ">[prev]</a>&nbsp;" );  
		for(int i=startPageNum;i<endPageNum;i++) {  
		    if( i <= totalPage) {  
		        if( i != currentPage )  
		            out.println("<a href=list.jsp?bsnumber="+getPara(request,"bsnumber")+"&bstype="+getPara(request,"bstype")+"&txtSearch="+getPara(request,"txtSearch")+"&selBsname="+getPara(request,"selBsname")+"&pageNo=" + i + ">[" + i + "]</a>&nbsp;" );  
		        else  
		            out.println("<b>[" + i + "]</b>&nbsp;" );  
		    }  
		}
		if( endPageNum <= totalPage ) {  
		    out.println("<a href=list.jsp?bsnumber="+getPara(request,"bsnumber")+"&bstype="+getPara(request,"bstype")+"&txtSearch="+getPara(request,"txtSearch")+"&selBsname="+getPara(request,"selBsname")+"&pageNo=" + endPageNum + ">[next]</a>&nbsp;" );  
		}  
		%>
		
		<hr style="width:900px; " />
				<div width="900px">
					<%
						
						if(chksessionbbs(session.getAttribute("uslevel"))){
						out.print("<input type='button' value='글쓰기' onclick='goWrite();' style='padding-top:5px;' />");
						}
						%>
			</div>
			</center>
		</form>
			
<%@include file="/lib/jsp/footer.jsp"%>