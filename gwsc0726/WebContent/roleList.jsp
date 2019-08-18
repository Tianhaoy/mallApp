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
   <script src="js/zDialog.js" type="text/javascript" ></script>
   
   <script type="text/javascript">
      $(function(){  
        $("#btn_add").click(function(){
			window.location = "<%=basePath%>roleAdd.jsp";	
        });
      }); 

      function del(id) {
  		if (confirm("确定删除记录吗？")) {
  			window.location = "<%=basePath%>role/delete?id=" + id;
  		}
      }
      function getResource(id){
      	window.location = "<%=basePath%>role/rolemenu?id=" + id;
      }
   </script>
   <title>角色列表</title>
 </head>
 <body>
  <div class="container">
  
     <div id="button" class="mt10">
       <input type="button" id="btn_add" name="btn_add" class="btn btn82 btn_add" value="新增"> 
     </div>
    
     <div id="table" class="mt10">
        <div class="box span10 oh">
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">
              <tr>
	              <th>名称</th>
	              <th>操作</th>
              </tr>
              <c:choose>
              	<c:when test="${roles == null || fn:length(roles) == 0}">
              		<tr>
	                   	<th width="30" colspan="2">暂无数据</th>
                    </tr>
              	</c:when>
              	<c:otherwise>
              		<c:forEach var="role" items="${roles}">
              			<tr class="tr">
		                   	<td>${role.rolename}</td>
		                   	<td align="center">
		                   		<a href="role/edit?opt=update&id=${role.id}">修改</a>
		                   		|
		                   		<a href="javascript:del('${role.id}');">删除</a>
		                   		|
		                   		<a href="javascript:getResource('${role.id}');">分配资源</a>
		                   	</td>
                    	</tr>
              		</c:forEach>
              	</c:otherwise>
              </c:choose>
              </table>
        </div>
     </div>
   </div> 
 </body>
 </html>
