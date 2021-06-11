<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getServletContext().getRealPath("/upload");
MultipartRequest mr = new MultipartRequest(request, path, 100 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>업로드 된 정보 보기</h1>

	<h2>
		<li>올린 사람 : <%=mr.getParameter("name")%></li>
		<li>올린 사람 : ${param.name}</li>
		<li>파일 원본 이름 :<%=mr.getOriginalFileName("f_name")%></li>
		<li>파일 저장 이름 :<%=mr.getFilesystemName("f_name")%></li>
		<li>파일 타입:<%=mr.getContentType("f_name")%></li>
		<hr>

		<%
		File file = mr.getFile("f_name");
		%>
		<li>파일 이름 : <%=file.getName()%></li>
		<li>파일 크기 : <%=file.length() / 1024%>KB
		</li>
		<li>수정 날짜 : <%=file.lastModified()%></li>
		<!-- 위 숫자는 1970101.0.0.0부터 현재시간까지 날짜를 수치화 한것. -->

		<%
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		%>




		<li>수정 날짜 : <%=format.format(file.lastModified())%></li> <img alt=""
			src="../upload/<%=file.getName()%> %>" style="width: 100px">
		<hr>

		 <li>다운로드 : <a href="download.jsp?path=upload&f_name=<%=file.getName()%>"><%=file.getName() %></a></li>



	</h2>



</body>
</html>