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
<title>관리자 | 회원관리</title>

<link rel="stylesheet" href="<%=cp %>/css/bootstrap.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/bootstrap.min.js"></script>

<style type="text/css">
	table, th, td
	{
		text-align: center;
	}
	.left_side
	{
		width: 200px;
    	float: left;
	}
	.container
	{
		width:1300px;
		display: inline-flex;
	}
	.contents
	{
		margin-left: 50px;
	}
	#search_tbl { text-align: left; }
	#search_tbl th
	{
		width: 150px;
		padding-left: 30px;
		text-align: left;
	}
	#search_tbl td { text-align: left; }
	.table > tbody > tr > td:nth-child(11) { padding-top: 3px; padding-bottom: 3px; }
</style>

<script type="text/javascript">
	function detail()
	{
		window.open("UserWarningDetail.jsp", "", "width=800, height=450, top=300, left=400");
	}

</script>

</head>
<body>

<div class="header" style="background-color: #ccc; height: 100px;">
	헤더 영역
</div>




<div class="container">
	<div class="left_side">
		<c:import url="AdminLeftSide.jsp"></c:import>
	</div><!-- .left_side -->
	
	<div class="contents">
		<h1>경고 회원 관리</h1>
		
		<div style="margin-bottom: 70px;">
			<h3>검색 조건</h3>
			<form action="">
				<table  id="search_tbl" class="table" style="margin-bottom: 0px;">
					<tr>
						<th>검색어</th>
						<td>
							<div class="form-inline">
								<select class="form-control">
									<option value="">회원등록코드</option>
									<option value="">아이디</option>
									<option value="" selected="selected">닉네임</option>
									<option value="">생년월일</option>
									<option value="">연락처</option>
									<option value="">이메일</option>
								</select>
								<input type="text" class="form-control" style="width:600px;">
							</div>
						</td>
					</tr>
					<tr>
						<th>처리기간</th>
						<td>
							<div>
								<input type="button" class="btn btn-primary" value="오늘">
								<input type="button" class="btn btn-default" value="3일">
								<input type="button" class="btn btn-default" value="7일">
								<input type="button" class="btn btn-default" value="1개월">
								<input type="button" class="btn btn-default" value="3개월">
								<input type="button" class="btn btn-default" value="6개월">
								<input type="date"> ~ <input type="date">
								
								<input type="button" class="btn btn-default" value="기간 설정">
							</div>
						</td>
					</tr>
				</table>
				
				<div style="float: right; text-align: center;">
					<input type="submit" class="btn btn-primary" value="검색">
					<a href="#a" class="btn btn-default" role="button">초기화</a>
				</div>
			</form>
		</div>
		
		<div style="margin-bottom: 70px;">
			<h3>경고 조치 회원 목록</h3>
			<p>검색 결과 : 1 건</p>
			<div style="float: right;">
				<select class="form-control" style="width:180px;">
					<option>회원등록코드 순</option>
					<option>아이디 순</option>
					<option>닉네임 순</option>
					<option>처리기간 순</option>
				</select>
			</div>
			<table class="table">
				<tr>
					<th><input type="checkbox"></th>
					<th></th>
					<th>접수코드</th>
					<th>아이디</th>
					<th>닉네임</th>
					<th>경고일시</th>
					<th>사유</th>
					<th>경고 해제 일시</th>
					<th>처리담당</th>
					<th>첨부자료</th>
				</tr>
				<tr>
					<td><input type="checkbox"></td>
					<td>1</td>
					<td><a href="javascript:detail();">WU451228</a></td>
					<td>ksd1026</td>
					<td>쩌리잇</td>
					<td>2020-12-31 13:02:15</td>
					<td>욕설</td>
					<td>2021-01-07 13:02:14</td>
					<td>운영자1</td>
					<td>
						<a href="#a">캡처.png</a>
					</td>
				</tr>
			</table>
			<a href="#a" class="btn btn-default" role="button" style="float:right;">회원 전체보기</a>
		</div>
		
		
	
	</div><!-- .contents end -->
	
</div><!-- .container end -->
		
<div class="footer" style="background-color: #ccc; height: 100px;">
	푸터 영역
</div>

</body>
</html>