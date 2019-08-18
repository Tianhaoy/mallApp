<%@ page language="java" import="java.util.*,java.lang.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <link rel="stylesheet" href="css/style.css">
  <script src="js/jquery-1.8.3.min.js" type="text/javascript" ></script>
  <script type="text/javascript" src="js/jquery.SuperSlide.js"></script>
  <script type="text/javascript" src="js/jquery.messager.js"></script>
  <script type="text/javascript">
  $(function(){
      $(".sideMenu").slide({
         titCell:"h3", 
         targetCell:"ul",
         defaultIndex:0, 
         effect:'slideDown', 
         delayTime:'500' , 
         trigger:'click', 
         triggerTime:'150', 
         defaultPlay:true, 
         returnDefault:false,
         easing:'easeInQuint',
         endFun:function(){
              scrollWW();
         }
       });
      $(window).resize(function() {
          scrollWW();
      });
	  
	  $("#out").click(function(){
	  	if(confirm("确定退出系统吗？")){
			window.location = "<%=basePath %>user/logout";
		}
	  });

	  $(".sideMenu li").click(function(){
		$(".sideMenu li").removeClass("on");
		$(this).addClass("on");
	  });
	  
  });
  function scrollWW(){
    if($(".side").height()<$(".sideMenu").height()){
       $(".scroll").show();
       var pos = $(".sideMenu ul:visible").position().top-38;
       $('.sideMenu').animate({top:-pos});
    }else{
       $(".scroll").hide();
       $('.sideMenu').animate({top:0});
       n=1;
    }
  } 

var n=1;
function menuScroll(num){
  var Scroll = $('.sideMenu');
  var ScrollP = $('.sideMenu').position();
  /*alert(n);
  alert(ScrollP.top);*/
  if(num==1){
     Scroll.animate({top:ScrollP.top-38});
     n = n+1;
  }else{
    if (ScrollP.top > -38 && ScrollP.top != 0) { ScrollP.top = -38; }
    if (ScrollP.top<0) {
      Scroll.animate({top:38+ScrollP.top});
    }else{
      n=1;
    }
    if(n>1){
      n = n-1;
    }
  }
}


  </script>
  <title>后台管理平台</title>
</head>
<body>
    <div class="top">
      <div id="top_t">
        <!--<div id="logo" class="fl"></div>-->
        <div id="photo_info" class="fr">
          <div id="photo" class="fl">       
            <IMG width="50" height="50" src="images/photo/${u.photo }">          
          </div>
          <div id="base_info" class="fr">
            <div class="help_info">
              <a href="login.jsp" id="hp">&nbsp;</a>
              <a href="#" id="gy">&nbsp;</a>
              <a href="login.jsp" id="out">&nbsp;</a>
            </div>
            <div class="info_center">
              <c:out value="${u.username}"></c:out>
              <!--<span id="nt">通知</span><span><a href="#" id="notice">3</a></span>-->
            </div>
          </div>
        </div>
      </div>
      <div id="side_here">
        <div id="side_here_l" class="fl"></div>
        <div id="here_area" class="fl"><!-- 当前位置： --></div>
      </div>
    </div>
    <div class="side">
        <div class="sideMenu"  style="margin:0 auto">
		 <h3>系统管理</h3>
		 <ul>                         	
            <li><a href="user/select" target="right">用户管理</a></li>
         </ul>
         <h3>密码管理</h3>
		 <ul>                         	
            <li><a href="userpasswordupdate.jsp?id=${u.id}" target="right">密码修改</a></li>
         </ul>
         <h3>业务管理</h3>
		 <ul>                         	
            <li><a href="category/select" target="right">分类列表</a></li>
            <li><a href="good/select" target="right">商品列表</a></li>
         </ul>
       </div>
    </div>
    <div class="main">
       <iframe name="right" id="rightMain" src="" frameborder="no" scrolling="auto" width="100%" height="auto" allowtransparency="true"></iframe>
    </div>
    <div class="bottom">
      <div id="bottom_bg">英旗国际&nbsp; 版权所有 &copy; 2019</div>
    </div>
    <div class="scroll">
          <a href="javascript:;" class="per" title="使用鼠标滚轴滚动侧栏" onclick="menuScroll(1);"></a>
          <a href="javascript:;" class="next" title="使用鼠标滚轴滚动侧栏" onclick="menuScroll(2);"></a>
    </div>
</body>

</html>
