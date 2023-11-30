<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link href="./element/Default/Default.css" type="text/css"
	rel="stylesheet">
<style type="text/css">
#backImg {
	position: relative;
	top: 110px;
	width: 1920px;
	height: 220px;
}
#sideContainer{
	position: relative;
	z-index: 10000;
	margin-left: 7vw;
	width: 15%;
	float: left;
}
#userInfo{
	margin-bottom: 5vh;
}
#userInfo p {
	margin-bottom: 8px;
	font-weight: 400px;
}
#userInfo h1{
	font-size: 36px;
}

#sideMenu{
	position: relative;
	left: -2vw;
	top: 5vh;
}
#sideMenu ul{
	margin: 30px 0;
}
#sideMenu ul li{
	list-style: none;
	margin: 8px 0;
	
}
#sideMenu ul li h5{
	font-family: 20px;
	font-weight: 600;
}
#sideMenu ul li h4{
	font-size: 20px;
 }
#sideMenu ul li a{
	text-decoration: none;
	color: #5F5F61;
}
</style>
</head>
<body>
	<img alt="backgroundIMG" src="./source/svg/MyPage_Bg.svg" id="backImg">
	<div id="sideContainer">
		<div id="userInfo">
			<p>안녕하세요!</p>
			<c:set var="dto" value="${dto }"/>
			<h1>${dto.name }님</h1>
		</div>
		<div id="sideMenu">
			<ul>
				<li><h5>나의 카드 수 ${issCnt }개</h5></li>
			</ul>
			<ul>
				<li><h4>나의 카드 관리</h4></li>
				<li><a href="" class="issuanceMenu">카드발급현황</a></li>
			</ul>
			<ul>
				<li><h4>나의 계정 정보</h4></li>
				<li><a href="" id="memberModifyMenu">회원정보수정</a></li>
				<li><a href="" id="changePWMenu">비밀번호 변경</a></li>
				<li><a href="" id="deleteInfoMenu">회원탈퇴</a></li>
			</ul>
			<ul>
				<li><h4>고객센터</h4></li>
				<li><a href="" id="helpNoticeMenu">공지사항/FAQ</a></li>
				<li><a href="" id="helpQNAMenu">Q&A</a></li>
				<li><a href="" id="helpDirectMenu">1:1문의</a></li>
			</ul>
		</div>
	</div>
</body>
</html>