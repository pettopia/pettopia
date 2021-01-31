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
<title>회원정보수정1 - 비밀번호 재확인</title>
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
<script type="text/javascript">
	$(document).ready(function()
	{
		$("#submitBtn").click(function()
	    {
			$("#command").submit();
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
			<i class="fas fa-home" style="font-size: 30px;"></i>
			<span style="font-weight:bold; font-size: 20pt; ">내정보관리</span>
		</div>
				
			<h2 class="tit">회원정보수정</h2>
			
		
		
		
		
		<!-- 설명란 -->
		<div class="explain">
			<!-- 돋보기 이미지 -->
			<p class="img-area">
			<i class="ico-circle-gray magnifier" style="background-image: url(https://www.work.go.kr/static/images/common/ico/ico-visual-magnifier.png);
   			background-position: 50% 50%; background-repeat: no-repeat;">
  			</i>
  			</p>
  				<!-- 설명글 -->
			<p class="txt">
				펫토피아는 회원님의 개인정보를 신중히 취급하며, 회원님의 동의없이 기재하신 회원정보를 공개하지 않습니다.<br>
				회원님의 개인정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 입력해주세요.
			</p>
		</div>
		<br>
		
		<div class="content_main">
		<!-- 비밀번호 재입력 폼구역 -->
		<h3 class="tit font-black">비밀번호 재확인</h3>
		
		<form id="command" name="chkForm"  action="checkpw.action?n=${n }" method="post">
			<table class="table"> 
				<tr>	
					<th>아이디</th>				
					<td>
						<input type="text" value="<%=(String)session.getAttribute("id") %>" title="아이디 입력" name="id" class="form-control" readonly="readonly">
					</td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" id="oldPwd" name="pw" title="비밀번호 입력" class="form-control" maxlength="24">
					</td>
				</tr>
							
				<tr>
					<th colspan="2">
						<button class="btn btn-success" style="width: 200px;">확인</button>
					</th>
				</tr>
			
			</table>
		</form>
		
		</div>
	</div>
	
	</div>
	<br><br><br><br><br><br><br><br><br><br><br>
	<c:import url="footer.jsp"></c:import>
	<script src="js/scripts.js"></script>
</body>
</html>