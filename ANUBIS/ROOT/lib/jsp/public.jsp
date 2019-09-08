<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%!

	public void top_menu(javax.servlet.jsp.JspWriter __out, String mname){
	try{
		javax.servlet.jsp.JspWriter _out = null;
		_out = __out;
		
		_out.print("<table width='900px' align='center'>");
		_out.print("<tr><td><font size='5em' face='bold' family='nanumGothic'><strong>"+mname+"</strong></font> <input type='button' onclick='goSave();' style='margin-left:15px;' value='추가'/></td></tr>");
		_out.print("<tr><td><hr width='900px' /></td></tr>");
		_out.print("</table>");
		}
		catch(Exception e){
		}
	}
	
		public void top_menu2(javax.servlet.jsp.JspWriter __out, String mname, int a, String lonum){
	try{
		javax.servlet.jsp.JspWriter _out = null;
		_out = __out;
		
		if(a == 1){
		_out.print("<div style='width:190px; margin-bottom:20px; text-align:left;'>");
		_out.print("<font size='5em' face='bold' family='nanumGothic'><strong>"+mname+"</strong></font> ");
		_out.print("</div>");
		}
		if(a == 2){
		_out.print("<div style='width:630px; margin-bottom:20px; border-bottom:1px solid gray; text-align:left; padding-bottom:12px; margin-left:10px; '>");
		_out.print("<font size='5em' face='bold' family='nanumGothic'><strong>"+mname+"</strong></font><input type='button' style='margin-left:15px;'  onclick='goWrite("+lonum+");' value='수정'/> <input type='button' onclick='goDelete("+lonum+");' value='삭제'/>");
		_out.print("</div>");
		}
		
		
		}
		catch(Exception e){
		}
	}
	
			public void top_menu3(javax.servlet.jsp.JspWriter __out, String mname, int a, String lonum){
	try{
		javax.servlet.jsp.JspWriter _out = null;
		_out = __out;
		
		if(a == 1){
		_out.print("<div style='width:190px; margin-bottom:20px; text-align:left;'>");
		_out.print("<font size='5em' face='bold' family='nanumGothic'><strong>"+mname+"</strong></font> ");
		_out.print("</div>");
		}
		if(a == 2){
		_out.print("<div style='width:630px; margin-bottom:20px; border-bottom:1px solid gray; text-align:left; padding-bottom:12px; margin-left:10px; '>");
		_out.print("<font size='5em' face='bold' family='nanumGothic'><strong>"+mname+"</strong></font><input type='button' style='margin-left:15px;'  onclick='goSave("+lonum+");' value='저장'/> <input type='button' value='취소'/>");
		_out.print("</div>");
		}
		
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
	
		public void student_boxx(javax.servlet.jsp.JspWriter __out, String title,String hakbun, String phone, String job, String type, String major, String gyear){
	try{
		javax.servlet.jsp.JspWriter _out = null;
		_out = __out;
		
		_out.print("<div class='iclab_wrap'>");
		_out.print("<div class='student_box'>");
			_out.print("<div class='img_box'>");
				_out.print("<img src='/data/member/member1.jpg' style='width:100px; height:133px;'>");
			_out.print("</div>");
		_out.print("<div class='text_box'>");
			_out.print("<span class='text_title'>"+title+"</span><br />");
			_out.print("<div class='text_box_t'>");
				_out.print("<span class='text_subt'>학번</span><br />");
				_out.print("<span class='text_subt'>전화번호</span><br />");
				_out.print("<span class='text_subt'>직장</span><br />");
				_out.print("<span class='text_subt'>업종</span><br />");
				_out.print("<span class='text_subt'>분야</span><br />");
				_out.print("<span class='text_subt'>졸업년도</span><br />");
			_out.print("</div>");
			_out.print("<div class='text_box_s'>");
				_out.print("<span class='text_text'>"+hakbun+"</span><br />");
				_out.print("<span class='text_text'>"+phone+"</span><br />");
				_out.print("<span class='text_text'>"+job+"</span><br />");
				_out.print("<span class='text_text'>"+type+"</span><br />");
				_out.print("<span class='text_text'>"+major+"</span><br />");
				_out.print("<span class='text_text'>"+gyear+"</span><br />");
			_out.print("</div>");
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

	public void left_menu(javax.servlet.jsp.JspWriter __out, mDB db, String mbemail){
	try{
		javax.servlet.jsp.JspWriter _out = null;
		_out = __out;
		int count = 0;
		String ret = "";
		String strSQL = "select * from tb_location where loemail=  " + mbemail + " order by loname";
		mRS rs = new mRS(db, strSQL);
		
		_out.print("<div style='width:250px; float:left; margin:0;'>");
		_out.print("<table style='width:250px;'>");
		while(rs.next()){
				if(count == 0){
				_out.print("<tr><th style='border-bottom:1px solid gray; border-top:1px solid gray; text-align:left; padding:10px 0 10px 10px; cursor:pointer;' onclick='goMenu("+rs.f("lonum")+");'>"+rs.f("loname")+"<th></tr>");
				count++;
				}
				else{
				_out.print("<tr><th style='border-bottom:1px solid gray; text-align:left; padding:10px 0 10px 10px; cursor:pointer;' onclick='goMenu("+rs.f("lonum")+");'>"+rs.f("loname")+"<th></tr>");
				}
			}
			_out.print("</table>");
			_out.print("</div>");
		
		rs.close();	
		}
		catch(Exception e){
		}
	}
	
	
	
%>