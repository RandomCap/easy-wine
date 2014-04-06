<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/commons/taglibs.jsp" %>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
    <head>
    	<meta charset="utf-8">
		<title>Sign in - EASY WINE | Create a belong to his account</title>
		<meta name="description" content="Here you can find what you need">
		
		<!-- Mobile Specific Metas -->
       	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0,user-scalable=no">
		
		<%@include file="/commons/css.jsp" %>
		
		<!--[if lt IE 9]>
			<script src="js/html5.js"></script>
		<![endif]-->
		
		<%@include file="/commons/script.jsp" %>
		
    </head>
    <body>
		<div id="wrap" class="boxed">
			<header>
				<%@include file="./header/header.jsp" %>
		   	</header><!-- <<< End Header >>> -->
		   	
		   	<!-- Start main content -->
   			<div class="container main-content clearfix">
   			
   				<div class="pricing-tables">
   				
   					<div class="eight columns tables-column" style="float: none;">
   							
   						<div class="header">
				        	<h3> 注册新会员 <span class="pop">welcome</span></h3>
				        	<div class="price">
				        		<span> 请认真填写注册信息，我们期待您的加入！</span><span id="sign_in_error_msg" style="color: red;"></span>
				        	</div>
				      	</div><!-- End header -->
				      	<form action="#" class="form-elements">
					      	<ul class="list" style="text-align: left;">
					        	<li>
					        		<small style="margin-left: 30%">*</small> 昵称  ：
        							<input type="text" name="nickname" class="text" 
        								onblur="signinCursorLoseVerify( 'nickname', this.value );">
        							<span style="padding-left: 20px;color: red;" id="signin_error_message_nickname"></span>
					        	</li>
					        	<li>
					        		<small style="margin-left: 30%">*</small> 邮箱  ：
        							<input type="text" name="email" class="text"
        								onblur="signinCursorLoseVerify( 'email', this.value );">
        							<span style="padding-left: 20px;color: red;" id="signin_error_message_email"></span>
					        	</li>
					        	<li>
					        		<small style="margin-left: 30%">*</small> 手机 ：
        							<input type="text" name="phone" class="text"
        								onblur="signinCursorLoseVerify( 'phone', this.value );">
        							<span style="padding-left: 20px;color: red;" id="signin_error_message_phone"></span>
					        	</li>
					        	<li>
					        		<small style="margin-left: 30%">*</small> 密码 ：
        							<input type="text" name="loginpwd" class="text"
        								onblur="signinCursorLoseVerify( 'loginpwd', this.value );">
        							<span style="padding-left: 20px;color: red;" id="signin_error_message_loginpwd"></span>
					        	</li>
					      	</ul>
				      	</form>
				      	<div class="footer">
				        	<h4><a href="javascript:;" onclick="signinSub( );" id="sigin_in_sub_button"> 立即注册 </a></h4>
				      	</div><!-- End footer -->
				      
   					</div>
   				
   				</div>
   			
   			</div>	<!-- End main content -->
		   	
			<footer>
		   		<%@include file="./footer/footer.jsp" %>
			</footer><!-- <<< End Footer >>> -->
		</div><!-- End wrap -->    	
	</body>
<script src="${ctx }/js/easywine/signin/signin.js"></script>
<script type="text/javascript">
function signinSub(){
	var nickname = $("input[name='nickname']").val();
	if( signinCursorLoseVerify( 'nickname', nickname ) ){//check nicename
		var email = $("input[name='email']").val();
		if( signinCursorLoseVerify( 'email', email ) ){//check email
			var phone = $("input[name='phone']").val();
			if( signinCursorLoseVerify( 'phone', phone ) ){//check phone
				var loginpwd = $("input[name='loginpwd']").val();
				if( signinCursorLoseVerify( 'loginpwd', loginpwd ) ){//check loginped
					$("#sigin_in_sub_button").removeAttr("onclick").text( "loading ..." );
					$.ajax({
						type: "POST",
						url : "${ctx }/signin",
						data : {
							name : nickname,
							email : email,
							phone : phone,
							loginpwd : loginpwd
						},
						dataType:"json",
						success:function( result ){
							if( result.success == 1 ){
								window.location.href = "${ctx}";
								$("#sigin_in_sub_button").attr("onclick", "signinSub( )").text( "立即注册" );
							}else{
								$("#sign_in_error_msg").val( "[ 网络繁忙，提交失败 ]" );
								$("#sigin_in_sub_button").attr("onclick", "signinSub( )").text( "立即注册" );
							}
						},
						error:function(err) {
							$("#sign_in_error_msg").val( "[ 网络繁忙，提交失败 ]" );
							$("#sigin_in_sub_button").attr("onclick", "signinSub( )").text( "立即注册" );
						}
					});
				}
			}
		}
	}
}
function signinCursorLoseVerify( idkey, value ){
	if( validateRules.isNull( value ) ){
		$("#signin_error_message_"+idkey).text("* 请填写，这一项不能空着！");
		return false;
	}else{
		value = value.replace(/(^\s*)|(\s*$)/g, "");
		if( idkey == "nickname" ){
			if( validateRules.betweenLength( value, 6, 20 ) ){
				if ( validateRules.isUid( value ) ) {
					var flag = true;
					$("#signin_error_message_"+idkey).html("<em style='color:#999'>检验中……</em>");
					$.getJSON("${ctx}/validate/isUsernameEngaged?username=" + value + "&r=" + Math.random(), function ( res ) {
						if (res.success == 1) {
							$("#signin_error_message_"+idkey).text("");
							flag = true;
						}else{
							$("#signin_error_message_"+idkey).text("* 昵称已经被使用");
							flag = false;
						}
					});
					return flag;
			    }else{
			    	$("#signin_error_message_"+idkey).text("* 昵称只能由中文、英文、数字及“_”、“-”组成");
			    	return false;
			    }
			}else{
				$("#signin_error_message_"+idkey).text("* 昵称长度只能在6-20位字符之间");
				return false;
			}
		}else if( idkey == "email" ){
			if( validateRules.isEmail(value) ){
				if( validateRules.betweenLength( value, 4, 50 ) ){
					var flag = true;
					$("#signin_error_message_"+idkey).html("<em style='color:#999'>检验中……</em>");
					$.getJSON("${ctx}/validate/isEmailEngaged?email=" + value + "&r=" + Math.random(), function ( res ) {
						 if (res.success == 1) {
							$("#signin_error_message_"+idkey).text(" ");
							flag = true;
						 }else{
							$("#signin_error_message_"+idkey).text("* 该邮箱已存在");
							flag = false;
						 }
					});
					return flag;
				}else{
					$("#signin_error_message_"+idkey).text("* 邮箱地址长度应在4-50个字符之间");
					return false;
				}
			}else{
				$("#signin_error_message_"+idkey).text("* 邮箱地址不正确，请重新输入");
				return false;
			}
		}else if( idkey == "phone" ){
			if( validateRules.isMobile( value ) && value.length == 11 ){
				var flag = true;
				$("#signin_error_message_"+idkey).html("<em style='color:#999'>检验中……</em>");
				$.getJSON("${ctx}/validate/isMobileEngaged?mobile=" + value + "&r=" + Math.random(), function ( res ) {
                    if ( res.success == 1 ) {
                    	$("#signin_error_message_"+idkey).text(" ");
                    	flag = true;
                    }else{
                    	$("#signin_error_message_"+idkey).text("* 该手机号已存在");
                    	flag = false;
                    }
				});
				return flag;
			}else{
				$("#signin_error_message_"+idkey).text("* 手机号不正确，请重新输入");
				return false;
			}
		}else if( idkey == "loginpwd" ){
			if( validateRules.betweenLength( value , 6, 20 ) ){
				if( validateRules.isPwd( value ) ){
					if( !validateRules.weakPwd( value ) ){
						$("#signin_error_message_"+idkey).text(" ");
					    return true;
					}else{
						$("#signin_error_message_"+idkey).text("* 该密码比较简单，有被盗风险，建议您更改为复杂密码");
						return false;
					}
				}else{
					$("#signin_error_message_"+idkey).text("* 密码只能由英文、数字及标点符号组成");
					return false;
				}
			}else{
				$("#signin_error_message_"+idkey).text("* 密码长度只能在6-20位字符之间");
				return false;
			}
		}
	}
}
</script>
</html>