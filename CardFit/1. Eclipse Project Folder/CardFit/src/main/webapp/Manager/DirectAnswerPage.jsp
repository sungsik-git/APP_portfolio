<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style type="text/css">
#directContainer {
  width: 100%;
  height: 300px;
  paading-bottom:50px;
}

#directTable, #answerTable {
  width: 100%;
  border-collapse: collapse;
}

#directTable th,
#directTable td,
#answerTable th,
#answerTable td {
  padding: 4px;
  border-bottom: 1px solid #ddd;
  text-align: left;
}

#directTable th,
#answerTable th {
  width: 30%;
  background-color: #f2f2f2;
    text-align: center;
  
}

#directTable td,
#answerTable td {
  width: 70%;
  max-height: 60px;
  overflow: auto;
  padding:8px;
}


#directTable td::-webkit-scrollbar {
  width: 5px;
  background-color: #f2f2f2;
}

#directTable td::-webkit-scrollbar-thumb {
  background-color: #888;
}

#directTable td::-webkit-scrollbar-track {
  background-color: #f2f2f2;
}

</style>
</head>
<body>
	<div id="directContainer">
		<c:set var="idto" value="${inqirydto }"/>
		<table id="directTable">
			<tr>
				<th>제목</th>
				<td>${idto.title }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${idto.writer }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td id="contents">${idto.contents }</td>
			</tr>
			</table>
			
			<table id="answerTable">
			<c:if test="${idto.answercheck eq 1 }">
				<c:set var="adto" value="${answerdto }"/>
				답변
				<img alt="" src="../source/svg/line.svg">
				<tr>
					<th>답변일</th>
					<td>${adto.answertime }</td>
				</tr>
				<tr>
					<th>답변내용</th>
					<td>${adto.answer }
				</tr>
			</c:if>
		</table>
	</div>	
</body>
</html>