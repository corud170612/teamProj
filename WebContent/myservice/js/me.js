$(document).ready(function() {
	//게시물 입력 공간의 게시글 입력 폼
	var meContent = $('#meContent');
	
	//게시물 입력 공간의 게시 버튼
	var mePostBtn = $('#mePostBtn');
	
	//게시글 버튼 클릭 이벤트
	mePostBtn.click(function() {
		if(meContent.al() == ''){
			alert('내용을 입력하세요');
			meContent.focus();
			return false;
		}
		// 백엔드 프로젝트에서 게시물 등록 기능 구현
	})
}