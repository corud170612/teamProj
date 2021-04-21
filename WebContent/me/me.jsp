<%@page import="com.jjj.membership.MembershipDAO"%>
<%@page import="com.jjj.membership.Mymember"%>
<%@page import="com.jjj.Contents.FileuploadDAO"%>
<%@page import="com.jjj.DTO.AttachFile"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.jjj.Contents.ContentsWriteDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.jjj.DTO.Contents"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //out.print(request.getParameter("contents"));
    String content = request.getParameter("contents");
   Date now = new Date();
   SimpleDateFormat sf = new SimpleDateFormat("yyyy년MM월dd일 E요일 a hh:mm:ss");
   String today = sf.format(now);
   int myMemberId=123;
   if(session.getAttribute("myMemberId")!=null) {
      myMemberId=(Integer)session.getAttribute("myMemberId");
    }
   ContentsWriteDAO contentsDao = new ContentsWriteDAO();
   //Contents contents = contentsDao.getContents(request, myMemberId, content, today);
   Contents contents = contentsDao.getContents(request, today, content, myMemberId);
   Connection conn = contentsDao.getConn();
   contentsDao.Insert(conn, contents); 
   //List<Contents> boardLst = (List<Contents>)request.getAttribute("boardLst");
   
   List<Contents> lst = contentsDao.getBoardList(conn, myMemberId);
   session.setAttribute("contentsLst", lst);

   List<Contents> boardLst = (List<Contents>)session.getAttribute("contentsLst");
   
   //String uploadFilePath = request.getServletContext().getRealPath("myMemberProfilePhoto");
   // 사진이 저장되는 경로
   // 폴더 명 + 사진이 저장되는 경로

   AttachFile attachFile = new AttachFile(); // 
   FileuploadDAO fileuploadDAO = new FileuploadDAO();
    Connection connection = fileuploadDAO.getConn();
    
   //String profpath = request.getContextPath()+"/myMemberProfilePhoto/" + myCoverPhoto;
   
   ////String uploadFilePath = request.getServletContext().getRealPath("myMemberProfilePhoto");
   /* System.out.print("파일 경로 : " +(AttachFile)session.getAttribute("af") + "<br/>"); */
   AttachFile af = (AttachFile)session.getAttribute("af");
   if(af == null) {
      af = new AttachFile();
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta name = "viewport" content="width=device-width" />
<meta charset="UTF-8">
<title>MBTI 커뮤니티</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/cssReset.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/header.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/me.css"/>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/me.js"></script>
<script type="text/javascript">
function formSubmit(frmId, nextPath){
      let frm = document.getElementById(frmId);
      frm.action = nextPath;
      frm.submit();
   }
</script>

<style>

#myWallPhoto{background:url('/20210406/myMemberProfilePhoto/<%=af.getAttachedfile1()%>');background-size:cover;
background-repeat:no-repeat;background-position:50% 50%;border-bottom:1px solid #ccc}
</style>
</head>
<body>
<input type="hidden" name="currentPage" value="me" />
<div id="container">
   <div id="center">
      <div id="myWallPhoto"></div>
      <div id="myProfilePhoto">
        <%-- <img src="<%=request.getContextPath() %>/images/me/pro.PNG" /> --%>
        <img src="/20210406/myMemberProfilePhoto/<%=af.getAttachedfile2() %>" />
      
      </div>
      <p id="name">라이언</p>
<!--       <div class="myButtonBox">
         <form id="frm" name="photo" method="post" enctype="multipart/form-data">
            
            <input type="hidden" name="mode" value="photo" />
            
             <div class = "photoBox">
               <p>배경사진 바꾸기</p>
            </div>
         </form>
      </div> -->
      
      <div class="myButtonBox">
         <%-- <form name="photo" method="post" action="<%=request.getContextPath()%>/me/ProfileProc.jsp" --%>
         <form name="photo" method="post" action="<%=request.getContextPath()%>/me/ProfileProc.jsp" enctype="multipart/form-data">
            <div class="photoBox">
               상　단 <input type="file" name="myProfilePhoto" class="photoSelectorBtn" /> 
            </div>
            <div class="photoBox">
               프로필 <input type="file" name="myCoverPhoto" class="photoSelectorBtn"/>
            </div>
            <input type="hidden" name="mode" value="photo" />
            
            <div class = "photoBox">
            <p><!-- 사진 바꾸기 --></p>
               <button type="submit" <%-- onclick="formSubmit('frm', '<%=request.getContextPath()%>/me/ProfileProc.jsp')"  --%>id="myCoverPhotoUploadBtn">　저장　</button>
            </div>
         </form>
      </div>

      <div class="myButtonBox">
      <form name="write" method="post" action="<%=request.getContextPath() %>/me/ContentsForm.jsp">
         <div id="writing" align="right">
               <input type="submit" id="mePostBtn" value="글쓰기" />
         </div>
      </form>
      </div>
<!--       <div id="myContent">
         <div id="writing">
            <div class="me">
               <img src="./images/me/pro.PNG" />
                  <p>라이언</p>
            </div>
            <textarea maxlength="500" id="meContent"></textarea>
            <div id="inputBox">
               <input type="button" id="mePostBtn" value="게시" />
            </div>
         </div> -->
         

         <%
         for(Contents c : boardLst){
       %>
         
      <div class="reading">
         <div class="writerArea">
            <img src="/20210406/myMemberProfilePhoto/<%=af.getAttachedfile2() %>" />
            <div class="writingInfo">
            <p>라이언  </p>
            <div class="writingDate"></div>
         </div>
      </div>
         <%=c.getRegtime() %>      
      <span class="content">   
         <%=c.getContent() %>
      </span>
      
      
<!--       <div class="likeArea">
         <div class="likeNum likes861225" style="background:#fff">공감수 : 250</div>
         <div class="likeBtn" id="likes861225">공감하기</div>
         <div class="contentsID">콘텐츠 번호: 861225</div>
      </div> -->
      
<!--        <div class="myCommentArea myCommentAtra861225">
         <div class="commentBox">
            <img src="../images/me/pro.PNG" />
            <p class="commentRegTime">2021년 04월 10일</p>
            <p class="commentPoster">댓글 작성자</p>
            <p class="writtenComment">네네네</p> 
         </div>
      </div>  -->
<!--       <div class="likeArea">
         <div class="likeNum likes861225" style="background:#fff">공감수 : 250</div>
         <div class="likeBtn" id="likes861225">공감하기</div> -->
            <div class="contentsID">
               <input type="hidden" name="contentsid" value="<%=c.getContentsid()%>"/>
            </div>
      </div> 

<%
}
%>
      
      <div class="regCommentBox">
      </div>
    </div>
</div>
<div id="noContents">
   더 이상 콘텐츠가 없습니다.
</div>
   <input type="hidden" name="page" id="page" value="1" />
</div>
</body>
</html>