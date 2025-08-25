<%@ include file ="db.jsp" %>
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
<h2 style="text-align: center; padding-top: 50px;">학생목록</h2>

<form style="display:flex; align-items:center; justify-content:center; text-align:center;">
	<table border="1">
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>학년</th>
			<th>반</th>
			<th>번호</th>
			<th>성별</th>
			<th>전화번호</th>
			<th>주소</th>
		</tr>
		<%
		request.setCharacterEncoding("UTF-8");
		try {
			String sql = "select sno, sname, sgender, sphone, saddress from student_tbl_01";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String sno = rs.getString(1);
				String grade = sno.substring(0,1);
				String group = sno.substring(1,3);
				String number = sno.substring(3,5);
				String gender = rs.getString(3);
				if(gender.equals("F"))
					gender = "여";
				else
					gender = "남";
				%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=grade%></td>
					<td><%=group%></td>
					<td><%=number%></td>
					<td><%=gender%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
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