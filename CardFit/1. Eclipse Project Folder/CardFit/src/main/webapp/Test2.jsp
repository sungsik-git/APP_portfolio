<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<style type="text/css">
.post-slider{
  border:1px solid red;
}
.post-slider .post-wrapper{
  width:84%;
  height:350px;
  margin:0px auto;
  border:1px dashed red;
}
.post-slider .post-wrapper .post{
  width:300px;
  height:350px;
  display:inline-block;
  background:gray;
}
</style>
</head>
<body>

<div class="single-item-rtl">
        <h1 class="sider-title">Treding Posts</h1>
        <div class="post-wrapper">
          <div class="post">1</div>
          <div class="post">2</div>
          <div class="post">3</div>
          <div class="post">4</div>
          <div class="post">5</div>
        </div>
</div>

	<script type="text/javascript">
	$('.single-item-rtl').slick({
		  rtl: true
		});
  </script>

</body>
</html>