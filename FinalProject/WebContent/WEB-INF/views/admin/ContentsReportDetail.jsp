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
<title>관리자 | 게시물 신고</title>

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
	.approval_text_wrap, .disapproval_text_wrap {
	    float: left;
	    margin-top: 15px;
	    margin-bottom: 30px;
	    width: 670px;
	    height: 170px;
	    border: 1px solid #e3e3e3;
	}
</style>

<script type="text/javascript">

	$().ready(function()
	{

		// 승인 내용 작성 후 완료 클릭 액션
		$(".submit").click(function()
		{
			$("#approval").submit();
		});
		
		// 반려 사유 입력완료 버튼 클릭 액션
		$(".dis_submit").click(function()
		{
			//alert($("#ref_reason_code").val());
			
			if( $("#restrict_reason_code").val() == 0 )
			{
				alert("반려 사유를 선택해주세요.");
				return;
			}
			
			$("#disapproval").submit();
		});
		
	});


</script>

</head>
<body>
<div class="container">

	<div class="contents">
		<h1>게시물 신고 접수 상세내역</h1>
		
		<div style="margin-bottom: 70px;">
			<h3>게시물 신고 상세 내역</h3>
			<span>접수코드 : ${report.code }</span>
			<table class="table" style="margin-top: 15px; width:670px;">
				<tr>
					<th>게시글코드</th>
					<th>아이디</th>
					<th>닉네임</th>
					<th>신고일시</th>
					<th>사유</th>
					<th>신고회원</th>
				</tr>
				<tr>
					<td>${report.board_code }</td>
					<td>${report.id }</td>
					<td>${report.nick }</td>
					<td>${report.report_date }</td>
					<td>${report.reason }</td>
					<td>${report.declarantId }</td>
				</tr>
				
			</table>
			
			<div>
				<p class="mark" style="font-weight: bold;">상세내용</p>
				<textarea class="form-control" style="height: 100px;" readonly="readonly">${report.content }</textarea>
			</div>
			
			<div style="float: right;">
				<ul class="list-inline">
					<li class="list-inline-item"><a href="#a" class="btn btn-primary approval" role="button">승인</a></li>
					<li class="list-inline-item"><a href="#a" class="btn btn-default disapproval" role="button">제재불가</a></li>
				</ul>
			</div>
			
			<script type="text/javascript">
				
				$().ready(function()
				{					
					$(".approval").click(function()
					{
						if($(".approval_text_wrap").css("display") == "none")
						{
							$(".disapproval_text_wrap").css("display", "none");					
							$(".approval_text_wrap").show();
						}
						else
						{
							$(".approval_text_wrap").css("display", "none");
						}
					});		
					
					$(".disapproval").click(function()
					{
						if($(".disapproval_text_wrap").css("display") == "none")
						{
							$(".approval_text_wrap").css("display", "none");
							$(".disapproval_text_wrap").show();
						}
						else
						{
							$(".disapproval_text_wrap").css("display", "none");
						}
					});
				});
			
			</script>
					
			<form action="contentsreportreg.action" method="post" id="approval">
				<input type="hidden" name="code" value="${report.code }">
				<div class="approval_text_wrap" style="display: none;">
					<p><span style="font-weight: bold;">승인내용</span></p>
					<textarea name="mgcontent" rows="10" cols="30" style="width: 660px; height: 100px;"></textarea>
					<a href="javascript:void(0);" class="btn btn-primary submit" style="float: right;">입력완료</a>
				</div>	
			</form>
			
			<form action="contentsreportref.action" method="post" id="disapproval">
				<input type="hidden" name="code" value="${report.code }">
				<div class="disapproval_text_wrap" style="display: none;">
					<p>
						<span style="font-weight: bold;">제재불가사유</span>
						<select id="restrict_reason_code" name="restrict_reason_code" class="form-control" style="width: 180px; float: right; margin-right: 10px;">
							<option value="0">=사유 선택=</option>
							<c:forEach var="reason" items="${refReasonList }">
							<option value="${reason.code }">${reason.content }</option>
							</c:forEach>
						</select>
					</p>
					<textarea name="mgcontent" rows="10" cols="30" style="width: 660px; height: 100px; margin-top: 10px;"></textarea>
					<a href="javascript:void(0);" class="btn btn-primary dis_submit" style="float: right;">입력완료</a>
				</div>
			</form>	
			
			
		</div>
	</div><!-- .contents end -->
</div><!-- .container end -->
	
</body>
</html>