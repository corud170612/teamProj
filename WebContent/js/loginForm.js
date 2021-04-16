function checkEmpty(){
	let items = ['userEmail', 'userPw'];
	
	for(let item of items)
		if(IsEmpty(item)==false)
			return;
	
	document.getElementById('loginForm').submit();
}
function formSubmit(frmId, path){
   let loginForm = document.getElementById(frmId);
   loginForm.action=path;
   loginForm.submit();
}