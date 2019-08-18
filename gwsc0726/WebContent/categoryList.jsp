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
			window.location = "<%=basePath%>categoryAdd.jsp";
        });
      }); 

      function del(id) {
  		if (confirm("确定删除记录吗？")) {
  			window.location = "<%=basePath%>category/delete?id=" + id;
  		}
      }
   </script>
   <title>分类列表</title>
 </head>
 <body>

  <div class="container"> 
     <div id="button" class="mt10">      
       <form id="form1" name="form1" method="post" action="category/ajaxselect1">
       <input type="button" id="btn_add" name="btn_add" class="btn btn82 btn_add" value="新增">
       <h>分类名查询：</h>
       <input type="text" name="name" id="name" />
       <input type="submit"  class="btn btn82 btn_add" value="查询1">
       </form >
       <form id="form2" name="form2" method="post" action="category/selecttype">
       &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<h>分类类型查询：</h>
       <label>
                	<select name="type" id="type">
                	<option value="" selected="selected">--请选择--</option>
                	 <option value="水果蔬菜">水果蔬菜</option>
                	 <option value="肉禽蛋类">肉禽蛋类</option>
                	 <option value="水产海鲜">水产海鲜</option>
                	 <option value="烘焙熟食">烘焙熟食</option>
                	 <option value="粮油副食">粮油副食</option>
                	 <option value="零食酒水">零食酒水</option>
                	 <option value="乳品母婴">乳品母婴</option>
                	 <option value="衣服">衣服</option>
                	</select>
       </label>         
        <input type="submit"  class="btn btn82 btn_add" value="查询2">
       </form>
        </div>
     <h1 align="center">${msg }</h1>
     <div id="table" class="mt10">
        <div class="box span10 oh">
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table">
              <tr>             	  
	              <th>分类名</th>
	              <th>分类类型</th>
	              <th>分类图片</th>
	              <th>操作</th>
              </tr>
              <c:choose>
              	<c:when test="${categorys == null || fn:length(categorys) == 0}">
              		<tr>
	                   	<th width="30" colspan="3">暂无数据</th>
                    </tr>
              	</c:when>
              	<c:otherwise>
              		<c:forEach items="${categorys}" var="c" >
              			<tr class="tr">            			
		                   	<td align="center">${c.name}</td>
		                   	<td align="center">${c.type}</td>
							<td align="center"><img width="50" height="50" src="<%=basePath%>images/cphoto/${c.photo}"></td>
                    		<td align="center">
		                   		<a href="category/edit?id=${c.id}">修改</a>
		                   		|
		                   		<a href="javascript:del('${c.id}');">删除</a>
		                   		                   		
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
