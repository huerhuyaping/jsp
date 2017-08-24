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
    
    <title>My JSP 'newslist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body align="center">
  <h1 align="center">新闻列表</h1>
  <br>
  <% 
  String username = (String)session.getAttribute("username");
  String time = (String)session.getAttribute("time");
  Page newpage = (Page)request.getAttribute("newpage");
  List<News> newslist =  (newpage==null) ? null: newpage.getNewsList();
   %>
  <h4>欢迎您：<%=username %></h4> <h4>当前时间：<%=time %></h4>
  <a href="newsadd.jsp">添加新闻</a>
  <br>
  <table border="1" align="center" width="880px">
  <thead>
  <th>编号</th>
  <th>新闻标题</th>
  <th>作者</th>
  <th>发布时间</th>
  <th>操作</th>
  </thead>
  <tbody>
  <%
   	for(News news:newslist){
  %>
  <tr>
  <td><%=news.getId() %></td>
  <td><%=news.getTitle()%></td>
  <td><%=news.getAuthor()%></td>
  <td><%=news.getCreateDate() %></td>
  <td><a href="newsdetail.jsp?id=<%=news.getId() %>&currPageNo=<%=newpage.getCurrPageNo()%>">修改</a>
  <a href="javascript:if(confirm('确认删除本条新闻吗？')) location='newsdel.jsp?id=<%=news.getId() %>&currPageNo=<%=newpage.getCurrPageNo()%>'">删除</a>
  </td>
  </tr>
  <%
  }
  %>
  </tbody>
  </table>
  <p align="center">
  
	   	 当前页数:[<%=newpage.getCurrPageNo() %>/<%=newpage.getTotalPageCount() %>]&nbsp;
	   	 <%
	   	 	if(newpage.getCurrPageNo() !=1){
	   	 	%>
	   	 	<a href="pagecontrol.jsp?currPageNo=1">首&nbsp;页</a>
	   	 	<a href="pagecontrol.jsp?currPageNo=<%=newpage.getCurrPageNo()-1%>">上一页</a>
	   	 	<% 	
	   	 	}else{
	   	 	%>
	   	 	<a href="javascript:void(0);" style="color:gray;">首&nbsp;页</a>
	   	 	<a href="javascript:void(0);" style="color:gray;">上一页</a>
	   	 	<%
	   	 	}
	   	 %>
	   	 
	   	 <%
	   	 	if(newpage.getCurrPageNo() < newpage.getTotalPageCount()){
	   	 	
	   	 	%>
	   	 	<a href="pagecontrol.jsp?currPageNo=<%=newpage.getCurrPageNo()+1%>">下一页</a>
	  		<a href="pagecontrol.jsp?currPageNo=<%=newpage.getTotalPageCount()%>">末页</a>
	   	 	
	   	 	<%
	   	 	}else {
	   	 	%>
	   	 	<a href="javascript:void(0);" style="color:gray;">下一页</a>
	   	 	<a href="javascript:void(0);" style="color:gray;">末页</a>
	   	 	<%
	   	 	}
	   	  %> 	
	
  	
  </p>
  </body>
</html>
