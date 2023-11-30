<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link href="./source/element/Default/Default.css" type="text/css"
	rel="stylesheet">
<style>
#deleteInfoContainer {
	width: 80%;
	margin: 0 auto;
		padding-bottom: 50px;
	position: relative;
    left: -9%;
}

#deleteInfoContainer > p:first-child {
	font-size: 26px;
}

#line {
	width: 100%;
}


input[type=text], input[type=password], input[type=email] {
	width: 100%;
	border: 1px solid #DADADB;
	padding: 6px;
	margin: 6px 0;
	border-radius: 4px;
}

input[type=button] {
	position: relative;
	margin: 3vh 0;
	width: 100%;
	padding: 12px;
	background: #0042EC;
	border: none;
	color: white;
	border-radius: 4px;
}

#comentsBox {
	position: relative;
	top: 15px;
	text-align: center;
}
</style>
</head>
<body>
	<div id="deleteInfoContainer">
		<p>회원탈퇴 안내</p>
		<p>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
		<img alt="" src="./source/svg/line.svg" id="line">
		<div id="comentsBox"></div>
			<c:set value="${dto }" var="dto"/>
			<p><img alt="" src="./source/svg/check.svg"> 사용하고 계신 아이디(
			<c:choose>
				<c:when test="${sessionScope.division eq 'c' }">
					${cdto.id }
				</c:when>
				<c:when test="${sessionScope.division ne 'c' }">
					${dto.id }
				</c:when>
			</c:choose>
			)는 탈퇴할 경우 재사용 및 복구가 불가능합니다.
탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</p><br>
			<p><img alt="" src="./source/svg/check.svg"> 탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.
			</p><br>
			<p><img alt="" src="./source/svg/check.svg"> 탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.
			</p><br>
			<p><img alt="" src="./source/svg/check.svg"> 탈퇴 후에는 아이디 <c:choose>
				<c:when test="${sessionScope.division eq 'c' }">
					${cdto.id }
				</c:when>
				<c:when test="${sessionScope.division ne 'c' }">
					${dto.id }
				</c:when>
			</c:choose> 로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.
게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.
			</p><br>
			<input type="button" value="삭제" id="deleteBtn" onclick="confirmDelete();">
	</div>
	<script type="text/javascript">
	function confirmDelete() {
		var confirmed = confirm('정말로 삭제하시겠습니까?');
		if (confirmed) {
			window.location.href="deleteInfoOK.do";
			alert("계정이 삭제되었습니다.")
		} else {
			// 취소되었을 때의 처리
		}
		return confirmed;
	}
	</script>
</body>
</html>