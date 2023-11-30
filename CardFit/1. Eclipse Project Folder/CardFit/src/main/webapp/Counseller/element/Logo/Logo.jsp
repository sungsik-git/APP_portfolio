<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style type="text/css">
.logoImg {
	position: absolute;
	width: 240px;
	height: 34.5px;
	top: 38px;
	left: 182px;
}

</style>
</head>
<body>
		<img class="logoImg" alt="" src="./source/svg/CF_logo_Blue.svg">

</body>
<script type="text/javascript">
const logoBox = document.querySelector(".logoImg");
logoBox.addEventListener("click", function(){
	location.href="index.do";
})
</script>
</html>