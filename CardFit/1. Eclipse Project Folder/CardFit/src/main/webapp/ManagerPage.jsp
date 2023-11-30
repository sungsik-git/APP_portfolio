<%@page import="com.cardfit.www.DTO.CategoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<%--모달 라이브러리 --%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<%--아이콘 라이브러리 --%>
<script src="https://kit.fontawesome.com/cecdbf634a.js"
	crossorigin="anonymous"></script>

<%--부트스트랩 라이브러리 --%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="./element/Default/Default.css" type="text/css" rel="stylesheet">
<style>
a{
	text-decoration: none;
	color:black;
}
body {
	width: 1920px;
	height: 80px;
}
.tab_content::-webkit-scrollbar {
	display: none; /* 크롬, 사파리, 오페라, 엣지 */
}
header {
	position: relative;
	width: 100%;
	height: 100%;
}

#logo {
	position: relative;
	width: 225px;
	height: 60px;
	top: 2vh;
	left: 5%;
}

nav {
	width: 40%;
	height: 4vh;
	position: absolute;
	top: 50%;
	right: 0;
}

nav>ul {
	width: 100%;
	list-style: none;
	height: 50%;
}

nav>ul>li {
	width: calc(100%/ 3);
	float: left;
	line-height: 1rem;
	font-weight: bold;
}

#tabMenu {
	margin-top: 2vh;
	width: 100%;
}

.tab_item {
	width: calc(100%/ 6);
	height: 50px;
	border-bottom: 3px solid #333333;
	background-color: #f8f8f8;
	line-height: 50px;
	font-size: 16px;
	text-align: center;
	color: #333333;
	display: block;
	float: left;
	text-align: center;
	font-weight: bold;
	transition: all 0.2s ease;
	cursor: pointer;
}

.tab_content {
	width: 100%;
	clear: both;
	height: 620px;
	overflow: scroll-y;
}


.allStatsBox {
	position: relative;
	width: 100%;
	height: 800px;
	padding: 12px;
	clear: both;
	overflow-y: scroll;
	margin: 0 auto;
}

.table {
	position: relative;
	width: 40%;
	float: left;
	left: 10%;
	top: 5vh;
	margin: 1vh;
	overflow: scroll;
}

td {
	position: relative;
}

input[type="submit"] {
	position: relative;
	right: 0;
	border: 1px solid black;
	background: none;
}

</style>
</head>
<body>
	<header>
		<div id="logobox">
			<img id="logo" src="./source/svg/CF_logo_Blue.svg" alt="logo">
		</div>
		<nav>
			<ul>
				<li><a href="index.do">홈페이지로 이동</a></li>
				<li><a href="">관리자권한 관리</a></li>
				<li><a href="logout.do">로그아웃</a></li>
			</ul>
		</nav>
	</header>
		<div id="tabMenu">
			<div id="cardTab" class="tab_item">카드등록/리스트</div>
			<div id="userTab" class="tab_item">고객관리</div>
			<div id="companyTab" class="tab_item">카드사/상담사관리</div>
			<div id="issuanceTab" class="tab_item">발급관리</div>
			<div id="noticeTab" class="tab_item">공지사항관리</div>
			<div id="questionTab" class="tab_item">문의관리</div>
		</div>
	<script type="text/javascript" src="./js/jquery.js"></script>
	<script type="text/javascript">
	$(function() {
	    $('#cardTab').on('click', function() {
	        window.location.href = "CardTab.do";
	    });
	});
	$(function() {
	    $('#userTab').on('click', function() {
	        window.location.href = "UserTab.do";
	    });
	});
	$(function() {
	    $('#companyTab').on('click', function() {
	        window.location.href = "CompanyTab.do";
	    });
	});
	$(function() {
	    $('#issuanceTab').on('click', function() {
	        window.location.href = "IssuanceTab.do";
	    });
	});
	$(function() {
	    $('#noticeTab').on('click', function() {
	        window.location.href = "NoticeTab.do";
	    });
	});
	$(function() {
	    $('#questionTab').on('click', function() {
	        window.location.href = "QuestionTab.do";
	    });
	});
	</script>
</body>
</html>
