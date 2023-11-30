<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<!-- <link href="./css/MemberRegisterOK.css" rel="stylesheet" type="text/css"> -->
<link href="./element/Default/Default.css" type="text/css" rel="stylesheet">
<style type="text/css">
#finishBox{
	position: relative;
	top: 40vh;
	width: 30vw;
	margin:0 auto;
	text-align: center;
	font-size: 24px;
}
input[type=button]{
	border: none;
	background-color: #0042ec;
	color: white;
	padding: 5px 12px;
	border-radius: 4px;
}
</style>
</head>
<body>
	<c:import url="./element/Header/Header.jsp" />
    <div id="finishBox">
        <p>환영합니다.</p>
        <p>회원가입이 완료되었습니다.</p>
        <input type="button" value="로그인하기 >>" id="goLoginBtn">
    </div>
    <script type="text/javascript" src="./js/jquery.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
    	  $("#goLoginBtn").on("click", function() {
    	    window.location.href = "login.do";
    	  });
    	});
    </script>
</body>
</html>