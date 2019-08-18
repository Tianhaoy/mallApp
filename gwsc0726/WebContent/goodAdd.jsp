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
   
   <title>添加商品</title>
 </head>
 <body>
  <div class="container">
     <div id="forms" class="mt10">
        <div class="box">
          <div class="box_border">
          	<form action="good/insert" enctype="multipart/form-data" class="jqtransform" method="post" id="resource_form">
            <div class="box_top"><b class="pl15">新增商品</b></div>
            <div class="box_center">
               <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">               
                 <tr>
                  <td class="td_right">名称：</td>
                  <td class=""> 
                    <input type="text" name="name" id="name" class="input-text lh30 input-text-right" size="40">
                  </td>
                </tr>
				
                 <tr>
                 <td class="td_right">分类ID：</td>
                
                  <td>
                <label>
                	<select name="cid" id="cid">
                	<option value="" selected="selected">--请选择--</option>
                	<c:forEach items="${cs}" var="c">
                	 <option value="${c.id }">${c.name}</option>
                	</c:forEach>
                	</select>
                </label>  
                </td> 
              
                </tr>
                <tr>
                  <td class="td_right">旧单价：</td>
                  <td class=""> 
                    <input type="text" id="oldprice" name="oldprice" class="input-text lh30 input-text-right" size="40">
                  </td>
                </tr>
                <tr>
                  <td class="td_right">新单价：</td>
                  <td class=""> 
                    <input type="text" id="newprice" name="newprice" class="input-text lh30 input-text-right" size="40">
                  </td>
                </tr>
                <tr>
                  <td class="td_right">销售数量：</td>
                  <td class=""> 
                    <input type="text" id="num" name="num" class="input-text lh30 input-text-right" size="40">
                  </td>
                </tr>
                <tr>
                  <td class="td_right">规格：</td>
                  <td class=""> 
                    <input type="text" id="standard" name="standard" class="input-text lh30 input-text-right" size="40">
                  </td>
                </tr>
                <tr>
                  <td class="td_right">备注：</td>
                  <td class=""> 
                    <input type="text" id="remark" name="remark" class="input-text lh30 input-text-right" size="40">
                  </td>
                </tr>
                
                 <tr>
                  <td class="td_right">排序：</td>
                  <td class=""> 
                    <input type="text" id="sort" name="sort" class="input-text lh30 input-text-right" size="40">
                  </td>
                </tr>
                                
                 <tr>
                  <td class="td_right">商品图片：</td>
                  <td class=""> 
                    <input type="file" name="up" id="up" class="input-text lh30 input-text-right" size="40">
                  </td>
                </tr>               
                 <tr>
                   <td class="td_right">&nbsp;</td>
                   <td class="">
                     <input type="submit" id="submitBtn" name="submitBtn" class="btn btn82 btn_save2" value="添加">
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
