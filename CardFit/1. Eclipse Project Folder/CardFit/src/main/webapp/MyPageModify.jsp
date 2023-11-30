<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="./element/Default/Default.css" type="text/css"
	rel="stylesheet">
<style type="text/css">
#memberModifyContainer {
	width: 80%;
	margin: 0 auto;
	position: relative;
    left: -9%;
}
#memberModifyContainer p{
	font-size:26px;
}
#memberModifyContainer img{
	width: 100%;
}
#modifyTable{
	width: 100%;
}
#modifyTable tr{
}
#modifyTable tr th{
	width:30%;
		padding: 12px;
	
}
#modifyTable tr td{
	width:70%;
	padding: 12px;
	
}
input[type=text], input[type=password], input[type=email]{
	width:100%;
	border: 1px solid #DADADB;
		padding: 6px;
		margin:6px 0;
	border-radius: 4px;
}
#addBtn{
	border: 1px solid black;
	padding: 6px;
	margin-left: 4%;
	border-radius: 4px;
	background-color: white;
}
input[type=submit]{
	position:relative;
	margin:3vh 0;
	width: 100%;
	padding: 12px;
	background: #0042EC;
	border: none;
	color:white;
	border-radius: 4px;
}

</style>
<title>Insert title here</title>
</head>
<body>
	<div id="memberModifyContainer">
		<p>회원정보수정</p>
		<img alt="" src="./source/svg/line.svg">
		<form action="modifyOK.do" method="post">
			<table id="modifyTable">
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" id="name" value="${dto.name }" required></td>
				</tr>
				<tr>
					<th>주민등록번호</th>
					<c:set var="regNum" value="${dto.regNum }" />
					<td><input type="text" name="regNumF" id="regNumF"
						 value="${fn:substring(regNum,0,6) }" style="width:46.5%">
						- <input type="password" name="regNumB" id="regNumB"
						 value="${fn:substring(regNum,6,13) }" style="width:46.5%"></td>

				</tr>
				<tr>
					<th>휴대폰번호</th>
					<td><input type="text" name="phone" id="phone"
						 value='<c:out value="${dto.phone }"/>'></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><c:set var="address" value="${dto.address }" /> <input
						type="text" id="sample4_postcode" placeholder="우편번호"
						 name="postcode"
						value="${fn:split(address,'/')[0] }" style="width:68%"> <input type="button"
						onclick="sample4_execDaumPostcode()" value="우편번호 찾기" id="addBtn"
						style="width:25%"><br> <input type="text"
						id="sample4_roadAddress" placeholder="도로명주소" 
						required name="roadAddress" value="${fn:split(address,'/')[1] }"><br>
						<input type="text" id="sample4_jibunAddress" placeholder="지번주소"
						 required name="dibunAddress"
						value="${fn:split(address,'/')[2] }"><br> <span
						id="guide" style="color: #999; display: none;"></span> <input
						type="text" id="sample4_detailAddress" placeholder="상세주소"
						 required name="detailAddress"
						value="${fn:split(address,'/')[3] }"> <input type="text"
						id="sample4_extraAddress" placeholder="참고항목" 
						required name="extraAddress" value="${fn:split(address,'/')[4] }">
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="email" name="email" id="email"
						 value='<c:out value="${dto.email }"/>'></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="수정하기"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="./js/PostAPI.js" type="text/javascript"></script>
</html>