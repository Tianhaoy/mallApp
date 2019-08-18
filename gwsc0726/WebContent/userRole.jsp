<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 <!doctype html>
 <html lang="zh-CN">
 <head>
  <base href="<%=basePath%>">
   <meta charset="UTF-8">
   <link rel="stylesheet" href="css/common.css">
   <link rel="stylesheet" href="css/main.css">
   <script src="js/jquery-1.8.3.min.js" type="text/javascript" ></script>
   <script type="text/javascript" src="js/colResizable-1.3.min.js"></script>
   <script type="text/javascript" src="js/common.js"></script>
   
   <script type="text/javascript">
      $(function(){
        $("#submitBtn").click(function(){
			$("#user_role_form").submit();
        });
      }); 
   </script>
   <title>用户角色分配</title>
 </head>
 <body>
  <div class="container">
     <div id="forms" class="mt10">
        <div class="box">
          <div class="box_border">
          	<form action="user/updaterole" class="jqtransform" method="post" id="user_role_form">
          	<input type="hidden" name="id" value="${requestScope.u.id }">
            <div class="box_top"><b class="pl15">分配角色 </b></div>
            <div class="box_center">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">
                 <thead>
                 <tr>
	              	<th style="width:4%">&nbsp;</th>
	              	<th>角色名称</th>
              	</tr>
              	</thead>
          		<tbody>
          		    <c:forEach var="role" items="${requestScope.roles }">
          			<tr><td class="td_center"><input type="radio" name="roleid" ${role.id eq u.roleid?"checked":"" } value="${role.id }"></td><td>${role.rolename}</td></tr>
          		    </c:forEach>
          		</tbody>
          		 <tr>
                   <td class="td_right">&nbsp;</td>
                   <td class="">
                     <input type="button" id="submitBtn" name="submitBtn" class="btn btn82 btn_save2" value="保存">
                    <input type="reset" name="button" class="btn btn82 btn_res" value="重置">
                   </td>
                 </tr>
                  </table>
            </div>
          	</form>
          </div>
        </div>
     </div>
   </div> 
 </body>
 </html>
