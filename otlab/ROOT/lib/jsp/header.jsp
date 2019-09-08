</head>
<body>
	
	
	<% request.setCharacterEncoding("utf-8"); %>

<%
	
	if(session.getAttribute("usid") == null){
		out.print("<div class='anubis_wrap' style='margin-top:10px;' >");
		out.print("<div style='width:1000px; text-align:right; margin-top:5px; margin:auto;'><a href='/login/login.jsp'><font size='2' color='gray'>로그인</font></a>&nbsp;&nbsp;<a href='/login/join.jsp'><font size='2' color='gray'>회원가입</font></a></div>");
		out.print("</div>");
	}
	else{
		out.print("<div class='anubis_wrap' style='margin-top:10px;'>");
		out.print("<div style='width:1000px; text-align:right; margin-top:5px; margin:auto;'><font size='2' color='gray'>"+session.getAttribute("usname")+"님 환영합니다. </font><a href='/login/logout.jsp'><font size='2' color='gray'>로그아웃</font></a></div>");
		out.print("</div>");
	}
	
	
		out.print("<div style=' width:100%; height:40px; lien-weight:40px; border-bottom:1px solid; padding-bottom:10px; margin-top:10px; margin-bottom:4px;' >");		
			out.print("<div class='topMenu' style='width:1000px; '>");
			out.print("<ul>");
				out.print("<li class='topMenuLi'><a href='http://iclab.andong.ac.kr/index.jsp' ><img src='/data/image/logo.png' style='border:0;' /></a>");
			out.print("</li>");
			out.print("<li class='topMenuLi'>");
      	out.print("<a class='menuLink' href='http://iclab.andong.ac.kr/intro/index.jsp' style='margin-left:20px;'>연구실소개</a>");
      	//out.print("<ul class='submenu'>");
        	//out.print("<li><a href='' class='submenuLink longLink' style='margin-left:400px;'><font color='white'>"+rs.f("loname")+"</font></a></li>");
        	//out.print("<li><a href='' class='submenuLink  longLink'><font color='white'>피자투어</font></a></li>");
        //out.print("</ul>");
	      out.print("</li>");
	      out.print("<li class='topMenuLi'>");
	        out.print("<a class='menuLink' href='http://iclab.andong.ac.kr/content/professor.jsp' style='margin-left:35px;'>지도교수</a>");
	      out.print("</li>");
	      out.print("<li class='topMenuLi'>");
	        out.print("<a class='menuLink' href='http://iclab.andong.ac.kr/member/student.jsp' style='margin-left:35px;'>재학생</a>");
	      out.print("</li>");
	      out.print("<li class='topMenuLi'>");
	        out.print("<a class='menuLink' href='http://iclab.andong.ac.kr/member/oldstudent.jsp' style='margin-left:35px;'>졸업생</a>");
	      out.print("</li>");
	      out.print("<li class='topMenuLi'>");
	        out.print("<a class='menuLink' href='http://iclab.andong.ac.kr/bbs/list.jsp?bsnumber=1&bstype=b&pageNo=1' style='margin-left:35px;'>공지사항</a>");
	      out.print("</li>");
	      out.print("<li class='topMenuLi'>");
	        out.print("<a class='menuLink' href='http://iclab.andong.ac.kr/bbs/list.jsp?bsnumber=2&bstype=b&pageNo=1' style='margin-left:35px;'>세미나자료실</a>");
	      out.print("</li>");
	      out.print("<li class='topMenuLi'>");
	        out.print("<a class='menuLink' href='http://iclab.andong.ac.kr/bbs/list.jsp?bsnumber=3&bstype=b&pageNo=1' style='margin-left:35px;'>자유게시판</a>");
	      out.print("</li>");
	      out.print("<li class='topMenuLi'>");
	        out.print("<a class='menuLink' href='http://iclab.andong.ac.kr/photo/list.jsp?bsnumber=1&bstype=p' style='margin-left:35px;'>포토게시판</a>");
	      out.print("</li>");
				out.print("</ul>");
			out.print("</div>");	
		out.print("</div>");
		
		if(session.getAttribute("usid") != null){
			out.print("<a class='menuLink' href='http://iclab.andong.ac.kr/bbs2/list.jsp?bsnumber=4&bstype=b&pageNo=1' style='margin-left:35px;'>test게시판</a>");
		}
		
	out.print("<center>");
	out.print("<img src='/data/image/main.jpg' alt='main' style='width:1000px; height:180px; margin:auto; padding-bottom:30px;' />");
	out.print("</center>");
%>