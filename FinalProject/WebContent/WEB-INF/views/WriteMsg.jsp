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

#main_content
{
	position:relative;
	padding: 30px;
}

.write_msg
{
	position: absolute;
	margin-right: 100px;
}

.submitbtn
{
	text-align: center;
}
</style>
</head>
<body>
<div class="wrapper">
	<div class="sidebar">
		<h2><a href="inbox.jsp">톡톡</a></h2>
		<div id="menu_write" class="btn_workset">
			<button type="button" id="write_msg" class="btn btn-primary" >톡톡보내기</button>
			<button type="button" class="btn btn-primary" >내게쓰기</button>
			
		</div>
		
		<ul>
			<li><a href="#">받은톡톡</a></li>
			<li><a href="#">내게쓴톡톡</a></li>
			<li><a href="#">보낸톡톡</a></li>
			<li><a href="#">톡톡보관함</a></li>
			<li><a href="#">스팸톡톡함</a></li>
		
		</ul>
		
	</div>
	
	<div id="main_content">
		<h3>톡톡 보내기</h3>
		<hr>
			<div class="write_msg">
				<form>
					<div class="form-group" >
						<label for="id">받는사람</label> 
						<input type="text" id="id" placeholder="아이디를 입력하세요." 
						class="txt form-control" required="required">
					</div>

					<div class="form-group">
						<label for="title">제목</label> 
						<input type="text" id="title" placeholder="제목을 입력하세요" 
						class="txt form-control" >
					</div>
					
					<div class="form-group">
						<label for="content">내용</label> 
						<textarea id="content" cols="50" rows="10" placeholder="내용을 입력하세요" 
						class="form-control" required="required"> </textarea>
					</div>

					<div class="submitbtn">
					<button type="button" id="submitbtn" class="btn btn-primary">보내기</button>
					</div>
				</form>
			</div>

	</div>
</div>

</body>
</html>