<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link href="./element/Default/Default.css" type="text/css"
	rel="styleSheet">
<style type="text/css">
body {
	width: 1910px;
	overflow: scroll;
	overflow-x: hidden;
}

.searchContainer {
	position: relative;
	top: 150px;
	width: 100%;
	min-height: 200px;
	text-align: center;
}

.searchElement {
	position: relative;
	width: 45%;
	margin: 0 auto;
	height: 200px;
	margin-bottom: 20px;
	margin-left: 30px;
	border-radius: 4px;
	display: inline-block;
	align-items: center; /* 수직 정렬 */
		box-shadow: 0px 4px 5px rgb(0, 0, 0, 0.2);
}

.searchElement .imgBox {
	position: relative;
	width: 20%;
	float: left;
	height: 100%;
	margin: auto;
	display: flex; /* Flexbox 사용 */
	align-items: center; /* 수직 정렬 */
	justify-content: center; /* 수평 정렬 */
}

.searchElement .imgBox img {
	position: relative;
	width: 100px;
	height: auto;
	margin: auto;
}

.searchElement p {
	position: relative;
	width: 100%;
}

.searchElement table {
	position: relative;
	width: 700px;
	float: right;
}

.goIssBtn {
	position: absolute;
	width: 10%;
	right: 10px;
	top: 10px;
	background-color: #0042EC;
	color: white;
	border: none;
	padding:4px;
	border-radius: 4px;
	cursor: pointer;
}

.countBox {
	position: relative;
	width: 80%;
	margin: 0 auto;
	display: block;
	font-size: 30px;
	margin-bottom: 20px;
}
.contentElement {
	width: 80%;
	margin: 0 auto;
	float: right;
	text-align: center;
}
.contentElement p{
	font-size: 16px;
	margin-top: 10px;
	text-align: center;
}
.contentElement p:nth-child(1){
	font-size:24px;
	padding-top: 5px;
	text-align: left;
}
.contentElement span{
	padding: 4px;
	width:70px;
	display: block;
	position: relative;
	border-radius: 8px;
}
.contentElement p:nth-child(3), .contentElement p:nth-child(4), .contentElement p:nth-child(5){
	display: inline-block;
	float: left;
	width: calc(100%/3);
}
.contentElement table{
	margin-top: 10px;
	width: 100%;
}
.contentElement caption{
	font-size: 16px;
	padding: 4px;
}
.contentElement tr td{
	border: solid 2px gray;
	padding: 10px 6px;
	border-radius: 50px;
	font-size: 14px;
	font-weight: 400;
}
</style>
</head>
<body>
	<c:import url="./element/Header/Header.jsp" />
	<div class="searchContainer">
		<c:set value="${nameCount }" var="count" />
		<div class="countBox">카드이름 중 '${keyword }'를 검색한 결과 ${count }건</div>
		<c:forEach items="${searchCardByNameList }" var="list">
			<div class="searchElement">
				<div class="imgBox">
					<img alt="" src="./CardIMG/${list.img }">
				</div>
				<div class="contentElement">
						<p>${list.name}</p>
						<span>${list.company }</span>
						<p>국내전용 연회비 : ${list.fee}원</p>
						<p>해외겸용 연회비 : ${list.outfee}원</p>
						<p>전월실적 : ${list.record}만원 이상</p>
						<table>
							<caption>주요혜택</caption>
							<tr>
								<c:forEach var="item"
									items="${fn:split(fn:substring(list.reword, 0, fn:length(list.reword)-1),',')}">
									<c:if test="${item ne null}">
										<td>#${item}</td>
									</c:if>
								</c:forEach>
							</tr>
						</table>
						<form action="CardInssuance.do" method="post">
							<input type="hidden" name="cardName" value="${list.name }">
							<input type="submit" value="발급신청" class="goIssBtn">
						</form>
				</div>
			</div>
		</c:forEach>
		<c:if test="${nameCount eq 0 }">
			<div class="noResult">
				<h2>
					<img alt="" src="./sourec/svg/check.svg">검색결과가 없습니다.
				</h2>
			</div>
		</c:if>
	</div>

	<div class="searchContainer">
		<c:set value="${rewordCount }" var="count" />
		<div class="countBox">카드혜택 중 '${keyword }'를 검색한 결과 ${count }건</div>
		<c:forEach items="${searchCardByRewordList }" var="list">
			<div class="searchElement">
				<div class="imgBox">
					<img alt="" src="./CardIMG/${list.img }">
				</div>
				<div class="contentElement">
					<p>${list.name}</p>
					<span>${list.company }</span>
					<p>국내전용 연회비 : ${list.fee}원</p>
					<p>해외겸용 연회비 : ${list.outfee}원</p>
					<p>전월실적 : ${list.record}만원 이상</p>
					<table>
						<caption>주요혜택</caption>
						<tr>
							<c:forEach var="item"
								items="${fn:split(fn:substring(list.reword, 0, fn:length(list.reword)-1),',')}">
								<c:if test="${item != null}">
									<td>#${item}</td>
								</c:if>
							</c:forEach>
						</tr>
					</table>
						<form action="CardInssuance.do" method="post">
							<input type="hidden" name="cardName" value="${list.name }">
							<input type="submit" value="발급신청" class="goIssBtn">
						</form>
				</div>
			</div>
		</c:forEach>
		<c:if test="${rewordCount eq 0 }">
			<div class="noResult">
				<h2>
					<img alt="" src="./sourec/svg/check.svg">검색결과가 없습니다.
				</h2>
			</div>
		</c:if>
	</div>

	<div class="searchContainer">
		<c:set value="${companyCount }" var="count" />
		<div class="countBox">카드사 중 '${keyword }'를 검색한 결과 ${count }건</div>
		<c:forEach items="${searchCardByCompanyList }" var="list">
			<div class="searchElement">
				<div class="imgBox">
					<img alt="" src="./CardIMG/${list.img }">
				</div>
				<div class="contentElement">
					<p>${list.name}</p>
					<span>${list.company }</span>
					<p>국내전용 연회비 : ${list.fee}원</p>
					<p>해외겸용 연회비 : ${list.outfee}원</p>
					<p>전월실적 : ${list.record}만원 이상</p>
					<table>
						<caption>주요혜택</caption>
						<tr>
							<c:forEach var="item"
								items="${fn:split(fn:substring(list.reword, 0, fn:length(list.reword)-1),',')}">
								<c:if test="${item != null}">
									<td>#${item}</td>
								</c:if>
							</c:forEach>
						</tr>
					</table>
						<form action="CardInssuance.do" method="post">
							<input type="hidden" name="cardName" value="${list.name }">
							<input type="submit" value="발급신청" class="goIssBtn">
						</form>
				</div>
			</div>
		</c:forEach>
		<c:if test="${companyCount eq 0 }">
			<div class="noResult">
				<h2>
					<img alt="" src="./sourec/svg/check.svg">검색결과가 없습니다.
				</h2>
			</div>
		</c:if>
	</div>

</body>
</html>