<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.News" %>
<%@ page import="dao.NewsDao" %>
<%@ page import="service.NewsService" %>
<%@ page import="dao.impl.NewsDaoImpl" %>
<%@ page import="service.impl.NewsServiceImpl" %>
<%@ page import="util.Page"%>
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
 		String currPageNo = request.getParameter("currPageNo");
		NewsService newsService = new  NewsServiceImpl();
		Page newpage = new Page();
   		newpage = newsService.getNewsList((currPageNo==null||currPageNo.trim().equals(""))?1:Integer.parseInt(currPageNo), 2);
    	request.setAttribute("newpage", newpage);
    	request.getRequestDispatcher("newslist.jsp").forward(request,response);
  
   %>
  </body>
</html>
