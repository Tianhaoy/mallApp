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
   <link rel="stylesheet" href="./js/jQueryUI/css/ui-lightness/jquery-ui-1.9.2.custom.min.css">
   	<link type="text/css" rel="stylesheet" href="./js/uploadify/uploadify.css" />
   <link rel="stylesheet" href="css/common.css">
   <link rel="stylesheet" href="css/main.css">
   <script src="js/jquery-1.8.3.min.js" type="text/javascript" ></script>
   <script type="text/javascript" src="js/colResizable-1.3.min.js"></script>
   <script type="text/javascript" src="js/common.js"></script>
   <script type="text/javascript" src="js/validate/jquery.validate.js"></script>
   <script src="js/validate/messages_cn.js" type="text/javascript"></script>
   <script src="js/validate/userValidate.js" type="text/javascript"></script>
   <script type="text/javascript" src="js/jQueryUI/js/jquery-ui-1.9.2.custom.js"></script>
      
      <script type="text/javascript" src="js/uploadify/jquery.uploadify.min.js"></script>
	<script type="text/javascript" src="js/uploadify/swfobject.js"></script>
   
   
   <script type="text/javascript">
       $(function(){
        $("#submitBtn").click(function(){
        if($("#user_form").validate())
			$("#user_form").submit();
        });
      }); 
   </script>
   <title>用户添加</title>
 </head>
 <body>
  <div class="container">
     <div id="forms" class="mt10">
        <div class="box">
          <div class="box_border">
          	<form action="/user/insert" class="jqtransform" method="post" id="user_form" enctype="multipart/form-data">
            <div class="box_top"><b class="pl15">新增用户</b></div>
            <div class="box_center">
               <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">                                         
                <tr>
                  <td class="td_right">用户名：</td>
                  <td class=""> 
                    <input type="text" id="username" name="username" value="" class="input-text lh30 input-text-right" size="40">
                  </td>
                </tr>
                 <tr>
                  <td class="td_right">密码：</td>
                  <td class=""> 
                    <input type="password" name="password" id="password" value="" class="input-text lh30 input-text-right" size="40">
                  </td>
                </tr>
                 <tr>
                  <td class="td_right">密码确认：</td>
                  <td class=""> 
                    <input type="password" name="passwordconf" value="" id="passwordconf" class="input-text lh30 input-text-right" size="40">
                  </td>
                </tr>
                 <tr>
                  <td class="td_right">状态：</td>
                  <td class=""> 
                    <select id="state" name="state" style="height: 25px;width: 150px;border: 1px solid #ccc;">
                    	<option value="1">正常</option>
                    	<option value="0">禁用</option>
                    
                    </select>
                  </td>
                </tr>
              
                 <tr>
                  <td class="td_right">备注：</td>
                  <td class=""> 
                   <textarea rows="4" cols="43" name="remark" id="remark"></textarea>
                  </td>
                </tr>
                	<tr>
                  <td class="td_right">头像：</td>
                  <td class=""> 
                   <input type="file" name="up">
                  </td>
                </tr>
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
   
 
    <div id="fileQueue"></div>
        
   
 </body>
 </html>
