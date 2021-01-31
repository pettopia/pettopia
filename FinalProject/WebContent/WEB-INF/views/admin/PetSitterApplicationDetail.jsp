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
<title>펫시터 신청 상세</title>

<link rel="stylesheet" href="<%=cp %>/css/bootstrap.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/bootstrap.min.js"></script>

<script type="text/javascript">

	$().ready(function()
	{
		// 메세지 전송 영역
		// 승인 버튼 클릭 액션 - "펫시터 회원이 되었습니다! 펫시터 프로필을 작성해주세요. <a>프로필 작성하기</a>"
		$(".approval").click(function(e)
		{
			
						
			$(location).attr("href", "psreg.action?reqcode="+'${petsitter.reqcode}');
			
		});	// end 승인 버튼 클릭 액션
		
		
		// 반려 사유 입력완료 버튼 클릭 액션
		$(".disapproval").click(function()
		{
			//alert($("#ref_reason_code").val());
			
			if( $("#ref_reason_code").val() == 0 )
			{
				alert("반려 사유를 선택해주세요.");
				return;
			}
			
			$("#disapproval").submit();
		});
		
	});


</script>

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
			<span>펫시터신청코드 : ${petsitter.reqcode }</span>
			<table class="table" style="margin-top: 15px; width:670px;">
				<tr>
					<th>회원고유코드</th>
					<th>아이디</th>
					<th>닉네임</th>
					<th>나이</th>
					<th>성별</th>
					<th>신청일자</th>
				</tr>
				<tr>
					<td>${petsitter.code }</td>
					<td>${petsitter.id }</td>
					<td>${petsitter.nick }</td>
					<td>${petsitter.age }세</td>
					<td>${petsitter.sex }</td>
					<td>${petsitter.reqdate }</td>
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
			
			<div style="float: right;">
				<ul class="list-inline">
					<li class="list-inline-item"><a href="javascript:void(0)" class="btn btn-primary approval" role="button">승인</a></li>
					<li class="list-inline-item"><a href="javascript:void(0)" class="btn btn-default reply" role="button">반려</a></li>
				</ul>
			</div>			
			
			<script type="text/javascript">
				
				$().ready(function()
				{					
					$(".reply").click(function()
					{
						if($(".text_wrap").css("display") == "none")
							$(".text_wrap").show();
						else
						{
							$(".text_wrap").css("display", "none");
						}
					});
				});
			
			</script>
					
			<form action="psref.action" method="post" id="disapproval">
				<input type="hidden" name="reqcode" value="${petsitter.reqcode }">
				<div class="text_wrap" style="display: none;">
					<p>
						<span style="font-weight: bold;">반려사유</span>
						<select id="ref_reason_code" name="ref_reason_code" class="form-control" style="width: 150px; float: right; margin-right: 10px;">
							<option value="0">=사유 선택=</option>
							<c:forEach var="reason" items="${refReasonList }">
							<option value="${reason.code }">${reason.content }</option>
							</c:forEach>
						</select>
					</p>
					<textarea name="content" rows="10" cols="30" style="width: 660px; height: 100px; margin-top: 10px;"></textarea>
					<a href="javascript:void(0);" class="btn btn-primary disapproval" style="float: right;">입력완료</a>
				</div>	
			</form>
			
		</div>
	</div><!-- .contents end -->
</div><!-- .container end -->
	
</body>
</html>