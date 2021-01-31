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
<title>예치금입금하기</title>


<style type="text/css">
 #deposit_popup {
 	margin: 0 auto;
	width:80%;
	text-align: center;
}

#psinf
{	
	
	border:1px solid black;
}

#reqinf
{	
	margin-top:20px;
	border:1px solid black;
}

#bank_seq{
	height:30px;
}

#name
{
	width:70px;
	height:25px;
}


#cardnumber {
	width:60px;
	height:25px;
}

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
	   
	   $( "#submitBtn" ).click(function() {
		   
		   if($("#bank_seq").val()==0)
		   {
		   	alert("은행을 선택하세요.");
		   	return;
		   }
		   
		     $("#form").submit();
		});
   });
</script>

</head>
<body>

	<div id="deposit_popup">
		<form id="form" name="form" action="deposit.action" method="post">
			<h1>예치금 입금하기</h1>
			<input type="hidden" name="care_agree_seq" value="${dto.care_agree_seq }">
			<div id="psinf">
				<p>펫시터님 : ${dto.psnick }</p>			
				<p>돌봄아이 : ${dto.petname }</p>
				<p>이용요금 : ${dto.carepay }</p>
			<input type="hidden" name="depositprice" value="${dto.carepay }">
			</div>

			<div id="reqinf">
				<div style="margin-top:20px; margin-bottom:20px;">
					
					은행 선택 : 
					<select id="bank_seq" name="bank_seq">
					<option value="0">선택안함</option>
					<c:forEach var="bank" items="${bank }">
						<option value="${bank.seq }">${bank.bankname }</option>
					</c:forEach>
					</select> 
					<br>
					<label for="name">예금주명 :</label>  
					<input type="text" id="name" name="name" required="required">
					<br>
					<label for="cardnumber">카드번호 :</label> 
					<input type="text" id="cardnumber" name="cardnumber" required="required">- 
					<input type="text" id="cardnumber" name="cardnumber" required="required">- 
					<input type="text" id="cardnumber" name="cardnumber" required="required">- 
					<input type="text" id="cardnumber" name="cardnumber" required="required">
				</div>		
			</div>
			
			<br>
			<div id="submitBtn" class="btn" ><span class="noselect">예치금입금하기</span></div>
			
		</form>
	</div>
	
	
	
</body>
</html>