<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="top-bar">
	<div class="container clearfix">
    	<div class="slidedown">
     		<div class="eight columns">
       			<div class="phone-mail">
        			<c:choose>
        				<c:when test="${userSessionInfo != null }">
        					<span>您好！${userSessionInfo.name }欢迎光临会买酒！</span>
        					<a href="${ctx }/exitSys">[退出]</a>
        				</c:when>
        				<c:otherwise>
		        			<span>您好！欢迎光临会买酒！</span>
		         			<a href="javascript:;" class="openlogin">[ 登录 ]</a><a href="${ctx }/easywine_sign_in_5.html">[免费注册]</a>
        				</c:otherwise>
        			</c:choose>
       			</div><!-- End phone-mail -->
     		</div>
     		<div class="eight columns">
       			<div class="social">
		 	      	<span>关注我们：</span>
					<a href="#"><i class="social_icon-weibo s-16"></i></a>
					<a href="#"><i class="social_icon-rss s-16"></i></a>
					<a href="#"><i class="social_icon-quora  s-16"></i></a>
       			</div>
      		</div><!-- End social-icons -->
     	</div><!-- End slidedown -->
   </div><!-- End Container -->
</div><!-- End top-bar -->
 
<div class="main-header">
   <div class="container clearfix">
     <a href="#" class="down-button"><i class="icon-angle-down"></i></a><!-- this appear on small devices -->
     <div class="one-third column">
      <div class="logo">
      <a href="index.html">
        <img src="${ctx }/images/logo.png" alt="Invention - Creative Responsive Theme" />
      </a>
      </div>
     </div><!-- End Logo -->
     
     <div class="two-thirds column">
      <nav id="menu" class="navigation" role="navigation">
      <a href="#">Show navigation</a><!-- this appear on small devices -->
      <ul id="nav">
        <li <c:if test="${menuId == 0}"> class="active" </c:if> ><a href="${ctx }/">首页</a></li>
        <li <c:if test="${menuId == 1}"> class="active" </c:if> ><a href="about.html#1">会买酒</a> </li>
        <li <c:if test="${menuId == 2}"> class="active" </c:if> ><a href="shortcodes.html#2">全球购</a> </li>
        <li <c:if test="${menuId == 3}"> class="active" </c:if> ><a href="portfolio_4.html#4">学院派</a> </li>
        <li <c:if test="${menuId == 4}"> class="active" </c:if> ><a href="${ctx }/main_note_4.html">品酒笔记</a> </li>
        <!-- 
        <li <c:if test="${menuId == 4}"> class="active" </c:if> ><a href="${ctx }/wine_tasting_note_4.html">品酒笔记</a> </li>
         -->
      </ul>
     </nav>
    </div><!-- End Menu -->
   
   </div><!-- End Container -->
 </div><!-- End main-header -->
 
<!-- mask start -->
<div class="loginmask" style="z-index: 90"></div>
<!-- mask end -->

<!--  login start  -->
<div id="loginalert">
	<div class="pd20 loginpd">
		<h3>
			<i class="closealert fr"></i>
			<div class="clear"></div>
		</h3>
		<div class="loginwrap">
			<div class="loginh">
				<div class="fl">会员登录</div>
				<div class="fr">还没有账号<a id="sigup_now" href="${ctx }/easywine_sign_in_5.html">立即注册</a></div>
        		<div class="clear"></div>
			</div>
		<h3>
			<span>邮箱/用户名登录</span><span class="login_warning">用户名或密码错误</span>
        	<div class="clear"></div>
      	</h3>
      	<div class="clear"></div>
      	<form action="#" method="post" id="login_form">
			<div class="logininput">
          		<input type="text" name="username" class="loginusername" 
          					value="邮箱/用户名" onblur="cursorLoseCheck( 'loginusername', this.value );"/>
          		<input type="text" class="loginuserpasswordt" value="密码" />
          		<input type="password" name="password" class="loginuserpasswordp" 
          					style="display: none" onblur="cursorLoseCheck( 'loginuserpasswordp', this.value );"/>
        	</div>
        	<div class="loginbtn">
          		<div class="loginsubmit fl">
            		<input type="button" value="登录" onclick="loginSys();"/>
            		<div class="loginsubmiting">
              			<div class="loginsubmiting_inner"></div>
            		</div>
          		</div>
          		<div class="logcheckbox fl">
            		<input id="bcdl" type="checkbox" checked="checked" /> 保持登录
          		</div>
          		<div class="fr"><a href="#">忘记密码?</a></div>
          		<div class="clear"></div>
        	</div>
      	</form>
		</div>
	</div>
  	<div class="thirdlogin">
		<div class="pd50">
      		<h4>用第三方帐号直接登录</h4>
      		<ul>
        		<li id="sinal"><a href="#">微博账号登录</a></li>
        		<li id="qql"><a href="#">QQ账号登录</a></li>
        		<div class="clear"></div>
      		</ul>
      		<div class="clear"></div>
		</div>
	</div>
</div>
<!--  login end  -->
 
 <script type="text/javascript">
 function cursorLoseCheck( key , value ){
	 if(!value){
		 $( "."+key ).css( "border", "1px solid #E7402F" );
		 return false;
	 }else{
		 if( value == '邮箱/用户名' ){
			 $( "."+key ).css( "border", "1px solid #E7402F" );
			 return false;
		 }
		 $( "."+key ).css( "border", "1px solid #DAE2E5" );
		 return true;
	 }
	 
 }
 function loginSys(){
	 var username = $(".loginusername").val();
	 var flag_name = cursorLoseCheck( 'loginusername', username );
	 var userpwd = $(".loginuserpasswordp").val();
	 var flag_pwd = cursorLoseCheck( 'loginuserpasswordp', userpwd );
	 if( flag_name && flag_pwd ){
		 $(".loginsubmiting").css( "display", "block" );
		 $.ajax({
			type: "POST",
			url : "${ctx }/loginSys",
			data : {
				username : username,
				userpwd : userpwd
			},
			dataType:"json",
			success:function( result ){
				if( result.success == 1 ){
					$(".loginsubmiting").css( "display", "none" );
					$(".phone-mail").html( "<span>您好！"+result.user.name+"欢迎光临会买酒！</span><a href='${ctx }/exitSys'>[退出]</a>" );
					$("#loginalert").animate({top:-600},600,"easeOutQuart",function(){$("#loginalert").hide();k=!0});
					$(".loginmask").fadeOut(500);
				}else{
					$(".loginsubmiting").css( "display", "none" );
					$(".login_warning").css( "display", "block" );
					setTimeout(function (){
						$(".login_warning").css( "display", "none" );
					}, 1000);
				}
			},
			error:function(err) {
				$(".loginsubmiting").css( "display", "none" );
			}
		 });
	 }
 }
</script>
 
 
		     