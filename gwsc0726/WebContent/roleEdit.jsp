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
   <script type="text/javascript" src="js/validate/jquery.validate.js"></script>
   <script src="js/validate/messages_cn.js" type="text/javascript"></script>
   <script src="js/validate/roleValidate.js" type="text/javascript"></script>
   <script type="text/javascript">
      $(function(){
        $("#submitBtn").click(function(){
        	if($("#role_form").validate()){
				$("#role_form").submit();
        	}
        });
      }); 
   </script>
   <title>角色管理</title>
 </head>
 <body>
  <div class="container">
     <div id="forms" class="mt10">
        <div class="box">
          <div class="box_border">
          	<form action="role/update" class="jqtransform" method="post" id="role_form">
            <div class="box_top"><b class="pl15">新增角色</b></div>
            <div class="box_center">
               <input type="hidden" id="id" name="id" value="${r.id }">
               <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
               
                 <tr>
                  <td class="td_right">名称：</td>
                  <td class=""> 
                    <input type="text" name="rolename" value="${r.rolename }" id="rolename" class="input-text lh30 input-text-right" size="40">
                  </td>
                 <tr>
                   <td class="td_right">&nbsp;</td>
                   <td class="">
                     <input type="button" id="submitBtn" name="submitBtn" class="btn btn82 btn_save2" value="提交">
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
