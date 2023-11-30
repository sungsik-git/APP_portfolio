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
#directPageContainer{
	position: relative;
	float: right;
	width: 70%;
	top: 150px;
	text-align: center;
	boder:2px solid red;
	height: 150px;
}
</style>
</head>
<body>
	<c:import url="../CounsellerPage.jsp"/>
	<div id="directPageContainer">
		<c:import url="../HelpDirect.jsp"></c:import>
	</div>
	
	<script type="text/javascript" src="../js/jquery.js"></script>
	<script type="text/javascript">
		
	</script>
</body>
</html>