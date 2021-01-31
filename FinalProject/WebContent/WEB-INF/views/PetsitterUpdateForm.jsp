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
<link rel="stylesheet" type="text/css"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/d0c252d761.js"
   crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
   src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript"
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!--아이콘 링크 -->

<script>
  /*  $(document).ready(function()
   {
      
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
   }); */
   
   $(function()
         {
            var serviceArr =
            [];
            <c:forEach items="${petcare}" var="petcare">
            serviceArr.push("${petcare.pet_size_seq}")
            </c:forEach>
            for (var i = 0; i < serviceArr.length; i++)
            {
               //console.log(serviceArr[i]);
               $(
                     "input[name=pet_size_seq][value="
                           + serviceArr[i] + "]").prop(
                     "checked", true);
            }

         });
   
   $(function()
         {
            var serviceArr =
            [];
            <c:forEach items="${service}" var="service">
            serviceArr.push("${service.ps_service_seq}")
            </c:forEach>
            for (var i = 0; i < serviceArr.length; i++)
            {
               //console.log(serviceArr[i]);
               $(
                     "input[name=ps_service_seq][value="
                           + serviceArr[i] + "]").prop(
                     "checked", true);
            }

         });
   
</script>




</head>
<body>
   <c:import url="header.jsp"></c:import>

   <!-- content -->
   <div id="content"
      style="font-family: 'Noto Sans KR Regular', 'Noto Sans KR Thin'; font-size: 12px;">

      <form action="petsitterinsert2.action" method="post" id="myForm"
         name="form">
         <table class="table" style="margin: 0 auto; width: 1150px;">

            <tr>
               <th><h3>세부사항</h3></th>
            </tr>



            <tr>
               <th>돌봄 형태 :</th>
               <td><label><input type="radio" name="caretype_seq"
                     value="1"
                     <c:if test="${petprofile.caretype_seq eq '1'}">checked</c:if>>위탁</label>
                  <label><input type="radio" name="caretype_seq" value="2"
                     <c:if test="${petprofile.caretype_seq eq '2'}">checked</c:if>>방문</label>
                  <label><input type="radio" name="caretype_seq" value="3"
                     <c:if test="${petprofile.caretype_seq eq '3'}">checked</c:if>>무관</label>
               </td>

            </tr>


            <tr>
               <th>자기소개 :</th>
               <td><input type="text" width="200px" , height="150px"
                  name="pscontent" value="${pscontent.pscontent }"></td>
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
                     <option value="0"
                        ${ps_open_seq.ps_open_seq == 0 ? "selected=\"selected\"" : ""}>공개</option>
                     <option value="1"
                        ${ps_open_seq.ps_open_seq == 1 ? "selected=\"selected\"" : ""}>비공개</option>
               </select></td>
            </tr>

            <tr>
               <th>돌봄 환경 이미지</th>
               <!-- 텍스트파일로 테스트  -->
               <td><input type="text" name="filepath" value=""
                  style="margin: auto; border: 1px solid"></td>
            </tr>

            <tr>
               <th>위치</th>
               <td>
                  <!-- <button type="button" class="postcodebtn">우편번호 찾기</button> -->
                  <input type="text" name="psaddrnumber"
                  value="${petprofile.psaddrnumber }"> <input type="text"
                  name="psaddr1" placeholder="시/도" value="${petprofile.psaddr1 }">
                  <input type="text" name="psaddr2" placeholder="도로명주소"
                  value="${petprofile.psaddr2 }"> <input type="text"
                  name="psaddr3" placeholder="상세주소" value="${petprofile.psaddr3 }">
               </td>
            </tr>

            <tr>


               <th>은행명</th>
               <td><select name="bank_seq" class="form-control"
                  style="width: 200px;">
                     <c:forEach var="selectbank" items="${selectbank }">
                        <option value="${selectbank.bank_seq}"
                           ${selectbank.bank_seq == petprofile.bank_seq ? "selected=\"selected\"" : ""}>${selectbank.bankname}</option>
                     </c:forEach>
               </select></td>
            </tr>
            <tr>
               <th>예금주명</th>
               <td><input type="text" name="psaccountname"
                  value="${petprofile.psaccountname }" class="form-control"
                  style="width: 150px;"></td>
            </tr>

            <tr>
               <th>계좌번호</th>
               <td><input type="text" name="psaccountnumber"
                  value="${petprofile.psaccountnumber }" class="form-control"
                  style="width: 150px;"></td>
            </tr>
            


            <tr>
               <th rowspan="3">이용요금</th>
               <td>
	               <ul>
	                  <li>
		                  <label>
		                     <input type="checkbox" id="petsize1" name="pet_size_seq" value="1">대형
		                  </label> 
		                     
		                  <!-- petcare : CAREPAY, PS_CARE_PAY_SEQ -->
		                  <!-- payList : 현재 펫시터 회원이 서비스하는 금액만 담은 배열 -->
		                  
		                 <c:forEach var="care" items="${petcare }">
	                     <c:if test="${care.pet_size_seq == 1 }">
	                     <input type="text" id="carepay1" name="carepay" value="${care.carepay }" style="display: block;">
	                     </c:if>
	                     <c:if test="${care.pet_size_seq != 1 }">
	                     <input type="text" id="carepay1" name="carepay" value="" style="display: block;">
	                     </c:if>
	                     </c:forEach>
	                  </li>
	                  
	                  <li>
	                  <label>
	                     <input type="checkbox" id="petsize2" name="pet_size_seq" value="2">중형
	                  </label> 
	                     
	                  <c:forEach var="care" items="${petcare }">
	                     <c:if test="${care.pet_size_seq == 2 }">
	                     <input type="text" id="carepay1" name="carepay" value="${care.carepay }" style="display: block;">
	                     </c:if>
	                     <c:if test="${care.pet_size_seq != 2 }">
	                     <input type="text" id="carepay2" name="carepay" value="" style="display: block;">
	                     </c:if>
	                     </c:forEach>
	                  </li>
	                  <li>
	                  <label>
	                     <input type="checkbox" id="petsize3" name="pet_size_seq" value="3">소형
	                  </label> 
	                     
	                  <c:forEach var="care" items="${petcare }">
	                     <c:if test="${care.pet_size_seq == 3 }">
	                     <input type="text" id="carepay1" name="carepay" value="${care.carepay }">
	                     </c:if>
	                     <c:if test="${care.pet_size_seq != 3 }">
	                     <input type="text" id="carepay3" name="carepay" value="">
	                     </c:if>
	                     </c:forEach>
	                  </li>
	               </ul>
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