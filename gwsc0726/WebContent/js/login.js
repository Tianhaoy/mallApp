
function getEvent(){
	if(document.all){
	   return window.event;
	}
	
	func=getEvent.caller;
	
	while(func!=null){
		var arg0=func.arguments[0];
		if(arg0){
			if((arg0.constructor==Event || arg0.constructor ==MouseEvent)
					||(typeof(arg0)=="object" && arg0.preventDefault && arg0.stopPropagation)){
				return arg0;
			}
		}
		func=func.caller;
	}
	return null;
}

function enter(){
	var event = getEvent();
	if(event.keyCode == 13){
		checkLogin();
	}
}
function checkLogin() {
	if ($("#signup_name").val() == "") {
        alert("用户名不能为空");
    } else if ($("#signup_password").val() == "") {
    	alert("密码不能为空");
    } else {
    	$("#signup_form").submit();
    }
}
$(function(){
    $('.login-btn').click(function(){
    	checkLogin();
    });
});