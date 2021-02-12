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
<title>회원가입 폼</title>
<script src="https://kit.fontawesome.com/d0c252d761.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>	
<script type="text/javascript" src="<%=cp%>/js/util.js"></script>
<style type="text/css">

#wrapper {
	margin: 0 auto;
	width: 1150px;
	margin-top:200px;
}	
#joinform {
	border: 1px solid #ccc;
	border-radius: 5px;
	width: 650px;
	padding: 15px;
	margin: 0px auto;
}
.msg 
{
	font-size:12pt;
}

.format
{
	font-size:12pt;
	display: block;
}
.id_1 {
    font-family: "나눔고딕";
    width: 149px;
    padding: 45px 0 0 29px;
    font-weight: 700;
    font-size: 14px;
    color: #333;
    line-height: 20px;
    vertical-align: top;
}

</style>

<script type="text/javascript">

function goPopup(){
   var pop = window.open("jusopopup.action","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}


function jusoCallBack(addrDetail, zipNo, siNm,sggNm, rn,buldMnnm){
      document.form.addr3.value = addrDetail;
      document.form.addrnumber.value = zipNo;
      document.form.addr1.value = siNm;
      document.form.addr2.value = sggNm + " " +  rn + buldMnnm;
}


$(document).ready(function()
   {
   
      //에러(span 엘리먼트) 안내 초기화
      $("#errId").css("display", "none");
      $("#errPw").css("display", "none");
      $("#errNick").css("display", "none");
      $("#err").css("display", "none");
      
      //아이디 입력시 수행
      $("#id").on("keyup", function()
      {
         //keyup 이벤트가 발생할 때 마다
         //실시간으로 입력값을 담아둘 변수 search
         var search = $(this).val();
         
         //입력 내용이 있는 경우에 전송할 수 있도록 처리
         if(search.replace(" ", "") == "" || search.length < 5)
         {
            $("#errId").css("display", "none");
            return;
         }
         
         if(search.length > 4)
        	ajaxIdRequest();
      });
      
      
      $("#pw1").keyup(function()
      {
         $("#errPw").text('');
      }); //#user_pass.keyup

      $("#pw").keyup(function()
      {
         if($("#pw1").val() != $("#pw").val())
         {
            $("#errPw").text('');
             $("#errPw").html("암호불일치").css("display", "inline");
         }
         else
         {
             $("#errPw").text('');
             $("#errPw").html("암호일치").css("display", "inline");
         }
      });
      
      
      //닉네임이 입력시 처리
      $("#nick").on("keyup", function()
      {
         
         //keyup 이벤트가 발생할 때 마다
         //실시간으로 입력값을 담아둘 변수 search
         var search = $(this).val();
         
         //입력 내용이 있을 경우에만 전송할 수 있도록 처리
         if(search.replace(" ", "") == "")
         {
            $("#errNick").css("display", "none");
            return;
         }
         
         
         ajaxNickRequest();
      });
      
      //생년월일 입력 시 처리
      $("#ssn1").on("keyup", function()
      {
         //keyup 이벤트가 발생할 때 마다 실시간으로 입력값을 담아둘 변수
         var ssn1 = $(this).val();
         
         //입력 내용이 있을 경우에만 전송할 수 있도록 처리
         if(ssn1.length == 6)
         {
        	 $("#ssn2").focus();
             return;
         }
      });

      // 주민번호 뒷자리 입력 시 처리
      $("#ssn2").on("keyup", function()
      {
         //keyup 이벤트가 발생할 때 마다 실시간으로 입력값을 담아둘 변수
         var ssn2 = $(this).val();
         
         //입력 내용이 있을 경우에만 전송할 수 있도록 처리
         if(ssn2.length == 1)
         {
        	 $("#nick").focus();
             return;
         }
      });
      
      // 회원가입 버튼이 클릭되었을 때 수행할 코드 처리
      $("#submitBtn").click(function()
      {
         $("#err").css("display", "none");
         
         //1. 데이터 검사
         if($("#id").val() == "" || $("#nick").val() == "" || $("#pw1").val() == "" || $("#pw").val() == "" 
            || $("#birth").val() == "" || $("#gender").val() == "" || $("#addrnumber").val() == ""
            || $("#addr1").val() == "" || $("#addr2").val() == ""
            || $("#phonenumber").val() == "" || $("#email").val() == "")
         {
            $("#err").html("입력 항목이 누락되었습니다.");
            $("#err").css("display", "inline");
            return;      
         }
         
         
         //비밀번호 재확인 일치 여부 확인
         if( $("#pw").val()!= $("#pw1").val() )
         {
            $("#errPw").html("비밀번호를 확인해주세요");
            $("#errPw").css("display", "inline");
            return;
         }
         
         //닉네임 한글/영어/숫자 2~10글자
         if( !/^[가-힣a-zA-Z0-9]{2,10}$/.test($("#nick").val()) ) // 『!』 check~!!!
         {
            $("#errNick").html("한글/영어/숫자만 입력해주세요.");
            $("#errNick").css("display", "inline");
            return;
         }
         
         
         //전화번호 유효성 체크
         if( !/^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/.test($("#phonenumber").val()) ) // 『!』 check~!!!
         {
            $("#err").html("전화번호를 확인해주세요.");
            $("#err").css("display", "inline");
            return;
         }
         
         //아이디 중복 확인 유효성 검사
         if( $("#errId").html().trim() == "이미 사용중인 아이디가 존재합니다.")
         {
            $("#err").html("사용중인 아이디는 등록할 수 없습니다.");
            $("#err").css("display", "inline");
            return;
         }
         
         //닉네임 중복 확인 유효성 검사
         if( $("#errNick").html().trim() == "이미 사용중인 닉네임이 존재합니다.")
         {
            $("#err").html("사용중인 닉네임은 등록할 수 없습니다.");
            $("#err").css("display", "inline");
            return;
         }
         
         //패스워드 유효성 검사
         if( $("#errPw").html().trim() == "암호불일치")
         {
            $("#err").html("암호를 확인해주세요.");
            $("#err").css("display", "inline");
            return;
         }
         
         
         
         //아이디 영어 숫자만 입력가능 5~20글자수 제한
         if( !/^[A-Za-z0-9]{5,20}$/.test($("#id").val()) ) // 『!』 check~!!!
         {
            $("#errId").html("5~20자리의 영문, 숫자만 사용가능합니다.");
            $("#errId").css("display", "inline");
            $("#err").html("아이디를 확인해주세요.");
            $("#err").css("display", "inline");
            return;
         }
         //비밀번호 글자수 6~14 글자의 영문 숫자 조합
         if( !/^[A-Za-z0-9]{6,14}$/.test($("#pw").val()) ) // 『!』 check~!!!
         {
            $("#errPw").html("6~14자리의 영문, 숫자만 사용가능합니다.");
            $("#errPw").css("display", "inline");
            $("#err").html("비밀번호를 확인해주세요");
            $("#err").css("display", "inline");
            return;
         }
         
         //이메일 유효성 검사
         if( !/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/.test($("#email").val()) ) // 『!』 check~!!!
         {
            $("#err").html("이메일을 확인해 주세요");
            $("#err").css("display", "inline");
            return;
         }
         
         
         // 생년월일 유효성 검사
         var ssn1 = $("#ssn1").val();

         if(!/^[0-9]{6}$/.test(ssn1))
         {
            $("#err").html("생년월일을 확인해주세요.");
            $("#err").css("display", "inline");
            return;
         }

         // 주민번호 뒷자리 유효성 검사
         if(!/^[1-4]{1}$/.test($("#ssn2").val()) ) 
         {
            $("#err").html("주민번호 뒷자리를 확인해주세요.");
            $("#err").css("display", "inline");
            return;
         }

         var year = parseInt(ssn1.substring(0,2));
         var month = parseInt(ssn1.substring(2,4));
         var day = parseInt(ssn1.substring(4,6));
         var months = [31,28,31,30,31,30,31,31,30,31,30,31];
         
         if(month > 12) 
         {
            $("#err").html("생년월일을 확인해주세요.");
            $("#err").css("display", "inline");
            return;
         }
         
         if(month != 2)
       	 {
        	 if(day > months[month-1])
        	 {
                 $("#err").html("생년월일을 확인해주세요.");
                 $("#err").css("display", "inline");
                 return;
        	 }
       	 } 
         if(month == 2)
   		 {
   		 	 if($("#ssn2").val() == 1 || $("#ssn2").val() == 2)
   		 		 year += 1900;
   		 	 else
   		 		 year += 2000;
   		 	 
   		 	 if(year%400==0 || (year%4==0 && year%100!=0))
				 months[1]++;
   		 	 
   		 	 if(day > months[1])
        	 {
                 $("#err").html("생년월일을 확인해주세요.");
                 $("#err").css("display", "inline");
                 return;
        	 }
   		 }
         
         //submit 액션 처리 수행
         $("#form").submit();
         
      });
      
   });
   
function ajaxIdRequest()
{
   $.post("idajax.action", {idName : $("#id").val()}, function(data)
   {
      $("#errId").html(data).css("display", "inline");
   });
}
   
function ajaxNickRequest()
{
   $.post("nickajax.action", {nickName : $("#nick").val()}, function(data)
   {
      $("#errNick").html(data).css("display", "inline");
   });
}
</script>

</head>
<body>

<div id="header">
	<c:import url="header.jsp"></c:import>
</div>

<div id="wrapper">
		<div id="joinform">
				<h2 class="tit" style="text-align: center;">회원가입</h2>
			
				
				<form id="form" name="form" action="join.action" method="post">
					<table class="table">
					<tr>
						<th class="id_1">아이디 *</th>
						<td>
							<input type="text"  title="아이디 입력" id="id" name="id"
								class="form-control" placeholder="아이디 입력">
							<span class="msg" id="errId" style="color:red; font-weight:bold; display:none;"></span>
							
						</td>
						<td></td>
					</tr>
					<tr>	
						<th>비밀번호 *</th> 
						<td>	
							<input type="password" title="비밀번호 입력" id="pw1" name="pw1"
								class="form-control" placeholder="비밀번호 입력">
						</td>
						<td></td>	
					</tr>
					<tr>	
						<th>비밀번호 재확인 *</th>
						<td> 
							<input type="password"  title="비밀번호 재확인" id="pw" name="pw"
								class="form-control" placeholder="비밀번호 재확인">
							<span class="msg" id="errPw" style="color:red; font-weight:bold; display:none;"></span>
							
						</td>
						<td></td>
					</tr>
					<tr>
					<tr>	
						<th>생년월일 *</th>
						<td> 
							<input type="text"  title="생년월일 + 성별" id="ssn1" name="ssn1"
								class="form-control" placeholder="생년월일(6)+주민번호 뒷자리(1)" style="width: 100px; display: inline;"> - 
								<input type="text"  title="생년월일 + 성별" id="ssn2" name="ssn2"
								class="form-control" style="width: 20px; display: inline; padding-left: 5px; padding-right: 5px;">******
							<span class="format">형식 : 950916 - 2******</span>
						</td>
						<td></td>
					</tr>
					
					<tr>		
						<th>닉네임 *</th>
						<td>
							<input type="text"  id="nick" name="nick" title="닉네임 입력" placeholder="닉네임 입력" class="form-control"> 
							
							<span class="msg" id="errNick" style="color:red; font-weight:bold; display:none;"></span>
							
						</td>
						<td></td>
					</tr>
					
						<tr>
									<th style="width: 195px;">거주지 주소 *</th>
									<td>																				
										<input type="text" class="form-control" title="우편번호 입력" 
										readonly="readonly" id="addrnumber"  name="addrnumber" >
										
										
										<input type="text" class="form-control" title="시명"
												placeholder="시명" readonly="readonly" id="addr1"  name="addr1">
										
										
										<input type="text" class="form-control" title="도로명" placeholder="도로명" readonly="readonly" id="addr2"  name="addr2"> 
										<input type="text" class="form-control" title="상세주소 입력 "
												placeholder="상세주소" id="addr3"  name="addr3">
									</td>
										
									<td>
										<button type="button" class="btn btn-primary addbtn" onclick="goPopup()">주소찾기</button>										
									</td>								
								
					
						<tr>
							<th >연락처 *</th>
							<td>
								<div class="tel-wrap mt05">
									<input type="tel" class="form-control" id="phonenumber" name="phonenumber" title="휴대전화입력"
										maxlength="13" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="휴대전화 입력"> 
									<span class="format">형식 : 010-0000-0000</span> 
								
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<th>이메일 *
							</th>
							<td>
								<div class="email-wrap mt05">
									<input type="email" name="email" id="email" 
										maxlength="40" class="form-control" title="이메일 주소 입력" placeholder="이메일 입력">
									<span class="format">형식 : abcd@test.com</span>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="2">
							<span class="msg" id="err" style="color:red; font-weight:bold; display:none;"></span>
							</td>
							<td></td>
						</tr>					
					</table>					
						<div class="btn">
							<button type="button" id="submitBtn" class="btn btn-success" style="width: 500px;margin-left:40px; height: 40px;">회원가입</button>
						</div>
						
				</form>

			</div>

		</div>

	<c:import url="footer.jsp"></c:import>
		<script src="js/scripts.js"></script>
</body>
</html>