<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!doctype html>
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" type="text/css"
	href="./js/jTree/css/SimpleTree.css" />
<script type="text/javascript" src="./js/jTree/js/jquery-1.6.min.js"></script>
<script type="text/javascript" src="./js/jTree/js/SimpleTree.js"></script>

<script type="text/javascript">
	$(function() {
		
		 $.ajax({
	    	  url:"rolemenu/ajaxselect",
	    	  type:"post",
	    	  data:{roleid:$("#roleid").val()},
	    	  cache:false,
	    	  dataType:"jsonp", //指定实现ajax的方式，有两种json和jsonp,默认是json,json是struts ajax的实现方式
	    	  //指定通过ajax从类中带过来的数据在页面中通过哪一个函数执行
	          success:function(d){
	        	 /* var allmenu=document.getElementsByName("menuids");
	        	  for(var i=0;i<allmenu.length;i++){
	        	      for(var j=0;j<d.list.length;j++){
	        	    	  if(parseInt(allmenu[i].value)==d.list[j].menuid){
	        	    		  allmenu[i].checked=true;
	        	    	  }
	        	      }
	        	  }*/
	        	
	        	  $.each(d.list,function(i,item){
	        		  $(":checkbox[name='menuids'][value='" + item.menuid + "']").prop("checked", "checked");
	        	  });
	          }
	    	  
	    })
		
		
		
		//laydate.skin('danlan');
		$("#submitBtn").click(function() {
			$("#opt").val("role_resource");
			$("#role_resource_form").submit();
		});
		$(".st_tree").SimpleTree({
		/* 可无视代码部分*/

		});
	});

	function isCheck(e) {
		var oBox = e.parentNode.parentNode.getElementsByTagName('input');
		for (var i = 1; i < oBox.length; i++) {
			if (e.checked) {
				oBox[i].checked = true;
			} else {
				oBox[i].checked = false;
			}
		}
	}

	function isChild(e) {
		e.parentNode.parentNode.parentNode.getElementsByTagName('input')[0].checked = true;
	}
</script>
<title>Document</title>
</head>
<body>
	<div class="container">
		<div id="forms" class="mt10">
			<div class="box">
				<div class="box_border">
					<form action="rolemenu/insert" class="jqtransform" method="post"
						id="role_resource_form">
						<div class="box_top">
							<b class="pl15">分配资源 </b>
						</div>
					 <input type="hidden" id="roleid" name="roleid" value="${roles.id }">
						<div class="st_tree" style="width:400px;margin:50 auto;">
							
<%-- 								<c:forEach var="item" items="${maps}">
									<ul>
										<li><input type="checkbox" name="menuids" value="${item.key.id}" onclick="isCheck(this)"><a href="#"><b>${item.key.name}</b></a></li>
										 <ul show="true">
										        <c:forEach var="sonmenu" items="${item.value}">				
											    	<li><input type="checkbox" name="menuids" value="${sonmenu.id }" onclick="isChild(this)"><a href="#">${sonmenu.name }</a></li>
											   </c:forEach>	
		
										</ul>
								    </ul>
								    </c:forEach> --%>
								    
								    <c:forEach var="item" items="${parentMenus}">
									<ul>
										<li><input type="checkbox" name="menuids" value="${item.id}" onclick="isCheck(this)"><a href="#"><b>${item.name}</b></a></li>
										 <ul show="true">
										        <c:forEach var="sonmenu" items="${sonMenus}">	
			                                       <c:if test="${item.id eq sonmenu.parentid }">
											    	     <li><input type="checkbox" name="menuids" value="${sonmenu.id }" onclick="isChild(this)"><a href="#">${sonmenu.name }</a></li>
											        </c:if>
											   </c:forEach>	
		
										</ul>
								    </ul>
								    </c:forEach>

					
						</div>
						<input type="button" id="submitBtn" name="submitBtn"
							class="btn btn82 btn_save2" value="保存"> <input
							type="reset" name="button" class="btn btn82 btn_res" value="重置">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
