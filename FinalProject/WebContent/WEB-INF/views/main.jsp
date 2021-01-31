<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>pettopia</title>
<link rel="stylesheet" href="css/main_master.css">
<link rel="stylesheet" type="text/css"
	href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://kit.fontawesome.com/d0c252d761.js" crossorigin="anonymous"></script>

<!--아이콘 링크 -->

</head>
<body>

	<header id="main-header">
	<c:import url="header.jsp"></c:import>
	</header>


	<div id="main">

		<!-- 키 이미지 산책  -->
		<div id="image">

			<div class="work">
				<p class="work_name">
					혼자 산책하기 외로울때는<br> <strong class="box_name">산책모임</strong>에서 쉽게
					찾고<br> 새로운 강아지들도 만나보세요
				</p>
				<a href="walklist.action"><div class="work_text">산책모임 바로가기</div></a>
			</div>
		</div>


		<!-- 펫 다이어리 -->
		<div id="diary">
			<p class="diary_text">펫 다이어리</p>
			<div class="diary_image">
			<img src="images/Diary_info4.jpg"
				style="border-radius: 10px; margin-top: 30px; float: left;
				       width:650px; height: 390px;">
			</div>
			<div class="diary_content">다이어리를 생성해서<br> 내 반려견의 활동을<br> 기록해보세요
			
			
			<a href="petdiary.action">
				<p class="diary_go">펫 다이어리 만들기</p>
			</a>
			</div>
		</div>


		<section class="module parallax parallax-1">
			<div class="container_parallox"></div>
		</section>




		<div class="main_best">
			<!--메인_베스트-->
			<a href="">
				<div class="sub_best">
					<p class="garden_info_text">BEST 펫시터</p>
				</div>
			</a>

			<ul class="best">
				<section class="autoplay">

					<div class="qwe">
						<img src="images/a12.jpg"> <strong class="best_name">
							<span class="best_product_name">강정강정</span>
						</strong>
					</div>


					<div class="qwe">
						<img src="images/a12.jpg"> <strong class="best_name">
							<span class="best_product_name">강정강정</span>
						</strong>
					</div>

					<div class="qwe">
						<img src="images/a12.jpg"> <strong class="best_name">
							<span class="best_product_name">강정강정</span>
						</strong>
					</div>

					<div class="qwe">
						<img src="images/a12.jpg"> <strong class="best_name">
							<span class="best_product_name">강정강정</span>
						</strong>
					</div>

					<div class="qwe">
						<img src="images/a12.jpg"> <strong class="best_name">
							<span class="best_product_name">강정강정</span>
						</strong>
					</div>

					<div class="qwe">
						<img src="images/a12.jpg"> <strong class="best_name">
							<span class="best_product_name">강정강정</span>
						</strong>
					</div>

				</section>




			</ul>


		</div>
		<!--베스트상품 div닫기-->
	</div>



	<div id="diary_info">
		<p class="diary_text">핫 한 게시글</p>



		<div class="info_info">
			<p class="garden_info_name">가장 인기글</p>
			<div class="garden_info">
				<i class="fas fa-bone"></i>
				<tt class="number1">001</tt>
				<br> <strong class="subject">반려견 알약 먹이는 꿀팁!!</strong> <br>
				<div class="line"></div>
				<br>


				<div class="d">
					<i class="fas fa-bookmark"></i>
					<tt class="price"> 평상시에 먹는 밥이나 간식에 타블렛 형태의 알약을 섞어줄 때 잘 먹는다면
						괜찮을 것이다. 하지만,한 번 약의 쓴 맛을 알게 되면 이후 경계하고 꾀가 생겨 알약만 쏙 남기고는 한다. </tt>
					<br>
					<br> <a href=""><span class="plus">더 보기</span></a>
				</div>

			</div>
		</div>


		<div class="sudden_sale">
			<p class="garden_info_name">인기글</p>

			<table class="sudden_sale_list">
				<tr>
					<a href="#">
						<td colspan="3" class="sudden"><tt class="sudden_sale_add">자유게시판</tt>
							<tt class="sudden_sale_add1">청라호수공원 반려견 산책 짱짱!!</tt> <a href="#"><i
								class="fas fa-plus-circle"></i></a></td>
					</a>
				</tr>
				<tr>
					<td colspan="3" class="sudden"><tt class="sudden_sale_add">자유게시판</tt>
						<tt class="sudden_sale_add1">청라호수공원 반려견 산책 짱짱!!</tt> <a href="#"><i
							class="fas fa-plus-circle"></i></a></td>
				</tr>
				<tr>
					<td colspan="3" class="sudden"><tt class="sudden_sale_add">자유게시판</tt>
						<tt class="sudden_sale_add1">청라호수공원 반려견 산책 짱짱!!</tt> <a href="#"><i
							class="fas fa-plus-circle"></i></a></td>
				</tr>
				<tr>
					<td colspan="3" class="sudden"><tt class="sudden_sale_add">자유게시판</tt>
						<tt class="sudden_sale_add1">청라호수공원 반려견 산책 짱짱!!</tt> <a href="#"><i
							class="fas fa-plus-circle"></i></a></td>
				</tr>
				<tr>
					<td colspan="3" class="sudden"><tt class="sudden_sale_add">자유게시판</tt>
						<tt class="sudden_sale_add1">청라호수공원 반려견 산책 짱짱!!</tt> <a href="#"><i
							class="fas fa-plus-circle"></i></a></td>
				</tr>
			</table>
		</div>


	</div>





	<div id="line"></div>

	<!--푸터-------------->


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


	<!--푸터-------------->
	</div>
	<!-- end container -->

	<!-- 제이쿼리,스크립트 -->
	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/scripts.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script type="text/javascript">
		$('.autoplay').slick(
		{
			slidesToShow : 4,
			slidesToScroll : 1,
			autoplay : true,
			autoplaySpeed : 2000,
		});
	</script>
</body>
</html>