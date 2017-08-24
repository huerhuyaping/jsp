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
  <% 
  NewsDao newsDao=new NewsDaoImpl(); 
  String id=request.getParameter("id"); 
  News news=newsDao.getById(id); 
  String currPageNo = request.getParameter("currPageNo");
   %>
  <h1 align="center">新闻详情</h1>
  <form action="newsupdate.jsp" method="post">
  <table border="1" align="center">
  <input type="hidden" name="currPageNo" value="<%=currPageNo%>"/>
  <tr><td>新闻标题</td>
  <td><input type="text" name="title" value="<%=news.getTitle() %>"/>
  </td>
  </tr>
  <tr><td>作者</td>
  <td><input type="text" name="author" value="<%=news.getAuthor() %>"/></td>
  </tr>
  <tr><td colspan="2">
  <input type="hidden" name="id" value="<%=id%>"/>
  <input type="submit" name="btn" value="修改"/></td></tr>
  </table>
  </form>
  </body>
</html>
