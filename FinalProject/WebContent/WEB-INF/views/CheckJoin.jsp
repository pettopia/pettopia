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
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/d0c252d761.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<style type="text/css">

#wrapper {
	margin: 0 auto;
	width: 1150px;
	margin-top: 200px;
}


#main_content
{
	margin: 0;
	padding: 0;
	box-sizing: border-box
}

ul>li {
	list-style: none
}

.clearfix::after {
	content: "";
	display: block;
	clear: both;
}

#joinForm {
	width: 460px;
	height: 500px;
	margin: 0 auto;
}

ul.join_box {
	border: 1px solid #ddd;
	background-color: #fff;
}

.checkBox, .checkBox>ul {
	position: relative;
}

.checkBox>ul>li {
	float: left;
}

.checkBox>ul>li:first-child {
	width: 85%;
	padding: 15px;
	font-weight:bold;
}

.checkBox>ul>li:nth-child(2) {
	position: absolute;
	top: 50%;
	right: 30px;
	margin-top: -12px;
}

.checkBox textarea {
	width: 96%;
	height: 90px;
	margin: 0 2%;
	background-color: #f7f7f7;
	color: #888;
	border: none;
	padding:15px;
}
} 
</style>
<script type="text/javascript">

   $(document).ready(function()
   {
	   
	   /* 
       $("#chk_all").click(function()
       {
           //클릭되었으면
           if($("#chk_all").prop("checked"))
           {
               //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
               $("input[class=chk]").prop("checked",true);
               //클릭이 안되있으면
           }
           else
           {
               //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
               $("input[class=chk]").prop("checked",false);
           }
       });
        */
        
       $("#yBtn").click(function()
       {
    	   
           if($("#chk1").prop("checked") == true && $("#chk2").prop("checked") == true)
           {
        	 	//submit 액션 처리 수행
   				$("#form").submit();
           }
           else
           {
        	   alert("약관에 모두 동의해주세요");
               return;
           }

       });
   });
</script>

</head>
<body>


<div id="header">
<c:import url="header.jsp"></c:import>
</div>

<div id="wrapper">
	
<div class="main_content">
	<div class="header">
			<span style="font-weight:bold; font-size: 20pt;">회원가입 이용약관</span>
	</div>
	<br><br>
	<div id="info">
		<form action="joinform.action" id="form" name="form" method="post">
			<ul class="join_box">
				<li class="checkBox check01">
					<ul class="clearfix">
						<li class="checkBtn">
						<label>
						<input type="checkbox" class="chk" id="chk1" value="1" name="chk">
						펫토피아 이용약관 동의(필수)
						</label>						
						</li>						
					</ul> 
					<textarea name="" id="">여러분을 환영합니다. 펫토피아 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 펫토피아 서비스의 이용과 관련하여 펫토피아 서비스를 제공하는 펫토피아 주식회사(이하 ‘펫토피아’)와 이를 이용하는 펫토피아 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 펫토피아 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
					</textarea>
				</li>
				<li class="checkBox check02">
					<ul class="clearfix">
						<li class="checkBtn">
						<label>
						<input type="checkbox" class="chk"  id="chk2" value="1" name="chk">
						개인정보 수집 및 이용에 대한 안내(필수)
						</label>
						</li>					
					</ul> <textarea name="" id="">여러분을 환영합니다. 펫토피아 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 펫토피아 서비스의 이용과 관련하여 펫토피아 서비스를 제공하는 펫토피아 주식회사(이하 ‘펫토피아’)와 이를 이용하는 펫토피아 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 펫토피아 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
	       </textarea>
				</li>
			</ul>
			
		</form>
		<div id="yBtn" class="btn"><button class="btn btn-success">동의</button></div>
			<div id="nBtn" class="btn"><button class="btn btn-danger">비동의</button></div>
	</div>
</div>	

</div>

</body>
</html>