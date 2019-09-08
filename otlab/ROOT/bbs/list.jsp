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

	mDB db = new mDB(out);
		
//	chksession(out, (String) session.getAttribute("usid"));
	
int totCnt = 0; // 게시물 전체 수  
int totalPage = 0; // 총 페이지수  
int pageCnt = 10;  // 한페이지에 보여질 게시물수  
int pageGroup = 5; // 한페이지에 보여질 페이지 수  
int currentPage = 0;
//int pageNo = 0;  // 현재페이지  
if(getPara(request, "pageNo") == null || getPara(request, "pageNo") == ""){
	currentPage = 1 ;  	
}
else{
	currentPage = Integer.parseInt(request.getParameter("pageNo"));
}

//현재 화면에서 보여질 페이지의 스타트 번호  
int startPageNum = currentPage % pageGroup == 0 ? (currentPage / pageGroup -1) * pageGroup + 1 : (currentPage / pageGroup) * pageGroup + 1;  
int endPageNum = startPageNum + pageGroup; //현재 화면에서 보여질 페이지의 마지막 번호  
  
int startRow = currentPage * pageCnt - pageCnt;   // Limit 시작  
int endRow = pageCnt; 
	int total = 0;
	String strSQL = "";
	
	
	if(getPara(request,"txtSearch") == null || getPara(request, "txtSearch") == ""){
		strSQL = " select count(*) bscnt from tb_bbs where bsnumber='"+getPara(request,"bsnumber")+"' and bstype='"+getPara(request,"bstype")+"'";
		mRS rs = new mRS(db,strSQL);
		if(rs.next()) {
			total = rs.intval("bscnt"); 
			totCnt = rs.intval("bscnt");
		}
		rs.close();
	}
	else{
		strSQL = " select count(*) bscnt from tb_bbs where "+getPara(request, "selBsname")+" like '%"+getPara(request,"txtSearch")+"%' ";
		strSQL += " and bsnumber = '"+getPara(request,"bsnumber")+"' and bstype = '"+getPara(request,"bstype")+"' ";
		mRS rs = new mRS(db,strSQL);
		if(rs.next()) {
			total = rs.intval("bscnt"); 
			totCnt = rs.intval("bscnt");
		}
		rs.close();
	}
	
	
	totalPage = totCnt / pageCnt + (totCnt % pageCnt == 0 ? 0:1 );  
	
	
%>
	<form name="f" method="GET">
		<%
		top_menu(out,mname(getPara(request,"bsnumber")));
		%>
			<input type="hidden" value="" />
			<input type="hidden" name="bstype" value="<%=getPara(request,"bstype")%>" />
			<input type="hidden" name="bsnumber" value="<%=getPara(request,"bsnumber")%>" />
			<input type="hidden" name="pageNo" value="<%=getPara(request,"pageNo")%>" />
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
		strSQL ="";
		
		
		if(getPara(request,"txtSearch") == null || getPara(request, "txtSearch") == ""){
			strSQL = "select *, date_format(bswrdt,'%Y-%m-%d') as sydt from tb_bbs where bsnumber = '"+getPara(request,"bsnumber")+"' and bstype = '"+getPara(request,"bstype")+"' ";
		strSQL += " order by sydt desc limit "+startRow+", "+endRow+" ";
		}
		else {
			strSQL = "select *, date_format(bswrdt,'%Y-%m-%d') as sydt from tb_bbs where "+getPara(request, "selBsname")+" like '%"+getPara(request,"txtSearch")+"%' ";
			strSQL += "and bsnumber = '"+getPara(request,"bsnumber")+"' and bstype = '"+getPara(request,"bstype")+"'";
			strSQL += " order by sydt desc limit "+startRow+", "+endRow+" ";
		}
		mRS rs = new mRS(db, strSQL);
		int no = 0;
		int rr = 0;
		//out.print(strSQL);
		int nowPage = 0;
		if(getPara(request, "pageNo") == null || getPara(request, "pageNo") == ""){
			nowPage = 1 ;  	
		}
		else{
			nowPage = Integer.parseInt(request.getParameter("pageNo"));
		}
		
		
		rr = (total + pageCnt) - (pageCnt * nowPage);
		
		
	%>		
			<tr>
				<th scope="col" style='width:80px;' >순번</th>
				<th scope="col" style='width:*;'>제목</th>
				<th scope="col" style='width:100px;'>게시자</th>
				<th scope="col" style='width:120px;'>등록일자</th>
				<th scope="col" style='width:80px;'>조회수</th>
			</tr>
			
			<% 	while(rs.next()){
					
					String seq = rs.f("bsseq"); 
					%>
			<tr>
				<td style="text-align:center;"><% out.print(rr); %></td>
				<td align='left'>
					<a href="view.jsp?bsseq=<%=seq%>&bsnumber=<%=getPara(request,"bsnumber")%>&bstype=<%=getPara(request,"bstype")%>" style='cursor:pointer;'><% out.print(rs.f("bstitle")); %></a></td>
				<td style="text-align:center;">
					<%=rs.f("bsusname")%>
				</td>
				<td style="text-align:center;">
					<% out.print(rs.f("sydt")); %>
				</td>
				<td style="text-align:center;"><% out.print(rs.f("bshit"));%></td>
			</tr>
			<%
			rr--;
			}
			rs.close();
			%>
		</table>
		<div style="margin-top:5px;">
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
		</div>

			 
		
		
				<div width="1000px">
					<%
						if(chksessionbbs(session.getAttribute("uslevel"))){
						out.print("<input type='button' value='글쓰기' onclick='goWrite();' style='margine-top:5px;' />");
						}
						%>
			</div>
			</center>
		</form>
		
<%@include file="/lib/jsp/footer.jsp"%>