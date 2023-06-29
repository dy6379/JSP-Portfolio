<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
	<script type="text/javascript" src="js/board.js?v=1"></script>
<style>
#wrap {
	width: 1000px;
	margin: auto;
}

body {
	background: url(https://scotch.io/wp-content/uploads/2014/07/61.jpg);
}

.container {
	font-family: 'Roboto';
	width: 600px;
	margin: 30px auto 0;
	display: block;
	background: #FFF;
	padding: 10px 50px 50px;
}

table {
	width: 100%;
	border-collapse: collapse;
	line-height: 24px;
	background-color: light;
}

table td, th {
	border-bottom: 1px solid black;
	border-collapse: collapse;
	text-align: center;
	padding: 10px;
}

h2 {
	text-align: center;
	margin-bottom: 50px;
}

h2 small {
	font-weight: normal;
	color: #888;
	display: block;
}

[class*="noty_theme__unify--v1"] {
	box-shadow: 0 2px 15px 0 rgba(0, 0, 0, 0.15);
	border-radius: 4px;
	padding: 1.57143rem;
}

.noty_theme__unify--v1--dark {
	background-color: #2e3c56;
}

.noty_theme__unify--v1--light {
	background-color: #fff;
	box-shadow: 0 2px 15px 0 rgba(0, 0, 0, 0.05);
}

.noty_type__info.noty_theme__unify--v1 {
	background-color: #1d75e5;
}

.noty_progressbar {
	height: 0.5rem !important;
}

.noty_theme__unify--v1 .noty_progressbar {
	background-color: rgba(0, 0, 0, 0.08) !important;
}

.noty_theme__unify--v1--dark.noty_type__info .noty_progressbar {
	background-color: #1d75e5;
}

.noty_theme__unify--v1--light.noty_type__info .noty_progressbar {
	background-color: rgba(29, 117, 229, 0.15);
}
</style>
</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>

	<div id="wrap">
		<header>
			<div
				class="g-brd-around g-brd-gray-light-v7 g-rounded-4 g-pa-15 g-pa-20--md g-mb-30">
				<h3
					class="d-flex align-self-center text-uppercase g-font-size-12 g-font-size-default--md g-color-black g-mb-20">Info</h3>
				<div
					class="noty_bar noty_type__info noty_theme__unify--v1--light noty_close_with_click noty_has_progressbar noty_has_timeout">
					<div class="noty_body">
						<div class="g-mr-20">
							<div class="noty_body__icon">
								<i class="hs-admin-info"></i>
							</div>
						</div>
						<div>상세보기 페이지 입니다. 다른 페이지 이동 희망시 아래의 버튼을 눌러주세요.</div>
					</div>
					<div class="noty_progressbar" style="width: 70%;"></div>
				</div>
			</div>
		</header>

		<div class="container text-center">
			<h2>
				게시글 상세보기<small>공연관련</small>
			</h2>
			<table class="table align-middle table-bordered">
				<caption>게시글 상세내용</caption>
				<tbody>
					<tr>
						<th>제목</th>
						<td><a
							href="BoardServlet?command=board_view&num=${boardone.num }">${boardone.title }</a></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${boardone.name }</td>
					</tr>
					<tr>
						<th>작성시간</th>
						<td>${boardone.writeDate }</td>
					</tr>
					<tr>
						<th>조회수</th>
						<td>${boardone.readCount }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><pre>${boardone.content }</pre></td>
					</tr>
				</tbody>
			</table>

			<input class="btn btn-dark" type="submit" value="새글 작성"
				onclick="location.href='BoardServlet?command=board_write_form'"/>
			<input class="btn btn-dark" type="button" value="글 수정"
				onclick="openWindow('BoardServlet?command=board_check_pass_form&num=${boardone.num}', 'update')" />
			<input class="btn btn-warning" type="button" value="글 삭제"
				onclick="openWindow('BoardServlet?command=board_check_pass_form&num=${boardone.num}', 'delete')" />
			<input class="btn btn-dark" type="button" value="목록으로"
				onclick="location.href='BoardServlet?command=board_list'"/>

			<script>
				function goToBoardList() {
					$.ajax({
						url : 'BoardServlet?command=board_list',
						success : function(response) {
							window.location.href = response; // 받은 URL로 페이지 이동
						}
					});
				}
			</script>

		</div>
	</div>
</body>
</html>