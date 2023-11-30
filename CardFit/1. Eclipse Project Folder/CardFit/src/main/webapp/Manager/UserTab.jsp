<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link href="../element/Default/Default.css" type="text/css"
	rel="stylesheet">
<style type="text/css">
#user_content {
	height: 560px;
	padding-top: 20px;
}

#user_table {
	position: relative;
	width: 100%;
	font-size: 12px;
}

#user_table tr th {
	text-align: center;
	font-size: 16px;
}

#user_table tr td {
	border-bottom: 2px dashed rgb(203, 203, 203);
	border-radius: 8px 8px 8px 8px;
	padding: 2px
}

#user_table tr td input {
	display: inline-block;
	width: 20px;
	height: 20px;
	border: 2px solid #bcbcbc;
	cursor: pointer;
	line-height: 30px;
	position: relative;
	top: 100%;
	left: 15%;
}

#userDeleteBtn {
	border: none;
	background-color: red;
	width: 5vw;
	position: absolute;
	left: 10px;
	line-height: 120px;
}

#pageBox {
	position: relative;
	text-align: center;
	border: none;
	top: 10px;
	width: 100%;
	margin: 0 auto;
}

.page-link {
	display: inline !important;
	width: 30px;
	border: none;
	margin: 0 auto;
}

#listDeleteBtn {
	position: relative;
	display: inline-block;
	border: none;
	float: right;
	padding: 4px;
	background-color: #FFC9C9;
	rigth: 5vw;
	border-radius: 4px;
}
</style>
</head>
<body>
	<c:import url="../ManagerPage.jsp" />
	<div class="tab_content" id="user_content">
		<table id="user_table">
			<tr>
				<th></th>
				<th>순서</th>
				<th>ID</th>
				<th>PW</th>
				<th>회원명</th>
				<th>주민등록번호</th>
				<th>휴대폰번호</th>
				<th>회원주소</th>
				<th>이메일</th>
				<th>가입일</th>
			</tr>
			<c:forEach items="${memberList }" var="dto" varStatus="vs">
				<tr>
					<td><input type="checkbox" name="memberCheck"></td>
					<td>${vs.index }</td>
					<td>${dto.id }</td>
					<td>${dto.pw }</td>
					<td>${dto.name }</td>
					<td>${dto.regNum }</td>
					<td>${dto.phone }</td>
					<td>${dto.address }</td>
					<td>${dto.email }</td>
					<td>${dto.registerDay }</td>
				</tr>
			</c:forEach>
		</table>
		<div id="pageBox">
			<c:set var="UserTabCurPage" value="${param.curPage }" />
			<c:if test="${UserTabCurPage eq null }">
				<c:set var="UserTabCurPage" value="0" />
			</c:if>
			<c:forEach var="i" begin="0" end="${totalPage}" step="1">
				<c:choose>
					<c:when test="${i eq UserTabCurPage}">
						<span class="page-link">${i+1}</span>
					</c:when>
					<c:when test="${i ne UserTabCurPage}">
						<a class="page-link">${i+1}</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<input type="button" value="회원삭제" id="listDeleteBtn">
		</div>
	</div>
	<script src="../js/jquery.js" type="text/javascript"></script>
	<script>
		$(document).ready(function() {
			$('body').on('click', 'a.page-link', function(e) {
				e.preventDefault();
				var UserTabCurPage = parseInt($(this).text() - 1);
				var url = "UserTab.do?curPage=" + UserTabCurPage;

				$.ajax({
					url : url,
					data : {
						"curPage" : UserTabCurPage
					},
					type : 'GET',
					success : function(response) {
						$('body').html(response).show();
					},
					error : function(xhr, status, error) {
						console.error(error);
					}
				});
			});
		});

		$("#listDeleteBtn").click(
				function() {
					var checkedValues = [];
					$("input[name='memberCheck']:checked").each(
							function() {
								checkedValues.push($(this).closest("tr").find(
										"td:eq(2)").text()); // 예시로 ID 값을 가져오도록 설정
							});

					if (checkedValues.length === 0) {
						alert("삭제할 데이터를 선택하세요.");
						return;
					}

					var url = "deleteUserOK.do?userID=" + checkedValues;

					$.ajax({
						url : url,
						data : {
							"userID" : checkedValues
						},
						type : 'POST',
						success : function(result) {
							alert(checkedValues + "삭제완료");
							window.location.reload();
						},
						error : function(xhr, status, error) {
							console.error(error);
						}
					});
				});
	</script>
</body>
</html>