<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>발급 신청 완료</title>
 <link rel="shorcut icon" type="image/x-icon" href="./source/svg/CF_logo_Symbol.svg">
 <link href="./element/Default/Default.css" type="text/css"
	rel="stylesheet">
 <style type="text/css">
#issuanceOKContainer {
	position: relative;
	top: 110px;
	width: 100%;
	height: 730px;
	display: flex; /* Flexbox 사용 */
	justify-content: center; /* 수평 가운데 정렬 */
	align-items: center; /* 수직 가운데 정렬 */
}

#messageContainer {
	text-align: left;
}

#messageContainer input[type="button"]{
	width:45%;
	background-color: #E6EDFE;
	color: #0042EC;
	border: none;
	padding: 12px 5px;
	font-size: 16px;
	margin: 0 auto;
	margin-left: 10px;
}
 </style>
</head>
<body>
	<c:import url="./element/Header/Header.jsp"/>
	<div id="issuanceOKContainer">
		<div id="messageContainer">
			<h1>카드 발급신청 완료<img src="./source/svg/checkcircle.svg"></h1><br>
			<h3>발급 신청이 성공적 등록되었어요!</h3><br>
			<p>입력하신 요청날짜와 시간에 맞춰서 담당 상담사가 연락을 드릴거예요<p><br>
			<input type="button" value="발급정보 확인하기" id="goIssuanceBtn">
			<input type="button" value="홈페이지로 돌아가기" id="goHomeBtn">
		</div>
	</div>
	<script type="text/javascript">
		var goIssuanceBtn = document.querySelector('#goIssuanceBtn');
		goIssuanceBtn.addEventListener('click', function(){
			window.location.href = "MyPage.do"
		});
		
		var goHomeBtn = document.querySelector('#goHomeBtn');
		goHomeBtn.addEventListener('click',function(){
			window.location.href = "index.do";
		})
	</script>
</body>
</html>