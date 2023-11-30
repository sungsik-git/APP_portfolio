<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style type="text/css">
 header {
	position: fixed;
	height: 110px;
	width: 1920px;
	z-index: 99999999;
	background-color: white;
	overflow: inherit;
	margin: 0;
	box-shadow: 0px 4px 5px rgb(0, 0, 0, 0.1);
}
</style>
</head>
<body>
	<header>
		<c:import url="./element/GNB/GNB.jsp"/>
		<c:import url="./element/LNB/LNB.jsp"/>
		<c:import url="./element/Logo/Logo.jsp"/>
	</header>
</body>
</html>