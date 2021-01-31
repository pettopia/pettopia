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
<title>알림</title>

<link rel="stylesheet" href="<%=cp %>/css/bootstrap.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/bootstrap.min.js"></script>

<style type="text/css">
	table, th, td
	{
		text-align: center;
	}
	td
	{
		white-space: pre-line;
	}
	.container
	{
		width:500px;
		display: inline-flex;
	}
	.contents
	{
		margin-left: 50px;
	}
	.text_wrap {
	    float: left;
	    margin-top: 15px;
	    margin-bottom: 30px;
	    width: 670px;
	    height: 170px;
	    border: 1px solid #e3e3e3;
	}
</style>

</head>
<body>
<div class="container">

	<div class="contents">
		<h1>알림</h1>
		
		<div style="margin-bottom: 70px;">
			<h3></h3>
			<span><strong>${nick }</strong> 님에게 도착한 알림입니다.</span>
			<table class="table" style="margin-top: 15px; width:500px;">
				<tr>
					<th style="width: 70%;">내용</th>
					<th style="width: 30%;">알림발송일</th>
				</tr>
				<c:if test="${count == 0}">
				<tr>
					<td colspan="2">도착한 알림이 없습니다.</td>
				</tr>
				</c:if>
				<c:forEach var="notify" items="${newNotifyList }">
				<tr>
					<td>
${notify.content }

<c:if test="${notify.notify_type_code == 'NO-000001' }"><a href="petprofileshareok.action?pet_con_req_seq=${notify.reference_code }&no_code=${notify.no_code}" role="button" class="notifyBtn">${notify.url_name }</a> | <a href="petprofileshareno.action?pet_con_req_seq=${notify.reference_code }&no_code=${notify.no_code}" role="button" class="notifyBtn">요청 거절</a></c:if><c:if test="${notify.notify_type_code != 'NO-000001' }"><a href="petprofileshareok.action?pet_con_req_seq=${notify.reference_code }&no_code=${notify.no_code}" role="button" class="notifyBtn">${notify.url_name }</a></c:if>
					</td>
					<td style="vertical-align: middle;">${notify.reg_date }</td>
				</tr>
				</c:forEach>
			</table>
			
			
			<a href="javascript:window.close();" class="btn btn-default" style="float: right;">닫기</a>
			
			
		</div>
	</div><!-- .contents end -->
</div><!-- .container end -->
	
</body>
</html>