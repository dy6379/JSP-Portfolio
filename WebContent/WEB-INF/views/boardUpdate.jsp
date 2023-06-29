<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>글 수정 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script type="text/javascript" src="js/board.js?v=1"></script>
<style>
* { box-sizing:border-box; }

/* basic stylings ------------------------------------------ */
body 				 { background:url(https://scotch.io/wp-content/uploads/2014/07/61.jpg); }
.container 		{ 
  font-family:'Roboto';
  width:600px; 
  margin:30px auto 0; 
  display:block; 
  background:#FFF;
  padding:10px 50px 50px;
}
h2 		 { 
  text-align:center; 
  margin-bottom:50px; 
}
h2 small { 
  font-weight:normal; 
  color:#888; 
  display:block; 
}
.footer 	{ text-align:center; }
.footer a  { color:#53B2C8; }

/* form starting stylings ------------------------------- */
.group 			  { 
  position:relative; 
  margin-bottom:45px; 
}
input,textarea 				{
  font-size:18px;
  padding:10px 10px 10px 5px;
  display:block;
  width:500px;
  border:none;
  border-bottom:1px solid #757575;
}
input:focus 		{ outline:none; }

/* LABEL ======================================= */
label {
  color: #999;
  font-size: 18px;
  font-weight: normal;
  position: absolute;
  pointer-events: none;
  left: 5px;
  top: 10px;
  transition: 0.2s ease all;
  -moz-transition: 0.2s ease all;
  -webkit-transition: 0.2s ease all;
}

/* active state */
input:focus ~ label,
input:valid ~ label,
textarea:focus ~ label,
textarea:valid ~ label {
  top: -20px;
  font-size: 14px;
  color: #5264AE;
}

/* BOTTOM BARS ================================= */
.bar 	{ position:relative; display:block; width:300px; }
.bar:before, .bar:after 	{
  content:'';
  height:2px; 
  width:0;
  bottom:1px; 
  position:absolute;
  background:#5264AE; 
  transition:0.2s ease all; 
  -moz-transition:0.2s ease all; 
  -webkit-transition:0.2s ease all;
}
.bar:before {
  left:50%;
}
.bar:after {
  right:50%; 
}

/* active state */
input:focus ~ .bar:before, input:focus ~ .bar:after {
  width:50%;
}

/* HIGHLIGHTER ================================== */
.highlight[for="content"] {
  position: absolute;
  height: 60%;
  width: 100px;
  top: 25%;
  left: 0;
  pointer-events: none;
  opacity: 0.5;
}

/* active state */
input[name="content"]:focus ~ .highlight[for="content"] {
  -webkit-animation: inputHighlighter 0.3s ease;
  -moz-animation: inputHighlighter 0.3s ease;
  animation: inputHighlighter 0.3s ease;
}

/* ANIMATIONS ================ */
@-webkit-keyframes inputHighlighter {
	from { background:#5264AE; }
  to 	{ width:0; background:transparent; }
}
@-moz-keyframes inputHighlighter {
	from { background:#5264AE; }
  to 	{ width:0; background:transparent; }
}
@keyframes inputHighlighter {
	from { background:#5264AE; }
  to 	{ width:0; background:transparent; }
}
</style>
<script type="text/javascript" src="js/board.js?v=1"></script>
</head>
<body>
	<div id="wrap" align="center">
		<h2>게시글 수정<small>Board Update</small></h2>
		<form name="frm" class="container" method="post" action="BoardServlet">
			<input type="hidden" value="board_update" name="command"> 
			<input type="hidden" value="${board.num }" name="num">
				
			<div class="group">
        		<input type="text" size="70" name="title" value="${board.title }">
        		<span class="highlight"></span>
        		<span class="bar"></span>
        		<label>제목 Title *</label>
        	</div>
			<div class="group">
        		<input type="text" size="12" name="name" value="${board.name }" required>
        		<span class="highlight"></span>
        		<span class="bar"></span>
        		<label>작성자 Name *</label>
        	</div>
        	<div class="group">
        		<input type="password" size="12" name="pass" value="${board.pass }" required>
        		<span class="highlight"></span>
        		<span class="bar"></span>
        		<label>비밀번호 *</label>
        	</div>
        	<div class="group">
        		<input type="text" size="40" name="email" value="${board.email }">
        		<span class="highlight"></span>
        		<span class="bar"></span>
        		<label>이메일 Email</label>
        	</div>
        	
        	<div class="group">
        		<textarea cols="70" rows="10" name="content">${board.content }</textarea>
        		<span class="highlight"></span>
        		<span class="bar"></span>
        		<label>내용 Content *</label>
        	</div>
        	<input class="btn btn-outline-dark" type="submit" value="수정 완료" onclick="return boardCheck(this)">
		<input class="btn btn-outline-dark" type="button" value="취소" onclick="location.href='BoardServlet?command=board_view&num=${board.num }'">
		</form>
		
	</div>
</body>
</html>