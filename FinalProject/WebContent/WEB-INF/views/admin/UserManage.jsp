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

	function userDetail()
	{
		window.open("UserInfoDetail.jsp", "", "width=650, height=720, top=300, left=400");
	}

	function userUpdate()
	{
		window.open("UserInfoUpdate.jsp", "", "width=650, height=720, top=300, left=400");
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
		<h1>회원 정보 조회</h1>
		
		<div style="margin-bottom: 70px;">
			<h3>검색 조건</h3>
			<p>총 회원수 : 100 명</p>
			<form action="">
				<table  id="search_tbl" class="table">
					<tr>
						<th>검색어</th>
						<td>
							<div class="form-inline">
								<select class="form-control">
									<option value="">회원고유코드</option>
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
						<th>성별</th>
						<td>
							<div style="">
								<input type="checkbox" style="margin-right: 10px;" checked="checked">전체
								<input type="checkbox" style="margin-right: 10px;">여성
								<input type="checkbox" style="margin-right: 10px;">남성
							</div>
						</td>
					</tr>
					<tr>
						<th>활동상태</th>
						<td>
							<div style="">
								<input type="checkbox" style="margin-right: 10px;" checked="checked">전체
								<input type="checkbox" style="margin-right: 10px;">정상
								<input type="checkbox" style="margin-right: 10px;">경고
								<input type="checkbox" style="margin-right: 10px;">영구정지
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
			<h3>회원 목록</h3>
			<p>검색 결과 : 3 건</p>
			<div style="float: right;">
				<select class="form-control" style="width:180px;">
					<option>회원등록코드 순</option>
					<option>아이디 순</option>
					<option>닉네임 순</option>
				</select>
			</div>
			<table class="table">
				<tr>
					<th><input type="checkbox"></th>
					<th></th>
					<th>회원등록코드</th>
					<th>아이디</th>
					<th>닉네임</th>
					<th>생년월일</th>
					<th>나이</th>
					<th>성별</th>
					<th>연락처</th>
					<th>활동상태</th>
					<th></th>
				</tr>
				<tr>
					<td><input type="checkbox"></td>
					<td>3</td>
					<td>1234569</td>
					<td><a href="javascript:userDetail()">rnlcksg77</a></td>
					<td>아롱이누나</td>
					<td>950716</td>
					<td>27 세</td>
					<td>여</td>
					<td>010-1212-2321</td>
					<td>정상</td>
					<td>
						<a href="javascript:userUpdate()" class="btn btn-default">수정</a>
						<a href="#a" class="btn btn-default">경고</a>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox"></td>
					<td>2</td>
					<td>1234568</td>
					<td><a href="javascript:userDetail()">gugu81</a></td>
					<td>구구81</td>
					<td>990801</td>
					<td>23 세</td>
					<td>남</td>
					<td>010-3785-4682</td>
					<td>정상</td>
					<td>
						<a href="javascript:userUpdate()" class="btn btn-default">수정</a>
						<a href="#a" class="btn btn-default">경고</a>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox"></td>
					<td>1</td>
					<td>1234567</td>
					<td><a href="javascript:userDetail()">ba__bo__</a></td>
					<td>순돌맘</td>
					<td>871222</td>
					<td>35 세</td>
					<td>여</td>
					<td>010-7845-7845</td>
					<td>정상</td>
					<td>
						<a href="javascript:userUpdate()" class="btn btn-default">수정</a>
						<a href="#a" class="btn btn-default">경고</a>
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