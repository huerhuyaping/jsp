<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.User" %>
<%@ page import="dao.UserDao" %>
<%@ page import="dao.impl.UserDaoImpl" %>
<%@ page import="service.NewsService" %>
<%@ page import="service.impl.NewsServiceImpl" %>
<%@ page import="util.Page"%>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
  <head>
    <title>My JSP 'control.jsp' starting page</title>
  </head>
  <body>
    <%
    request.setCharacterEncoding("utf-8");
    String userName=request.getParameter("userName");
    String password=request.getParameter("password");
    
   int result=0;
   if(userName==null||userName.trim().equals("")){
   		request.setAttribute("mess", "用户名不能为空");
   }else if(password==null||password.trim().equals("")){
   		request.setAttribute("mess", "密码不能为空");
   }else{
   		UserDao userDao=new UserDaoImpl();
   		result = userDao.login(userName, password);
   }
    
    if(result>0){
    	SimpleDateFormat formater=new SimpleDateFormat("yyyy-MM-dd");
		Date d=new Date();
		Page newpage = new Page();
		String time=formater.format(d);
		
    	session.setAttribute("username", userName);
    	session.setAttribute("time", time);
    	request.getRequestDispatcher("pagecontrol.jsp").forward(request,response);
    }else{
    	request.getRequestDispatcher("register.jsp").forward(request,response);
    }
     %>
  </body>
</html>
