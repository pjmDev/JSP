
<%@include file="/lib/jsp/db.jsp"%>
<%

	mDB db = new mDB(out);

	out.print(getPara(request, "bcate"));
	String ret = "";
	String strSQL = "select * from tb_category where cabcate = '" + getPara(request, "bcate") + "' ";
	//echo $strSQL;
		mRS rs = new mRS(db, strSQL);
	if (!rs.next())
		return;
	String search_bcate = rs.f("cabcate");
	rs.close();

	//$strSQL = "select distinct posigugun from tb_category ";
	strSQL = "select * from tb_category ";
	strSQL+= "where cabcate = '" + search_bcate + "' and castandard = 'm' ";
	strSQL+= "order by camcate ";
	out.print(strSQL);
	rs = new mRS(db, strSQL);

while (rs.next()) {
	ret+= rs.f("camcate");
	ret+= "~!@";
	ret+= rs.f("camcate");
	ret+= "@!~";
}
	out.print("A"+ret);
	rs.close();
	db.close();
	db=null;

%>