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
<h2 style="text-align: center; padding-top: 50px;">환자조회</h2>

<form style ="display:flex; aligns-item:center; justify-content:center; text-align:center;">
	<table border = "1">
		<tr>
			<th>환자번호</th>
			<th>환자성명</th>
			<th>생년월일</th>
			<th>성별</th>
			<th>전화번호</th>
			<th>지역</th>
		</tr>
		<%
		request.setCharacterEncoding("UTF-8");
		try{
			String sql = "select * from tbl_patient_202004 order by p_no asc";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String jumin = rs.getString(3);
				String jumin2 = jumin.substring(0,4) + "년" + jumin.substring(4,6) + "월" + jumin.substring(6,8) + "일";
				String gender = rs.getString(4);
				if(gender.equals("M"))
					gender = "남";
				else
					gender = "여";
				String location = rs.getString(8);
				if(location.equals("10"))
					location = "서울";
				else if (location.equals("20"))
					location = "경기";
				else if (location.equals("30"))
					location = "강원";
				else
					location = "대구";
				%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=jumin2%></td>
					<td><%=gender%></td>
					<td><%=rs.getString(5) + "-" + rs.getString(6) + "-" + rs.getString(7)%></td>
					<td><%=location%></td>
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