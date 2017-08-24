function validate(){
	var userName=$("userName");
	var password=$("password");
	var repassword=$("repassword");
	var mess=$("mess");
	
	if(userName.value==""){
		mess.innerHTML="用户名不能为空";
		return false;
	}else if(password.value==""){
		mess.innerHTML="密码不能为空";
		return false;
	}else if(repassword.value==""){
		mess.innerHTML="确认密码不能为空";
		return false;
	}else if(password.value!=repassword.value){
		mess.innerHTML="两个输入密码不一致";
		return false;
	}
	return true;
}

//���id�����Ӧ�ı?���
function $(id){
	return document.getElementById(id);
}