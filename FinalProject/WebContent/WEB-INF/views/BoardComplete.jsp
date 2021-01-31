<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String requestUrl = (String)request.getAttribute("javax.servlet.forward.request_uri");
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
		/*
		alert("<%= requestUrl%>");
		alert("requestUrl : " + $("#requestUrl").val());
		alert("insertUrl : " + $("#insertUrl").val());
		alert("updateUrl : " + $("#updateUrl").val());
		alert("deleteUrl : " + $("#deleteUrl").val());
		// /FinalProject_20210121/boardinsert.action
		// requestUrl : /FinalProject_20210121/boardinsert.action
		//  insertUrl : /FinalProject_20210121/boardinsert.action
		//  updateUrl : /FinalProject_20210121/boardupdate.action
		//  deleteUrl : /FinalProject_20210121/boarddelete.action
		alert($("#requestUrl").val() == $("#insertUrl").val());
		alert($("#requestUrl").val() == $("#updateUrl").val());
		alert($("#requestUrl").val() == $("#deleteUrl").val());
		*/
		
		if ( $("#requestUrl").val() == $("#insertUrl").val() )	// 게시물 작성완료한 경우
		{
			alert("작성이 완료되었습니다.");
			$(location).attr("href", "board.action");
			return;
		}
		if ( $("#requestUrl").val() == $("#updateUrl").val() )	// 게시물 수정 완료한 경우
		{
			alert("수정이 완료되었습니다.");
			$(location).attr("href", "boardcontent.action?board_code="+$("#board_code").val());	
			return;			
		}
		if ( $("#requestUrl").val() == $("#deleteUrl").val() )	// 게시물 삭제 완료한 경우
		{
			alert("삭제가 완료되었습니다.");
			$(location).attr("href", "board.action");	
			return;	
		}
		
	
	});

</script>

<body>

<div>
	<input type="hidden" id="requestUrl" value="<%=requestUrl %>">
	<input type="hidden" id="insertUrl" value="<%=cp%>/boardinsert.action">
	<input type="hidden" id="updateUrl" value="<%=cp%>/boardupdate.action">
	<input type="hidden" id="deleteUrl" value="<%=cp%>/boarddelete.action">
	<input type="hidden" id="board_code" value="${board_code }">
</div>

</body>
</html>