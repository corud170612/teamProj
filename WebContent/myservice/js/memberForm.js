function sendMember(){
	let userName = document.getElementById(name);
	let userEmail = document.getElementById(email);
	let userPw = document.getElementById(pw);
	
	if(IsEmpty(name)==false) return;
	if(IsEmpty(email)==false) return;
	if(IsEmpty(pw)==false) return;	
	
	document.getElementById('signUpForm').submit();
	
	System.out.print(name);
}
function formSubmit(frmId, path){
   let signUpForm = document.getElementById(frmId);
   signUpForm.action=path;
   signUpForm.submit();
}