<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/header.jsp"%>
<%@include file="/lib/jsp/db.jsp"%> 
<%@include file="/lib/jsp/public.jsp"%>
<%@ page import="java.io.*"%> 
<%@ page import="java.util.*" %> 

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/bbs3/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>		
<script type="text/javascript" src="local.js"></script>		
<script type="text/javascript">
$(function(){
    //전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "smarteditor",
        sSkinURI: "/bbs3/smarteditor/SmartEditor2Skin.html",
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,            
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,    
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true,
        }
    });
     
    //전송버튼 클릭이벤트
    $("#savebutton").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
         
        //폼 submit
        $("#f").submit();
    })
})
</script>
<%
	//chksession(out, (String) session.getAttribute("usid"));	
	String bsseq = getPara(request, "bsseq");
	String bsnumber = getPara(request,"bsnumber");
	String bstype = getPara(request, "bstype");
	//out.print("A"+getPara(request,"bsseq"));
	//out.print("AA"+getPara(multi,"bsseq"));
	mDB db = new mDB(out);
	
	String strSQL = "select * from tb_bbs where bsseq = '"+bsseq+"'";
	mRS rs = new mRS(db, strSQL);
	rs.next();
	
%>
 <form name="f" method="post" enctype="multipart/form-data" >
<!--<form name="f" method="post" > -->
	<%
		top_menu(out,mname(getPara(request,"bsnumber")));
		
	%>
	<input type="hidden" name="bsseq" id="bsseq" value="<%=bsseq%>" />
	<input type="hidden" name="bsseq" id="bsseq" value="<%=bsseq%>" />
	<input type="hidden" name="bsnumber" id="bsnumber" value="<%=bsnumber%>" />
	<input type="hidden" name="bstype" value="<%=bstype%>">
	

	<div style="margin:auto;">
	
		<table width="900px" cellspacing="0" style="margin:auto;">
			<tr>
				<th scope="row" style="background:#b3b3b3; border:1px solid #b3b3b3;">제목</label></th>
				<td><input type="text" id="txtBstitle" name="txtBstitle" style="width:100%;" value="<%=rs.f("bstitle")%>" ></td>
			</tr>
			
			<tr>
				<th scope="row" colspan="2" >
				
				<br />
				<div style="width:900px;">
					<!--<textarea name="smarteditor" id="smarteditor" rows="10" cols="100" style="width:880px; height:412px;"></textarea>
				<br />
				-->
				</th>
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
		<input type="hidden" name="atfilename" id="atfilename" value="<%=rs.f("atfilesname")%>" />
		<% out.print(rs.f("atfilename"));  %>&nbsp;&nbsp;<input type="button" value="삭제" onclick="goAttfDelete();" /><br />
		
		<% } %>
		<td>
	</tr>
		</table>
		
		<div style="margin:0 auto;">
			<input type="button" value="취소" onclick="history.back();" />
			<input type="button" value="저장" onclick="goSave();" />
		</div>
		<%
		rs.close();
		db.close();
		%>
	
 </div>

	</form>
	
<%@include file="/lib/jsp/footer.jsp"%>
