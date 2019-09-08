<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/header.jsp"%>
<%@include file="/lib/jsp/session.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>
<%@include file="/lib/jsp/public.jsp"%>

<script>
	function HttpReq(url, sendStr) {
		try {
		    var xmlHttp =null;
		    if(window.XMLHttpRequest ){
		        xmlHttp = new XMLHttpRequest();     
		    }
		    else{
		        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		    }
		    if( xmlHttp ){ // 동기 호출
		        xmlHttp.open('POST', url, false);
		        xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		        xmlHttp.send(sendStr);
		        return (xmlHttp.responseText);
		    }
			else {
			    return("null");
			}
		} 
		catch (e) {
			alert('HtttpReq:'+e.description);
		}
	}
	
	function changeBig() {
		//var sd = 'sido=' + Base64.encode(document.all.selSearchSido.value);
		//alert(document.f.selLobcate.value);
		var sd = 'bcate=' + document.f.selLobcate.value;
		ret2 = HttpReq('setsel.jsp', sd);
		str = ret2.replace(/\n/g,"");
	
		var ctl2 = document.f.selmcate;
		ctl2.innerHTML = "";
		
		var rec = str.split('@!~');
		for (var j=0; j<rec.length-1; j++) {
			var fld = rec[j].split('~!@');
				
			newOpt = document.createElement('OPTION');
			newOpt.value = fld[0];
			newOpt.text  = fld[1];
			newOpt.setAttribute("sname", fld[1]);
			//newOpt.setAttribute("fee_per", fld[2]);
			ctl2.add(newOpt);
		}
	}
	
	function changeMid() {
		var sd = 'bcate=' + document.f.selLobcate.value + '&mcate=' + document.f.selmcate.value;
		ret3 = HttpReq('setsels.jsp', sd);
		str2 = ret3.replace(/\n/g,"");
		var ctl3 = document.f.selscate;
		ctl3.innerHTML = "";
		
		var rec2 = str2.split('@!~');
		for (var j=0; j<rec2.length-1; j++) {
			var fld2 = rec2[j].split('~!@');
				
			newOptn = document.createElement('OPTION');
			newOptn.value = fld2[0];
			newOptn.text  = fld2[1];
			newOptn.setAttribute("sname", fld2[1]);
			ctl3.add(newOptn);
		}	
	}
	
	function goSave(){
		f.target='_self';
		f.action='save.jsp';
		f.submit();
	}
</script>


<form name="f" method="POST">
<%
	mDB db = new mDB(out);
	chksession(out, (String) session.getAttribute("mbemail"));
%>
<%
		top_menu(out,"사업장 추가");
%>

	<br /><br />
	

<table width="690px" cellpadding="10px" border="1px" align="center">
<tr>
<td bgcolor="#efefef" align="center">사업장 이름</td> <td><input type=text name="txtLoname"></td>
</tr>
<tr>
<td bgcolor="#efefef" align="center">사업장 전화번호</td> <td><input type=text name="txtLohp"></td>
</tr>
<tr>
<td bgcolor="#efefef" align="center">대표 이름</td> <td><input type=text name="txtLohuname"></td>
</tr>
<tr>
<td colspan="2" bgcolor="#efefef" align="center">사업장 분류</td>
</tr>
<tr>
<td bgcolor="#efefef" align="center">대분류</td> <%	
	out.print(show_sel_b(db, "onchange='changeBig();'"));
	%>
</tr>
<tr>
<td bgcolor="#efefef" align="center">중분류</td> <td><select type="select" name="selmcate" onchange="changeMid();" style="width:80px;">
		</select></td>
</tr>
<tr>
<td bgcolor="#efefef" align="center">소분류</td> <td><select type="select" name="selscate" style="width:80px;">
		</select></td>
</tr>
<tr>
<td bgcolor="#efefef" align="center">위도</td> <td><input type="text" name="txtLolat"></td>
</tr>
<tr>
<td bgcolor="#efefef" align="center">경도</td> <td><input type="text" name="txtLolong"></td>
</tr>
</table>



</form>
<%@include file="/lib/jsp/footer.jsp"%>


<%!
public String show_sel_b(mDB db, String oncha){
	
	String strSQL = "select * from tb_category where castandard = 'b' ";
	mRS rs = new mRS(db, strSQL);
	String strS;
	strS = "<td>";
	strS+= "<select type='select' name='selLobcate' "+oncha+" style='width:80px;'>";
	strS+= "<option>카테고리</option>";
	while(rs.next()){
		strS+="<option value='"+rs.f("cabcate")+"'>"+rs.f("cabcate")+"</option>";
	}
	strS+="</select>";
	strS+= "</td>";
	rs.close();
		
	return strS;
	}
%>
