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
<title>비밀번호 재확인 후 진짜 수정 페이지</title>
<link rel="stylesheet" type="text/css"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript"
   src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/d0c252d761.js"
   crossorigin="anonymous"></script>
<script type="text/javascript"
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">

#wrapper {
   margin: 0 auto;
   width: 1150px;
   margin-top: 160px;
}

.main_content .header
{
   margin-bottom: 20px;
}

.my_image {
   width: 150px;
   height: 150px;
   border-radius: 50%;
   float: left;
} 
.following_user_form
{
   width:950px;
   height: 200px;
}
.table1 {
    float: left;
    height: 50px;
    margin-top: 40px;
    margin-left: 30px;
    text-align: center;
}
.table1 th
{
   width:100px;
}

#my-inf
{
   width:80%;
   height:500px; 
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
      $("#err").css("display", "none");
      $("#err2").css("display", "none");
      
      //닉네임이 입력될 경우 수행할 코드 처리
      $("#nick").on("keyup", function()
      {
         //keyup 이벤트가 발생할 때 마다
         //실시간으로 입력값을 담아둘 변수 search
         var search = $(this).val();
         
         //입력 내용이 있을 경우에만 전송할 수 있도록 처리
         if(search.replace(" ", "") == "")
         {
            $("#err").css("display", "none");
            return;
         }
         
         
         
         ajaxRequest();
      });
      
      
      
      //지역 추가 버튼이 클릭되었을 때 수행할 코드 처리
      $("#submitBtn").click(function()
      {
         
         $("#err").css("display", "none");

         //1. 데이터 검사
         if( $("#nick").val() == "" || $("#addrnumber").val() == "" || $("#addr1").val() == "" || $("#addr2").val() == ""
            || $("#phonenumber").val() == "" || $("#email").val() == "")
         {
            $("#err2").html("입력 항목이 누락되었습니다.");
            $("#err2").css("display", "inline");
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
         
         //이메일 유효성 검사
         if( !/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/.test($("#email").val()) ) // 『!』 check~!!!
         {
            $("#err").html("이메일을 확인해 주세요");
            $("#err").css("display", "inline");
            return;
         }
         
         //2. 중복 확인 유효성 검사
         if( $("#errNick").html().trim() == "이미 사용중인 이름이 존재합니다."
               || $("#err").html().trim() == "사용중인 이름은 등록할 수 없습니다.")
         {
            $("#err").html("사용중인 이름은 등록할 수 없습니다.");
            $("#err").css("display", "inline");
            return;
         }
         
         //submit 액션 처리 수행
         $("#form").submit();
         
      });
      
   });
   
   
function ajaxRequest()
{
   $.post("nickajax.action", {nickName : $("#nick").val()}, function(data)
   {
      $("#err").html(data).css("display", "inline");
   });
}
</script>
</head>
<body>

<div id="header">
   <c:import url="header.jsp"></c:import>
</div>

<div id="wrapper">

   <c:import url="sidemenu.jsp"></c:import>

      <div class="main_content" style="margin-left: 240px; padding-top: 60px;">
         <div class="header">
            <h2 class="tit">내 정보수정 / 닉네임변경</h2>
         
         </div>

         <div class="info">

            <div class="explain">
               <p class="img-area">
                  <i class="ico-circle-gray tool"></i>
               </p>
               <p class="txt">
                  펫토피아는 회원님의 개인정보를 신중히 취급하며, 회원님의 동의 없이 기재하신 회원정보를 공개하지 않습니다. <br>
                  회원님의 정보 가운데 변경된 내용이나 설정 변경이 필요한 경우에는 아래에서 수정해주시기 바랍니다.
               </p>
            </div>

            <h3>회원 로그인 정보</h3>
            <form id="form" name="form" action="myinfedit.action" method="post">
               
               <input type="hidden" value="${member_code_seq }" name="member_code_seq">
               
               <table class="table">
                  <tr>
                     <th>아이디</th>
                     <td>
                        <input type="text" value="${list.id }" title="아이디 입력" id="id" name="id"
                           class="form-control" readonly="readonly">
                     </td>
                  </tr>
                  
                  <tr>
                     <th>닉네임</th>
                     <td>
                        <input type="text" value="${list.nick }" id="nick" name="nick" title="닉네임 입력" class="form-control"> 
                        <span id="err" style="color:red; font-weight:bold; display:none;"></span>      
                     </td>
                  </tr>
               </table>   
                  
               <br>
               <h3 class="tit font-black">연락처 정보</h3>

               
                  <table class="table">                                    
                        <tr>
                           <th style="width: 195px;">거주지 주소*</th>
                           <td>                                                            
                              <input type="text" class="form-control" title="우편번호 입력" 
                              readonly="readonly" id="addrnumber"  name="addrnumber" value="${list.addrnumber } ">
                              
                              
                              <input type="text" class="form-control" title="시명"
                                    placeholder="시명" readonly="readonly" id="addr1"  name="addr1"  value="${list.addr1 }">
                              
                              
                              <input type="text" class="form-control" title="도로명" placeholder="도로명" readonly="readonly" id="addr2"  name="addr2" value="${list.addr2}"> 
                              <input type="text" class="form-control" title="상세주소 입력 "
                                    placeholder="상세주소" id="addr3"  name="addr3"  value="${list.addr3 }">
                           </td>
                              
                           <td>
                              <button type="button" class="btn btn-primary addbtn" onClick="goPopup()">주소찾기</button>                              
                           </td>                        
                        </tr>
                     
                        <tr>
                           <th>연락처 * </th>
                           <td colspan="2">
                              <div class="tel-wrap mt05">
                                 <input type="text" class="form-control" id="phonenumber" name="phonenumber" title="휴대전화입력"
                                    maxlength="13" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" value="${list.phonenumber }" style="width:472px;"> 
                                 <span>형식 : 010-0000-0000</span> 
                              
                              </div>
                           </td>
                        </tr>
                        
                        <tr>
                           <th>이메일 *</th>
                           <td colspan="2">
                              <div class="email-wrap mt05">
                                 <input type="text" name="email" id="email" value="${list.email }"
                                    maxlength="40" class="form-control" title="이메일 주소 입력" style="width:472px;">
                                 <span>형식 : abcd@test.com</span>
                              </div>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="2">
                           <span id="err2" style="color:red; font-weight:bold; display:none;"></span>
                           </td>
                        </tr>
                     </tbody>
                  </table>
                           
               <%-- 

               <h3 class="tit font-black">펫토피아 지원정보 수신여부</h3>
               <div class="table-wrap mb50">
                  <table class="board-form">
                     <caption>펫토피아 지원정보 수신여부 설정</caption>
                     <colgroup>
                        <col style="width: 155px;">
                        <col>
                     </colgroup>
                     <tbody>
                        <tr>
                           <th scope="row">휴대전화 문자서비스</th>
                           <td>
                              <div class="mt05 mb05">
                                 <p class="mg00">휴대전화로 문자서비스를 받으시겠습니까?</p>
                                 <label><input type="radio" name="smsRcvYn"
                                    id="smsRcvYn1" value="Y" checked="checked"
                                    onclick="fnOpenLatte('/indivMemberSrv/custInfoAdmin/PopReceiveAgree.do?returnFunction=smsReceiveAgreeRtn');">
                                    수신</label> <label class="ml10"><input type="radio"
                                    name="smsRcvYn" id="smsRcvYn2" value="N"> 수신안함</label>
                              </div>
                           </td>
                        </tr>
                        <tr>
                           <th scope="row">메일링서비스</th>
                           <td>
                              <div class="mt05 mb05">
                                 <p class="mg00">펫토피아에서 제공하는 산책정보, 이벤트, 정보 등
                                    새로운 소식을 받으시겠습니까?</p>
                                 <label><input type="radio" name="mailsvcRcvYn"
                                    id="mailsvcRcvYn1" value="Y"
                                    onclick="fnOpenLatte('/indivMemberSrv/custInfoAdmin/PopReceiveAgree.do?returnFunction=mailReceiveAgreeRtn');">
                                    수신</label> <label class="ml10"><input type="radio"
                                    name="mailsvcRcvYn" id="mailsvcRcvYn2" value="N"
                                    checked="checked"> 수신안함</label>
                              </div>
                           </td>
                        </tr>
                     </tbody>
                  </table>
               </div>

               <h3 class="tit font-black">공지 수신여부</h3>
               <div class="table-wrap mb50">
                  <table class="board-form">
                     <caption> 공지 수신여부 설정</caption>
                     <colgroup>
                        <col style="width: 155px;">
                        <col>
                     </colgroup>
                     <tbody>
                        <tr>
                           <th scope="row">휴대전화 문자서비스</th>
                           <td>
                              <div class="mt05 mb05">
                                 <label><input type="radio" name="imsSmsRcvYn"
                                    id="imsSmsRcvYn1" value="Y"
                                    onclick="fnOpenLatte('/indivMemberSrv/custInfoAdmin/PopImsSmsReceiveAgree.do?returnFunction=imsSmsReceiveAgreeRtn');">
                                    수신</label> <label class="ml10"><input type="radio"
                                    name="imsSmsRcvYn" id="imsSmsRcvYn2" value="N"
                                    checked="checked"> 수신안함</label>
                              </div>
                           </td>
                        </tr>
                        <tr>
                           <th scope="row">메일링서비스</th>
                           <td>
                              <div class="mt05 mb05">
                                 <label><input type="radio" name="imsMailsvcRcvYn"
                                    id="imsMailsvcRcvYn1" value="Y"
                                    onclick="fnOpenLatte('/indivMemberSrv/custInfoAdmin/PopImsMailReceiveAgree.do?returnFunction=imsMailReceiveAgreeRtn');">
                                    수신</label> <label class="ml10"><input type="radio"
                                    name="imsMailsvcRcvYn" id="imsMailsvcRcvYn2" value="N"
                                    checked="checked"> 수신안함</label>
                              </div>
                           </td>
                        </tr>
                     </tbody>
                  </table>
               </div>


               <!-- 20170602 네이버,소셜 로그인 연동 간편 로그인 추가 -->
                --%>

               <div class="btn-group" style="margin-left: 250px;">
                  <button class="btn btn-success" style="width:200px; margin-right: 30px;">수정하기</button> 
                  <button type="reset" class="btn btn-danger" style="width:200px;">취소하기</button>
               </div>
               
            </form>

         </div>

      </div>

   </div>

      <c:import url="footer.jsp"></c:import>
   <script src="js/scripts.js"></script>
</body>
</html>