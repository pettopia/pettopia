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
	.reply_text_wrap {
	    float: left;
	    margin-top: 15px;
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
			<span>접수코드 : ${inquiry.code }</span>
			<table class="table" style="margin-top: 15px; width:670px;">
				<tr>
					<th>회원고유코드</th>
					<th>회원등록코드</th>
					<th>아이디</th>
					<th>닉네임</th>
					<th>나이</th>
					<th>문의일시</th>
				</tr>
				<tr>
					<td>${inquiry.member_code }</td>
					<td>${inquiry.member_reg_code }</td>
					<td>${inquiry.id }</td>
					<td>${inquiry.nick }</td>
					<td>${inquiry.age }세</td>
					<td>${inquiry.reg_date }</td>
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
			
			<form action="inquirycomplete.action" method="post" id="reply">
				<input type="hidden" name="code" value="${inquiry.code }">
				<div class="reply_text_wrap">
					<p><span style="font-weight: bold;">문의 답변 작성</span></p>
					<textarea name="mgcontent" rows="10" cols="30" style="width: 660px; height: 100px;"></textarea>
					<a href="javascript:void(0);" class="btn btn-primary submit" style="float: right;">답변완료</a>
				</div>	
			</form>
			
			
		</div>
	</div><!-- .contents end -->
</div><!-- .container end -->
	
</body>
</html>