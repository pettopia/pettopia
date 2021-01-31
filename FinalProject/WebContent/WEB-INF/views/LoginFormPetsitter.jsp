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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/d0c252d761.js"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
.wrapper {
	margin: 0 auto;
	width: 1150px;
	margin-top: 200px;
}	

#login {
	border: 1px solid #ccc;
	border-radius: 5px;
	width: 600px;
	padding: 15px;
	margin: 20px auto;
}

#login h3 {
	margin: 0px;
	margin-bottom: 15px;
}
</style>

<script type="text/javascript">
	$(document).ready(function()
	{
		$("#submitBtn").click(function()
		{
			$("#err").css("display", "none");

			if ($("#id").val() == "" || $("#pw").val() == "")
			{
				$("#err").html("항목을 모두 입력해야 합니다.").css("display", "inline");
				return;
			}

			$("#loginForm").submit();

		});
	});
</script>


</head>
<body>


	<div id="header">
		<c:import url="header.jsp"></c:import>
	</div>

	<div class="wrapper">


		<div id="login">
			<h3>로그인</h3>

			<form action="loginpetsitter.action" method="post" id="loginForm">

				<!-- 『form-group』 : 폼 컨트롤 항목 1개 관련 내용만 묶기 -->
				<div class="form-group">
					<label for="id">아이디</label> <input type="text" id="id" name="id"
						placeholder="아이디를 입력하세요." class="form-control" required="required">
				</div>

				<div class="form-group">
					<label for="pw">패스워드</label> <input type="password" id="pw"
						name="pw" placeholder="패스워드를 입력하세요." class="form-control"
						required="required">
				</div>

				<input type="submit" value="로그인" class="btn btn-default">
				<div class="bottomText">
					아이디/비밀번호를 잊으셨나요? <a href="findid.action">아이디/비밀번호 찾기</a><br>
					펫토피아 회원이 아니신가요? <a href="join1.action">회원가입</a>
				</div>
			</form>

		</div>

	</div>
	
	<!-- 푸터 구성 -->
		
		
		
		<script src="js/scripts.js"></script>
</body>
</html>