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
<h2 style="text-align: center; padding-top: 50px;">(지역별)검사건수통계</h2>

<form style = "display: flex; aligns-item: center; justify-content: center; text-align: center;">
	<table border = "1">
		<tr>
			<th>지역코드</th>
			<th>지역명</th>
			<th>검사건수</th>
		</tr>
		<%
		request.setCharacterEncoding("UTF-8");
		try {
			String sql = "select p.p_city, count(*) from tbl_patient_202004 p join tbl_result_202004 r on p.p_no = r.p_no group by p.p_city order by p.p_city asc";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String location = rs.getString(1);
				if(location.equals("10"))
					location = "서울";
				else if(location.equals("20"))
					location = "경기";
				else if(location.equals("30"))
					location = "강원";
				else
					location = "대구";
				%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=location%></td>
					<td><%=rs.getString(2)%></td>
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