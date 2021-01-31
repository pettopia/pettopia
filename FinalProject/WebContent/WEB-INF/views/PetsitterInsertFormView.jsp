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
<link rel="stylesheet" href="css/PetsitterInsertForm.css">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://kit.fontawesome.com/d0c252d761.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<!--아이콘 링크 -->

<script>
	$(document).ready(function()
	{
		console.log("1")
		// 체크박스 클릭시 이벤트 발생
		$("input:checkbox[name='pet_size_seq']").click(function()
		{
			if ($("input:checkbox[id='petsize1']").is(":checked"))
			{

				$("input:text[id='carepay1']").attr("disabled", false);
				// 체크박스 버튼의 value 값이 1이라면 활성화
			} else
			{
				$("input:text[id='carepay1']").attr("disabled", true);
			}
			if ($("input:checkbox[id='petsize2']").is(":checked"))
			{
				$("input:text[id='carepay2']").attr("disabled", false);
				// 체크박스 버튼의 value 값이 2이라면 활성화
			} else
			{
				$("input:text[id='carepay2']").attr("disabled", true);
			}
			if ($("input:checkbox[id='petsize3']").is(":checked"))
			{
				$("input:text[id='carepay3']").attr("disabled", false);
				// 체크박스 버튼의 value 값이 3이라면 활성화
			} else
			{
				$("input:text[id='carepay3']").attr("disabled", true);
			}
		});
	});
</script>




</head>
<body>
	<!-- header -->
	<header id="main-header">

		<nav class="header_inner">

			<div class="header_menu">
				<!--헤더 메뉴-->

				<div class="logo">
					<a href="main.jsp"> <img src="images/logo3.png" width="280"
						alt="Logo" id="logo">
					</a>
				</div>


				<!----검색버튼 누른후 회색 화면 -->
				<div id="myOverlay" class="overlay">


					<div class="overlay-content">
						<p class="closebtn" onclick="closeSearch()" title="Close Overlay">X</p>
						<input type="text" placeholder="Search.." name="search">
						<button type="submit">
							<i class="fas fa-search"></i>
						</button>


					</div>

				</div>
				<!----검색버튼 누른후 회색 화면 닫기-->



				<!-- 로그인 -->
				<ul class="head_btn">

					<%
					//로그인 되어있을 때
					String id = null;
					if (session.getAttribute("id") != null)
					{
						id = (String) session.getAttribute("id");
					%>
					<li><a href="logout.action"> <span>로그아웃</span></a></li>


					<li><a href="mypage.action"> <span>마이페이지</span></a></li>
					<li><a href="inbox.action"> <span>톡톡</span></a></li>
					<li><a href="#"> <span><%=id%></span></a></li>

					<%
					} else
					{
					%>
					<li><a href="join1.action"> <span>회원가입</span></a></li>
					<li><a href="loginform.action"> <span>로그인</span></a></li>

					<%
					}
					%>
					<li class="button">
						<button class="openBtn" onclick="openSearch()">
							<i class="fas fa-search"></i>
						</button>

					</li>
				</ul>


				<!-- 로그인 닫기-->



				<!-- 서브메뉴 -->
				<ul class="head_sub">


					<li><a href=""> <span>자유 게시판</span></a></li>
					<li><a href=""> <span>펫시터 찾기</span></a></li>
					<li><a href=""> <span>펫 다이어리</span></a></li>
					<li><a href=""> <span>강아지 산책</span></a></li>
				</ul>
				<!-- 서브메뉴 닫기-->


			</div>
			<!--헤드인-->
			<!--헤더 메뉴닫기-->
			<!--헤더닫기-->

		</nav>
	</header>

	<!-- content -->
	<div id="content"
		style="font-family: 'Noto Sans KR Regular', 'Noto Sans KR Thin'; font-size: 12px;">

		<form action="petsitterinsert2.action" method="post" id="myForm"
			name="form">
			<table class="table">

				<tr>
					<th><h3>세부사항</h3></th>
				</tr>


				<!-- <tr>
            <th>희망 반려동물 :</th>
            <td>
            <label><input type="checkbox" id="select" name="select" value="Big">대형견</label> 
            <label><input type="checkbox" id="select" name="select" value="middle">중형견</label> 
            <label><input type="checkbox" id="select" name="select" value="small">소형견</label>
            </td>
         </tr>

         <tr>
            <th>돌봄 비용 :</th>
            <td><input type="text" id="txtMoney" placeholder="1박 비용을 입력하세요."
               required="required" style="font-size: small; margin: 5px;"></td>
         </tr> -->


				<tr>
					<th>돌봄 형태 :</th>
					<td><label><input type="radio" name="ps_care_type_seq"
							value="1">위탁</label> <label><input type="radio"
							name="ps_care_type_seq" value="2">방문</label> <label><input
							type="radio" name="ps_care_type_seq" value="3">무관</label></td>

				</tr>


				<tr>
					<th>자기소개 :</th>
					<td><input type="text" name="pscontent" value=""></td>
				</tr>

				<tr>
				<tr>
					<th>돌봄환경(이용서비스)</th>
					<td><label><input type="checkbox"
							name="ps_service_seq" value="1">정기예약가능</label> <label><input
							type="checkbox" name="ps_service_seq" value="2">야외산책가능</label> <label><input
							type="checkbox" name="ps_service_seq" value="3">마당있음</label> <label><input
							type="checkbox" name="ps_service_seq" value="4">노령견가능</label></td>
				</tr>

				<tr>
					<th></th>
					<td><label><input type="checkbox"
							name="ps_service_seq" value="5">대형견가능</label> <label><input
							type="checkbox" name="ps_service_seq" value="6">픽업가능</label> <label><input
							type="checkbox" name="ps_service_seq" value="7">돌봄경험있음</label> <label><input
							type="checkbox" name="ps_service_seq" value="8">교육이수함</label></td>
				</tr>
				

				<tr>
					<th>프로필공개여부</th>
					<td><select name="ps_open_seq" class="form-control"
						style="width: 100px;">
							<option value="0">공개</option>
							<option value="1">비공개</option>
					</select></td>
				</tr>

				<tr>
					<th>돌봄 환경 이미지</th>
					<!-- 텍스트파일로 테스트  -->
					<td><input type="file" name="filepath" value=""
						style="margin: auto; border: 1px solid"></td>
				</tr>

				<tr>
					<th>위치</th>
					<td>
						<!-- <button type="button" class="postcodebtn">우편번호 찾기</button> -->
						<input type="text" name="psaddrnumber" value=""> <input
						type="text" name="psaddr1" placeholder="시/도" value=""> <input
						type="text" name="psaddr2" placeholder="도로명주소" value=""> <input
						type="text" name="psaddr3" placeholder="상세주소" value="">
					</td>
				</tr>

				<tr>
					<th>은행명</th>
					<td><select name="bank_seq" class="form-control"
						style="width: 200px;">
							<option value="81">하나은행</option>
							<option value="4">국민은행</option>
							<option value="2">산업은행</option>
							<option value="3">기업은행</option>
							<option value="20">우리은행</option>
							<option value="11">농협</option>
							<option value="71">우체국</option>
							<option value="88">신한은행</option>
							<option value="5">외한은행</option>
							<option value="7">수협</option>
							<option value="23">SC제일은행</option>
							<option value="54">HSBC</option>
							<option value="32">부산은행</option>
							<option value="45">새마을금고</option>
							<option value="27">시티은행</option>
							<option value="48">신용협동조합</option>
							<option value="50">상호저축은행</option>
							<option value="55">도이치은행</option>
							<option value="31">대구은행</option>
							<option value="34">광주은행</option>
							<option value="39">경남은행</option>
							<option value="37">전북은행</option>
							<option value="35">제주은행</option>
					</select></td>
				</tr>
				<tr>
					<th>예금주명</th>
					<td><input type="text" name="psaccountname" value=""
						class="form-control" style="width: 150px;"></td>
				</tr>

				<tr>
					<th>계좌번호</th>
					<td><input type="text" name="psaccountnumber" value=""
						class="form-control" style="width: 150px;"></td>
				</tr>

				<tr>
					<th>이용요금</th>
					<td><label>
					<input type="checkbox" id="petsize1" name="pet_size_seq" value="1">대형</label> 
					<input type="text" id="carepay1" name="carepay" value="" placeholder="돌봄금액" disabled>
					</td>
				</tr>
				<tr>
					<th></th>
					<td><label><input type="checkbox" id="petsize2"
							name="pet_size_seq" value="2">중형</label> <input type="text"
						id="carepay2" name="carepay" value="" placeholder="돌봄금액" disabled>
					</td>
				</tr>
				<tr>
					<th></th>
					<td><label><input type="checkbox" id="petsize3"
							name="pet_size_seq" value="3">소형</label> <input type="text"
						id="carepay3" name="carepay" value="" placeholder="돌봄금액" disabled>
					</td>

				</tr>



				<tr>
					<td colspan="2" style="text-align: center;">
						<button type="submit" class="btn btn-success">등록</button>
						<button type="reset" class="btn btn-default">취소</button> <br>
						<span style="font-size: small;"> (※)는 필수 입력 사항입니다. </span> <span
						id="errMsg" style="font-size: small; color: red; display: none;">
							필수 입력 사항을 모두 입력해야 합니다. </span>

					</td>
				</tr>


			</table>
		</form>
	</div>

	<!-- footer -->
	<c:import url="footer.jsp"></c:import>
	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/scripts.js"></script>
</body>


</html>