function inputCheck(usrName, usrEmail, usrPw, usrMbti, frmId, path){

	let name = document.getElementById(usrName);
    let email = document.getElementById(usrEmail);
    let pw = document.getElementById(usrPw);
    let mbti = document.getElementById(usrMbti);

	   if(name.value==""){
	      alert("이름을 입력하세요.");
	      name.focus();
	      return false;
	   }
	
	   if(email.value==""){
	      alert("이메일을 입력하세요.");
	      email.focus();
	      return false;
	   }
	
	   if(pw.value==""){
	      alert("비밀번호 입력하세요.");
	      pw.focus();
	      return false;
	   }
	
	   if(mbti.value==""){
	      alert("mbti 입력하세요.");
	      mbti.focus();
	      return false;
	   }

   let frm = document.getElementById(frmId);
   frm.action = path;
   frm.submit();
}
	
