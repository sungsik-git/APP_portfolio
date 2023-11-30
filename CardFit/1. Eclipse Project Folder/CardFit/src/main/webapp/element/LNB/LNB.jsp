<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>

<link href="../Default/Default.css" rel="styleSheet" type="text/css"></link>
<style type="text/css">
* {
	font-family: Pretendard;
	font-weight: 700;
	padding: 0;
	margin: 0;
}

body {
	width: 1920px;
}

#LNB {
	position: absolute;
	width: 300px;
	top: 40px;
	right: 182px;
	overflow: hidden;
}

#LNB ul {
	width: 100%;
	height: 100%;
	overflow: hidden;
}

#LNB li {
	list-style: none;
	float: left;
	width: 10%;
	height: 36px;
	display: inline-block;
	margin: auto 20px;
	cursor: pointer;
}

#LNB li img {
	width: 100%;
	height: 100%;
}

#searchicon {
	cursor: pointer;
}

#searchBarBox {
	position: absolute;
	display: none;
	width: 1000px;
	height: 18vh;
	top: 28px;
	left: 500px;
}

#searchBarBox input[type=submit] {
	width: 10%;
	padding: 4px;
	border: none;
	background-color: #0042ec;
	color: white;
	margin-left: 3%;
	border-radius: 4px;
	position: relative;
	left: -15%;
	top: 1.5vh;
}

#searchBar {
	width: 85%;
	height: 6vh;
	float: left;
	display: inline-block;
	border: 2px solid #D1D1D2;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

	<form id="searchBarBox" method="post" action="headerSearch.do">
		<input type="text" id="searchBar" placeholder="검색어를 입력해주세요"
			name="searchKeyword"> <input type="submit" value="검색">
	</form>
	<nav id="LNB">
		<ul>
			<li><img alt="" src="./source/svg/bar.svg"></li>
			<li><img alt="" src="./source/svg/search.svg" id="searchicon"></li>
			<c:if test="${sessionScope.id eq null}">
				<li><a href="login.do"><img alt=""
						src="./source/svg/user.svg"></a></li>
			</c:if>
			<c:if test="${sessionScope.id ne null }">
				<li><a href="MyPage.do"><img alt=""
						src="./source/svg/user.svg"></a></li>
			</c:if>
			<li>
				<c:if test="${sessionScope.id eq null}">
					<a href="login.do"><img alt="" src="./source/svg/Login.svg"></a><br>
				</c:if> 
				<c:if test="${sessionScope.id ne null}">
					<a href="logout.do"><img alt="" src="./source/svg/Logout.svg"></a><br>
				</c:if>
			</li>
		</ul> 
	</nav>
	<script src="./js/jquery.js" type="text/javascript"></script>
	<script type="text/javascript">
  $(document).ready(function() {
    $("#searchicon").click(function() {
      $("#searchBarBox").toggle();
    });
  });
</script>

</body>
</html>