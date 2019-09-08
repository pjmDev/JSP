<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/header.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>
<%@include file="/lib/jsp/session.jsp"%>
<%@include file="/lib/jsp/public.jsp"%>

<script type="text/javascript">
	function goWrite(){
		f.target='_self';
		f.action='write.jsp';
		f.submit();
	}
	function goList(){
		
		f.target='_self';
		f.action='list.jsp?bsnumber=<%=getPara(request, "bsnumber")%>&bstype=<%=getPara(request,"bstype")%>&pageNo=<%=getPara(request,"pageNo")%>';
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
		top_menu(out,mname(getPara(request,"bsnumber")));
	%>
	<input type="hidden" name="bsseq" value="<%=getPara(request,"bsseq")%>" />
	<input type="hidden" name="bsseq" value="<%=getPara(request,"bsseq")%>" />
	<input type="hidden" name="bsnumber" value="<%=getPara(request,"bsnumber")%>" />
	<input type="hidden" name="bstype" value="<%=getPara(request,"bstype")%>" />
	<input type="hidden" name="pageNo" value="<%=getPara(request,"pageNo")%>" />
<center>
<table width="901px" cellspacing="0" >

<%
	String bsseq = request.getParameter("bsseq"); 
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
	String usid = "";
	while(rs.next()){
	bsnumber = rs.f("bsnumber");
	usid = rs.f("bsusid");
%>

<iframe id="ifrm_filedown"  style="position:absolute; z-index:1;visibility : hidden;"></iframe>
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
		<td colspan="4" style="text-align:left; padding-top:20px; padding-bottom:100px; border-bottom:1px solid #666; width:150px; height:15px; padding-left:5px; ">
		<% out.print(rs.f("bstext")+"<br />"); 
		
			strSQL = "select * from tb_bbs_attf where atbsseq = '"+bsseq+"'";
			mRS rs2 = new mRS(db, strSQL);
			
			while(rs2.next()){
				if(chkExtension(rs2.f("atfilename"))){
					out.print("<img src='/data/file/"+rs2.f("atfilesname")+"' height='400px' /><br />");
					}
			}
			rs2.close();
		%>
		<td>
	</tr>
	
	<tr>
		<td style="padding:5px 0; border-right:1px solid #666; border-bottom:2px solid #666; width:150px; height:15px;">첨부파일
	</td>
		<td colspan="4" style="text-align:left; padding:5px 0; border-bottom:1px solid #666; border-bottom:2px solid #666; width:150px; height:15px;">
			
			<%
			rs.close();
			strSQL = "select * from tb_bbs_attf where atbsseq = '"+bsseq+"' ";
			rs = new mRS(db, strSQL);
		while(rs.next()){
		%>
		<a href="attfDownload.jsp?filename=<%= rs.f("atfilesname") %>" ><% out.print(rs.f("atfilename"));   %></a><br />
		
			<% } %>
		<td>
	</tr>
		<% } %>
				</table>
		<div>
			<%
			out.print(rs.f("atfilename"));
			out.print("<input type='button' value='목록' onclick='goList();' /> ");
			
			if(chksessionbbs(session.getAttribute("uslevel"))){
				if((int)session.getAttribute("uslevel") >= 90){
					out.print("<input type='button' value='수정' onclick='goWrite();' /> ");
					out.print("<input type='button' value='삭제' onclick='goDelete();' /> ");
				}
				else if(session.getAttribute("usid").equals(usid)){
					out.print("<input type='button' value='수정' onclick='goWrite();' /> ");
					out.print("<input type='button' value='삭제' onclick='goDelete();' /> ");
				}
			}
			rs.close();
			db.close();
			%>

		</div>
		</table>
	</center>
</form>
<%@include file="/lib/jsp/footer.jsp"%>

<%!
	public boolean chkExtensionx(String Extension){
	try{
		boolean ret = false;
		int leng;
		String[] Exten = {"jpg", "png", "peg", "gif"};
		leng = Extension.length();
		for(int i=0; i<Exten.length; i++){
			if(Exten[i].equals(Extension.substring( leng-3, leng ))){
				ret = true;
			}
		}
		return ret;
	}
	catch(Exception e){ return false; }
	}
%>

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
