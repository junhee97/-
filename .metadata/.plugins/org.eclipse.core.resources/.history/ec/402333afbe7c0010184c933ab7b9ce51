<%@ include file="db.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String drvdate = request.getParameter("drv_date");
	String carno = request.getParameter("car_no");
	int drvstart = Integer.parseInt(request.getParameter("drv_start"));
	int drvend = Integer.parseInt(request.getParameter("drv_end"));
	String deptcode = request.getParameter("dept_code");
	int drvmoney = Integer.parseInt(request.getParameter("drv_money"));
	try {
		String sql = "insert into tbl_drive values(?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, drvdate);
		pstmt.setString(2, carno);
		pstmt.setInt(3, drvstart);
		pstmt.setInt(4, drvend);
		pstmt.setString(5, deptcode);
		pstmt.setInt(6, drvmoney);
		int result = pstmt.executeUpdate();
		if (result > 0)
			response.sendRedirect("index.jsp");
	} catch (Exception e) {
		e.printStackTrace();
	}
%>