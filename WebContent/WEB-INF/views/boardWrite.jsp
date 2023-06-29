<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-type" content="text/html"; charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>글 작성 페이지</title>
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
</head>
<body>
<div id="wrap">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <!-- 작성한 게시글을 데이터베이스에 추가 -->
        <div class="container">
        <h2>리뷰 작성 페이지<small>BoardWrite</small></h2>
        <form method="post" action="BoardServlet?command=board_write">
        	<div class="group">
        		<input type="text" name="title">
        		<span class="highlight"></span>
        		<span class="bar"></span>
        		<label>제목 Title *</label>
        	</div>
        	<div class="group">
        		<input type="text" name="name">
        		<span class="highlight"></span>
        		<span class="bar"></span>
        		<label>작성자 Name *</label>
        	</div>
        	<div class="group">
        		<input type="password" name="pass">
        		<span class="highlight"></span>
        		<span class="bar"></span>
        		<label>비밀번호 Password *</label>
        	</div>
        	<div class="group">
        		<input type="email" name="email">
        		<span class="highlight"></span>
        		<span class="bar"></span>
        		<label>이메일 Email</label>
        	</div>
        	<div class="group">
        		<textarea name="content" rows="5"></textarea>
        		<span class="highlight"></span>
        		<span class="bar"></span>
        		<label>내용 Content * </label>
        	</div>
            <input class="btn btn-outline-dark" type="submit" value="등록" onclick="return boardCheck(this)">
            <input class="btn btn-outline-dark" type="reset" value="다시작성하기">
            <input class="btn btn-outline-dark" type="button" value="취소" onclick="javascript:history.back()">
        </form>
        
        </div>
    </div>
</body>
</html>