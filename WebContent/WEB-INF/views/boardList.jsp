<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../common/navigation.jspf"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-type" content="text/html" ; charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1  maximum-scale=1, user-scalable=no">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<title>Insert title here</title>
<style>
HTML CSSResult Skip Results Iframe
EDIT ON
body {
  padding:1.5em;
  background: #f5f5f5
}

table {
  border: 1px #a39485 solid;
  font-size: .9em;
  box-shadow: 0 2px 5px rgba(0,0,0,.25);
  width: 100%;
  border-collapse: collapse;
  border-radius: 5px;
  overflow: hidden;
}

th {
  text-align: left;
}
  
thead {
  font-weight: bold;
  color: #fff;
  background: #262626;
}
  
 td, th {
  padding: 1em .5em;
  vertical-align: middle;
}
  
 td {
  border-bottom: 1px solid rgba(0,0,0,.1);
  background: #fff;
}

a {
  color: #73685d;
}
  
 @media all and (max-width: 768px) {
    
  table, thead, tbody, th, td, tr {
    display: block;
  }
  
  th {
    text-align: right;
  }
  
  table {
    position: relative; 
    padding-bottom: 0;
    border: none;
    box-shadow: 0 0 10px rgba(0,0,0,.2);
  }
  
  thead {
    float: left;
    white-space: nowrap;
  }
  
  tbody {
    overflow-x: auto;
    overflow-y: hidden;
    position: relative;
    white-space: nowrap;
  }
  
  tr {
    display: inline-block;
    vertical-align: top;
  }
  
  th {
    border-bottom: 1px solid #a39485;
  }
  
  td {
    border-bottom: 1px solid #e5e5e5;
  }
  }
  /* BACKGROUND MOVE */
.button-background-move {
  font-size: 16px;
  font-weight: 200;
  letter-spacing: 1px;
  padding: 13px 20px 13px;
  outline: 0;
  border: 1px solid black;
  cursor: pointer;
  position: relative;
  background-color: rgba(0, 0, 0, 0);
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
}

.button-background-move:after {
  content: "";
  background-color: 
#8abaff
;
  width: 100%;
  z-index: -1;
  position: absolute;
  height: 100%;
  top: 7px;
  left: 7px;
  transition: 0.2s;
}

.button-background-move:hover:after {
  top: 0px;
  left: 0px;
}

@media (min-width: 768px) {
  .button-background-move {
    padding: 13px 50px 13px;
  }
}
</style>
</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
		
		
		<section id="about">
	<header>
		<img src="images/board.jpg" class="img-fluid" alt="...">
	</header>
	<div class="container">
	<h2>리뷰 리스트</h2>
		<div class="row">
			<div class="col-xs-12">
				<div class="table-wrapper"></div>
				<div class="btn-toolbar">
					<div class="btn-group focus-btn-group">
						<a href="BoardServlet?command=board_write_form" class="button-background-move" role="button" style="color:white"
						>
							<span class="glyphicon glyphicon-screenshot"></span> 글 작성하기
						</a>
					</div>
				</div>
				<table class="table table-bordered table-hover dt-responsive">
					<caption class="text-center">
						An example of a responsive table based on <a
							href="https://datatables.net/extensions/responsive/"
							target="_blank">DataTables</a>:
					</caption>
					<thead>
					<thead>
						<tr>
							<th>글번호</th>
							<th>글제목</th>
							<th>작성자</th>
							<th>작성날짜</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<c:forEach var="board" items="${list }">
							<tr>
								<td>${board.num }</td> <!-- 상세보기 board_view -->
								<td><a href="BoardServlet?command=board_view&num=${board.num }">${board.title }</a></td>
								<td>${board.name }</td>
								<td><fmt:formatDate value="${board.writeDate }" /></td>
								<td>${board.readCount }</td>
								<tr class="spacer"><td colspan="50"></td></tr>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5" class="text-center">Data retrieved from <a
								href="http://www.infoplease.com/ipa/A0855611.html"
								target="_blank">infoplease</a> and <a
								href="http://www.worldometers.info/world-population/population-by-country/"
								target="_blank">worldometers</a>.
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
	</section>
	
	<section id="services">
	<div class="container px-4 py-5 my-5">
		<div class="row gx-4 justify-content-center">
			<h2>About this page</h2>
			<p class="lead"> 이 페이지는 다른 누군가가 쓴 게시글들을 볼 수 있게 만들어진 페이지입니다.
							여러분들은 여기서 글번호에 해당된 각 게시물들을 제목, 작성자, 작성날짜, 조회수를 볼 수 있으며
							만일 좀더 상세한 글들을 보고 싶다하신다면 그 보고싶은 게시물의 '제목'을 클릭(밑줄쳐져있음)하여
							상세보기가 실현될 것입니다. 또한 자신이 글쓰기를 직접하고 싶어 하신다면 게시물들의 위에 있는 버튼
							'글 작성하기'를 클릭해 작성페이지로 가시면 됩니다. 현재 페이지는 공연 게시물의 리뷰 페이지이기에 
							여러분들은 여러분들이 경험한 공연에 관련된 연극, 뮤지컬, 전시 등에 대한 리뷰나 어떤 공연장, 문화원등에 가
							무엇을 경험했는지에 대한 것을 쓰는 것을 추천드립니다.</p>
			<div class="col-lg-6 mx-auto">
				<ul>
					<li>네비바에는 다른 리스트, 게시판모음 각 세션이 준비되어있습니다.</li>
					<li>각 링크를 타고 리스트에선 다른 장르에 관련된 정보들을 얻을 수 있을 것입니다.</li>
					<li>또한 게시판모음에서도 다양한 장르에 들어갈 수 있게 되어 있으니 여러분들이 원하시는
						장르에 선택하여 다른 사람들이 올린 리뷰를 볼 수 있을 것입니다.</li>
					<li>섹션별로 수직으로 위치조정 가능합니다.</li>
					<li>About Section 리뷰리스트를 볼 수 있습니다.</li>
					<li>현 섹션은 Service Section 설명글을 적어놨습니다.</li>
					<li>Contact Section은 존재하지 않습니다.</li>
					<li>설명글을 읽으시면 더 편하게 서비스를 이용할 수 있을 것입니다.</li>
				</ul>
			</div>
		</div>
	</div>
</section>
	<!-- footer class -->
	<footer class="py-5 bg-dark">
            <div class="container px-4"><p class="m-0 text-center text-white">Copyright © Your Website 2023</p></div>
        </footer>
</body>
</html>