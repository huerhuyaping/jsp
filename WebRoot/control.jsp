<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.User" %>
<%@ page import="dao.UserDao" %>
<%@ page import="dao.impl.UserDaoImpl" %>
<html>
  <head>
    <title>My JSP 'control.jsp' starting page</title>
  </head>
  <body>
    <%
    request.setCharacterEncoding("utf-8");
    String userName=request.getParameter("userName");
    String password=request.getParameter("password");
    String repassword=request.getParameter("repassword");
    
    User user=new User();
    user.setUserName(userName);
    user.setPassword(password);
   int result=0;
   if(user.getUserName()==null||user.getUserName().trim().equals("")){
   		request.setAttribute("mess", "用户名不能为空");
   }else if(user.getPassword()==null||user.getPassword().trim().equals("")){
   		request.setAttribute("mess", "密码不能为空");
   }else if(repassword==null||repassword.trim().equals("")){
   		request.setAttribute("mess", "确认密码不能为空");
   }else if(!user.getPassword().equals(repassword)){
   		request.setAttribute("mess", "两次输入密码不一致");
   }else{
   		UserDao userDao=new UserDaoImpl();
   		result=userDao.addUser(user);
   }
    
    if(result>0){
    	response.sendRedirect("login.jsp");
    }else{
    	request.getRequestDispatcher("register.jsp").forward(request,response);
    }
     %>
  </body>
</html>
