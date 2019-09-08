<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/header.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>
<%@include file="/lib/jsp/session.jsp"%>
<%@include file="/lib/jsp/public.jsp"%>
<%@ page import="java.io.*"%> 
<%@ page import="java.util.*" %> 

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" href="/by/bbs2/daum/daumeditor/css/editor.css" type="text/css" charset="utf-8"/>
<script src="/by/bbs2/daum/daumeditor/js/editor_loader.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>		
<script type="text/javascript" src="local.js"></script>		 
<!-- -->
<script type="text/javascript">
$(function(){ 
        $.ajax({
            url : "/by/bbs2/daum/daumeditor/editor_multi.html",
            success : function(data){
                $("#editor_frame").html(data);
                // 에디터UI load
                var config = {
                    /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */
                    txHost: 'http://iclab.andong.ac.kr/',
                    /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */
                    txPath: '/by/bb2/daum/',
                    /* 수정필요없음. */
                    txService: 'sample',
                    /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */
                    txProject: 'sample',
                    /* 대부분의 경우에 빈문자열 */
                    initializedId: "",
                    /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */
                    wrapper: "tx_trex_container",
                    /* 등록하기 위한 Form 이름 */
                    form: "f",
                    /*에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */
                    txIconPath: "/by/bbs2/daum/daumeditor/images/icon/editor/",
                    /*본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */
                    txDecoPath: "/by/bbs2/daum/daumeditor/images/deco/contents/",
                    canvas: {
                        styles: {
                            /* 기본 글자색 */
                            color: "#123456",
                            /* 기본 글자체 */
                            fontFamily: "굴림",
                            /* 기본 글자크기 */
                            fontSize: "10pt",
                            /*기본 배경색 */
                            backgroundColor: "#fff",
                            /*기본 줄간격 */
                            lineHeight: "1.5",
                            /* 위지윅 영역의 여백 */
                            padding: "8px"
                        },
                        showGuideArea: false
                    },
                    events: {
                        preventUnload: false
                    },
                    sidebar: {
                        attachbox: {
                            show: true,
                            confirmForDeleteAll: true
                        }
                    },
                    size: {
                        /* 지정된 본문영역의 넓이가 있을 경우에 설정 */
                        //contentWidth: 700
                    }
                };
                 
                //에디터내에 환경설정 적용하기
                new Editor(config);
            }
        });
         
        //form submit 버튼 클릭
        $("#save_button").click(function(){
            //다음에디터가 포함된 form submit
            Editor.save();
        })
    })
     
     
    //Editor.save() 호출 한 다음에 validation 검증을 위한 함수
    //validation 체크해줄 입력폼들을 이 함수에 추가 지정해줍니다.
    function validForm(editor) {
        var validator = new Trex.Validator();
        var content = editor.getContent();
        if (!validator.exists(content)) {
            alert('내용을 입력하세요');
            return false;
        }
        return true;
    }
      
    //validForm 함수까지 true값을 받으면 이어서 form submit을 시켜주는  setForm함수
    function setForm(editor) {
        var content = editor.getContent(); 
        $("#daumeditor").val(content)
        return true;
    }



</script>
<!-- -->
<%
	chksession(out, (String) session.getAttribute("usid"));	
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
 <!-- <form name="f" method="post" enctype="multipart/form-data" > -->
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
				<th scope="row" style=" border:1px solid #b3b3b3;">제목</label></th>
				<td><input type="text" id="txtBstitle" name="txtBstitle" style="width:100%;" value="<%=rs.f("bstitle")%>" ></td>
			</tr>
			
			<tr>
				<th scope="row" colspan="2" >
				
				<br />
				<div style="width:900px;">
				<!-- 실제 값이 담겨져서 넘어갈 textarea 태그  -->
					<div name="editor_frame" id="editor_frame"></div>
						
					<!--	<textarea name="daumeditor" id="daumeditor" style="width:900px; height:600px;display: none;"></textarea> -->
					
					<!-- <textarea name="smartedior" style="width:900px; height:600px;" ></textarea> -->
					</div>
				<br />
				
				</th>
			</tr>
			
			<tr>
				<th scope="row" style="background:#b3b3b3; border:1px solid #b3b3b3;">첨부파일</th>
				<td style="text-align:left;"><input type="file" name="filename1">
					<!--
					<br /><input type="file" name="filename2">
					<br /><input type="file" name="filename3">
					-->
				</td>
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

	 <!-- </form> -->
	
<%@include file="/lib/jsp/footer.jsp"%>
