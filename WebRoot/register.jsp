<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
  <head>
    <title>My JSP 'register.jsp' starting page</title>
    <script type="text/javascript" src="js/user.js"></script>
  </head>
  <body>
  
  <form action="control.jsp" method="post" onsubmit="return validate();">
  <table border="1" cellspacing="0" cellpadding="0" align="center">
  <tr>
  <td>用户名：</td>
  <td><input type="text" name="userName" id="userName"/></td>
  </tr>
  <tr>
  <td>输入登录密码：</td>
  <td><input type="text" name="password" id="password"/></td>
  </tr>
 <tr>
  <td>再次输入密码：</td>
  <td><input type="text" name="repassword" id="repassword"/></td>
  </tr>
  <tr>
  <td align="center"><input type="submit" name="btn" id="btn" value="注册"/></td>
  <td><div id="mess" style="color:red">
  <%
  String mess=(String)request.getAttribute("mess");
  if(mess!=null){
  out.print(mess);
  }
  
   %>
  
  </div></td>
  </tr>
  </table>

  </form>
  </body>
</html>
