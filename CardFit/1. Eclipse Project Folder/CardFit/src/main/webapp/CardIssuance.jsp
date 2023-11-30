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
<link href="./element/Default/Default.css" type="text/css">
<link rel="shorcut icon" type="image/x-icon" href="./source/svg/CF_logo_Symbol.svg">
<style type="text/css">
#issuanceContainer {
	position: relative;
	top: 110px;
	width: 80%;
	height: 720px;
	margin: 0 auto;
}
#cardInfoTable{
	position: relative;
	width: 50%;
	float: left;
	height: 100%;
}
#cardInfoTable img{
	width: 200px;
	box-shadow: 3px 3px 2px gray;
}

#cardInfoTable .cardInfo{
	outline: none;
	border: none;
	width: 40%;
	font-size: 24px;
}

#memberInfoTable{
	position: relative;
	width: 50%;
	height:100%;
	float: right;
	border-left: dashed 2px gray;
}

#cardInfoTable tr th,#memberInfoTable tr th {
	width: 30%;
	padding: 12px;
}

#cardInfoTable tr td,#memberInfoTable tr td {
	width: 70%;
	padding: 12px;
}

input[type=text], input[type=password], input[type=email], select, button
	{
	width: 100%;
	border: 1px solid #DADADB;
	padding: 6px;
	margin: 6px 0;
	border-radius: 4px;
}

input[type=submit] {
	display:block;
	position: relative;
	margin: 3vh auto;
	width: 30%;
	padding: 12px;
	background: #0042EC;
	border: none;
	color: white;
	border-radius: 4px;
	top: 20px;
	font-size:20px;
}
input[type=button]{
	border:none;
	padding:7px;
	border-radius: 4px;
}
#startTime, #endTime{
	width:45%;
}
#rewordBox{
	width:auto;
	padding: 10px 6px;
	border-radius: 4px;
	font-size: 20px;
	text-align: center;
}
#rewordBox span{
	border: 2px solid gray;
	border-radius: 50px;
	padding: 4px;
	font-size: 12px;
}
</style>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css"
	href="https://npmcdn.com/flatpickr/dist/themes/dark.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
</head>
<body>
	<c:import url="./element/Header/Header.jsp" />
		<form action="issuanceCardOK.do" id="issuanceContainer" method="post">
			<table id="cardInfoTable">
				<tr>
					<th>카드이미지</th>
					<td><img alt="cardimg" src="./CardIMG/${cardInfo.img }"></td>
				</tr>
				<tr>
					<th>카드이름</th>
					<td><input type="text" value="${cardInfo.name }" readonly="readonly" name="cardName" class="cardInfo"></td>
				</tr>
				<tr>
					<th>카드사</th>
					<td><input type="text" value="${cardInfo.company }" readonly="readonly" name="company" class="cardInfo"></td>
				</tr>
				<tr>
					<td colspan="2">
						<div id="rewordBox">
							<c:forEach var="item" items="${fn:split(fn:substring(cardInfo.reword, 0, fn:length(cardInfo.reword)-1),',')}">
								<c:if test="${item != null}">
									<span>#${item}</span>
								</c:if>
							</c:forEach>
						</div>
					</td>
				</tr>
			</table>
			<table id="memberInfoTable">
				<tr>
					<th>이름</th>
					<td><input type="text" value="${memberInfo.name }" name="userName"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" value="${memberInfo.phone }" name="phone"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><c:set var="address" value="${memberInfo.address }" /> <input
						type="text" id="sample4_postcode" placeholder="우편번호"
						name="postcode" value="${fn:split(address,'/')[0] }"
						style="width: 70%"> <input type="button"
						onclick="sample4_execDaumPostcode()" value="우편번호 찾기" id="addBtn"
						style="width: 25%"><br> <input type="text"
						id="sample4_roadAddress" placeholder="도로명주소" required
						name="roadAddress" value="${fn:split(address,'/')[1] }"><br>
						<input type="text" id="sample4_jibunAddress" placeholder="지번주소"
						required name="dibunAddress" value="${fn:split(address,'/')[2] }"><br>
						<span id="guide" style="color: #999; display: none;"></span> <input
						type="text" id="sample4_detailAddress" placeholder="상세주소" required
						name="detailAddress" value="${fn:split(address,'/')[3] }">
						<input type="text" id="sample4_extraAddress" placeholder="참고항목"
						required name="extraAddress" value="${fn:split(address,'/')[4] }">
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="email" name="email" id="email"
						value='<c:out value="${memberInfo.email }"/>'></td>
				</tr>
				<tr>
					<th><label class="form-label" for="dateSelector">연락가능 날짜</label></th>
				<td>
					<div class="reservation">
						<input id="dateSelector" class="dateSelector" name="contactableDate" placeholder="Click Me!"/>
					</div>
				</td>
			</tr>
			<tr>
				<th><label class="form-label" for="startTime">연락가능 시간</label></th>
				<td><input class="timeSelector" id="startTime" name="startTime"/> ~ <input class="timeSelector2" id="endTime" name="endTime" /></td>
			</tr>
			</table>
			<input type="submit" value="카드발급 신청하기">
		</form>
		<script type="text/javascript" src="./js/jquery.js"></script>
		<script type="text/javascript">



		var dateSelector = document.querySelector('.dateSelector');
		dateSelector.flatpickr({
		    mode: "multiple",
		    dateFormat: "Y-m-d",
		    conjunction: " ~ "
		});
		
		var timeSelector = document.querySelector('.timeSelector');
		timeSelector.flatpickr({
			  enableTime: true,
			  noCalendar: true,
			  dateFormat: "H:i",
			  hourIncrement: 1,
			  minuteIncrement: 30,
			  time_24hr: true,
			  minTime: "09:00",
			  maxTime: "20:00",

			});
		
		var timeSelector2 = document.querySelector('.timeSelector2');
		timeSelector2.flatpickr({
			  enableTime: true,
			  noCalendar: true,
			  dateFormat: "H:i",
			  hourIncrement: 1,
			  minuteIncrement: 30,
			  time_24hr: true,
			  minTime: "09:00",
			  maxTime: "20:00",
			});
		</script>
</body>
</html>