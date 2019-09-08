<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/header.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.net.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>


<form name="f" method="POST">
<%

	String newfilename = "" ;
	String realFileName = "";
	String fileName = "";
	Random rand = new Random();
	Calendar currentCalendar = Calendar.getInstance();
	request.setCharacterEncoding("utf-8");		
	MultipartRequest multi = null;
	int sizeLimit = 10 * 1024 * 1024 ; //10mb로 제한
	String savePath = request.getRealPath("/data/file/temp/");    
	String savePaths = request.getRealPath("/data/file/");    
	
	
	try{
			out.println("bbbb");
			
			
			//if(!getPara(multi, "filename1").equals(null)){
			
			multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy()); 
			out.println("cccc");
			fileName = multi.getFilesystemName("filename1");  
			//out.print(fileName);
			//fileName = URLEncoder.encode(fileName);
		
			String strYear   = Integer.toString(currentCalendar.get(Calendar.YEAR));
			String strMonth  = Integer.toString(currentCalendar.get(Calendar.MONTH) + 1);
			String strDay   = Integer.toString(currentCalendar.get(Calendar.DATE));
			String strHour   = Integer.toString(currentCalendar.get(Calendar.HOUR_OF_DAY));
			String strMinute   = Integer.toString(currentCalendar.get(Calendar.MINUTE));
			String strSecond   = Integer.toString(currentCalendar.get(Calendar.SECOND));

			String strDate = strYear + strMonth + strDay + strHour + strMinute + strSecond;
			
			int nowplus = rand.nextInt(100000);
			String str_nowplus = Integer.toString(nowplus);
				newfilename = strDate + "_" + str_nowplus;
			int i = -1;
			i = fileName.lastIndexOf("."); // 파일 확장자 위치
			realFileName = newfilename + fileName.substring(i, fileName.length());  //현재시간과 확장자 합치기
			
			File oldFile = new File(savePath + fileName);
			File newFile = new File(savePaths + realFileName);
			
			for(;;){
				boolean tf = oldFile.renameTo(newFile);
				if(tf == true){
					if(oldFile.exists()) oldFile.delete();
					break;
				}
			}
			//}
		out.print("aa");
	/*
	if(oldFile.renameTo(savePath + realFileName)){
		
		}else{
		System.out.println("파일없음")
	}
	*/
	
	String bsseq = getPara(multi, "bsseq");
	String bsnumber = getPara(multi, "bsnumber");
	String bstype = getPara(multi, "bstype");
	String bstitle = getPara(multi, "txtBstitle");
	
	mDB db = new mDB(out);
	boolean IsFound = false;
	String strSQL = "select * from tb_bbs where bsseq = '"+bsseq+"' ";
	//out.println("strSQL" + strSQL);
	mRS rs = new mRS(db, strSQL);
	if(rs.next()){
		IsFound = true;
	}
	rs.close();
	if(IsFound){
		strSQL = "update tb_bbs set bstitle='"+ getPara(multi, "txtBstitle")+"', bsopcd = '"+session.getAttribute("usid")+"' , bsopname = '"+session.getAttribute("usname")+"', ";
		strSQL += " bstext='"+getPara(multi, "smarteditor")+"', bssydt=now() where bsseq = '"+bsseq+"' ";
		//out.println("<br>strSQL" + strSQL);
		if (!db.execute(strSQL)) {
			db.rollback();
			return;
		}
	}
	else{
		strSQL = "insert into tb_bbs ( bstitle, bsusid, bsusname , bstext , bswrdt , bssydt, bsnumber, bstype ) ";
		strSQL += "values ('"+getPara(multi, "txtBstitle")+"', '"+session.getAttribute("usid")+"' , '"+session.getAttribute("usname")+"' ,'"+getPara(multi, "smarteditor")+"', now() , now(), '"+getPara(multi, "bsnumber")+"', 'b' )"; 
		
		//out.println("<br>strSQL" + strSQL);
		if (!db.execute(strSQL)) {
			db.rollback();
			return;
		}
		
		bsseq = GetLastDbKey(db);
	}
	
		DoAddAttf(out, multi, db, bsseq, realFileName, fileName);
	
	//DoAddAttf(out, multi, db, bsseq, "2");
	//DoAddAttf(out, multi, db, bsseq, "3");

	
	
/*
	String filename1 = multi.getFilesystemName("filename1");
	String filename2 = multi.getFilesystemName("filename2");
	String filename3 = multi.getFilesystemName("filename3");
	
	
	String title = multi.getParameter("txtBstitle"); 
	int count = 0; 
	String regip = request.getRemoteAddr();

	
	strSQL = "select max(atno) as max_bsno from tb_bbs_attf where atbsseq = '"+bsseq+"' ";
	//out.println("sql:" + strSQL);
	rs = new mRS(db, strSQL);
	rs.next();
	int max_bsno = rs.intval("max_bsno") + 1;
	rs.close();
	
	out.println("<br>max" + max_bsno);
	

	strSQL = "insert into tb_bbs_attf ( atbsseq, atno , atfilename, atfilesname ) values ('"+bsseq+"', '"+max_bsno+"' , '"+fileName+"', + '"+realFileName+"' ) ";
	out.println(strSQL);
	if (!db.execute(strSQL)) {
		db.rollback();
		return;
	}
	db.commit();
	db.close();
	*/

%>	
<%!
public void DoAddAttf(javax.servlet.jsp.JspWriter out, MultipartRequest multi, mDB db, String bsseq, String realFileName, String originalfilename) {
	try {
		if (multi.getFilesystemName("filename1") == null)
			return;
	
		String filenames = multi.getFilesystemName("filename1");
		
		String strSQL = "select max(atno) as max_bsno from tb_bbs_attf where atbsseq = '"+bsseq+"' ";
		out.print("sql:" + strSQL);
		mRS rs = new mRS(db, strSQL);
		rs.next();
		int max_bsno = rs.intval("max_bsno") + 1;
		rs.close();
		
		out.println("<br>max" + max_bsno);
	
		strSQL = "insert into tb_bbs_attf ( atbsseq, atno , atfilename, atfilesname ) values ('"+bsseq+"', '"+max_bsno+"' , '"+originalfilename+"', '"+realFileName+"' ) ";
		//out.println(strSQL);
		if (!db.execute(strSQL)) {
			db.rollback();
			return;
		}
	}
	catch(Exception e){
	}
} 
%>
</form>
<script type="text/javascript">
	f.target='_self';
	f.action='view.jsp?bsseq=<%=bsseq%>&bsnumber=<%=bsnumber%>&bstype=<%=bstype%>';
	f.submit();
</script>
<%	
}catch (Exception e) {
		e.printStackTrace();
} 
%>
<%@include file="/lib/jsp/footer.jsp"%>
