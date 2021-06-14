<%@page contentType="text/html; charset=UTF-8"
	import="java.sql.*,java.io.*"%>
<%
	session.setAttribute("user_avatar","assets/module/img/security/user/avatar.jpg");

	session.setAttribute("wechat_server_address","www.cdylx.com");
%>
<script>
window.location.href="home/main/login.jsp";
</script>