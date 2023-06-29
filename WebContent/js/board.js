
function boardCheck(btn) {
	var form = btn.form;
	if (form.title.value.length == 0) {
	    alert("제목을 입력하세요");
	    return false;
	  }
	if (form.name.value.length == 0) {
	    alert("작성자를 입력하세요");
	    return false;
	  }
	  if (form.pass.value.length == 0) {
	    alert("비밀번호를 입력하세요");
	    return false;
	  }
	  if (form.content.value.length == 0) {
	    alert("내용을 입력하세요");
	    return false;
	  }
	  return true;
}

function openWindow(url,name) {
    window.open(url, name, "width=500, height=230");
}


function passCheck() {
  if (document.frm.pass.value.length == 0) {
    alert("비밀번호를 입력하세요");
    return false;
  }
  return true;
}
