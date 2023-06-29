<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1  maximum-scale=1, user-scalable=no">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<title>Insert title here</title>
<link rel="stylesheet" href="css/board.css">
<script type="text/javascript" src="js/board.js"></script>
</head>
<body>
	<div id="wrap">
		<form action="BoardServlet" name="frm" method="get">
			<!-- command에 board_check_pass를 저장, num에는 해당게시글 번호저장 후 BoardServlet으로 -->
			<input type="hidden" name="command" value="board_check_pass">
			<input type="hidden" name="num" value="${param.num}">
			<table style="width: 80%">
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pass" size="20"></td>
				</tr>
			</table>
			<br> <input type="submit" value="확인"
				onclick="return passCheck()"><br> <br>${message }
		</form>
	</div>
</body>
</html>