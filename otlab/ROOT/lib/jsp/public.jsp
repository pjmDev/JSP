<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%!
	public void Gap(javax.servlet.jsp.JspWriter __out, int a){
		try{
			javax.servlet.jsp.JspWriter _out = null;
			_out = __out;
			for(int i = 0; i < a; i++){
				_out.print("<br />");
			}
		}
			catch(Exception e){
		}
	}
	
	public void top_menu(javax.servlet.jsp.JspWriter _out, String mname){
	try{
		
		_out.print("<table width='900px' align='center'>");
		_out.print("<tr><td><font size='4em' face='bold' family='nanumGothic'><strong>"+mname+"</strong></font></td></tr>");
		_out.print("<tr><td><hr width='900px' /></td></tr>");
		_out.print("</table");
		}
		catch(Exception e){
		}
	}
	
	public String mname(String mename){
		String named = "";
		if(mename.equals("1")){
			named = "공지사항";
		}
		else if(mename.equals("2")){
			named = "세미나자료실";
		}
		else if(mename.equals("3")){
			named = "자유게시판";
		}
		else{
			named = "메뉴";
		}
		return named;
	}
	
		public void student_box(javax.servlet.jsp.JspWriter __out, String img, String title, String hakbun, String phone, String job, String major, String gyear){
	try{
		javax.servlet.jsp.JspWriter _out = null;
		_out = __out;
		
		_out.print("<div class='iclab_wrap'>");
		_out.print("<div class='student_box'>");
			_out.print("<div class='img_box'>");
				_out.print("<img src='/data/member/"+img+".jpg' style='width:100px; height:133px;'>");
			_out.print("</div>");
		_out.print("<div class='text_box'>");
			_out.print("<span class='text_title'>"+title+"</span><br />");
			
			_out.print("<div class='text_box_l'>");
				_out.print("<span class='text_subt'>학번</span>");
				_out.print("<span class='text_text'>"+hakbun+"</span>");
			_out.print("</div>");
			_out.print("<div class='text_box_l'>");
				_out.print("<span class='text_subt'>전화번호</span>");
				_out.print("<span class='text_text'>"+phone+"</span>");
			_out.print("</div>");
			_out.print("<div class='text_box_l'>");
				_out.print("<span class='text_subt'>희망직종</span>");
				_out.print("<span class='text_text'>"+job+"</span>");
			_out.print("</div>");
			_out.print("<div class='text_box_l'>");
				_out.print("<span class='text_subt'>희망분야</span>");
				_out.print("<span class='text_text'>"+major+"</span>");
			_out.print("</div>");
			_out.print("<div class='text_box_l'>");
				_out.print("<span class='text_subt'>졸업년도</span>");
				_out.print("<span class='text_text'>"+gyear+"</span>");
				_out.print("</div>");
			_out.print("</div>");
			/*
			_out.print("<div class='text_box_s'>");
				_out.print("<br />");
				_out.print("<span class='text_text'>"+phone+"</span><br />");
				_out.print("<span class='text_text'>"+job+"</span><br />");
				_out.print("<span class='text_text'>"+type+"</span><br />");
				_out.print("<span class='text_text'>"+major+"</span><br />");
				_out.print("<span class='text_text'>"+gyear+"</span><br />");
			_out.print("</div>");
			*/
			_out.print("</div>");
		_out.print("</div>");
	_out.print("</div>	");
	
		}
		catch(Exception e){
		}
	}
	
		public void oldstudent_box(javax.servlet.jsp.JspWriter __out, String img, String title,String hakbun, String phone, String job, String type, String major, String gyear){
	try{
		javax.servlet.jsp.JspWriter _out = null;
		_out = __out;
		
		_out.print("<div class='iclab_wrap'>");
		_out.print("<div class='student_box'>");
			_out.print("<div class='img_box'>");
				_out.print("<img src='/data/member/"+img+".jpg' style='width:100px; height:133px;'>");
			_out.print("</div>");
		_out.print("<div class='text_box'>");
			_out.print("<span class='text_title'>"+title+"</span><br />");
			
			_out.print("<div class='text_box_l'>");
				_out.print("<span class='text_subt'>학번</span>");
				_out.print("<span class='text_text'>"+hakbun+"</span>");
			_out.print("</div>");
			_out.print("<div class='text_box_l'>");
				_out.print("<span class='text_subt'>전화번호</span>");
				_out.print("<span class='text_text'>"+phone+"</span>");
			_out.print("</div>");
			_out.print("<div class='text_box_l'>");
				_out.print("<span class='text_subt'>직장</span>");
				_out.print("<span class='text_text'>"+job+"</span>");
			_out.print("</div>");
			_out.print("<div class='text_box_l'>");
				_out.print("<span class='text_subt'>업종</span>");
				_out.print("<span class='text_text'>"+type+"</span>");
			_out.print("</div>");
			_out.print("<div class='text_box_l'>");
				_out.print("<span class='text_subt'>분야</span>");
				_out.print("<span class='text_text'>"+major+"</span>");
			_out.print("</div>");
			_out.print("<div class='text_box_l'>");
				_out.print("<span class='text_subt'>직장위치</span>");
				_out.print("<span class='text_text'>"+gyear+"</span>");
				_out.print("</div>");
			_out.print("</div>");
			/*
			_out.print("<div class='text_box_s'>");
				_out.print("<br />");
				_out.print("<span class='text_text'>"+phone+"</span><br />");
				_out.print("<span class='text_text'>"+job+"</span><br />");
				_out.print("<span class='text_text'>"+type+"</span><br />");
				_out.print("<span class='text_text'>"+major+"</span><br />");
				_out.print("<span class='text_text'>"+gyear+"</span><br />");
			_out.print("</div>");
			*/
			_out.print("</div>");
		_out.print("</div>");
	_out.print("</div>	");
	
		}
		catch(Exception e){
		}
	}


	
	
%>