<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내 카드 찾기</title>
 <link rel="shortcut icon" type="image/x-icon" href="./source/svg/CF_logo_Symbol.svg">
<link href="./element/Default/Default.css" type="text/css"
	rel="stylesheet">
<style>
body{
	width: 1920px;
 overflow:scroll;overflow-x:hidden;
}

#cardResultContainer {
	position: relative;
	top: 110px;
	width: 100%;
		text-align: center;
	
}

#cardResultContainer h1{
	width:auto;
	padding: 20px 0px;
	margin: 0 auto;
	text-decoration-line: underline;
	text-decoration-style: wavy;
	text-decoration-color: #FFC9C9;
}

.cardElement {
	position: relative;
	width: 80%;
	margin: 0 auto;
	height: 200px;
	margin-bottom: 20px;
	margin-left: 30px;
	border-radius: 4px;
	display: inline-block;
	align-items: center; /* 수직 정렬 */
	box-shadow: 0px 4px 5px rgb(0, 0, 0, 0.2);
}
.cardImgBox{
	position: relative;
	width: 25%;
	float: left;
	height: 100%;
	margin: auto;
	display: flex; /* Flexbox 사용 */
	align-items: center; /* 수직 정렬 */
	justify-content: center; /* 수평 정렬 */
}

.cardElement img {
	position: relative;
	width: 100px;
	height: auto;
	margin: auto;
}

.contentElement {
	width: 50%;
	margin: 0 auto;
}
.contentElement p{
	text-align: left;
	font-size: 16px;
	margin-top: 10px;
}
.contentElement p:nth-child(1){
	font-size:24px;
	padding-top: 5px;
	text-align: center;
}
.contentElement span{
	text-align: center;
	padding: 4px;
	width:70px;
	display: block;
	position: relative;
	margin: 0 auto;
	border-radius: 8px;
}
.contentElement p:nth-child(3), .contentElement p:nth-child(4), .contentElement p:nth-child(5){
	display: inline-block;
	float: left;
	width: calc(100%/3);
}
.contentElement table{
	margin-top: 40px;
	width: 100%;
}
.contentElement caption{
	font-size: 16px;
	padding: 4px;
}
.contentElement tr td{
	border: solid 2px #A4A4FB;
	padding: 10px 6px;
	border-radius: 50px;
	font-size: 12px;
}
.issForm {
  position: relative;
  top:-175px;
  width: 20%;
  height:100%;
  display: flex; /* Flexbox 사용 */
  align-items: center; /* 수직 중앙 정렬 */
  justify-content: center; /* 수평 중앙 정렬 */
  float: right;
}

.issBtn {
	width:70%;
	padding: 12px 6px;
	font-size: 20px;
	border: none;
	background-color: #0042EC;
	color: white;
	border-radius: 50px;
	cursor: pointer;
}
</style>
</head>
<body>
	<c:import url="./element/Header/Header.jsp" />
	<div id="cardResultContainer">
		<h1>${sessionScope.id }님의 맞춤카드 테스트 결과입니다!</h1>
		<c:choose>
			<c:when test="${sessionScope.cardSearchResult eq '[]'}">
			    <p id="noResult">결과가 없습니다.<p>
			</c:when>
			<c:otherwise>
				<c:forEach items="${sessionScope.cardSearchResult}" var="list">
					<div class="cardElement">
						<div class="cardImgBox">
							<img alt="cardimg" src="./CardIMG/${list.img}">
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
									<c:forEach var="item" items="${fn:split(fn:substring(list.reword, 0, fn:length(list.reword)-1),',')}">
										<c:if test="${item != null}">
											<td>#${item}</td>
										</c:if>
									</c:forEach>
								</tr>
							</table>
						</div>
						<form action="CardInssuance.do" method="POST" class="issForm">
							<input type="hidden" name="cardName" value="${list.name}">
							<input type="hidden" name="company" value="${list.company}">
							<button type="submit" class="issBtn">카드발급신청</button>
						</form>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>

</body>
</html>