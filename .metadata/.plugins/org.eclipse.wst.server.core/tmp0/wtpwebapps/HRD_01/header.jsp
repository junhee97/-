<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
	a{
		text-decoration: none;
		color: white;
	}
</style>

</head>
<body>

	<header style="position:fixed; top:0px; left:0px; width:100%; height: 150px; line-height: 150px; background-color: blue; color: white; text-align: center; font-size: 40px;">
		학사관리 프로그램 ver1.0
	</header>
	
	<nav style="position: fixed; top: 150px; left: 0px; width: 100%; height: 80px; line-height: 80px; background-color: violet; padding-left: 40px;">
		<a href="list.jsp">학생목록</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		<a href="insert.jsp">성적입력</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		<a href="select.jsp">학생성적</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		<a href="index.jsp">홈으로</a>
	</nav>

</body>
</html>