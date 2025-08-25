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
<h2 style="text-align: center; padding-top: 50px;">학생성적</h2>

<form style="display:flex; aligns-item:center; justify-content:center; text-align:center;">
	<table border="1">
		<tr>
			<th>학년</th>
			<th>반</th>
			<th>번호</th>
			<th>이름</th>
			<th>국어</th>
			<th>수학</th>
			<th>영어</th>
			<th>역사</th>
			<th>합계</th>
			<th>평균</th>
			<th>석차</th>
		</tr>
		
		<%
		request.setCharacterEncoding("UTF-8");
		int rank = 1;
		int sumk = 0;
		int summ = 0;
		int sume = 0;
		int sumh = 0;
		int sumt = 0;
		double suma = 0;
		try {
			String sql = "select s.sno, sname, ekor, emath, eeng, ehist, ekor+emath+eeng+ehist as total, round((ekor+emath+eeng+ehist)/4.0, 1) as avg "
					+ "from student_tbl_01 s "
					+ "left join exam_tbl_01 e on s.sno = e.sno order by avg desc nulls last, s.sno asc";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String sno = rs.getString(1);
				String grade = sno.substring(0,1);
				String group = sno.substring(1,3);
				String number = sno.substring(3,5);
				sumk += rs.getInt(3);
				summ += rs.getInt(4);
				sume += rs.getInt(5);
				sumh += rs.getInt(6);
				sumt += rs.getInt(7);
				suma += rs.getDouble(8);	
				%>
				<tr>
					<td><%=grade%></td>
					<td><%=group%></td>
					<td><%=number%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3) != null ? rs.getString(3) : ""%></td>
					<td><%=rs.getString(4) != null ? rs.getString(4) : ""%></td>
					<td><%=rs.getString(5) != null ? rs.getString(5) : ""%></td>
					<td><%=rs.getString(6) != null ? rs.getString(6) : ""%></td>
					<td><%=rs.getString(7) != null ? rs.getString(7) : ""%></td>
					<td><%=rs.getString(8) != null ? rs.getString(8) : ""%></td>
					<td><%=rs.getString(8) != null ? rank++ : ""%></td>
				</tr>
				<%
			}
			%>
				<tr>
					<td colspan="4">총　합</td>
					<td><%=sumk%></td>
					<td><%=summ%></td>
					<td><%=sume%></td>
					<td><%=sumh%></td>
					<td><%=sumt%></td>
					<td><%=suma%></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="4">총평균</td>
					<td><%= (rank > 1) ? Math.round((sumk * 10.0) / (rank - 1)) / 10.0 : 0 %></td>
					<td><%= (rank > 1) ? Math.round((summ * 10.0) / (rank - 1)) / 10.0 : 0 %></td>
					<td><%= (rank > 1) ? Math.round((sume * 10.0) / (rank - 1)) / 10.0 : 0 %></td>
					<td><%= (rank > 1) ? Math.round((sumh * 10.0) / (rank - 1)) / 10.0 : 0 %></td>
					<td><%= (rank > 1) ? Math.round((sumt * 10.0) / (rank - 1)) / 10.0 : 0 %></td>
					<td><%= (rank > 1) ? Math.round((suma * 10.0) / (rank - 1)) / 10.0 : 0 %></td>
					<td></td>
				</tr>
			<%
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