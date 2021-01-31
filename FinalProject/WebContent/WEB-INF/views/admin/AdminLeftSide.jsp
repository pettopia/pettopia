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
<title>AdminLeftSide.jsp</title>

<style type="text/css">

	div ul span {
		font-size: large;
	}

</style>

</head>
<body>
	
	<!------------------------------------------ 
	
	메인페이지에 추가 ↓↓
	url 경로 수정하기!
	
	<%-- <div class="left_side">
		<c:import url="AdminLeftSide.jsp"></c:import>
	</div> --%>
	
	------------------------------------------->

	<div class="" role="group">
		<ul>
			<span>회원 관리</span>
			<li><a href="#a">회원 정보 조회</a></li>
			<li><a href="#a">경고 회원 관리</a></li>
			<li><a href="#a">영구정지 회원 관리</a></li>
		</ul>
		<ul>
			<span>펫시터 관리</span>
			<li><a href="#a">펫시터 관리</a></li>
			<li><a href="#a">프로 펫시터 심사 관리</a></li>
		</ul>
		<ul>
			<span>게시물 관리</span>
			<li><a href="#a">공지사항 관리</a></li>
			<li><a href="#a">자유게시판 관리</a></li>
			<li><a href="#a">산책모임방 관리</a></li>
			<li><a href="#a">펫시터 관리</a></li>
			<li><a href="#a">1:1 문의</a></li>
			<li><a href="#a">푸쉬알람 발송</a></li>
		</ul>
		<ul>
			<span>댓글 관리</span>
			<li><a href="#a">자유게시판 댓글 관리</a></li>
			<li><a href="#a">산책모임방 댓글 관리</a></li>
			<li><a href="#a">펫시터 댓글 관리</a></li>
		</ul>
		<ul>
			<span>견종 관리</span>
			<li><a href="#a">견종 관리</a></li>
		</ul>
		<ul>
			<span>펫시터 거래 관리</span>
			<li><a href="#a">펫시터 거래 예치금 관리</a></li>
		</ul>
		<ul>
			<span>통계</span>
			<li><a href="#a">신규 가입회원</a>
		</ul>
	</div>

</body>
</html>