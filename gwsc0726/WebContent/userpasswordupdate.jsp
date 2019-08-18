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
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>

<script type="text/javascript">
var p=${u.password};
function check(){
	if($("#oldpassword").val() != p){
		$("#spanpassword").html("原密码验证失败！");
	}else{
		$("#spanpassword").html("原密码验证成功！");
	}
}
function check1(){
	if($("#password").val()== ""){
		$("#spanpassword1").html("请输入新密码");
	}
}
function check2(){
	if($("#password").val() != $("#passwordconf").val()){
		$("#spanpassword2").html("两次密码不一致，请重新输入");
	}else{
		$("#spanpassword2").html("密码一致，可以更改！");
	}
}
</script>


   <title>密码修改</title>
 </head>
 <body>
  <div class="container">
     <div id="forms" class="mt10">
        <div class="box">
          <div class="box_border">
          	<form action="/user/update?id=${u.id }" class="jqtransform" method="post"  id="user_form" name="user_form" " >
          	<input type="hidden" id="id" name="id" value="${u.id}">  
          	<input type="hidden" id="password1" name="password1" value="${u.password}">        	
            <div class="box_top"><b class="pl15">修改密码</b></div>
            <div class="box_center">
               <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">                                         
                <tr>
                  <td class="td_right">原密码：</td>
                  <td class=""> 
                    <input type="text" id="oldpassword" name="oldpassword" value="" class="input-text lh30 input-text-right" size="40" onblur="check()">
                    <span id="spanpassword"></span>
                  </td>
                </tr>
                 <tr>
                  <td class="td_right">新密码：</td>
                  <td class=""> 
                    <input type="password" name="password" id="password" value="" class="input-text lh30 input-text-right" size="40" onblur="check1()">
                    <span id="spanpassword1"></span>
                  </td>
                </tr>
                 <tr>
                  <td class="td_right">密码确认：</td>
                  <td class=""> 
                    <input type="password" name="passwordconf" value="" id="passwordconf" class="input-text lh30 input-text-right" size="40" onblur="check2()">
                  <span id="spanpassword2"></span>
                  </td>
                </tr>
	
               <tr>
                   <td class="td_right">&nbsp;</td>
                   <td class="">
                     <input type="submit" id="submitBtn" name="submitBtn" class="btn btn82 btn_save2" value="修改">
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
