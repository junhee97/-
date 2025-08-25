<%@ include file="db.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String rm = request.getParameter("regist_month");
	String cno = request.getParameter("c_no");
	String carea = request.getParameter("class_area");
	int tuition = Integer.parseInt(request.getParameter("tuition"));
	int tcode = Integer.parseInt(request.getParameter("tuition"))/1000;
	try {
		String sql = "insert into tbl_class_202201 values (?, ?, ?, ?, ?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, rm);
		pstmt.setString(2, cno);
		pstmt.setString(3, carea);
		pstmt.setInt(4, tuition);
		pstmt.setInt(5, tcode);
		int result = pstmt.executeUpdate();
		if (result > 0 ) {
			response.sendRedirect("index.jsp");
		}
	} catch(Exception e) {
		e.printStackTrace();
	}
%>