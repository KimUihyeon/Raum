
<%@page contentType="text/html; charset=utf-8"%>
<html>
<head>
<script>
	alert("로그아웃 되었습니다.");
</script>
</head>
<body>
</body>
</html>
<%
	session.invalidate();
	response.sendRedirect("00_index.jsp?Logout=1");
%>
