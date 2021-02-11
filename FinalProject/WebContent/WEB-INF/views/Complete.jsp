<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
</head>

<script type="text/javascript">

	$().ready(function()
	{
		var requestUrl = "<c:out value='${requestUrl}' />";
		var msg = "<c:out value='${msg}' />";
		
		if(requestUrl == "/myprofileimgdelete.action")
			alert(msg);
		
		window.opener.location.reload();	
		window.close();
	});

</script>

<body>

</body>
</html>