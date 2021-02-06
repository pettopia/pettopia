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
<title>mypage.jsp</title>
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
   $(document).ready(function()
   {
      $("#modifyBtn").click(function()
      {
         $(location).attr('href', 'checkpwform.action?n=1');
      });

      $("#mypage").click(function()
      {
         $(location).attr('href', 'mypage.action');
      });
   });

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

/*    $(function()
   {
      var serviceArr =
      [];
      <c:forEach items="${petcare}" var="petcare">
      serviceArr.push("${petcare.pet_size_seq}")
      </c:forEach>
      for (var i = 0; i < serviceArr.length; i++)
      {
         //console.log(serviceArr[i]);
         $("input[name=pet_size_seq][value=" + serviceArr[i] + "]").prop(
               "checked", true);
      }

   }); */

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
         $("input[name=ps_service_seq][value=" + serviceArr[i] + "]").prop(
               "checked", true);
      }
      
      
       var checkBoxArr = [];
      $("input[name=pet_size_seq]:checked").each(function(i)
      {
            checkBoxArr.push($(this).val());
            alert($(this).val())
      }); 

   });
</script>
</head>
<body>
	<div id="header">
<c:import url="header.jsp"></c:import>
</div>

<div id="wrapper">

	<c:import url="sidemenu_ps.jsp"></c:import>

	<div class="main_content" style="margin-left: 240px; padding-top: 60px;">

			<div class="header">
				<i class="fas fa-home" style="font-size: 30px;"></i> <span
					style="font-weight: bold; font-size: 20pt;">펫시터 프로필 수정</span>
			</div>

         <div class="info">

            <form action="psprofileupdate.action" method="post">
            	<input type="hidden" name="ps_profile_seq" value="${ps_profile_seq}">
               
               <table class="table" style="width:900px;">

                  <tr>
                     <th colspan="2"><h3>세부사항</h3></th>
                  </tr>



                  <tr>
                     <th>돌봄 형태<span style="font-size: 15px;">(※)</span> :</th>
                     <td><label><input type="radio" name="ps_care_type_seq"
                           value="1"
                           <c:if test="${petprofile.caretype_seq eq '1'}">checked</c:if>>위탁</label>
                        <label><input type="radio" name="ps_care_type_seq" value="2"
                           <c:if test="${petprofile.caretype_seq eq '2'}">checked</c:if>>방문</label>
                        <label><input type="radio" name="ps_care_type_seq" value="3"
                           <c:if test="${petprofile.caretype_seq eq '3'}">checked</c:if>>무관</label>
                     </td>

                  </tr>


                  <tr>
                     <th>자기소개<span style="font-size: 15px;">(※)</span> :</th>
                     <td><textarea style="width: 700px; height: 200px;" name="pscontent">${pscontent.pscontent }</textarea></td>
                  </tr>

                  <tr>
                  <tr>
                     <th>돌봄환경<span style="font-size: 15px;">(※)</span><br>(이용서비스)</th>
                     <td><label><input type="checkbox"
                           name="ps_service_seq" value="1">정기예약가능</label> <label><input
                           type="checkbox" name="ps_service_seq" value="2">야외산책가능</label>
                        <label><input type="checkbox" name="ps_service_seq"
                           value="3">마당있음</label> <label><input type="checkbox"
                           name="ps_service_seq" value="4">노령견가능</label>
                        <label><input type="checkbox"
                           name="ps_service_seq" value="5">대형견가능</label> <label><input
                           type="checkbox" name="ps_service_seq" value="6">픽업가능</label> <label><input
                           type="checkbox" name="ps_service_seq" value="7">돌봄경험있음</label>
                        <label><input type="checkbox" name="ps_service_seq"
                           value="8">교육이수함</label>                                                                                                         
                     </td>
                  </tr>




                  <tr>
                     <th>프로필공개여부<span style="font-size: 15px;">(※)</span></th>
                     <td><select name="ps_open_seq" class="form-control"
                        style="width: 100px;">
                           <option value="0"
                              ${ps_open_seq.ps_open_seq == 0 ? "selected=\"selected\"" : ""}>공개</option>
                           <option value="1"
                              ${ps_open_seq.ps_open_seq == 1 ? "selected=\"selected\"" : ""}>비공개</option>
                     </select></td>
                  </tr>

                  <!-- <tr>
                     <th>돌봄 환경 이미지</th>
                     텍스트파일로 테스트 
                     <td><input type="text" name="filepath" value=""
                        style="margin: auto; border: 1px solid" class="form-control"></td>
                  </tr> -->

                  <tr>
                     <th>위치<span style="font-size: 15px;">(※)</span></th>
                     <td>
                        <!-- <button type="button" class="postcodebtn">우편번호 찾기</button> -->
                        <input type="text" name="psaddrnumber"
                        value="${petprofile.psaddrnumber }" class="form-control"> 
                        <input type="text"
                        name="psaddr1" placeholder="시/도" value="${petprofile.psaddr1 }" class="form-control">
                        <input type="text" name="psaddr2" placeholder="도로명주소"
                        value="${petprofile.psaddr2 }" class="form-control"> 
                        <input type="text"
                        name="psaddr3" placeholder="상세주소" value="${petprofile.psaddr3 }" class="form-control">
                     </td>
                  </tr>

                  <tr>


                     <th>은행명<span style="font-size: 15px;">(※)</span></th>
                     <td><select name="bank_seq" class="form-control"
                        style="width: 200px;">
                           <c:forEach var="selectbank" items="${selectbank }">
                              <option value="${selectbank.bank_seq}"
                                 ${selectbank.bank_seq == petprofile.bank_seq ? "selected=\"selected\"" : ""}>${selectbank.bankname}</option>
                           </c:forEach>
                     </select></td>
                  </tr>
                  <tr>
                     <th>예금주명<span style="font-size: 15px;">(※)</span></th>
                     <td><input type="text" name="psaccountname"
                        value="${petprofile.psaccountname }" class="form-control"
                        style="width: 150px;"></td>
                  </tr>

                  <tr>
                     <th>계좌번호<span style="font-size: 15px;">(※)</span></th>
                     <td><input type="text" name="psaccountnumber"
                        value="${petprofile.psaccountnumber }" class="form-control"
                        style="width: 150px;"></td>
                  </tr>
                  
                  
               		<tr>
               			<th rowspan="3">이용요금<span style="font-size: 15px;">(※)</span></th>
               			<td><input type="checkbox" name="pet_size_seq1" value="Y"> 대형 <input type="text" name="size1" class="form-control" style="width: 200px; display: inline;" 
               			value="${size1.carepay }"></td>
               		</tr>
               		<tr>
               			<td><input type="checkbox" name="pet_size_seq2" value="Y"> 중형 <input type="text" name="size2" class="form-control" style="width: 200px; display: inline;" 
               			 value="${size2.carepay }"></td>
               		</tr>
               		<tr>
               			<td><input type="checkbox" name="pet_size_seq3" value="Y"> 소형 <input type="text" name="size3" class="form-control"  style="width: 200px; display: inline;" 
               			value="${size3.carepay }"></td>
               		</tr>
               		

                  <tr>
                     <td colspan="2" style="text-align: center;">
                        <button type="submit" class="btn btn-success">수정</button>
                        <button type="reset" class="btn btn-default">취소</button> <br>
                        <span style="font-size: small;"> (※)는 필수 입력 사항입니다. </span> <span
                        id="errMsg" style="font-size: small; color: red; display: none;">
                           필수 입력 사항을 모두 입력해야 합니다. </span>

                     </td>
                  </tr>

               </table>
            </form>

         </div>
      </div>


   </div>

   <c:import url="footer.jsp"></c:import>
</body>
</html>
   <%--<td>
                        <c:forEach var="care" items="${petcare }">
                           <c:if test="${petcare.pet_size_seq == 1 }">
                              대형 <input type="text" class="form-control" 
                           value="" style="width: 300px; display: inline-block;"><hr>
                           </c:if>
                           
                           <c:if test="${petcare.pet_size_seq == 2 }">
                              중형 <input type="text" class="form-control" 
                           value="" style="width: 300px; display: inline-block;"><hr>
                           </c:if>
                           
                           <c:if test="${petcare.pet_size_seq == 3 }">
                              소형 <input type="text" class="form-control" 
                           value="" style="width: 300px; display: inline-block;"><hr>
                           </c:if>
                        <!-- 중형 : <input type="text" class="form-control" 
                           value="" style="width: 300px; display: inline-block;"><hr>
                        소형 : <input type="text" class="form-control" 
                           value="" style="width: 300px; display: inline-block;"> -->
                        </c:forEach>
                     </td> --%>