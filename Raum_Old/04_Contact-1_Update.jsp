
<%@page contentType="text/html; charset=utf-8"%>
<%@include file="Action/connectionDB.jsp"%>
 
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="java.io.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

<%


	String saveDir = application.getRealPath("/RaumTest/Asset/01_img/99_UpdateRequst/");
	int maxSize = 1024*1024*100;
	String encType = "UTF-8";

	MultipartRequest multipartRequest = new MultipartRequest(request, saveDir, maxSize, encType, new DefaultFileRenamePolicy());
	
	String name = multipartRequest.getParameter("name");
	String id =  multipartRequest.getParameter("id");
	String title = multipartRequest.getParameter("title");
	String text =  multipartRequest.getParameter("text");
	String Qtype = multipartRequest.getParameter("Question");

	String text2 = text.replace("\r\n","<br>");
	
	 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyMMddHHmmss");
	 String today = formatter.format(new java.util.Date());

	 java.text.SimpleDateFormat formatter2 = new java.text.SimpleDateFormat("yy-MM-dd-HH:mm:ss");
	 String dateEdit = formatter2.format(new java.util.Date());


    
    out.write("이름 : " + multipartRequest.getParameter("name") + "<br>");
	out.write("이름 : " +saveDir+ "<br>");
    out.write("파일 : " + multipartRequest.getParameter("file") + "<br>");
    out.write("업로드파일명 : " + multipartRequest.getFilesystemName("file") + "<br>");
    out.write("원래파일명 : " + multipartRequest.getOriginalFileName("file") + "<br>");

	String 	fileName = multipartRequest.getFilesystemName("file");
	boolean bool = false;
	String realFileName = "-";
	if(fileName!=null){
		int i = -1;
	    i = fileName.lastIndexOf(".");
		realFileName = id +"_"+today+ fileName.substring(i, fileName.length()); 
	    out.write(saveDir+"/"+realFileName+ "<br>");
		out.write(saveDir+"/"+fileName+ "<br>");

	    File oldFile = new File(saveDir+"/"+ fileName);
		File newFile = new File(saveDir+"/"+realFileName);

		oldFile.renameTo(newFile); // 파일명 변경

		bool =true;

	}
	else{
	}

	Query = "insert into Raum_Request (M_id,R_title,R_text,R_date,R_type,R_file) value(?,?,?,?,?,?)";
	PreparedStatement cursorHelper = con.prepareStatement(Query);
	cursorHelper.setString(1,id);
	cursorHelper.setString(2,title);
	cursorHelper.setString(3,text2);
	cursorHelper.setString(4,dateEdit);
	cursorHelper.setString(5,Qtype);
	cursorHelper.setString(6,realFileName);

	cursorHelper.executeUpdate();

	response.sendRedirect("04_Contact-2.jsp");

	%>
	<script>
		alert("<%=Qtype%>")
		alert("<%=name%>")
		alert("<%=id%>")
		alert("<%=title%>")
		alert("<%=text2%>")
		alert("<%=realFileName%>")
		alert("<%=bool%>")
	</script>
	<%
%>
<script>
</script>