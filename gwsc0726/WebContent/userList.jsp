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
        $("#btn_add").click(function(){
			window.location = "<%=basePath%>userAdd.jsp";
        });
      }); 

      function del(id) {
  		if (confirm("确定删除用户吗？")) {
  			window.location = "<%=basePath%>user/delete?id=" + id;
  		}
      }
   </script>
   <title>用户列表</title>
 </head>
 <body>
  <div class="container">
  
     <div id="button" class="mt10">
       <input type="button" id="btn_add" name="btn_add" class="btn btn82 btn_add" value="新增"> </div>
    
     <div id="table" class="mt10">
        <div class="box span10 oh">
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">
              <tr>
	              <th>用户名</th>
	              <th>状态</th>
	              <th>操作</th>
              </tr>
              <c:choose>
              	<c:when test="${users == null || fn:length(users) == 0}">
              		<tr>
	                   	<th width="30" colspan="3">暂无数据</th>
                    </tr>
              	</c:when>
              	<c:otherwise>
              		<c:forEach var="u" items="${users}">
              			<tr class="tr">
		                   	<td>${u.username}</td>
		                   	<td>${u.state eq 1 ? "正常" : "禁用"}</td>
		                   	<td align="center">
		                   		<a href="user/edit?id=${u.id}">修改</a>
		                   		<c:if test="${u.username != 'admin'}">
		                   		|
		                   		<a href="javascript:del('${u.id}');">删除</a>
		                   		</c:if>
		                   		<%-- | 
		                   		<a href="userRole.jsp?id=${u.id}">分配角色</a> --%>
		                   		
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
