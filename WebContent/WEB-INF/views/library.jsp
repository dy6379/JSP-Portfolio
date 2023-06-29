<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-03-16
  Time: 오전 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Title</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<style>
html, body, .intro {
	height: 100%;
}

table td, table th {
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}

.card {
	border-radius: .5rem;
}

.carousel-item {
	height: 65vh;
	min-height: 350px;
	background: no-repeat center center scroll;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

body {
	background: #eee;
}

.container {
	margin-top: 200px
}

.btn {
	display: inline-block;
	margin-right: 20px;
	letter-spacing: 2px;
	border: 1px solid transparent
}

.btn-round {
	border-radius: 4px !important
}

.btn i {
	margin-right: 5px
}

.btn.btn-large i {
	font-size: 24px
}

.button {
	margin-top: 0;
	margin-bottom: 0
}

.btn.btn-large {
	font-size: 18px;
	padding: 18px 35px
}

.highlight-button {
	border: 2px solid #000;
	display: inline-block;
	padding: 8px 20px 9px;
	font-size: 12px;
	color: #000;
	background-color: transparent
}

.highlight-button:hover {
	background-color: #000;
	border: 2px solid #000;
	color: #fff
}

.highlight-button i {
	color: #000
}

.highlight-button:hover i {
	color: #fff
}
</style>
</head>
<body>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>

<!-- Navbar -->
<nav class="navbar navbar-expand-sm navbar-dark bg-dark fixed-top">
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="navBar">
			<ul class="navbar-nav mx-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#"
					role="button" aria-expanded="false">다른 리스트</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">음식점 리스트</a></li>
						<li><a class="dropdown-item" href="#">카페 리스트</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">헬스 리스트</a></li>
						<li><a class="dropdown-item" href="#">운동 리스트</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="hall">공연 리스트</a></li>
						<li><a class="dropdown-item" href="library">도서관 리스트</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#"
					role="button" aria-expanded="false">게시판 모음</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">음식점 게시판</a></li>
						<li><a class="dropdown-item" href="#">카페 게시판</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">헬스 게시판</a></li>
						<li><a class="dropdown-item" href="#">운동 게시판</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item"
							href="BoardServlet?command=board_list">공연 게시판</a></li>
						<li><a class="dropdown-item" href="#">도서관 게시판</a></li>
					</ul></li>
			</ul>
			<div class="navbar-collapse collapse" id="navbarResponsive" style="">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link active" href="#about">About</a></li>
					<li class="nav-item"><a class="nav-link" href="#services">Services</a></li>
					<li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
				</ul>
			</div>
		</div>
	</div>
</nav>
<!-- Navbar -->

<!-- Background image -->
<header>

	<div id="carouselExampleCaptions" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active"
				style="background-image: url('images/library.jpg')">
				<div class="carousel-caption">
					<h5>First slide label</h5>
					<p>Some representative placeholder content for the first slide.</p>
				</div>
			</div>
			<div class="carousel-item"
				style="background-image: url('images/books.jpg')">
				<div class="carousel-caption">
					<h5>Second slide label</h5>
					<p>Some representative placeholder content for the second
						slide.</p>
				</div>
			</div>
			<div class="carousel-item"
				style="background-image: url('images/starfield.jpg')">
				<div class="carousel-caption">
					<h5>Third slide label</h5>
					<p>Some representative placeholder content for the third slide.</p>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
</header>

<!-- Page Content -->
<section class="py-5">
	<div class="container">
		<h1 class="fw-light">Page Image Slider</h1>
		<p class="lead">여러분들이 이 페이지에서 어떤 것을 알 수 있는지 직관적으로 만든 페이지입니다. 그렇기에
			슬라이더 이미지들은 관련 사진으로 이루어져 있습니다. 바로 아래의 설명글을 읽고서 더 편하고 쉽게 이용해 보십시오!</p>
	</div>
</section>
<!-- about섹션 -->
<section id="about">
	<div class="container px-4 py-5 my-5">
		<div class="row gx-4 justify-content-center">
			<h2>About this page</h2>
			<p class="lead">이 Abount Section에서는 여러분들에게 설명을 할 것입니다. 이 페이지에서
				여러분들은 공연에 관련된 정보들을 입수하실 수 있습니다. 여러분들이 이 페이지에서 주로 하실 수 있는 활동은 어떤 공연들과
				어떤 Hall들이 있는지 이겠죠. 아래 Service Section에 들어 가시면 여러분들은 기본적인 관련정보를 얻을 수
				있습니다. 현재 상영되거나 상영된 공연물들이죠. 구분, 제목, 시작일, 종료일, 시군, 장소, 가격, 문의, 홈페이지를 알
				수 있으며 만일 더 상세히 알고 싶은 공연들이나 각 공연장소에 대해 알고 싶으시다면 옆의 홈페이지를 통해 가시면
				편할것입니다. 현 페이지는 각공연 각장소에 대한 리스트일 뿐이니 상세정보는 제공하지 않습니다. 또한 이 웹사이트는
				여러분들의 경험을 필요로 하는 다른 사용자들을 위해 그리고 다른 사용자들의 경험의 리뷰들을 알고 싶을 시 여러분들은 리뷰
				게시판으로 가시면 됩니다. 위의 네비바를 보시면 각 리스트와 각 게시판 모음이 있으며 여러분들은 각 장르의 정보를
				리스트에서 각 장르에 대한 경험 후기를 각 게시판모음에서 보실 수 있습니다. 편히 사용해 보십시오</p>
			<div class="col-lg-6 mx-auto">
				<ul>
					<li>네비바에서 다른 게시물, 리스트로 갈 수 있다</li>
					<li>네비바에서 현 페이지의 각 Section으로 갈 수 있게 되어있다</li>
					<li>Service section에서 공연에 대한 정보를 얻을 수 있다</li>
					<li>여러분들이 원하는 정보를 얻을 수 있게 하였다</li>
					<li>구분, 제목, 시작일, 종료인, 시군, 장소, 가격, 문의, 홈페이지</li>
					<li>Contact section은 부산시에 완공예정된 오페라하우스 그림</li>
				</ul>
			</div>
		</div>
		<h2 class="font-weight-bold mb-2">도서관예시</h2>
		<p class="font-italic text-muted mb-4">도서관에서 주로 경험할수 있는 것들. 예시몇개만</p>

		<div class="row pb-5 mb-4">
			<div class="col-lg-3 col-md-6 mb-4 mb-lg-0">
				<!-- Card-->
				<div class="card shadow-sm border-0 rounded">
					<div class="card-body p-0">
						<img src="images/book.jpg" alt="" class="w-100 card-img-top">
						<div class="p-4">
							<h5 class="mb-0">Books</h5>
							<p class="small text-muted">pic-unsplash</p>
							<ul class="social mb-0 list-inline mt-3">
								<li class="list-inline-item m-0"><a href="#"
									class="social-link"><i class="fa fa-facebook-f"></i></a></li>
								<li class="list-inline-item m-0"><a href="#"
									class="social-link"><i class="fa fa-twitter"></i></a></li>
								<li class="list-inline-item m-0"><a href="#"
									class="social-link"><i class="fa fa-instagram"></i></a></li>
								<li class="list-inline-item m-0"><a href="#"
									class="social-link"><i class="fa fa-linkedin"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4 mb-lg-0">
				<!-- Card-->
				<div class="card shadow-sm border-0 rounded">
					<div class="card-body p-0">
						<img src="images/read.jpg" alt="" class="w-100 card-img-top">
						<div class="p-4">
							<h5 class="mb-0">Read</h5>
							<p class="small text-muted">pic-unsplash</p>
							<ul class="social mb-0 list-inline mt-3">
								<li class="list-inline-item m-0"><a href="#"
									class="social-link"><i class="fa fa-facebook-f"></i></a></li>
								<li class="list-inline-item m-0"><a href="#"
									class="social-link"><i class="fa fa-twitter"></i></a></li>
								<li class="list-inline-item m-0"><a href="#"
									class="social-link"><i class="fa fa-instagram"></i></a></li>
								<li class="list-inline-item m-0"><a href="#"
									class="social-link"><i class="fa fa-linkedin"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4 mb-lg-0">
				<!-- Card-->
				<div class="card shadow-sm border-0 rounded">
					<div class="card-body p-0">
						<img src="images/culture.jpg" alt="" class="w-100 card-img-top">
						<div class="p-4">
							<h5 class="mb-0">CultureCenter</h5>
							<p class="small text-muted">pic-unsplash</p>
							<ul class="social mb-0 list-inline mt-3">
								<li class="list-inline-item m-0"><a href="#"
									class="social-link"><i class="fa fa-facebook-f"></i></a></li>
								<li class="list-inline-item m-0"><a href="#"
									class="social-link"><i class="fa fa-twitter"></i></a></li>
								<li class="list-inline-item m-0"><a href="#"
									class="social-link"><i class="fa fa-instagram"></i></a></li>
								<li class="list-inline-item m-0"><a href="#"
									class="social-link"><i class="fa fa-linkedin"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4 mb-lg-0">
				<!-- Card-->
				<div class="card shadow-sm border-0 rounded">
					<div class="card-body p-0">
						<img src="images/write.jpg" alt="" class="w-100 card-img-top">
						<div class="p-4">
							<h5 class="mb-0">Write</h5>
							<p class="small text-muted">pic-unsplash</p>
							<ul class="social mb-0 list-inline mt-3">
								<li class="list-inline-item m-0"><a href="#"
									class="social-link"><i class="fa fa-facebook-f"></i></a></li>
								<li class="list-inline-item m-0"><a href="#"
									class="social-link"><i class="fa fa-twitter"></i></a></li>
								<li class="list-inline-item m-0"><a href="#"
									class="social-link"><i class="fa fa-instagram"></i></a></li>
								<li class="list-inline-item m-0"><a href="#"
									class="social-link"><i class="fa fa-linkedin"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</section>

<section class="intro" id="services">

	<div class="mask d-flex align-items-center h-100"
		style="background-color: black;">
		<div class="container">
			<h2 style="color: white;">lists</h2>
			<div class="row justify-content-center">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-hover mb-0">
									<caption>도서관 리스트</caption>
									<thead>
										<tr>
											<th>도서관명</th>
											<th>주소(클릭 시 지도)</th>
											<th>도서관유형</th>
											<th>자료수(도서)</th>
											<th>전화번호</th>
											<th>홈페이지</th>
										</tr>
									</thead>
									<tbody>
									<c:if test="${empty librarys}">
											<tr>
												<td colspan="5">No data available</td>
											</tr>
										</c:if>
										<c:forEach items="${librarys}" var="library" varStatus="status">
											<tr>
												<td>${library.name}</td>
												<td><a class="btn btn-primary"
													href="map?address=${library.address}">${library.address}</a>
												</td>
												<td>${library.type}</td>
												<td>${library.count}</td>
												<td>${library.phoneNum}</td>
												<td><a href="${library.homePage}" target="_blank">홈페이지</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<ul class="pagination">
								<li class="paginate_button page-item previous disabled"
									id="example_previous"><a aria-controls="example"
									aria-disabled="true" aria-role="link" data-dt-idx="previous"
									tabindex="0" class="page-link">이전</a></li>
								<li class="paginate_button page-item active"><a href="#"
									aria-controls="example" aria-role="link" aria-current="page"
									data-dt-idx="0" tabindex="0" class="page-link">1</a></li>
								<li class="paginate_button page-item "><a href="#"
									aria-controls="example" aria-role="link" data-dt-idx="1"
									tabindex="0" class="page-link">2</a></li>
								<li class="paginate_button page-item "><a href="#"
									aria-controls="example" aria-role="link" data-dt-idx="2"
									tabindex="0" class="page-link">3</a></li>
								<li class="paginate_button page-item "><a href="#"
									aria-controls="example" aria-role="link" data-dt-idx="3"
									tabindex="0" class="page-link">4</a></li>
								<li class="paginate_button page-item "><a href="#"
									aria-controls="example" aria-role="link" data-dt-idx="4"
									tabindex="0" class="page-link">5</a></li>
								<li class="paginate_button page-item next" id="example_next"><a
									href="#" aria-controls="example" aria-role="link"
									data-dt-idx="next" tabindex="0" class="page-link">다음</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</section>
<section id="contact">
	<section class="button-style">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12 center-col text-center">
					<div class="row gx-4 justify-content-center">
						<h2>Contact</h2>
						<p class="lead">네비바가 아니어도 리뷰 게시물들을 볼 수 있게 버튼링크를 만들었습니다.</p>
						<p class="lead">각 장르에 맞게 리뷰 버튼이 구현되어 있으며 동시에 맨위로 가기 버튼 또한 구현되어
							있습니다.</p>
						<p class="lead">공연 리뷰보기 할 시 공연리뷰 페이지로 갑니다.</p>
						<p class="lead">맨위로 가기 할 시 맨위로 가게 됩니다.</p>
						<a href="BoardServlet?command=board_list"
							class="highlight-button btn btn-large button xs-margin-bottom-five"
							data-abc="true"><i class="fa fa-comment"></i>공연 리뷰보기</a> <a
							href="#"
							class="highlight-button btn btn-large button xs-margin-bottom-five"
							data-abc="true"><i class="fa fa-comment"></i>맨위로 가기</a>
					</div>
				</div>
			</div>
		</div>
	</section>
</section>
<footer class="py-4 bg-dark">
	<div class="container px-3">
		<h2>Contact</h2>
		<p class="m-0 text-center text-white">Copyright © Your Website
			2023</p>
	</div>
</footer>
</body>


</body>

<footer class="footer"> </footer>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</html>
