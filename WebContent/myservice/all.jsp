<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width" />
<meta charset="UTF-8">
<title>MBTI Ŀ�´�Ƽ</title>
<link rel="stylesheet" href="./css/cssReset.css" />
<link rel="stylesheet" href="./css/header.css" />
<link rel="stylesheet" href="./css/all.css" />
<link rel="stylesheet" href="./css/footer.css" />
<script type="text/javascript" src="./js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src=./js/all.js></script>
</head>
<body>
<!-- ���߿� header ���� �ڸ� -->
<div id="timeLine">
	<div id="container">
		<div id="writing">
		<div class="me">
			<img src="./images/me/happyCat.png" />
			<p>���¿�</p>
		</div>
		<textarea maxlength="500" id="meContent"></textarea>
		<div id="inputBox">
			<input type="button" id="mePostBtn" value="�Խ�" />
		</div>
	</div>
	<div class="reading">
		<div class="writerArea">
			<img src="./images/me/happyCat.png" />
			<div class="writingInfo">
				<p>���¿�</p>
				<div class="writingDate">2030�� 12�� 25��</div>
			</div>
		</div>
		
		
		<span class="content">�ݰ����ϴ�.</span>
		
		<div class="likeArea">
			<div class="likeNum likes861225" style="background:#fff">������ : 250</div>
			<div class="likeBtn" id="likes861225">�����ϱ�</div>
			<div class="contentsID">������ ��ȣ: 861225</div>
		</div>
		
		<div class="myCommentArea myCommentAtra861225">
			<div class="commentBox">
				<img src="./images/me/happyCat.png" />
				<p class="commentRegTime">2030�� 12�� 25��</p>
				<p class="commentPoster">���¿�</p>
				<p class="writtenComment">�ݰ����ϴ�.</p> 
			</div>
		</div>
		<div class="inputBox">
			<img src="./images/me/happyCat.png" />
			<input type="text" class="inputComment comments861225" placeholder="�ڸ�Ʈ �Է�" />
			<div class="regCommentBox">
				<input type="button" class="regCommentBtn" id="comments861225" value="�Խ�" />
			</div>
		</div>
 	</div>
</div>
<div id="noContents">
	�� �̻� �������� �����ϴ�.
</div>
	<input type="hidden" name="page" id="page" value="1" />
</div>
<aside id="advertiseBox">
	Advertisement
</aside>
<!-- ���߿� footer ���� �ڸ� -->
</body>
</html>