<%@ page contentType="text/html; charset=UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<style type="text/css">
* {
   margin: 0px;
   padding: 0px;
   text-decoration: none;
   font-family: sans-serif;
}

body {
   background-image: #34495e;
}

.loginForm {
   position: absolute;
   width: 500px;
   height: 400px;
   padding: 30px, 20px;
   background-color: #FFFFFF;
   text-align: center;
   top: 50%;
   left: 50%;
   transform: translate(-50%, -50%);
   border-radius: 15px;
}

.loginForm h2 {
   text-align: center;
   margin: 30px;
}

.idForm {
   border-bottom: 2px solid #adadad;
   margin: 30px;
   padding: 10px 10px;
}

.passForm {
   border-bottom: 2px solid #adadad;
   margin: 30px;
   padding: 10px 10px;
}

.id {
   width: 100%;
   border: none;
   outline: none;
   color: #636e72;
   font-size: 16px;
   height: 25px;
   background: none;
}

.pw {
   width: 100%;
   border: none;
   outline: none;
   color: #636e72;
   font-size: 16px;
   height: 25px;
   background: none;
}

.btn {
   position: relative;
   left: 40%;
   transform: translateX(-50%);
   margin-bottom: 40px;
   width: 80%;
   height: 40px;
   background: linear-gradient(125deg, #81ecec, #6c5ce7, #81ecec);
   background-position: left;
   background-size: 200%;
   color: white;
   font-weight: bold;
   border: none;
   cursor: pointer;
   transition: 0.4s;
   display: inline;
}

.btn:hover {
   background-position: right;
}

</style>
<!-- <link rel="stylesheet" href="css/login.css"> -->

</head>
<body width="100%" height="100%">
   <form action="adminlogin.action" method="post" class="loginForm">
      <h2>관리자 로그인</h2>
      <div class="idForm">
         <input type="text" name="id" class="id" placeholder="ID" required="required">
      </div>
      <div class="passForm">
         <input type="password" name="pw" class="pw" placeholder="PW" required="required">
      </div>
      <button type="submit" class="btn">로그인</button>
   
   </form>
</body>
</html>