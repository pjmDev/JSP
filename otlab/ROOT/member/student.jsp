<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/header.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>
<%@include file="/lib/jsp/session.jsp"%>
<%@include file="/lib/jsp/public.jsp"%>


<%
	chksession(out, (String) session.getAttribute("usid"));
	top_menu(out,"재학생");
%>
<%
	
	mDB db = new mDB(out);
	
	String strSQL = "select * from tb_member  ";
	mRS rs = new mRS(db, strSQL);
	
	while(rs.next()){
	}
		
		student_box(out,"KBY", "김보연(랩장)", "15학번", "010-3752-3482", "구글", "JAVA, KOTLIN, LINUX", "2021년");
		student_box(out,"NMA", "나민아", "16학번", "010-6487-5478", "프로그램 개발", "JAVA, C#", "2020년");
		student_box(out,"SBW", "서보원", "15학번", "010-6317-8722", "소프트웨어 개발", "JAVA, PYTHON, PHP", "2021년");
		student_box(out,"KSH", "김상훈", "15학번", "010-8283-7865", "소프트웨어 개발", "JAVA", "2021년");
		student_box(out,"LJC", "이종찬", "15학번", "010-4743-9081", "로봇 공학", "PYTHON, GPIO", "2021년");
		student_box(out,"NSZ", "남수지", "17학번", "010-4983-3109", "KAKAO", "JAVA, ANDROID, MATLAB", "2021년");
		student_box(out,"PTH", "박태현", "15학번", "010-5247-5627", "서버 관리자", "KALI LINUX, 암호해독, 패턴분석", "2021년");
		student_box(out,"IH", "임  현", "15학번", "010-9497-4910", "AI 알고리즘 개발", "MATLAB, R, LISP", "2022년");
		
		rs.close();
	db.close();
	db=null;
%>
	


<%@include file="/lib/jsp/footer.jsp"%>
