<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
  <head>
    <title>My JSP 'login.jsp' starting page</title>
  </head>
  <body>
  <form action="dologin.jsp" method="post">
  <table border="1" cellspacing="0" cellpadding="0" align="center">
  <tr>
  <td>用户名：</td>
  <td><input type="text" name="userName" id="userName"/></td>
  </tr>
  <tr>
  <td>密码：</td>
  <td><input type="text" name="password" id="password"/></td>
  </tr>
  <tr>
  <td align="center"><input type="submit" name="btn" id="btn" value="登录"/></td>
  <td><a href="register.jsp" >注册</a></td>
  </tr>
  </table>
<div id="mess" style="color:red">
  <%
  String mess=(String)request.getAttribute("mess");
  if(mess!=null){
  out.print(mess);
  }
  
   %>
  
  </div>
  </form>
  </body>
</html>
