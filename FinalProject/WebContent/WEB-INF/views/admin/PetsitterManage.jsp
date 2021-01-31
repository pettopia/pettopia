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
<title>관리자 | 펫시터</title>

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
	.table > tbody > tr > td:nth-child(13) { padding-top: 3px; padding-bottom: 3px; }
</style>

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
		<h1>펫시터 관리</h1>
		
		<div style="margin-bottom: 70px;">
			<h3>검색 조건</h3>
			<p>총 펫시터 회원 수 : 18 명</p>
			<form action="">
				<table  id="search_tbl" class="table">
					<tr>
						<th>검색어</th>
						<td>
							<div class="form-inline">
								<select class="form-control">
									<option value="">펫시터코드</option>
									<option value="">아이디</option>
									<option value="" selected="selected">닉네임</option>
								</select>
								<input type="text" class="form-control" style="width:600px;">
							</div>
						</td>
					</tr>
					<tr>
						<th>활동상태</th>
						<td>
							<div style="">
								<input type="checkbox" style="margin-right: 10px;" checked="checked">전체
								<input type="checkbox" style="margin-right: 10px;">정상
								<input type="checkbox" style="margin-right: 10px;">중지
							</div>
							
							<div style="float: right; text-align: center;">
								<input type="submit" class="btn btn-primary" value="검색">
								<a href="#a" class="btn btn-default" role="button">초기화</a>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
		
		<div style="margin-bottom: 70px;">
			<h3>펫시터 조회 목록</h3>
			<p>검색 결과 : 2 건</p>
			<div style="float: right;">
				<select class="form-control" style="width:180px;">
					<option>펫시터코드 순</option>
					<option>아이디 순</option>
					<option>닉네임 순</option>
					<option>등록일 순</option>
					<option>거래횟수 내림차순</option>
				</select>
			</div>
			<table class="table">
				<tr>
					<th><input type="checkbox"></th>
					<th></th>
					<th>펫시터코드</th>
					<th>아이디</th>
					<th>닉네임</th>
					<th>나이</th>
					<th>성별</th>
					<th>활동지역</th>
					<th>거래횟수</th>
					<th>활동상태</th>
					<th>등록일</th>
					<th>활동프로필</th>
				</tr>
				<tr>
					<td><input type="checkbox"></td>
					<td>2</td>
					<td>PST1234530</td>
					<td>tkaruq_2</td>
					<td>오늘의돌보미</td>
					<td>32 세</td>
					<td>여</td>
					<td>서울 마포구</td>
					<td>0 회</td>
					<td>정상</td>
					<td>2021-01-01</td>
					<td>
						<a href="#a" class="btn btn-default">보기</a>
						<a href="#a" class="btn btn-default">수정</a>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox"></td>
					<td>1</td>
					<td>PST1234498</td>
					<td>hatnim1315</td>
					<td>햇님</td>
					<td>28 세</td>
					<td>여</td>
					<td>인천 부평구</td>
					<td>0 회</td>
					<td>중지</td>
					<td>2021-01-01</td>
					<td>
						<a href="#a" class="btn btn-default">보기</a>
						<a href="#a" class="btn btn-default">수정</a>
					</td>
				</tr>
			</table>
			<a href="#a" class="btn btn-default" role="button" style="float:right;">펫시터 전체보기</a>
		</div>
		
		
	
	</div><!-- .contents end -->
	
</div><!-- .container end -->
		
<div class="footer" style="background-color: #ccc; height: 100px;">
	푸터 영역
</div>

</body>
</html>