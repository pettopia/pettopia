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
<title>PetsitterInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/Petsitter.css">
<script src="https://kit.fontawesome.com/d0c252d761.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!--아이콘 링크 -->

<script type="text/javascript">
	$(document).ready(function()
	{
		var psregcode = "${psregcode}";
		
		$("#btn").click(function()
		{
			if(psregcode != "")
			{
				alert("이미 펫시터인 회원입니다.");
				return;
			}
			alert("등록이 완료되었습니다.");
			$("#myForm").submit();
		});
	});
</script>


</head>
<body>


	<div>
		<c:import url="header.jsp"></c:import>
	</div>

	<div id="Diary" style="margin-top:152px;">
	
		<p class="Diary_text">PETSITTER</p>
		<p class="Diary_text_small">펫시터를 찾아 돌봄 신청을 하세요.<br>펫시터가 되어 보세요-!</p>
		
	<div class="Diary_select">
			<div class="Diary_information">
				<a href="petsitter.action">펫시터 찾기</a>
			</div>
			<div class="Diary_start">
				<a href="petsitterreq.action">펫시터 신청</a>
			</div>
	</div>
		
		
		<div id="Petprofile">
			
			<form action="petsitterinsert1.action" method="post" id="myForm">
			<table class="table">

				<tr>
					<th><h3>펫시터 증빙 서류 제출</h3></th>
				</tr>
				<tr>
					<td></td>
				</tr>

				
				<tr>
					<th><h4>경력 소개 작성(※)</h4></th>
				</tr>
				<tr>
					<td>
						<textarea rows="20" cols="100" name="pscareer" class="textbox" style="width: 800px;"></textarea>
					</td>
				</tr>

				<tr>
					<th>제출 파일 첨부(경력증명서/자격증 등..)(※)</th>
				</tr>
				<tr>
					<th>
						<select name="document_seq" class="form-control" style="width: 400px; float: left">
						    <option  value="1">펫시터 관련 자격증</option>
						    <option  value="2">펫시터 관련 경력 증명서</option>
						    <option  value="3">기타</option>
						</select>
						<input type="file" name="filepath" class="form-control" style="width:300px; float:left;">
					</th>
				</tr>
				
				<tr>
				

			<td>
				<textarea name="promise_seq" value="4" style="width: 800px; height: 250px;font-size:14px; ">
						주식회사 펫토피아(이하 “중개인”)과 ‘____________‘ (이하 “중개의뢰인”)는 다음과 같이 펫토피아가 운영하는 ‘펫토피아’ 어플리케이션(Application) 등을 통한 펫시팅 서비스 중개계약을 체결한다.

제 1 조(목적)

이 계약은 중개의뢰인이 중개인에게 의뢰하는 펫시팅 서비스 중개에 관하여 중개의뢰인과 중개인 간의 권리와 의무를 정하는 것을 목적으로 한다.

제 2 조(정의규정) 이 계약에서 사용하는 용 어의 정의는 다음과 같다.

① “서비스”라 함은 펫토피아에서 이용할 수 있는 펫플래닛 관련 제반 서비스(중개서비스 포함)를 말한다.

② “펫시팅 서비스”라 함은 반려동물의 소유자를 대신하여 소유자로부터 의뢰를 받아 계약기간 동안 반려동물에 대한 보호, 사료 급여, 목욕, 산책 등의 업무를 수행하는 서비스를 말하며, 펫시팅 서비스의 종류는 다음과 같다.

1. 데이케어 서비스 : 의뢰인이 하루 중 1시간 이상 12시간 이내로 긴 외출을 할 때 중개의뢰인의 거주지에서 반려동물을 돌봐주는 서비스

2. 1박케어 서비스 : 의뢰인이 하룻밤 이상 장기간 집을 비울 때 중개의뢰인의 거주지에서 반려동물을 돌봐주는 서비스

③ “펫시터”라 함은 중개인이 운영하는 ‘펫플래닛’ 어플리케이션(Application) 등(휴대형 단말기, PC, TV 등의 각종 유무선 장치를 통해 이용하는 경우를 전부 포함함, 이하 “펫플래닛”)을 통해 의뢰하는 반려동물 소유자에게 펫시팅 서비스 상품을 판매하고 해당 펫시팅 서비스를 제공하는 자를 말한다.

④ “의뢰인”이라 함은 펫플래닛을 통해 펫시팅 서비스를 구매•이용하는 펫플래닛 회원을 말한다.

⑤ “의뢰계약”이라 함은 의뢰인이 펫플래닛을 통해 펫시팅 서비 스를 이용하고자 중개의뢰인과 체결하는 계약을 말한다.

⑥ “이용대금”이라 함은 의뢰인이 중개의뢰인과 의뢰계약을 체결한 후 펫시팅 서비스를 제공받는 대가로 지급하는 금원을 말한다.

⑦ “중개”라 함은 펫플래닛에서 중개의뢰인과 의뢰인 사이의 펫시팅 서비 스에 관한 의뢰계약을 알선하는 것을 말한다.

⑧ “중개서비스”라 함은 구현되는 단말기와 상관 없이 중개의뢰인 또는 의뢰인이 펫플래닛을 통해 이용하는 의뢰계약 중개서비스 또는 이와 관련된 제반 서비스를 말한다.

제 3 조(계약의 성격 및 효력)

① 이 계약은 중개인과 중개의뢰인에 있어, 중개인이 제공하는 펫플래닛 관련 제반 서비스(중개서비스 포함)에 관한 ‘펫플래닛 서비스 이용 약관’에 우선한다.

② 이 계약에서 명시하지 아니한 사항은 ‘펫플래닛 서 비스 이용 약관’에 따른다.
	    		</textarea>
    		</td>
		</tr>
		<tr>
			<td>이용약관 동의(※)
			<input type="checkbox" name="agree" value="1" ></td>
		</tr>
				
				
				
				<tr>
					<td colspan="2" style="text-align: center;">
						<button type="button" class="btn btn-success" id="btn">등록</button>
						<button type="reset" class="btn btn-default">취소</button> <br>
						<span style="font-size: small;"> (※)는 필수 입력 사항입니다. </span> <span
						id="errMsg" style="font-size: small; color: red; display: none;">
							필수 입력 사항을 모두 입력해야 합니다. </span>

					</td>
				</tr>


			</table>
		</form>


		</div>
		<!-- end #petprofile -->
	</div>
	<!-- end #Diary  -->
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<!-- 푸터 구성 -->
	<div>
		<c:import url="footer.jsp"></c:import>
	</div>
</body>


</html>