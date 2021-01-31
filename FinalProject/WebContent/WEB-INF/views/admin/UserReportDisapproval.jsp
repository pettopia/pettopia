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
<title>관리자 | 회원 신고 처리</title>

<link rel="stylesheet" href="<%=cp %>/css/bootstrap.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/bootstrap.min.js"></script>

<style type="text/css">
	table, th, td
	{
		text-align: center;
	}
	.container
	{
		width:720px;
		display: inline-flex;
	}
	.contents
	{
		margin-left: 50px;
	}
	.approval_text_wrap, .disapproval_text_wrap {
	    float: left;
	    margin-top: 15px;
	    margin-bottom: 30px;
	    width: 670px;
	    height: 170px;
	    border: 1px solid #e3e3e3;
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
		<h1>회원 신고 처리 내역</h1>
		
		<div style="margin-bottom: 70px;">
			<h3>회원 신고 제재불가 내역</h3>
			<span>접수코드 : ${report.code }<span style="margin-left: 20px;">( ${report.report_date } )</span></p>
			<table class="table" style="margin-top: 15px; width:670px;">
				<tr>
					<th>아이디</th>
					<th>닉네임</th>
					<th>처리일시</th>
					<th>사유</th>
					<th>신고회원</th>
					<th>처리담당</th>
				</tr>
				<tr>
					<td>${report.defendantid }</td>
					<td>${report.nick }</td>
					<td>${report.ref_date }</td>
					<td>${report.reason }</td>
					<td>${report.declarantid }</td>
					<td>${report.ref_mg }</td>
				</tr>
				
			</table>
			
			<div>
				<p class="mark" style="font-weight: bold;">상세내용</p>
				<textarea class="form-control" style="height: 100px;" readonly="readonly">
				${report.content }
				</textarea>
			</div>
			
			<div style="margin-top: 20px;">
				<p class="mark" style="font-weight: bold;">
					첨부자료<br>
					<c:forEach var="doc" items="${documentList }">
					<a href="#a" style="margin-left: 50px; font-weight: normal;">${doc.filename }</a><br>
					</c:forEach>
				</p>
			</div>	
			
				
			<div class="text_wrap">
				<p><span style="font-weight: bold;">관리자 처리 내용</span></p>
				<p>제재불가사유 : [사유코드 ${report.restrict_reason_code }] ${report.restrict_reason_content }</p>
				<textarea class="form-control" rows="10" cols="30" style="width: 660px; height: 100px;" readonly="readonly">${report.mgcontent }</textarea>
			</div>
			
			
			<a href="javascript:window.close();" class="btn btn-default" style="float: right;">닫기</a>
		</div>
	</div><!-- .contents end -->
</div><!-- .container end -->
	
</body>
</html>