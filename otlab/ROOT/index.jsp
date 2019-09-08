<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>
<%@include file="/lib/jsp/public.jsp"%>
<%@include file="/lib/jsp/header.jsp"%>
<%@include file="/lib/jsp/session.jsp"%>
<script>
</script>
<form name="f" method="post">
<%
	//chksession(out, (String) session.getAttribute("usid"));
%>
	<div style="width:1000px; margin:auto; overflow:hidden" >
		
	<div class="img" >
		<div> 
			<br />
			<div style="text-align:right; padding-right:25px; border=0;"><a href="/bbs/list.jsp?bsnumber=1&bstype=b"><img src="/data/image/plus.png" style="width:20px; height:20px; border:0; cursor:pointer;" /></a></div>
			<br />
			<%
			mDB db = new mDB(out);
			String strSQL = "select *, date_format(bseddt,'%Y-%m-%d') as eddt from tb_bbs where bsnumber='1' and bstype='b' order by bswrdt desc limit 10";
			mRS rs = new mRS(db, strSQL);
			while(rs.next()){
			%>
				<div style="width:270px; float:left; ">
					<a href="/bbs/view.jsp?bsseq=<%=rs.f("bsseq")%>&bsnumber=<%=rs.f("bsnumber")%>&bstype=<%=rs.f("bstype")%>" ><%out.println(rs.f("bstitle"));%></a>
				</div>
				<div style="width:150px; float:left; ">
					<font color="gray"><%out.println(rs.f("eddt"));%></font>
				</div>
			<%
			}
			rs.close();
			%>
		</div>		
	</div>
	
	<div class="img2" >
		<div >
			<br />
			<div style="text-align:right; padding-right:25px; border=0;"><a href="/bbs/list.jsp?bsnumber=2&bstype=b"><img src="/data/image/plus.png" style="width:20px; height:20px; border:0;" onclick="goBbs('"+bsnumber+"');" /></a></div>
			<br />
			<%
			strSQL = "select *, date_format(bseddt,'%Y-%m-%d') as eddt from tb_bbs where bsnumber='2' and bstype='b' order by bswrdt desc limit 10";
			rs = new mRS(db, strSQL);
		while(rs.next()){
			%>
			<div style="width:270px; float:left; ">
				<a href="/bbs/view.jsp?bsseq=<%=rs.f("bsseq")%>&bsnumber=<%=rs.f("bsnumber")%>&bstype=<%=rs.f("bstype")%>" ><%out.println(rs.f("bstitle"));%></a>
			</div>
			<div style="width:150px; float:left; ">
				<font color="gray"><%out.println(rs.f("eddt"));%></font>
			</div>
			<%
			}
			rs.close();
			%>
		</div>
	</div>
	
	<div class="img3" >
		<div >
			<br />
			<div style="text-align:right; padding-right:5px; border=0;"><img src="/data/image/plus.png" style="width:20px; height:20px; border:0;" /></div>
			<br />
			<%
			strSQL = " SELECT * FROM ";
			strSQL += " ( select *, date_format(bseddt,'%Y-%m-%d') as eddt from tb_bbs where bsnumber='1' and bstype='p' ) aa ";
			strSQL += " left outer join (select * from tb_bbs_attf where atno = '1' ) bb on aa.bsseq = bb.atbsseq order by eddt desc limit 5 ";
			rs = new mRS(db, strSQL);
		while(rs.next()){
			%>
			
				<div style="width:170px; float:left; margin-left:8px; margin-top:10px; text-align:center;">
					<a href="/photo/view.jsp?bsseq=<%=rs.f("bsseq")%>&bsnumber=<%=rs.f("bsnumber")%>&bstype=<%=rs.f("bstype")%>" ><img src="/data/photo/<%=rs.f("atfilename")%>" alt="" width="170px" height="200px" border="0"/></a>
						<br /><font color="gray"><%out.println(rs.f("bstitle"));%></font>
			</div>
			<%
			}
			rs.close();
			%>
		</div>		
	</div>
</div>	
</div>
</form>
<%@include file="/lib/jsp/footer.jsp"%>
