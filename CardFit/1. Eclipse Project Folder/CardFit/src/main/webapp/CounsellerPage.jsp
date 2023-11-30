<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상담사 전용 페이지</title>
 <link rel="shorcut icon" type="image/x-icon" href="./source/svg/CF_logo_Symbol.svg">
<link href="./element/Default/Default.css" type="text/css" rel="stylesheet">
<style type="text/css">
body {
	width: 100%;
}
.logoImg {
	position: absolute;
	width: 240px;
	height: 34.5px;
	top: 38px;
	left: 182px;
}

li {
	list-style: none;
}

* {
	font-family: Pretendard-Bold;
	padding: 0;
	margin: 0;
}

header {
	position: relative;
	width: 100%;
	height: 10vh;
}

#mainContainer {
	width: 100%;
	position: relative;
}

#GNB ul {
	position: relative;
	width: 20%;
	height: 84.9vh;
	top: 5vh;
	background-color: #0042EC;
	border-radius: 0px 80px 0px 0px;
	float: left;
}

#GNB ul li {
	width: 60%;
	position: relative;
	top: 7vh;
	margin: 30px auto;
	color: white;
	left: -2vw;
	padding: 5px;
}

#GNB ul li:first-child {
	background-color: white;
	border-radius: 12px;
	padding: 10px;
	left: -1vw;
	color: #0042EC;
	font-size: 20px;
	text-align: center;
}

#GNB ul li span {
	margin-left: 5px;
}

#GNB ul li:hover:not(#GNBTitle) {
	background-color: white;
	color: #0042EC;
	padding: 5px;
	border-radius: 12px;
}

#LNB {
	position: relative;
	float: right;
	top: 8vh;
	width: 30%;
	text-align: right;
	margin-right: 10%;
	font-size: 18px;
}
#LNB a{
	color:black;
	text-decoration: none;
}
#logoElementId {
  pointer-events: none;
  cursor: default;
}
</style>
<script src="https://kit.fontawesome.com/cecdbf634a.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<header>
		<img class="logoImg" alt="" src="./source/svg/CF_logo_Blue.svg">
		<div id="LNB">
			<ul>
				<li><a href="logout.do">로그아웃</a></li>
			</ul>
		</div>
	</header>
	<div id="mainContainer">
		<div id="GNB">
			<ul>
				<c:choose>
					<c:when test="${sessionScope.company eq null }">
						<li id="GNBTitle">${sessionScope.counsellerName } 사업자님</li>
					</c:when>
					<c:when test="${sessionScope.compnay ne null }">
						<li id="GNBTitle">${sessionScope.compnay } 상담사님</li>
					</c:when>
				</c:choose>
				<li id="indexTab"><i class="fa-duotone fa-house"
					style="--fa-primary-color: #ffffff; --fa-secondary-color: #ffffff;"></i><span>메인페이지</span></li>
				<li id="issuancingTab"><i class="fa-solid fa-credit-card"
					style="color: #ffffff;"></i><span>발급대기카드</span></li>
				<li id="myIssuanceTab"><i
					class="fa-solid fa-hand-holding-dollar" style="color: #ffffff;"></i><span>발급중인 정보</span></li>
				<li id="issuancedTab"><i class="fa-solid fa-check"
					style="color: #ffffff;"></i><span>발급완료카드</span></li>
				<li id="noticeTab"><i class="fa-solid fa-circle-exclamation"
					style="color: #ffffff;"></i><span>공지사항/Q&A</span></li>
				<li id="modifyTab"><i class="fa-solid fa-user"
					style="color: #ffffff;"></i><span>개인정보수정</span></li>
				<li id="directTab"><i class="fa-solid fa-square-envelope"
					style="color: #ffffff;"></i><span>1:1문의</span></li>
				<li id="deleteInfoTab"><i class="fa-solid fa-square-xmark"
					style="color: #ffffff;"></i><span>회원탈퇴</span></li>
			</ul>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#indexTab').on("click", function(){
				window.location.href = "CounsellerPage.do";
			})
			
			$('#issuancingTab').on("click", function() {
				window.location.href = "cIssuancingTab.do";
			});

			$('#issuancedTab').on("click", function() {
				window.location.href = "cIssuancedTab.do";
			});

			$('#myIssuanceTab').on("click", function() {
				window.location.href = "cMyIssuanceTab.do";
			});

			$('#noticeTab').on("click", function() {
				window.location.href = "cNoticeTab.do";
			});

			$('#modifyTab').on("click", function() {
				window.location.href = "cModifyTab.do";
			});

			$('#directTab').on("click", function() {
				window.location.href = "cDirectTab.do";
			});

			$('#deleteInfoTab').on("click", function() {
				window.location.href = "cDeleteInfoTab.do";
			});
		});
		

	</script>
</body>
</html>