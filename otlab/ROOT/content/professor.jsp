<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/header.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>
<%@include file="/lib/jsp/session.jsp"%>
<%@include file="/lib/jsp/public.jsp"%>
<%
	chksession(out, (String) session.getAttribute("usid"));
%>
<%
		top_menu(out,"지도교수");
%>
	<div>
		
	ㅎ
		
	</div>


<%@include file="/lib/jsp/footer.jsp"%>
