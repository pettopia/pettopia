<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/inbox.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<style type="text/css">
#main_content {
	position: relative;
	padding: 30px;
}

.write_msg {
	position: absolute;
	margin-right: 100px;
}


#resetBtn
{
	
	width:45%;
	height:50px;
}

#submitBtn
{
	float:right;
	width:45%;
	height:50px;
}
</style>

<script type="text/javascript">
	$(document).ready(function()
	{
		//아이디 입력시 수행
		$("#nick").on("keyup", function()
		{
			var search = $(this).val();

			if (search.replace(" ", "") == "")
			{
				return;
			}

			ajaxNickRequest();
		});

		$("#submitBtn").click(function()
		{
			if($("#nick").val() == "")
			{
				alert("받는사람을 입력해주세요");
				return;
			}
			
			if($("#talk").val() == "")
			{
				alert("내용을 입력해주세요.");
				return;
			}
			
			
			if ($("#err").val().trim() != "이미 사용중인 이름이 존재합니다.")
			{
				alert("유효하지 않은 닉네임입니다.");
				return;
			}
			
			$("#form").submit();

		});

	});

	function ajaxNickRequest()
	{
		$.post("nickajax.action",
		{
			nickName : $("#nick").val()
		}, function(data)
		{
			$("#err").val(data);
		});
	}
</script>
</head>
<body>
	<div class="wrapper">
		<div class="sidebar">
			<h2>
				<a href="inbox.action">톡톡</a>
			</h2>
			<div id="menu_write" class="btn_workset">
				<input type="button" id="write_msg" class="btn btn-primary"
					value="톡톡보내기" style="width: 100%; height: 50px;">

			</div>

			<ul>
				<li><a href="inbox.action">받은톡톡</a></li>
				<li><a href="sendinbox.action">보낸톡톡</a></li>
				<li><a href="#">톡톡보관함</a></li>
				<li><a href="#">스팸톡톡</a></li>

			</ul>

		</div>

		<div id="main_content">
			<h3>톡톡 보내기</h3>
			<hr>
			<div class="write_msg">
				<form id="form" name="form" action="sendmsg.action">
					<input type="hidden" id="err" >
					
					<div class="form-group">
						<label for="nick">받는사람</label> <input type="text" id="nick"
							name="nick" placeholder="닉네임을 입력하세요." class="txt form-control"
							required="required">
					</div>

					<div class="form-group">
						<label for="talk">내용</label>
						<textarea id="talk" name="talk" cols="50" rows="10"
							placeholder="내용을 입력하세요" class="form-control" required="required"> </textarea>
					</div>

					<div class="btnarea">
						<input type="button" id="resetBtn" class="btn btn-danger" value="취소">
						<input type="button" id="submitBtn" class="btn btn-primary" value="보내기">
					</div>
				</form>
			</div>

		</div>
	</div>

</body>
</html>