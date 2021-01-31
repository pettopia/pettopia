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
<title>footer.jsp</title>
<link rel="stylesheet" href="css/footer.css">
<script src="https://kit.fontawesome.com/d0c252d761.js" crossorigin="anonymous"></script>
</head>
<body>

<div id="line"></div>

<div id="footer">
		<div class="footer_inner">
			<div class="copyright">
				<img src="images/logo3.png" width="280" style="float: left;"><br>
				<br>
				<dt>SHOP NAME : PetToPia
					&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
					OWNER : 강정우</dt>
				<dt>Fax. 02-2222-2222
					&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;TEL:
					02-2222-2222</dt>
				<dt>사업자등록번호 : 2222-22-222222</dt>
				<dt>소재지: 서울특별시 마포구 월드컵대로</dt>
			</div>



			<div class="copyright1">
				<dd>
					<i class="fas fa-phone-alt"></i>&ensp;02-2222-2222
				</dd>
				<dt>MON - FRI : PM 1:00 ~ PM 6:00</dt>
				<dt>(SAT,SUN,HOLIDAY CLOSED)</dt>
				<br>
				<br>
				<br>
				<dt class="last">Copyright (c) PetToPia All Rights Reserved</dt>
			</div>

			<div class="copyright2">
				<dd class="follow">follow</dd>
				<a href="#"><i class="fab fa-facebook-f"></i></a> <a href="#"><i
					class="fab fa-instagram"></i></a> <a href="#"> <i
					class="fab fa-twitter"></i></a>



			</div>

		</div>
	</div>
</body>
</html>