<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>카드핏</title>
 <link rel="shorcut icon" type="image/x-icon" href="./source/svg/CF_logo_Symbol.svg">
 <style type="text/css">
#issuanceOKContainer {
	position: relative;
	top: 110px;
	width: 100%;
	height: 730px;
	display: flex; /* Flexbox 사용 */
	justify-content: center; /* 수평 가운데 정렬 */
	align-items: center; /* 수직 가운데 정렬 */
	text-align: center
}


#messageContainer input[type="button"]{
	width:100%;
	background-color: #E6EDFE;
	color: #0042EC;
	border: none;
	padding: 12px 5px;
	font-size: 16px;
	margin: 0 auto;
}
 </style>
</head>
<body>
	<c:import url="./element/Header/Header.jsp"/>
	<div id="issuanceOKContainer">
		<div id="messageContainer">
			<h1>권한이 없습니다</h1><br>
			<p>홈페이지로 이동해주세요<p><br>
			<input type="button" value="홈페이지로 돌아가기" id="goHomeBtn">
		</div>
	</div>
	<script type="text/javascript">
		
		var goHomeBtn = document.querySelector('#goHomeBtn');
		goHomeBtn.addEventListener('click',function(){
			window.location.href = "index.do";
		})
	</script>
</body>
</html>