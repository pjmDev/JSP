<%@include file="/lib/jsp/start.jsp"%>
<%@include file="/lib/jsp/header.jsp"%>
<%@include file="/lib/jsp/db.jsp"%>

<%	
	
	session.invalidate();
	response.sendRedirect("/");
	
%>


<%@include file="/lib/jsp/footer.jsp"%>
