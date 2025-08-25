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
<h2 style="text-align: center; padding-top: 50px;">검사결과조회</h2>

<form style = "display: flex; align-items: center; justify-content: center; text-align: center;">
	<table border = "1">
		<tr>
			<th>환자번호</th>
			<th>환자명</th>
			<th>검사명</th>
			<th>검사시작일</th>
			<th>검사상태</th>
			<th>검사종료일</th>
			<th>검사결과</th>
		</tr>
		<%
		request.setCharacterEncoding("UTF-8");
		try {
			String sql = "SELECT P.P_NO, P.P_NAME, L.T_NAME, R.T_SDATE, R.T_STATUS, R.T_LDATE, R.T_RESULT"
					+ " FROM TBL_RESULT_202004 R"
					+ " JOIN TBL_PATIENT_202004 P ON R.P_NO = P.P_NO"
					+ " JOIN TBL_LAB_TEST_202004 L ON R.T_CODE = L.T_CODE"
					+ " ORDER BY P.P_NO ASC";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String sdate = rs.getString(4).substring(0,10);
				String status = rs.getString(5);
				if(status.equals("1"))
					status = "검사중";
				else
					status = "검사완료";
				String ldate = rs.getString(6).substring(0,10);
				String result = rs.getString(7);
				if(result.equals("X"))
					result = "미입력";
				else if (result.equals("P"))
					result = "양성";
				else
					result = "음성";
				%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=sdate%></td>
					<td><%=status%></td>
					<td><%=ldate%></td>
					<td><%=result%></td>
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