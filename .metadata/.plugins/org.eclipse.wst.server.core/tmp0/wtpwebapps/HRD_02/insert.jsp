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
<h2 style="text-align: center; padding-top: 50px;">검사결과입력</h2>

<form method="post" action="action.jsp" name = "frm" style = "display: flex; aligns-item: center; justify-content: center;">
	<table border = "1">
		<tr>
			<td style ="text-align: center;">환자번호</td>
			<td><input type = "text" name = "p_no"> 예)1001</td>
		</tr>
		<tr>
			<td style ="text-align: center;">검사코드</td>
			<td>
				<select name="t_code">
					<option value="">검사명</option>
					<option value="t001">[T001]결핵</option>
					<option value="t002">[T002]장티푸스</option>
					<option value="t003">[T003]수두</option>
					<option value="t004">[T004]홍역</option>
					<option value="t005">[T005]콜레라</option>
				</select>
			</td>
		</tr>
		<tr>
			<td style ="text-align: center;">검사시작일자</td>
			<td><input type = "text" name = "t_sdate"> 예)20200101</td>
		</tr>
		<tr>
			<td style ="text-align: center;">검사상태</td>
			<td>
				<input type = "radio" name = "t_status" value="1">검사중
				<input type = "radio" name = "t_status" value="2">검사완료
			</td>
		</tr>
		<tr>
			<td style ="text-align: center;">검사완료일자</td>
			<td><input type = "text" name = "t_ldate"> 예)20200101</td>
		</tr>
		<tr>
			<td style ="text-align: center;">검사결과</td>
			<td>
				<input type = "radio" name = "t_result" value="X">미입력
				<input type = "radio" name = "t_result" value="P">양성
				<input type = "radio" name = "t_result" value="N">음성
			</td>
		</tr>
		<tr>
			<td style ="text-align: center;" colspan = "2">
				<input type = "button" value = "검사결과등록" onclick="add()">&nbsp;&nbsp;
				<input type = "button" value = "다시쓰기" onclick="res()">
			</td>
		</tr>
	</table>
</form>

</section>

<jsp:include page="footer.jsp"></jsp:include>

<script>
	function add(){
		if(frm.p_no.value == 0) {
			alert("환자번호가 입력되지 않았습니다!");
			frm.p_no.focus();
			return false;
		}
		else if(frm.t_code.value == 0) {
			alert("검사코드가 선택되지 않았습니다!");
			frm.t_code.focus();
			return false;
		}
		else if(frm.t_sdate.value == 0) {
			alert("검사시작일자가 입력되지 않았습니다!");
			frm.t_sdate.focus();
			return false;
		}
		else if(frm.t_status.value == 0) {
			alert("검사상태가 선택되지 않았습니다!");
			frm.t_status.focus();
			return false;
		}
		else if(frm.t_ldate.value == 0) {
			alert("검사완료일자가 입력되지 않았습니다!");
			frm.t_ldate.focus();
			return false;
		}
		else if(frm.t_result.value == 0) {
			alert("검사결과가 선택되지 않았습니다!");
			frm.t_result.focus();
			return false;
		}
		else {
			alert("검사결과가 정상적으로 등록되었습니다");
			document.frm.submit();
			return true;
		}
	}
	
	function res() {
		alert("정보를 지우고 처음부터 다시 입력합니다!");
		document.frm.reset();
	}
</script>


</body>
</html>