<%@ include file="db.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String pno = request.getParameter("p_no");
	String tcd = request.getParameter("t_code");
	String tdt = request.getParameter("t_sdate");
	String tstat = request.getParameter("t_status");
	String tldt = request.getParameter("t_ldate");
	String trs = request.getParameter("t_result");

	try {
		String sql = "INSERT INTO TBL_RESULT_202004 VALUES (?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, pno);
		pstmt.setString(2, tcd);
		pstmt.setString(3, tdt);
		pstmt.setString(4, tstat);
		pstmt.setString(5, tldt);
		pstmt.setString(6, trs);
		int result = pstmt.executeUpdate();
		if(result > 0) {
			response.sendRedirect("index.jsp");
		}

	} catch (Exception e) {
		e.printStackTrace();
	}
%>
