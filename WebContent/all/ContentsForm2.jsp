<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<meta name = "viewport" content="width=device-width" />
<meta charset="UTF-8">
<title>MBTI 커뮤니케이션</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/cssReset.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/header.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/footer.css" />

<style>
#myWallPhoto{background:url('/20210406/images/me/back.PNG');background-size:cover;
background-repeat:no-repeat;background-position:50% 50%;border-bottom:1px solid #ccc}
</style>
</head>
<header>
   <%@ include file="../common/top.jsp" %>
</header>
<center>
<form action="<%=request.getContextPath() %>/all/ContentsProc2.jsp" >
<table style="width: 650px; ">

	<tr>
<!-- 		<td  style="width: 50px; height:100px;" align="right">제 목</td>
		<td style="width: 1000px; height:100px;">
			<input type=text name='title' style="width: 750px; height:30px; "/> 
		<input type="radio" name="radioBtn" value="open" /> 전채공개
			<input type="radio" name="radioBtn" value="close"/>비공개
		</td> -->
	</tr>
	<tr>
		<td colspan=2 align="right"><br/><br/><textarea name="contents" style="width: 1000px; height: 500px"></textarea></td>
	</tr>
	<tr>
		<td align='right' height=40 colspan=2>
			<input type=file name="uploadFile" style="width: 300px; "/> 
		</td>
	</tr>
	<tr>
		<td align='center' height=40 colspan=2>
			<input type=submit  value='글쓰기' style="width: 200;  height:50px"/>
			<input type=reset value='취소' style="width: 200px; height:50px"/>	 
		</td>
	</tr>
</table>
</form>
</center>