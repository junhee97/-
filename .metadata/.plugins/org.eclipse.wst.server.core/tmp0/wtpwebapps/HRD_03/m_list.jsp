<%@ include file="db.jsp"%>
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
<h2 style="text-align: center; padding-top: 50px;">후보조회</h2>

<form style="display: flex; align-items: center; justify-content:center; text-align:center;">
	<table border="1">
		<tr>
			<td>후보번호</td>
			<td>성명</td>
			<td>소속정당</td>
			<td>학력</td>
			<td>주민번호</td>
			<td>지역구</td>
			<td>대표전화</td>
		</tr>
		<%
		request.setCharacterEncoding("UTF-8");
		try {
			String sql ="select m_no, m_name, p_name, p_school, m_jumin, m_city, p_tel1, p_tel2, p_tel3 from tbl_member_202005 m join tbl_party_202005 p on m.p_code = p.p_code";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String grade = rs.getString(4);
				if (grade.equals("1")) {
					grade = "고졸";
				} else if (grade.equals("2")) {
					grade = "학사";
				} else if (grade.equals("3")) {
					grade = "석사";
				} else {
					grade = "박사";
				}
				String jumin = rs.getString(5);
				String jumin2 = jumin.substring(0,6) + "-" + jumin.substring(6, 13);
				%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=grade%></td>
					<td><%=jumin2%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=rs.getString(7) + "-" + rs.getString(8) + "-" + rs.getString(9)%></td>
				</tr>
				<%
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		%>
	</table>
</form>

</section>

<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>