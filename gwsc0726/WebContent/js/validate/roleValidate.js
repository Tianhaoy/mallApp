$().ready(function() {
	$("#role_form").validate({
		rules : {
			rolename : {
				required : true
			}
		},
		messages : {
			rolename : {
				required : "角色名称不能为空"
			}
		}
	});
});