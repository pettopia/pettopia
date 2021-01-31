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
<title>PetDiaryShare.jsp</title>
<link rel="stylesheet" type="text/css" href="css/DiaryShare.css">
<script src="https://kit.fontawesome.com/d0c252d761.js"
   crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript"
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>

   <!-- 메뉴 구성영역 -->
   <div>
      <c:import url="header.jsp"></c:import>
   </div>

   <div id="Diary" style="margin-top:152px;">
      <div>
         <h1>다이어리 공유하기</h1>
         <hr>
      </div>

      <div id="InsertDiary">
         <form class="input form-inline" role="form">
            <table class="table">
               <tr>
                  <th>다이어리 공유자 닉네임</th>
                  <th><input type="text" class="form-control"
                     style="width: 500px;"></th>
               </tr>

            </table>
            <button class="dailyBtn btn btn-success">공유하기</button>
            </form>
   </div>
   </div>
   <!-- end Diary  -->
   
   <!-- 푸터 구성 -->
   <div>
      <c:import url="footer.jsp"></c:import>
   </div>
   <script src="js/jquery-3.1.1.min.js"></script>
   <script src="js/scripts.js"></script>

</body>
</html>