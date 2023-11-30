<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상담사 페이지</title>
 <link rel="shorcut icon" type="image/x-icon" href="./source/svg/CF_logo_Symbol.svg">
<style>
#changeContainer {
	/*수정하지 말것 */
	position: relative;
	top: 8vh;
	width: 80%;
	margin: 0 auto;
	float: right;
	height: 81.9vh;
}

#issuanceInfoContainer {
	position: relative;
	width: 90%;
	height: 15vh;
	margin: 0 auto;
}

#issuanceInfoContainer .issInfoBox {
	width: 28%;
	float: left;
	box-shadow: 5px 5px 3px rgb(0,0,0,0.2);
	margin-left : 20px;
	border-radius: 4px;
	padding:8px;
}
#issuanceInfoContainer .issInfoBox p{
	text-align: center;
	font-size: 20px;
	display: block;
}
#issuanceInfoContainer .issInfoBox > p:first-child {
	font-size: 40px;
}

#issuancingListContainer{
	position: relative;
	width: 80%;
	height:30vh;
	padding: 12px;
	top: 5vh;
	margin:0 auto;
}


#issuancingListContainer h3{
	position: relative;
		text-align: center;
	
}

#issuancingListContainer table{
	position: relative;
	width: 100%;
	font-size: 16px;
	overflow: auto;	
	text-align: center;
	margin-top: 20px;
}

#issuancingListContainer table tr th {
	text-align: center;
	font-size: 20px;
}

#issuancingListContainer table tr td {
	border-bottom: 2px dashed rgb(203, 203, 203);
	border-radius: 8px 8px 8px 8px;
	padding: 2px
}


#issuancingListContainer a:last-child {
	font-size: 20px;
	text-decoration: none;
	width: 100%;
	text-align: right;
	display: block;
	margin-top : 30px;
	cursor: pointer;
}
</style>
</head>
<body>
	<c:import url="../CounsellerPage.jsp"/>
	<div id="changeContainer">
			<div id="issuanceInfoContainer">
				<div class="issInfoBox">
					<p><i class="fa-solid fa-credit-card" style="color: #0042eb;"></i></p><br>
					<p>발급 대기중인 카드</p>
					<c:choose>
						<c:when test="${sessionScope.company eq null }">
							<p>${counsellerIssuance}</p>
						</c:when>	
						<c:when test="${sessionScope.company ne null }">
							<p>${companyIssuance}</p>
						</c:when>				
					</c:choose>
				 </div>
				<div class="issInfoBox">
					<p><i class="fa-solid fa-check fa-xl" style="color: #0042eb;"></i></p><br>
					<p>내가 발급중인 카드</p>
					<c:choose>
						<c:when test="${sessionScope.company eq null }">
							<p>${counsellerIssuancing}</p>
						</c:when>
						<c:when test="${sessionScope.company ne null }">
							<p>${companyIssuancing}</p>
						</c:when>
					</c:choose>
				 </div>
				<div class="issInfoBox">
					<p><i class="fa-solid fa-hand-holding-dollar fa-lg" style="color: #0042eb;"></i></p><br>
					<p>내가 발급완료한 카드</p>
					<c:choose>
						<c:when test="${sessionScope.company eq null }">
							<p>${counsellerIssuanced }</p>
						</c:when>
						<c:when test="${sessionScope.company ne null }">
							<p>${companyIssuanced }</p>
						</c:when>
					</c:choose>
				</div>
			</div>
			<div id="issuancingListContainer">
				
				<c:choose>
					<c:when test="${sessionScope.company eq null}"><h3>발급 대기중인 카드가 ${issuancing}건 있어요!</h3></c:when>
					<c:when test="${sessionScope.company ne null}"><h3>발급 대기중인 <strong>${sessionScope.company}</strong>의 카드가 건 있어요!</h3></c:when>
				</c:choose>
				<table>
					<tr>
						<th>발급대기 중인 카드명</th>
						<th>발급 신청일</th>
						<th>연락 가능날짜</th>
						<th>연락 가능시간</th>
					</tr>
					<c:choose>
						<c:when test="${sessionScope.company eq null}">
							<c:forEach items="${issuanceList }" var="list">
								<tr>
									<td>${list.cardName }</td>
									<td>${list.requestDate }</td>
									<td>${list.contactableDate }</td>
									<td>${list.startTime } ~ ${list.endTime }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:when test="${sessionScope.company ne null}">
							<c:forEach items="${ComapnyIssuancelist}" var="list">
								<tr>
									<td>${list.cardName }</td>
									<td>${list.requestDate }</td>
									<td>${list.contactableDate }</td>
									<td>${list.startTime } ~ ${list.endTime }</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</table>
					<a href="cIssuancingTab.do">자세히 보기</a>
			</div>
		</div>
</body>
</html>