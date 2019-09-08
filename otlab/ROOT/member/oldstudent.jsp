<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/header.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>
<%@include file="/lib/jsp/session.jsp"%>
<%@include file="/lib/jsp/public.jsp"%>

<%
	chksession(out, (String) session.getAttribute("usid"));
	top_menu(out,"졸업생");
	
	
	%>
<%
	Gap(out,3);
	mDB db = new mDB(out);
	
	String strSQL = "select * from tb_test  ";
	mRS rs = new mRS(db, strSQL);
	
	while(rs.next()){
	}
	
	rs.close();
	db.close();
	db=null;
	
	oldstudent_box(out, "LDG","이동근", "04학번", "010-3415-0078","펜타시스템테크놀리지(주)","IBM SW,보안솔루션, 빅데이터, 미들웨어 등","영업 대표","서울시 여의도");	
	oldstudent_box(out, "KDJ","김동준", "05학번", "010-4477-8804","NC소프트","웹서버 개발","서버 개발","경기도 판교");
	oldstudent_box(out, "KDW","김동우", "07학번", "010-5121-4577","유비벨록스","서버 개발","서버 개발","서울특별시시 구로구");
	oldstudent_box(out, "NSJ","노상진", "07학번", "010-4754-8099","???","???","???","???");
	oldstudent_box(out, "OHJ","오현재", "07학번", "010-2787-0211","????","????","????","????");
	oldstudent_box(out, "CSY","최석열", "08학번", "010-4212-0503","위니텍","지능형 교통관리시스템 개발 및 유지보수","JAVA, 웹 개발","대구광역시 남구");
	oldstudent_box(out, "JSH","정성훈", "08학번", "010-9999-5241","뱅크웨어글로벌","FW 관리","WAS, FW 관리","서울특별시 중구");
	oldstudent_box(out, "JHJ","지효진", "08학번", "010-3703-8911","??","??","??","??");
	oldstudent_box(out, "KBK","임병기", "11학번", "010-","","","","??");
	oldstudent_box(out, "KBK","김준호", "11학번", "010-","","","","??");
	oldstudent_box(out, "PJM","박정민", "12학번", "010-","","","","??");
	oldstudent_box(out, "JHY","정후영", "12학번", "010-","","","","??");
		
%>


<%@include file="/lib/jsp/footer.jsp"%>
