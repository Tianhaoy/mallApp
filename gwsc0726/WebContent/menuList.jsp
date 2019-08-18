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
			location.href = "<%=basePath%>menuAdd.jsp";
        });
      }); 

      function del(id) {
  		if (confirm("确定删除记录吗？")) {
  			window.location = "<%=basePath%>menu/delete?id=" + id;
  		}
      }
   </script>
   <title>菜单列表</title>
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
              	  <th>序号</th>
	              <th>名称</th>
	              <th>级别</th>
	              <th>资源url</th>
	              <th>操作</th>
              </tr>
              <c:choose>
              	<c:when test="${resources == null || fn:length(resources) == 0}">
              		<tr>
	                   	<th width="30" colspan="5">暂无数据</th>
                    </tr>
              	</c:when>
              	<c:otherwise>
              		<c:forEach var="resource" items="${resources}">
              			<tr class="tr">
		                   	<td>${resource.codeno}</td>
		                   	<td>${resource.name}</td>
		                   	<td>${resource.levels eq 1 ? "一级菜单" : "二级菜单"}</td>
		                   	<td>${resource.url}</td>
		                   	<td align="center">
		                   		<a href="menu/edit?id=${resource.id}">修改</a>
		                   		|
		                   		<a href="javascript:del('${resource.id}');">删除</a>
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
