<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정 - 비밀번호 변경</title>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/d0c252d761.js"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">

#wrapper {
	margin: 0 auto;
	width: 1150px;
	margin-top: 160px;
}

.main_content .header
{
	margin-bottom: 20px;
}

.my_image {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	float: left;
} 
.following_user_form
{
	width:950px;
	height: 200px;
}
.table1 {
    float: left;
    height: 50px;
    margin-top: 40px;
    margin-left: 30px;
    text-align: center;
}
.table1 th
{
	width:100px;
}

#my-inf
{
	width:80%;
	height:500px; 
}


</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">

			
$(function()
{
	//에러(span 엘리먼트) 안내 초기화
	$("#err").css("display", "none");
	
	$("#pw1").keyup(function()
	{
		$("#err").text('');
	}); //#user_pass.keyup

	$("#pw").keyup(function()
	{
	   if($("#pw1").val() != $("#pw").val())
	   {
			$("#err").text('');
		    $("#err").html("암호불일치").css("display", "inline");
	   }
	   else
	   {
	    	$("#err").text('');
	    	$("#err").html("암호일치").css("display", "inline");
	   }
	}); //#chpass.keyup
	  
	
	//지역 추가 버튼이 클릭되었을 때 수행할 코드 처리
	$("#submitBtn").click(function()
	{
		//1. 데이터 검사
		if( $("#pw").val() == "" || $("#pw1").val() == "")
		{
			$("#err").html("입력항목 누락");
			$("#err").css("display", "inline");
			return;		
		}
		
		
		//2. 중복 확인 유효성 검사
		if( $("#err").html().trim() == "암호불일치"
				|| $("#err").html().trim() == "입력항목 누락")
		{
			$("#err").html("암호를 확인해주세요");
			$("#err").css("display", "inline");
			return;
		}
		
		//submit 액션 처리 수행
		$("#form").submit();
		
	});
 });


		
	
</script>
</head>
<body>

<div id="header">
<c:import url="header.jsp"></c:import>
</div>

<div id="wrapper">

	<c:import url="sidemenu.jsp"></c:import>

	<div class="main_content" style="margin-left: 240px; padding-top: 60px;">
		<div class="header">	
			<h2 class="tit">비밀번호 변경</h2>
		</div>
		
		<br>
		
		<div class="content_main">
		<!-- 비밀번호 재입력 폼구역 -->
		<p>안전한 비밀번호로 내정보를 보호하세요</p>
		<p>다른 아이디/사이트에서 사용한 적 없는 비밀번호</p>
		<p>이전에 사용한 적 없는 비밀번호가 안전합니다.</p><br>
					
		<form id="form" name="form" action="changepw.action" method="post">
			<div class="myinf-change">
				<input type="hidden" id="id" name="id" value="<%=(String)session.getAttribute("id")%>">
				
				<div class="line">
					<input type="password" id="pw1" name="pw1" placeholder="새 비밀번호" class="form-control" maxlength="24">
				</div>
				<div class="line">
					<input type="password" id="pw" name="pw" placeholder="새 비밀번호 확인" class="form-control" maxlength="24">
					<span id="err" style="color:red; font-weight:bold; display:none;"></span>
					
				</div>
			</div>
			<br>
			<div class="btn-group">
				<div id="submitBtn" class="btn btn-success" style="margin-right: 10px; width: 150px;">확인</div> 
				
				<div id="resetBtn" class="btn btn-danger" style="width: 150px;">취소</div>
			</div>
			
		</form>
		
		</div>
	
	</div>

</div>

<div id="footer"></div>
</body>
</html>