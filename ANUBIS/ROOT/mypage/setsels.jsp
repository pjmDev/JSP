<%@include file="/lib/jsp/db.jsp"%>
<%
	mDB db = new mDB();
	String ret = "";

/*$strSQL = "select * from tb_category where cabcate = '" . $_REQUEST["bcate"] . "' and camcate = '" . $_REQUEST["mcate"] . "' ";
//echo $strSQL;
$rs = new mRS($db, $strSQL);
if (!$rs->next()){}
return;
$rs->close();
	*/
	
	String search_bcate = getPara(request, "bcate");
	String search_mcate = getPara(request, "mcate");

//$strSQL = "select distinct posigugun from tb_category ";
	String strSQL = "select * from tb_category ";
	strSQL+= "where cabcate = '" + $search_bcate + "' and camcate = '" + $search_mcate + "' and castandard = 's' ";
	strSQL+= "order by cascate ";
//echo $strSQL;
	mRS rs = new mRS($db, $strSQL);

while (rs.next()) {
	ret += $rs->f("cascate");
	ret += "~!@";
	ret += $rs->f("cascate");
	ret += "@!~";
}
	out.print(ret);

%>