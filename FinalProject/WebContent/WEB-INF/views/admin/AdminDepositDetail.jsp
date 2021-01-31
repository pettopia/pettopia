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
<title>관리자 | 예치금 관리</title>

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
</style>

</head>
<body>
<div class="container">

	<div class="contents">
		<h1>펫시터 거래 예치금 상세내역</h1>
		
		<div style="margin-bottom: 70px;">
			<h3>결제내역</h3>
			<span>거래코드 : 0017201228-02</span>
			<table class="table" style="margin-top: 15px; width:670px;">
				<tr>
					<th>거래상태</th>
					<th>금액</th>
					<th>일자</th>
					<th>구분</th>
					<th>은행명</th>
					<th>계좌번호</th>
					<th>예금주</th>
				</tr>
				<tr>
					<td>거래대기</td>
					<td>+ 80,000</td>
					<td>2020-12-28 11:38:42</td>
					<td>예치금 결제(카드)</td>
					<td></td><td></td><td></td>
				</tr>
				<tr>
					<td>거래확정</td>
					<td>- 80,000</td>
					<td>2021-01-02 14:03:21</td>
					<td>미지급금 지급</td>
					<td>농협</td>
					<td>302-1425-1425-14</td>
					<td>김집사</td>
				</tr>
				<tr>
					<td>총 금액</td>
					<td><mark style="font-weight: bold">0</mark></td>
					<td colspan="5"></td>
				</tr>
			</table>
			
			<a href="javascript:window.close();" class="btn btn-default" style="float: right;">닫기</a>
		</div>
	</div><!-- .contents end -->
</div><!-- .container end -->
	
</body>
</html>