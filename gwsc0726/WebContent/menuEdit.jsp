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
   <script type="text/javascript" src="./js/validate/jquery.validate.js"></script>
   <script src="./js/validate/messages_cn.js" type="text/javascript"></script>
   <script src="./js/validate/resourceValidate.js" type="text/javascript"></script>
   
   <script type="text/javascript">
      $(function(){
        $("#submitBtn").click(function(){
        	if($("#resource_form").validate()){
				$("#resource_form").submit();        		
        	}
        });
        	
        if($('#parId').val() == 0){
        	$('#parentId').find("option[text='0']").attr("selected",true);
        	$('#parentId').attr("disabled",true);
        }
        $('#levels').change(function(){
        	if($(this).val() == 1){
        		$('#parentId').val(0);
        		$('#parentId').find("option[text='0']").attr("selected",true);
        		$('#parentId').attr("disabled",true);
        	}else{
        		$('#parentId').attr("disabled",false);
        	}
        })
      });
   </script>
   <title>菜单修改</title>
 </head>
 <body>
  <div class="container">
     <div id="forms" class="mt10">
        <div class="box">
          <div class="box_border">
          	<form action="menu/update" class="jqtransform" method="post" id="resource_form">
            <div class="box_top"><b class="pl15">修改资源</b></div>
            <div class="box_center">
               <input type="hidden" id="id" name="id" value="${resource.id }">
               <input type="hidden" id="parId" name="parId" value="${resource.parentid }">
               <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
               	<tr>
                  <td class="td_right">序号：</td>
                  <td class=""> 
                    <input type="text" id="codeNo" name="codeno" class="input-text lh30 input-text-right" size="40" value="${resource.codeno }">
                  </td>
                </tr>
                 <tr>
                  <td class="td_right">名称：</td>
                  <td class=""> 
                    <input type="text" id="name" name="name" class="input-text lh30 input-text-right" size="40" value="${resource.name }">
                  </td>
                </tr>
                <tr>
                  <td class="td_right">级别：</td>
                   <td class=""> 
                  <select name="levels" id="levels" style="height: 25px;width: 150px;border: 1px solid #ccc;">
                  	<c:choose>
						<c:when test="${resource.levels eq 1}">
							<option value="1" selected="selected">一级菜单</option>
							<option value="2">二级菜单</option>
						</c:when>
						<c:otherwise>
							<option value="1">一级菜单</option>
							<option value="2" selected="selected">二级菜单</option>
						</c:otherwise>
					</c:choose>
                  </select>
                  	</td>
                </tr>
                 <tr>
                  <td class="td_right">父级资源：</td>
                  <td class=""> 
                    <select name="parentid" id="parentId" style="height: 25px;width: 150px;border: 1px solid #ccc;">
                    
                    	<option value="0" >一级菜单选择此项</option>
                    	<c:forEach var="res" items="${resources}">
              			<c:choose>
						<c:when test="${res.id == resource.parentid}">
						<option  value="${res.id}" selected="selected">${res.name}</option>
						</c:when>
						<c:otherwise>
							<option value="${res.id}">${res.name}</option>
						</c:otherwise>
					</c:choose>
					</c:forEach>
                    </select>
                  </td>
                </tr>
                 <tr>
                  <td class="td_right">资源url：</td>
                  <td class=""> 
                    <input type="text" name="url" id="url" class="input-text lh30 input-text-right" size="40" value="${resource.url }">
                  </td>
                </tr>
                 <tr>
                   <td class="td_right">&nbsp;</td>
                   <td class="">
                     <input type="button" id="submitBtn" name="submitBtn" class="btn btn82 btn_save2" value="提交">
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
