$(document).ready(function() {
	
	//게시물 입력 공간의 게시글 입력 폼
	var meContent = $('#meContent');
	
	//게시물 입력 공간의 게시 버튼
	var mePostBtn = $('#mePostBtn');
	
	//[게시]버튼 클릭 이벤트
	mePostBtn.click(function(){
		if(meContent.val() == ''){
			alert("내용을 입력하세요");
			meContent.focus();
			return false;
		}
	});
});