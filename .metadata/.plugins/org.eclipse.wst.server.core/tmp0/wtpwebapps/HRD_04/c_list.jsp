<%@ include file = "db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<section style="position: fixed; top: 230px; left: 0px; width: 100%; height: 100%; background-color: lightgray;">
<h2 style="text-align: center;">차량조회</h2>

<form style ="display :flex; align-items: center; justify-content: center; text-align: center;">
	<table style ="width: 500px;" border="1">
		<tr>
			<th>차랑변호</th>
			<th>모델</th>
			<th>제조사</th>
			<th>구매일</th>
		</tr>
		<%
		request.setCharacterEncoding("UTF-8");
		try {
			String sql = "select * from tbl_car";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String buydate = rs.getString(4);
				String bydate = buydate.substring(0,4) + "년" + buydate.substring(4,6) + "월" + buydate.substring(6,8) + "일";
				%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=bydate%></td>
				</tr>
				<%
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		%>
	</table>
</form>

</section>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>