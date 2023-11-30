<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style>
#companyContainer {
	width: 30%;
	height: 560px;
	position: relative;
	float: left;
	margin: 20px 0;
	text-align: center;
}
#companyContainer{
	display: flex;
	position: relative;
	width:30%;
}

#counsellerContainer {
	position: relative;
	width: 70%;
	height: 560px;
	margin: 20px 0;
	float: right;
}


#counsellerTable, #companyTable {
	position: relative;
	width: 100%;
	font-size: 12px;
}

#counsellerTable tr th,
#companyTable tr th, #companyTable tr td {
	text-align: center;
	font-size: 16px;
}

#counsellerTable tr td{
	border-bottom: 2px dashed rgb(203, 203, 203);
	border-radius: 8px 8px 8px 8px;
	padding: 2px
}

#counsellerTable tr td input 
{
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
	<div id="companyContainer">
		<table id="companyTable">
			<c:forEach items="${companyList }" var="list">
				<tr>
					<th>${list.name }</th>
					<td>${list.tel }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="counsellerContainer">
		<table id="counsellerTable">
			<tr>
				<th></th>
				<th>ID</th>
				<th>PW</th>
				<th>이름</th>
				<th>회사</th>
				<th>직통번호</th>
				<th>이메일</th>
				<th>사업자등록번호</th>
				<th>가입일</th>
			</tr>
			<c:forEach var="list" items="${CounsellerList }">
				<tr>
					<td><input type="checkbox" name="counsellerCheck"></td>
					<td>${list.id }</td>
					<td>${list.pw }</td>
					<td>${list.name }</td>
					<td>${list.company }</td>
					<td>${list.tel }</td>
					<td>${list.email }</td>
					<td>${list.corporate }</td>
					<td>${list.division }</td>
					<td>${list.registerDay }</td>
				</tr>
			</c:forEach>
		</table>
		<div id="pageBox">
			<c:set var="CompanyTabCurPage" value="${param.curPage }" />
			<c:if test="${CompanyTabCurPage eq null }">
				<c:set var="CompanyTabCurPage" value="0" />
			</c:if>
			<c:forEach var="i" begin="0" end="${totalPage}" step="1">
				<c:choose>
					<c:when test="${i eq CompanyTabCurPage}">
						<span class="page-link">${i+1}</span>
					</c:when>
					<c:when test="${i ne CompanyTabCurPage}">
						<a class="page-link">${i+1}</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<input type="button" value="상담사 삭제" id="listDeleteBtn">
		</div>
	</div>
	<script src="../js/jquery.js" type="text/javascript"></script>
	<script>
		$(document).ready(function() {
			$('body').on('click', 'a.page-link', function(e) {
				e.preventDefault();
				var CompanyTabCurPage = parseInt($(this).text() - 1);
				var url = "CompanyTab.do?curPage=" + CompanyTabCurPage;

				$.ajax({
					url : url,
					data : {
						"curPage" : CompanyTabCurPage
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
					$("input[name='counsellerCheck']:checked").each(
							function() {
								checkedValues.push($(this).closest("tr").find(
										"td:eq(0)").text()); // 예시로 ID 값을 가져오도록 설정
							});

					if (checkedValues.length === 0) {
						alert("삭제할 데이터를 선택하세요.");
						return;
					}

					var url = "deleteCounsellerOK.do?userID=" + checkedValues;

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