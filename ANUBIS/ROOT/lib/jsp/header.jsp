</head>
<body>


<%
	request.setCharacterEncoding("utf-8");
	if(session.getAttribute("mbemail") == null){
		out.print("<div>");
		out.print("<div style='width:900px; text-align:right; margin-top:5px; margin-bottom:5px; margin:auto;'><a href='/login/login.jsp'><font size='2' color='gray'>로그인</font></a>&nbsp;&nbsp;<a href='/login/join.jsp'><font size='2' color='gray'>회원가입</font></a></div>");
		out.print("</div>");
	}
	else{
		out.print("<div>");
		out.print("<div style='width:900px; text-align:right; margin-top:5px; margin:auto; '><font size='2' color='gray'>"+session.getAttribute("mbname")+"님 환영합니다. </font><a href='/login/logout.jsp'><font size='2' color='gray'>로그아웃</font></a></div>");
		out.print("</div>");
	}
	
	out.print("<div style=' width:100%; height:40px; lien-weight:40px; border-bottom:1px solid; margin-top:10px; margin-bottom:40px;' >");
		
		out.print("<div class='topMenu'>");
			out.print("<ul>");
				out.print("<li class='topMenuLi'><img src='/data/image/logo2.png' />");
			out.print("</li>");
			out.print("<li class='topMenuLi'>");
      	out.print("<a class='menuLink' href='http://iclab.andong.ac.kr/mypage/mypage.jsp' style='margin-left:40px;'>내 사업장</a>");
      	out.print("<ul class='submenu'>");
      	
        	//out.print("<li><a href='' class='submenuLink longLink' style='margin-left:400px;'><font color='white'>"+rs.f("loname")+"</font></a></li>");
        
        	//out.print("<li><a href='' class='submenuLink longLink'><font color='white'>피자투어</font></a></li>");
        out.print("</ul>");
	      out.print("</li>");
	      out.print("<li class='topMenuLi'>");
	        out.print("<a class='menuLink' href='http://iclab.andong.ac.kr/add/index.jsp' style='margin-left:100px;'>사업장 추가</a>");
	      out.print("</li>");
	      out.print("<li class='topMenuLi'>");
	        out.print("<a class='menuLink' href='http://iclab.andong.ac.kr/bbs/list.jsp?bsnumber=1&bstype=b' style='margin-left:100px;'>고객센터</a>");
	      out.print("</li>");
				out.print("</ul>");
			out.print("</div>");	
		out.print("</div>");
	out.print("</div>");
	
	
%>