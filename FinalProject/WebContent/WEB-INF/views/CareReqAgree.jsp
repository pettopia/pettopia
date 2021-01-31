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
<title>돌봄신청 정보 (승인/거절하기)</title>


<style type="text/css">
#agree_popup {
	text-align: center;
}

.star_rating {
	font-size: 0;
	letter-spacing: -4px;
}

.star_rating span {
	font-size: 22pt;
	letter-spacing: 0;
	display: inline-block;
	margin-left: 5px;
	color: #ccc;
	text-decoration: none;
	cursor: pointer;
}

.star_rating span:first-child {
	margin-left: 0;
}

.star_rating span.on {
	color: #777;
}

.btn {
	float: left;
	background: #222;
	margin-left: 11%;
	width: 200px;
	height: 50px;
	border: none;
	border-radius: 10px;
	color: #eee;
	font-size: 18px;
	position: relative;
	transition: 1s;
	-webkit-tap-highlight-color: transparent;
	display: flex;
	align-items: center;
	justify-content: center;
	cursor: pointer;
	padding-top: 5px;
}

.btn:hover {
	background: transparent;
}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
	$(function()
	{
		//승인하기 클릭시
		$("#agreeBtn").click(function()
		{	if (confirm("돌봄신청을 승인하시겠습니까? "))
			{
				$(location).attr("href","careagree.action?care_req_seq="
					+ $("#care_req_seq").val());
	
			}	
		});

		//거절하기 클릭 시
		$("#refuseBtn").click(function()
				{
					if (confirm("돌봄신청을 거절하시겠습니까?"))
					{
						$(location).attr("href","carerefuse.action?care_req_seq="
										+ $("#care_req_seq").val());
					}

				});
	});
</script>

</head>
<body>

	<div id="agree_popup">
		<form id="form" name="form" method="post">
			<input type="hidden" id="care_req_seq" name="care_req_seq" value="${dto.care_req_seq }">
			<div>
				<h1>예약 정보</h1>
				<h3>돌봄일자 : ${dto.caredate }</h3>
				<h3>신청일 : ${dto.reqdate }</h3>
				<h3>신청인 : ${dto.nick }</h3>
				<h3>강아지이름 : ${dto.petname }</h3>
				<h3>견종 : ${dto.breed }</h3>
				<h3>크기 : ${dto.petsize }</h3>
				<h3>성별 : ${dto.gender }</h3>
				<h3>강아지성격 : ${dto.nature }</h3>
				<h3>중성화여부 : ${dto.neutral }</h3>


			</div>


			<div id="agreeBtn" class="btn">
				<span class="noselect">승인하기</span>
			</div>
			<div id="refuseBtn" class="btn">
				<span class="noselect">거절하기</span>
			</div>

		</form>
	</div>



</body>
</html>