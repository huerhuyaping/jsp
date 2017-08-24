<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.News" %>
<%@ page import="dao.NewsDao" %>
<%@ page import="dao.impl.NewsDaoImpl" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'newsdetail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  
  <h1 align="center">添加新闻</h1>
  <form action="addnews.jsp" method="post">
  <table border="1" align="center">
  <tr><td>新闻标题</td>
  <td><input type="text" name="title" /></td>
  </tr>
  <tr><td>作者</td>
  <td><input type="text" name="author"/></td>
  </tr>
   </table>
  <input type="submit" name="btn" value="增加"/>
  </form>
  </body>
</html>
