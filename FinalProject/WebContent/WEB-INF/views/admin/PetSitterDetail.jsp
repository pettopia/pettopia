<%@page import="java.io.File"%>
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
<title>펫시터 프로필</title>

<link rel="stylesheet" href="<%=cp %>/css/bootstrap.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/bootstrap.min.js"></script>

<style type="text/css">
	p {
		margin: 0 auto;
	}
	ul, li {
	    list-style: none;
	    padding-left: 0px;
	}
	table, th, td
	{
		text-align: center;
	}
	table p
	{
		text-align: left;
	}
	.container
	{
		width:720px;
		display: inline-flex;
	}
	.contents
	{
		margin-left: 50px;
		margin-bottom: 50px;
	}
	.text_wrap {
	    float: left;
	    margin-top: 15px;
	    margin-bottom: 30px;
	    width: 670px;
	    height: 170px;
	    border: 1px solid #e3e3e3;
	}
	.doc li { float: left; } 
</style>

</head>
<body>
<div class="container">

	<div class="contents">
		<div>
			<h1>펫시터 프로필</h1>
			
			<div style="margin-bottom: 70px;">
				<h3>신청 처리 내역</h3>
				<p>펫시터신청코드 : ${petsitter.reqcode }<span style="margin-left: 20px;">( ${petsitter.reqdate } )</span></p>
				<table class="table" style="margin-top: 15px; width:670px;">
					<tr style="vertical-align: middle;">
						<th>펫시터코드</th>
						<th>아이디</th>
						<th>닉네임</th>
						<th>나이</th>
						<th>성별</th>
						<th>처리일시</th>
						<th>담당자</th>
					</tr>
					<tr style="vertical-align: middle;">
						<td>${petsitter.regcode }</td>
						<td>${petsitter.id }</td>
						<td>${petsitter.nick }</td>
						<td>${petsitter.age }세</td>
						<td>${petsitter.sex }</td>
						<td>${petsitter.approval_date }</td>
						<td>${petsitter.approval_mg }</td>
					</tr>
				</table>
				
				<table class="table" style="margin-top: 15px; width:670px;">
					<tr>
						<th style="width: 130px; vertical-align: middle">경력소개</th>
						<td>
							${petsitter.content }
						</td>
					</tr>
					<tr>
						<th>증빙서류<br>첨부내역</th>
						<td style="text-align: left;">
							<ul class="doc">
								<c:forEach var="doc" items="${documentList}">
								<li>
									<span style="float: left; width: 150px; margin: 0;">구분 : ${doc.doc_type }</span>
									<p style="float: left;"><a href="">${doc.filename }</a></p>
								</li>
								</c:forEach>
								
								<!-- 
								<li>
									<span style="float: left; width: 150px; margin: 0;">구분 : 관련자격증</span>
									<p style="float: left;"><a href="">애견미용자격증.png</a></p>
								</li>
								-->		
							</ul>
						</td>
					</tr>
				</table>
				
			</div>
		</div>
		
		<div>	
				
			<div style="margin-bottom: 70px;">
				<h3>프로필</h3>
				<c:if test="${profile == null }">
				<p> 작성된 내역이 없습니다. </p>
				</c:if>
				<c:if test="${profile != null }">	
				<p>펫시터프로필코드 : ${profile.profile_code }</p>
				<table class="table table-bordered" style="margin-top: 15px; width:670px;">
					<tr style="vertical-align: middle;">
						<th>돌봄형태(위탁/방문)</th>
						<th>주소</th>
						<th>프로필공개여부</th>
					</tr>
					<tr>	
						<td>${profile.care }</td>
						<td>${profile.ps_addr }</td>
						<td>${profile.open_type }</td>
					</tr>
				</table>
				<br>
				<table class="table table-bordered" style="margin-top: 15px; width:670px;">
					<tr>
						<th style="width: 117px; vertical-align: middle;">이용서비스</th>
						<td>
						<%
							int cnt = 0;
						%>
							<c:forEach var="service" items="${serviceList }">
							${cnt }
							<span style="float: left; width: 100px; margin: 0;">${service }</span>
							<% 
								cnt = cnt + 1;
								if (cnt%5 == 0)
								{
							%>
								<br>
							<%  }   %>
							</c:forEach>
							<!-- 
							<span style="float: left; width: 100px; margin: 0;">노령견가능</span>
							<span style="float: left; width: 100px; margin: 0;">약물복용가능</span>
							<span style="float: left; width: 100px; margin: 0;">목욕가능</span>
							<span style="float: left; width: 100px; margin: 0;">매일산책가능</span>
							<span style="float: left; width: 100px; margin: 0;">마당있음</span>
							<br><span style="float: left; width: 100px; margin: 0;">돌봄경험있음</span>
							-->
						</td>
					</tr>
					<tr>
						<th>돌봄환경<br>이미지</th>
						<td style="text-align: left;">
							<ul class="image">
								<c:forEach var="img" items="${imgList }">
								<li>
									<span style="float: left; width: 330px; margin: 0; margin-left: 10px;"><a href="">${img.filename }</a></span>
									<p style="float: left;">${img.regdate }</p>
								</li>
								</c:forEach>
								<!-- 
								<li>
									<span style="float: left; width: 330px; margin: 0; margin-left: 10px;"><a href="">거실.png</a></span>
									<p style="float: left;">2020-12-30 20:20:12</p>
								</li>
								-->
							</ul>
						</td>
					</tr>
					<tr>
						<th style="width: 117px; vertical-align: middle;">상세내용</th>
						<td>
							${profile.content }
						</td>
					</tr>
				</table>
				<br>
				<h4>※ 계좌정보</h4>
				<table class="table table-bordered" style="margin-top: 15px; width:670px;">
					<tr style="vertical-align: middle;">
						<th>은행명</th>
						<th>예금주명</th>
						<th>계좌번호</th>
						<th>프로필작성일</th>
					</tr>
					<tr>
						<td>${profile.bank }</td>
						<td>${profile.depositor }</td>
						<td>${profile.account_num }</td>
						<td>${profile.writedate }</td>
					</tr>
				</table>
				</c:if>
			</div>
			
			
			<a href="javascript:window.close();" class="btn btn-default" style="float: right;">닫기</a>
		
		</div>
	</div><!-- .contents end -->
</div><!-- .container end -->
	
</body>
</html>