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
			window.location = "<%=basePath%>good/insertone";
        });
      }); 

      function del(id) {
  		if (confirm("确定删除记录吗？")) {
  			window.location = "<%=basePath%>good/delete?id=" + id;
  		}
      }
   </script>
   <title>商品列表</title>
 </head>
 <body>
  <div class="container">
  
     <div id="button" class="mt10">
       <input type="button" id="btn_add" name="btn_add" class="btn btn82 btn_add" value="新增"> </div>
    
     <div id="table" class="mt10">
        <div class="box span10 oh">
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">
              <tr>
              	  <th>商品图片</th>
	              <th>商品名</th>	
	              <th>分类ID</th>              
	              <th>旧单价</th>
	              <th>新单价</th>
	              <th>销售数量</th>
	              <th>规格</th>
	              <th>备注</th>
	              <th>排序</th>
				  <th>增加时间</th>
	              <th>操作</th>
              </tr>
              <c:choose>
              	<c:when test="${goods == null || fn:length(goods) == 0}">
              		<tr>
	                   	<th width="30" colspan="3">暂无数据</th>
                    </tr>
              	</c:when>
              	<c:otherwise>
              		<c:forEach items="${goods}" var="g" >
              			<tr class="tr">
              			<td align="center"><img width="50" height="50" src="<%=basePath%>images/gphoto/${g.photo}"></td>
		                   	<td align="center">${g.name}</td>
		                   	<td align="center">${g.cid }</td>
		                   	<td align="center">${g.oldprice}</td>
		                   	<td align="center">${g.newprice}</td>
		                   	<td align="center">${g.num}</td>
		                   	<td align="center">${g.standard}</td>
		                   	<td align="center">${g.remark}</td>
		                   	<td align="center">${g.sort}</td>
		                   	<td align="center">${g.createdate}</td>	                   	
		                   	<td align="center">
		                   		<a href="good/edit?id=${g.id}">修改</a>
		                   		|
		                   		<a href="javascript:del('${g.id}');">删除</a>
		                   		                   		
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
