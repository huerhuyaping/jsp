<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.News" %>
<%@ page import="dao.NewsDao" %>
<%@ page import="dao.impl.NewsDaoImpl" %>
<%@ page import="service.NewsService" %>
<%@ page import="service.impl.NewsServiceImpl" %>
<%@ page import="util.Page" %>
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
  request.setCharacterEncoding("utf-8");
  NewsDao newDao=new NewsDaoImpl();
  String author=request.getParameter("author");
  String title=request.getParameter("title");
  News news=new News();
  news.setAuthor(author);
  news.setTitle(title);
  newDao.add(news);
  request.getRequestDispatcher("pagecontrol.jsp").forward(request,response);
  
   %>
  </body>
</html>
