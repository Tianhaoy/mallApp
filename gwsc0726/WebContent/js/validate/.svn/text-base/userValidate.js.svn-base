$().ready(function() {
	$("#user_form").validate({
		rules : {
			username : {
				required : true
			},
			password : {
				required : true,
				minlength : 6
			},
			passwordconf : {
				required : true,
				minlength : 6,
				equalTo : "#password"
			}
		},
		messages : {
			username : {
				required : "用户名不能为空"
			},
			password : {
				required : "请输入密码",
				minlength : jQuery.format("密码不能小于{0}个字 符")
			},
			passwordconf : {
				required : "请输入确认密码",
				minlength : "确认密码不能小于5个字符",
				equalTo : "两次输入密码不一致不一致"
			}
		}
	});
});