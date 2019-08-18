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

   <title>修改分类</title>
 </head>
 <body>
  <div class="container">
     <div id="forms" class="mt10">
        <div class="box">
          <div class="box_border">
          	<form action="category/update?id=${cs.id}" enctype="multipart/form-data" class="jqtransform" method="post" id="resource_form">
          	<input type="hidden" id="id" name="id" value="${cs.id }">
            <div class="box_top"><b class="pl15">修改分类</b></div>
            <div class="box_center">
               <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">               
                 <tr>
                  <td class="td_right">名称：</td>
                  <td class=""> 
                    <input type="text" name="name" id="name" class="input-text lh30 input-text-right" size="40" value="${cs.name }">
                  </td>
                </tr>
                 <tr>
                  <td class="td_right">类型：</td>
                  <td>
                <label>
                	<select name="type" id="type">
                	<option value="${cs.type }" selected="selected">${cs.type }</option>
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
                </td>
                </tr>                

                 <tr>
                  <td class="td_right">分类图片：</td>
                  <td class=""> 
                    <input type="file" name="up" id="up" class="input-text lh30 input-text-right" size="40" >原图片：${cs.photo }
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
 </body>
 </html>
