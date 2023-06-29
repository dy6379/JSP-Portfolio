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
</head>
<body>
<!-- 텍스트를 통해 자바스크립트를 구현한다
	자바스크립트창(window).비밀번호확인창(opener).처음실행한페이지(parent) -->
	<script type="text/javascript">
		if(window.name=="update") {
			window.opener.parent.location.href
			="BoardServlet?command=board_update_form&num=${param.num}";
		} else if(window.name=="delete"){
			alert('삭제되었습니다');
			window.opener.parent.location.href
			="BoardServlet?command=board_delete&num=${param.num}";
		}
		window.close();
	</script>
</body>
</html>