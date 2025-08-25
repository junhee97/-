<%@ include file = "db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8");
String sno = request.getParameter("sno");
String ekors = request.getParameter("ekor");
int ekor = Integer.parseInt(ekors);
String emaths = request.getParameter("emath");
int emath = Integer.parseInt(emaths);
String eengs = request.getParameter("eeng");
int eeng = Integer.parseInt(eengs);
String ehists = request.getParameter("ehist");
int ehist = Integer.parseInt(ehists);
try {
	String sql = "insert into exam_tbl_01 values(?,?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, sno);
	pstmt.setInt(2, ekor);
	pstmt.setInt(3, emath);
	pstmt.setInt(4, eeng);
	pstmt.setInt(5, ehist);
	pstmt.executeUpdate();
	
} catch(Exception e) {
	e.printStackTrace();
}
%>

<jsp:forward page="insert.jsp"></jsp:forward>