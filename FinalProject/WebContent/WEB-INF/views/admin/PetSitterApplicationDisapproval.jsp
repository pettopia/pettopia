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
<title>펫시터 신청 상세</title>

<link rel="stylesheet" href="<%=cp %>/css/bootstrap.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/bootstrap.min.js"></script>

<style type="text/css">
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
		<h1>펫시터 신청 상세내역</h1>
		
		<div style="margin-bottom: 70px;">
			<h3>신청내역</h3>
			<span>펫시터신청코드 : ${petsitter.reqcode }<span style="margin-left: 20px;">( ${petsitter.reqdate } )</span></p>
			<table class="table" style="margin-top: 15px; width:670px;">
				<tr>
					<th>회원고유코드</th>
					<th>아이디</th>
					<th>닉네임</th>
					<th>나이</th>
					<th>성별</th>
					<th>처리일시</th>
					<th>처리담당</th>
				</tr>
				<tr>
					<td>${petsitter.code }</td>
					<td>${petsitter.id }</td>
					<td>${petsitter.nick }</td>
					<td>${petsitter.age }세</td>
					<td>${petsitter.sex }</td>
					<td>${petsitter.disapproval_date }</td>
					<td>${petsitter.disapproval_mg }</td>
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
						</ul>
					</td>
				</tr>
			</table>
			
			
			<div class="text_wrap">
				<p><span style="font-weight: bold;">관리자 처리 내용</span></p>
				<p>반려 사유 : [사유코드 ${petsitter.ref_reason_code }] ${petsitter.ref_reason }</p>
				<textarea rows="10" cols="30" style="width: 660px; height: 100px;" readonly="readonly">${petsitter.pscontent }</textarea>
			</div>
			
			
			<a href="javascript:window.close();" class="btn btn-default" style="float: right;">닫기</a>
			
		</div>
	</div><!-- .contents end -->
</div><!-- .container end -->
	
</body>
</html>