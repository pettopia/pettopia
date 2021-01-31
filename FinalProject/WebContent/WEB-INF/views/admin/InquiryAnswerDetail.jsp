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
<title>관리자 | 댓글 신고</title>

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
	.text_wrap {
	    float: left;
	    margin-top: 50px;
	    margin-bottom: 30px;
	    width: 670px;
	    height: 170px;
	    border: 1px solid #e3e3e3;
	}
</style>

<script type="text/javascript">

	$().ready(function()
	{

		// 승인 내용 작성 후 완료 클릭 액션
		$(".submit").click(function()
		{
			$("#reply").submit();
		});
		
	});


</script>

</head>
<body>
<div class="container">

	<div class="contents">
		<h1>1:1 문의 내역</h1>
		
		<div style="margin-bottom: 70px;">
			<h3>1:1 문의</h3>
			<p><span>접수코드 : ${inquiry.code }<span style="margin-left: 20px;">( ${inquiry.reg_date } )</span></p>
			<table class="table" style="margin-top: 15px; width:670px;">
				<tr>
					<th>회원고유코드</th>
					<th>회원등록코드</th>
					<th>아이디</th>
					<th>닉네임</th>
					<th>나이</th>
					<th>처리일시</th>
					<th>처리담당</th>
				</tr>
				<tr>
					<td>${inquiry.member_code }</td>
					<td>${inquiry.member_reg_code }</td>
					<td>${inquiry.id }</td>
					<td>${inquiry.nick }</td>
					<td>${inquiry.age }세</td>
					<td>${inquiry.com_date }</td>
					<td>${inquiry.mg }</td>
				</tr>
				
			</table>
			
			<div class="form">
				<p class="mark" style="font-weight: bold;">문의제목</p>
				<input type="text" class="form-control" readonly="readonly"
				style="float: left;" value="${inquiry.title }">
			</div>
			
			<div>
				<p class="mark" style="font-weight: bold; margin-top: 50px;">문의내용</p>
				<textarea class="form-control" style="height: 100px;" readonly="readonly">${inquiry.content }</textarea>
			</div>		
				
			<div class="text_wrap">
				<p><span style="font-weight: bold;">관리자 처리 내용</span></p>
				<textarea class="form-control" rows="10" cols="30" style="width: 660px; height: 100px;" readonly="readonly">${inquiry.mgcontent }</textarea>
			</div>
			
			<a href="javascript:window.close();" class="btn btn-default" style="float: right;">닫기</a>
		</div>
	</div><!-- .contents end -->
</div><!-- .container end -->
	
</body>
</html>