<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상담사 페이지</title>
 <link rel="shorcut icon" type="image/x-icon" href="./source/svg/CF_logo_Symbol.svg">
<style type="text/css">
#issuancingContainer {
	position: relative;
	top: 5vh;
	width: 75%;
	margin: 0 auto;
	float: right;
	overflow: auto;
	height: 783px;
	text-align: center;
}

#isuuancingElement {
	width: 80%;
	margin: 10px auto;
	padding: 12px;
	border-radius: 8px;
	height: 180px;
}


#rightBox {
	width: 70%;
	float: right;
	text-align: left;
}
#leftBox {
  width: 30%;
  height: 100%;
  float: left;
  display: flex;
  align-items: center;
  justify-content: center;
}

#leftBox img {
  max-width: 150px;
  max-height: 180px;
  margin: auto;
}

#rightBox p {
	padding: 2px;
}
.clearBtn{
	position: relative;
	width: 20%;
	height: 30px;
	background: none;
	display: inline-block;
	color: #0042ec;
	border-radius: 4px;
	font-size: 16px;
	border: 2px solid #0042ec;
}

#colorTable{
	position: relative;	
	width: 50%;
	margin: 0 auto;
}
#colorTable tr th{
	border: 1px solid black;
	height: 10px;
}
#colorTable tr td{
	border: 1px solid black;
	height: 20px;
}
#colorTable tr td:nth-child(1) {
	background-color: #A4A4FB;
}
#colorTable tr td:nth-child(2) {
	background-color: #FFF289;
}
#colorTable tr td:nth-child(3) {
	background-color: #FFC9C9; 
}
</style>
</head>
<body>
	<c:import url="../CounsellerPage.jsp" />
	<c:set var="now" value="<%=new java.util.Date()%>" />
	<div id="issuancingContainer">
		<h2>현재 발급을 진행중인 카드리스트입니다.</h2>
		<br>
		<p>배경색 별로 남은 시간이 구분돼요 !</p>
		<table id="colorTable">
			<tr>
				<th>요청일 전이예요!</th><th>시간에 맞춰서 전화하세요!</th><th>요청일이 지났어요!</th>
			</tr>
			<tr>
				<td></td><td></td><td></td>
			</tr>
		</table>
		<c:forEach items="${list}" var="list">
			<c:set var="contactableDateS"
				value="${fn:split(list.contactableDate, '~')[0]}" />
			<c:set var="contactableDateE"
				value="${fn:split(list.contactableDate, '~')[1]}" />

			<%-- 문자열을 날짜로 변환 --%>
			<fmt:parseDate value="${contactableDateS}" var="parsedDateS"
				pattern="yyyy-MM-dd" />
			<fmt:parseDate value="${contactableDateE}" var="parsedDateE"
				pattern="yyyy-MM-dd" />

			<div id="isuuancingElement"
				style="background-color:
      <c:choose>
        <c:when test="${parsedDateS gt now}">
          #A4A4FB; 
        </c:when>
        <c:when test="${parsedDateS lt now && now lt parsedDateE}">
          #FFF289; 
        </c:when>
        <c:when test="${now gt parsedDateE}">
          #FFC9C9; 
        </c:when>
      </c:choose>
      ">
				<div id="leftBox">
					<img alt="" src="./CardIMG/${list.img }">
				</div>
				<div id="rightBox">
					<h2>${list.cardName }</h2>
					<p>고객명 : ${list.userName }</p>
					<p>고객전화번호 : ${list.phone }</p>
					<p>발급신청일 : ${list.requestDate }</p>
					<p>연락가능 날짜 : ${list.contactableDate }</p>
					<p>연락가능 시간 : ${list.startTime } ~ ${list.endTime }</p>
					<input type="button" value="발급완료" class="clearBtn"> 
					<input type="hidden" value="${list.cardName }" name="cardName">
					<input type="hidden" value="${list.num }" name="num">
				</div>
			</div>
		</c:forEach>

	</div>
	<script src="../js/jquery.js" type="text/javascript"></script>
	<script>
		$(document).ready(function() {
			$('body').on('click', 'input[type="button"]', function(e) {
				e.preventDefault();

				var cardName = $('input[name="cardName"]').val();
				var num = $('input[name="num"]').val();

				$.ajax({
					url : 'counsellerClearIssuance.do',
					type : 'POST',
					data : {
						"cardName" : cardName,
						"num" : num
					},
					dataType : 'text',
					success : function(response) {
						alert("치리가 완료되었습니다.");
						location.reload();
					},
					error : function(xhr, status, error) {
						console.error(error);
					}
				});
			});
		});
	</script>

</body>
</html>