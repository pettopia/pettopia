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

<link rel="stylesheet" href="css/bootstrap-theme.min.css">

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
		margin-left: 10px;
	}
	#search_tbl th
	{
		width: 150px;
		text-align: left;
		padding-left: 30px;
	}
	#search_tbl td
	{
		text-align: left;
		margin-left: 10px;
	}
</style>

<script type="text/javascript">
	function detail()
	{
		window.open("AdminDepositDetail.jsp", "", "width=800, height=450, top=300, left=400");
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
		<h1>펫시터 거래 예치금 관리</h1>
		
		<div>
			<p style="font-size: medium;">
				펫토피아 총 예치금 현황  :  <span style="color:red; margin-left: 10px;">1,827,500 원</span>
				<p>
					<span style="color: gray;">업데이트 시간 :  2021-01-02 16:12:39</span>
					<a href="#a" class="glyphicon glyphicon-refresh" style="margin-left: 10px;"></a>
				</p>
			</p>
		</div>
		
		
		<div style="margin-bottom: 70px;">
			<h3>검색 조건</h3>
			<form action="">
				<table  id="search_tbl" class="table">
					<tr>
						<th>검색어</th>
						<td>
							<div class="form-inline">
								<select class="form-control">
									<option value="">거래코드</option>
									<option value="">펫시터코드</option>
									<option value="">펫시터 닉네임</option>
									<option value="">펫시터 아이디</option>
									<option value="">이용자 닉네임</option>
									<option value="">이용자 아이디</option>
								</select>
								<input type="text" class="form-control" style="width:600px;">
							</div>
						</td>
					</tr>
					<tr>
						<th>기간</th>
						<td>
							<input type="button" class="btn btn-primary" value="오늘">
							<input type="button" class="btn btn-default" value="3일">
							<input type="button" class="btn btn-default" value="7일">
							<input type="button" class="btn btn-default" value="1개월">
							<input type="button" class="btn btn-default" value="3개월">
							<input type="button" class="btn btn-default" value="6개월">
							<input type="date">~<input type="date">
							
							<input type="button" class="btn btn-default" value="기간 설정">
						</td>
					</tr>
					<tr>
						<th>거래상태</th>
						<td>
							<input type="checkbox" style="margin-right: 10px;" checked="checked">전체
							<input type="checkbox" style="margin-right: 10px;">예약대기
							<input type="checkbox" style="margin-right: 10px;">예약승인
							<input type="checkbox" style="margin-right: 10px;">거래대기
							<input type="checkbox" style="margin-right: 10px;">거래중
							<input type="checkbox" style="margin-right: 10px;">거래완료
							<input type="checkbox" style="margin-right: 10px;">거래확정
							<input type="checkbox" style="margin-right: 10px;">예약취소
							<input type="checkbox" style="margin-right: 10px;">거래취소
						</td>
					</tr>
				</table>
				<div style="text-align: center;">
					<input type="submit" class="btn btn-primary" value="검색">
					<a href="#a" class="btn btn-default" role="button">초기화</a>
				</div>
			</form>
		</div>
			
		<div style="margin-bottom: 70px;">
			<h3>검색 결과</h3>
			<div style="float: right;">
				<select class="form-control" style="width:180px;">
					<option>최신거래순</option>
					<option>거래코드 오름차순</option>
					<option>거래코드 내림차순</option>
					<option>보유예치금 내림차순</option>
					<option>보유예치금 오름차순</option>
				</select>
			</div>
			<table class="table">
				<tr>
					<th></th>
					<th>거래코드</th>
					<th>보유예치금</th>
					<th>펫시터닉네임</th>
					<th>이용자닉네임</th>
					<th>강아지</th>
					<th>예약신청일</th>
					<th>펫시팅 시작일</th>
					<th>펫시팅 종료일</th>
					<th>거래상태</th>
				</tr>
				<tr>
					<td>3</td>
					<td><a href="javascript:detail()">0017210101-01</a></td>
					<td style="text-align: right;">65,000 원</td>
					<td>강아지엄마</td>
					<td>토르누나</td>
					<td>토르</td>
					<td>2020-01-01</td>
					<td>2021-01-02 10:00</td>
					<td>2021-01-03 17:00</td>
					<td>거래대기</td>
				</tr>
				<tr>
					<td>2</td>
					<td><a href="#a">0017201228-02</a></td>
					<td style="text-align: right;">0 원</td>
					<td>집사</td>
					<td>박민순</td>
					<td>진돌이</td>
					<td>2020-12-28</td>
					<td>2020-12-30 13:00</td>
					<td>2021-01-01 18:00</td>
					<td>거래확정</td>
				</tr>
				<tr>
					<td>1</td>
					<td><a href="#a">0017201228-01</a></td>
					<td style="text-align: right;">0 원</td>
					<td>집사</td>
					<td>박민순</td>
					<td>진돌이</td>
					<td>2020-12-28</td>
					<td>2021-01-03 13:00</td>
					<td>2021-01-04 18:00</td>
					<td>예약취소</td>
				</tr>
			</table>
		</div>
		
	</div><!-- .contents end -->
</div><!-- .container end -->
		
<div class="footer" style="background-color: #ccc; height: 100px;">
	푸터 영역
</div>

</body>
</html>