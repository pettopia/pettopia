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
<title>리뷰쓰기(펫시터리뷰)</title>


<style type="text/css">
 #review_popup {
	text-align: center;
	
	}
.star_rating {font-size:0; letter-spacing:-4px;}
.star_rating span {
    font-size:22pt;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
    cursor: pointer;
}
.star_rating span:first-child {margin-left:0;}
.star_rating span.on {color:#777;}


.btn {
	margin-left:15%;
	background: #222;
	width:70%;
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
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
   $(function() {

	   $( ".star_rating span" ).click(function() {
		     
		   $(this).parent().children("span").removeClass("on");
		   $(this).addClass("on").prevAll("span").addClass("on");
		   
		   $("#psscore").val($(this).attr("id"));
		   
		   return false;
		  
		});
	   
	   
	   $( "#submitBtn" ).click(function() {
		     $("#form").submit();
		});
   });
</script>

</head>
<body>

	<div id="review_popup">
		<form id="form" name="form" action="review.action" method="post">
			<input type="hidden" name="care_agree_fix_seq" value="${dto.care_agree_fix_seq }">
			<div>
				<h1>돌봄은 어떠셨나요?</h1>
				<h3>펫시터님 : ${dto.psnick }</h3>
				<h3>돌봄아이 : ${dto.petname }</h3>
			</div>

			<div class="star_rating">
			    <span class="on" id="1">★</span>
			    <span class="on" id="2">★</span>
			    <span class="on" id="3">★</span>
			    <span id="4">★</span>
			    <span id="5">★</span>
			    <input type="hidden" id="psscore" name="psscore" value="3">
			</div>
			
			<br>
			<div>
				<textarea cols="65" rows="12" name="reviewcontent" placeholder="상세리뷰를 작성해주세요"></textarea>
			</div>
			<br>
			
			<div id="submitBtn" class="btn" ><span class="noselect">리뷰작성</span></div>
			
		</form>
	</div>
	
	
	
</body>
</html>