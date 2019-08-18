$().ready(function() {
	$("#dept_form").validate({
		rules : {
			deptname : {
				required : true
			}
		},
		messages : {
			deptname : {
				required : "机构名称不能为空"
			}
		}
	});
});