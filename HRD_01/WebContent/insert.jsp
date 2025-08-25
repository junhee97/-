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
<h2 style="text-align: center; padding-top: 50px;">성적입력</h2>

<form action="action.jsp" name="frm" style="display:flex; aligns-item: center; justify-content:center;">
	<table border="1">
		<tr>
			<td style="text-align:center;">학번</td>
			<td><input type="text" name="sno"></td>
		</tr>
		<tr>
			<td style="text-align:center;">국어점수</td>
			<td><input type="text" name="ekor"></td>
		</tr>
		<tr>
			<td style="text-align:center;">수학점수</td>
			<td><input type="text" name="emath"></td>
		</tr>
		<tr>
			<td style="text-align:center;">영어점수</td>
			<td><input type="text" name="eeng"></td>
		</tr>
		<tr>
			<td style="text-align:center;">역사점수</td>
			<td><input type="text" name="ehist"></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;">
				<input type="button" value="등록하기" onclick="add()">
			</td>
		</tr>
	</table>
</form>

</section>

<jsp:include page="footer.jsp"></jsp:include>


<script>
	function add() {
		if(frm.sno.value==0) {
			alert("학생번호가 입력되지 않았습니다!");
			frm.sno.focus();
			return false;
		}
		else if(frm.ekor.value==0) {
			alert("국어점수가 입력되지 않았습니다!");
			frm.ekor.focus();
			return false;
		}
		else if(frm.emath.value==0) {
			alert("수학점수가 입력되지 않았습니다!");
			frm.emath.focus();
			return false;
		}
		else if(frm.eeng.value==0) {
			alert("영어점수가 입력되지 않았습니다!");
			frm.eeng.focus();
			return false;
		}
		else if(frm.ehist.value==0) {
			alert("역사점수가 입력되지 않았습니다!");
			frm.ehist.focus();
			return false;
		}
		else {
			alert("학생 성적이 정상적으로 입력되었습니다!");
			document.frm.submit();
			return true;
		}
	}
</script>


</body>
</html>