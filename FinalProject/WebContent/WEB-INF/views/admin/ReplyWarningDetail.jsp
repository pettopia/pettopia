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
		<h1>댓글 신고 처리 상세내역</h1>
		
		<div style="margin-bottom: 70px;">
			<h3>댓글 신고 처리 내역</h3>
			<span>접수코드 : WC751326<span style="margin-left: 20px;">( 2020-12-31 10:12:57 )</span></p>
			<table class="table" style="margin-top: 15px; width:670px;">
				<tr>
					<th>댓글코드</th>
					<th>아이디</th>
					<th>닉네임</th>
					<th>처리일시</th>
					<th>사유</th>
					<th>신고회원</th>
					<th>처리담당</th>
				</tr>
				<tr>
					<td>21124501</td>
					<td>kjinok1988</td>
					<td>뿡뿡</td>
					<td>2020-12-31 11:22:05</td>
					<td>욕설</td>
					<td>song8song</td>
					<th>운영자3</th>
				</tr>
				
			</table>
			
			<div>
				<p class="mark" style="font-weight: bold;">상세내용</p>
				<textarea class="form-control" style="height: 100px;">본인과 다른 회원들에게 댓글로 심한 욕을 함</textarea>
			</div>
			
			
			<div class="text_wrap">
				<p><span style="font-weight: bold;">관리자 처리 내용</span></p>
				<textarea rows="10" cols="30" style="width: 660px; height: 100px;">댓글 내용이 다른 회원들에게 불쾌감을 줄 수 있는 내용을 포함하고 있으므로 블라인드 처리</textarea>
			</div>
			
			<a href="javascript:window.close();" class="btn btn-default" style="float: right;">닫기</a>
			
		</div>
	</div><!-- .contents end -->
</div><!-- .container end -->
	
</body>
</html>