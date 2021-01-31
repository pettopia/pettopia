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
<title>회원 상세 정보</title>

<link rel="stylesheet" href="<%=cp %>/css/bootstrap.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/bootstrap.min.js"></script>

<style type="text/css">
	label {
		margin: 0;
		font-weight: normal;
	}
	p {
		margin: 0 auto;
	}
	ul, li {
	    list-style: none;
	    padding-left: 0px;
	}
	table, th, td
	{
		text-align: left;
	}
	th { width: 150px; }
	tr td span {
		width: 150px; 
		margin: 0; 
		margin-left: 10px; 
		float: left;
	}
	td ul li span { 
		width: 160px; 
		float: left; 
		margin: 0; 
		margin-left: 10px;
	}
	.container
	{
		width:500px;
		display: inline-flex;
	}
	.contents
	{
		margin-left: 50px;
	}
	.text_wrap {
	    float: left;
	    margin-top: 15px;
	    margin-bottom: 30px;
	    width: 670px;
	    height: 500px;
	    border: 1px solid #e3e3e3;
	}
</style>

</head>
<body>
<div class="container">

	<div class="contents">
		<h1>펫시터 프로필</h1>
		
		<div style="margin-bottom: 70px;">
			<h3>펫시터 프로필 수정</h3>
				<p>펫시터프로필코드 : PST123451600<span style="margin-left: 20px;">( 2020-12-28 11:38:42 )</span></p>
			<form action="" method="post" class="form">
				<table class="table" style="margin-top: 15px; width:600px;">
					<tr>
						<th>펫시터코드</th>
						<td>PST001234516</td>
					</tr>
					<tr>
						<th>돌봄형태(위탁/방문)</th>
						<td>
							<select name="" class="form-control" style="width: 80px;">
								<option value="1">위탁</option>
								<option value="2">방문</option>
								<option value="3" selected="selected">무관</option>
							</select>
						</td>
					</tr>
					<tr>
						<th style="vertical-align: middle;">주소</th>
						<td>
							<input type="text" class="form-control" value="[21302] 인천광역시 연수구 아트센터대로7번길 5"
							 name="addr" style="width: 400px;">
							<button class="btn">우편번호검색</button>
						</td>
					</tr>
					<tr>
						<th>프로필공개여부</th>
						<td>
							<select name="" class="form-control" style="width: 100px;">
								<option value="1">공개</option>
								<option value="2" selected="selected">비공개</option>
							</select>
						</td>
					</tr>
					<tr>
						<th style="vertical-align: middle;">돌봄환경</th>
						<td>
							<span><label><input type="checkbox" value="1"style="margin-right: 10px;">정기예약가능</label></span>
							<span><label><input type="checkbox" value="1" checked="checked" style="margin-right: 10px;">약물복용가능</label></span>
							<span><label><input type="checkbox" value="1" checked="checked" style="margin-right: 10px;">매일산책가능</label></span>
							<span><label><input type="checkbox" value="1" checked="checked" style="margin-right: 10px;">마당있음</label></span>
							<span><label><input type="checkbox" value="1" checked="checked" style="margin-right: 10px;">노령견가능</label></span>
							<span><label><input type="checkbox" value="1" checked="checked" style="margin-right: 10px;">목욕가능</label></span>
							<span><label><input type="checkbox" value="1" style="margin-right: 10px;">대형견가능</label></span>
							<span><label><input type="checkbox" value="1" style="margin-right: 10px;">픽업가능</label></span>
							<span><label><input type="checkbox" value="1" checked="checked" style="margin-right: 10px;">돌봄경험있음</label></span>
							<span><label><input type="checkbox" value="1" style="margin-right: 10px;">교육이수경험있음</label></span>
						</td>
					</tr>
					<tr>
						<th style="vertical-align: middle;">돌봄환경<br>이미지</th>
						<td style="text-align: left;">
							<ul class="image">
								<li>
									<span><a href="">마당사진.png</a></span>
									<p style="float: left;">2020-12-30 20:18:42
										<a href="#a" role="button" style="margin-left: 10px;">삭제</a>
									</p>
								</li>
								<li>
									<span><a href="">거실.png</a></span>
									<p style="float: left;">2020-12-30 20:20:12
										<a href="#a" role="button" style="margin-left: 10px;">삭제</a>
									</p>
								</li>
							</ul>
						</td>
					</tr>
				</table>
				
				<br>
				<h4>※ 프로필 상세 내용 (자기소개)</h4>
				<div class="text_wrap">
					<textarea rows="10" cols="30" style="width: 660px; height: 500px;">안녕하세요 펫토피아 펫시터 김*분입니다. 저는 2년 전에 외국으로 떠난 지인의 7개월된 강아지(뽀숑이, 말티숑)를 키우고 있습니다. 순하고 사랑스러워 모든 사람들의 사랑을 받는 아이입니다. 사람도 좋아하지만, 다른 강아지에게도 매너있게 접근하고 그렇지 않으면 관심을 두지 않습니다. 뽀숑이의 이런 성격으로 손수 미용에도 도전할 수 있었습니다. 13년전 새끼강아지를 분양받아 새끼를 낳고 모견과 함께 같이 키웠습니다. 유기견과 아픈 강아지까지 무턱대고 키우면서 부족했던 지식 탓에 힘든 시간도 있었지만 넘치는 사랑은 변함이 없었습니다. 하지만 아이들이 떠난 후에 많은 후회가 밀려왔습니다. 예뻐하기만 하고 제대로 즐겁게 해주지 못한 것 같아서요 그래서 많은 고민 끝에 뽀숑이를 입양하면서 다짐했습니다. 생명을 다루면서 내 것으로 소유하는 것이 아니라 함께하는 즐거움을 나누기로요. 아이도 좋아히자만 저 스스로도 변하기 시작했습니다. 지인의 강아지를 새끼때부터 돌보면서 제가 제일로 좋아하고 잘하는 것이 강아지를 돌보는 것임을 알게 되었습니다. 주변에서 나이들어 아픈 강아지, 에너지 넘치는 어린 강아지들을 펫시팅했으며 앞으로도 더 많은 강아지들을 만나고 싶습니다. 여행이나 긴 외출로 혼자있게 될 반려견이 걱정되어 노심초사하는 보호자님들의 마음을 너무 잘 알기에 아이들이 야간에도 편안하고 안전하게 잘 지낼 수 있도록 함께 하겠습니다. 저희 가족은 모두 강아지를 예뻐하고 사랑합니다. 저희 집은 한적한 곳에 위치한 아파트이며 내부에는 아이들을 위해 매트가 깔려있습니다. 계단을 비치하여 아이들이 뛰는 일이 없어도 준비하고 있습니다. 공기 청정기와 여분의 집, 장난감 등을 구비해 놓았습니다. 아파트 주변에는 운중천변과 넓은 잔디밭, 금토산능선, 타운하우스와 주택이 계획배치되어 도로가 넓고 인적이 드물어 산책에 최적화되어 있습니다. 오랜 경험으로 퍼피부터 노령견까지 케어할 수 있으며, 약을 먹이는 것, 강이지 전용 저울로 사료를 계량하여 급여할 수 있습니다. 목욕 후 강아지 전용드라이를 사용 하고 있습니다. 무엇보다도 생명을 가진 강아지의 입장에서 많이 생각하고 사랑하며 편안하고 즐겁게 지낼 수 있도록 노력하겠습니다.</textarea>
				</div>
				
				<br>
				<h4>※ 계좌정보</h4>
				<table class="table" style="margin-top: 15px; width:600px;">
					<tr>
						<th>은행명</th>
						<td>
							<select name="bank" class="form-control" style="width: 200px;">
								<option value="">농협</option>
								<option value="" selected="selected">서울은행</option>
								<option value="">신한</option>
								<option value="">국민</option>
								<option value="">우리</option>
								<option value="">기업</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>예금주명</th>
						<td>
							<input type="text" name="depositor" value="김옥분" class="form-control" style="width: 150px;">
						</td>
					</tr>
					<tr>
						<th>계좌번호</th>
						<td>
							<input type="text" name="account_num" value="1230685159674" class="form-control" style="width: 150px;">
						</td>
					</tr>
				</table>
				
				
				<div style="text-align: center;">
					<button type="submit" class="btn btn-primary">수정 완료</button>
					<button type="reset" class="btn btn=default">수정 취소</a>
				</div>
				
			
			</form>
			
		</div>
	</div><!-- .contents end -->
</div><!-- .container end -->
	
</body>
</html>