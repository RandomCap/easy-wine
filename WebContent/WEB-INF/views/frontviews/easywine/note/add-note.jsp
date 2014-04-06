<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/commons/taglibs.jsp" %>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
    <head>
    	<meta charset="utf-8">
		<title>About us - EASY WINE | Creative passion Theme</title>
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
				<%@include file="./../header/header.jsp" %>
		   	</header><!-- <<< End Header >>> -->
		   	
		   	<div class="page-title">
				<div class="container clearfix">
		       		<div class="sixteen columns"> 
		         		<h1>Add note</h1>
		       		</div>
	     		</div><!-- End Container -->
	   		</div><!-- End Page title -->
		   	
			<!-- Start main content -->
   			<div class="container main-content clearfix">
   			
   				<div class="pricing-tables">
   				
   					<div class="eight columns tables-column" style="float: none;">
   							
   						<div class="header" id="easy_wine_add_note_data">
				        	<h3> 添加品酒笔记 <span class="pop">welcome</span></h3>
				        	<div class="price">
				        		<span id="add_note_in_error_msg" style="color: red;"></span>
				        		<form action="" class="form-elements" id="add_note_form_id"  enctype='multipart/form-data' >
							      	<ul class="list" style="text-align: left;">
							        	<li>
							        		<small style="margin-left: 30%">*</small> 笔记名称  ：
		        							<input type="text" name="noteName" class="text" 
		        								onblur="addNoteNameVerify( this.value );">
		        							<span style="padding-left: 20px;color: red;" id="addNote_error_message_noteName"></span>
							        	</li>
							        	<li>
							        		<fieldset>
												<small style="margin-left: 30%">*</small><span>是否公开 : </span>
									          	<input type="radio" name="isOpen" id="radio_2" value="0" checked="checked"/>
									          	<label for="radio_2" style="padding-right: 20px">否</label>
									          	<input type="radio" name="isOpen" id="radio_1" value="1"/>
									          	<label for="radio_1" >是</label>
											</fieldset>
							        	</li>
							      	</ul>
							      	<div class="footer">
							        	<h4><a href="javascript:;" onclick="addNoteSub( );"> 保存 </a></h4>
							      	</div><!-- End footer -->
							      	<input type="hidden" name="userId" value="${userId }">
						      	</form>
				        	</div>
				      	</div><!-- End header -->
				      	
				      	
				      	<div class="header" id="easy_wine_add_note_photo" style="display: none;">
				        	<h3> 添加品酒笔记 <span class="pop">welcome</span></h3>
				        	<div class="price">
				        		<span id="add_note_in_error_msg" style="color: red;"></span>
				        		<form action="" class="form-elements" id="add_note_form_id"  enctype='multipart/form-data' >
							      	<ul class="list" style="text-align: left;">
							        	<li>
							        		<small style="margin-left: 30%">*</small> 笔记名称  ：
		        							<input type="text" name="noteName" class="text" 
		        								onblur="addNoteNameVerify( this.value );">
		        							<span style="padding-left: 20px;color: red;" id="addNote_error_message_noteName"></span>
							        	</li>
							        	<li>
							        		<fieldset>
												<small style="margin-left: 30%">*</small><span>是否公开 : </span>
									          	<input type="radio" name="isOpen" id="radio_2" value="0" checked="checked"/>
									          	<label for="radio_2" style="padding-right: 20px">否</label>
									          	<input type="radio" name="isOpen" id="radio_1" value="1"/>
									          	<label for="radio_1" >是</label>
											</fieldset>
							        	</li>
							      	</ul>
							      	<div class="footer">
							        	<h4><a href="javascript:;" onclick="addNoteSub( );"> 保存 </a></h4>
							      	</div><!-- End footer -->
							      	<input type="hidden" name="userId" value="${userId }">
						      	</form>
				        	</div>
				      	</div><!-- End header -->
				      	
				      	
				      
   					</div>
   				
   				</div>
   			
   			</div>	<!-- End main content -->
		   	
		   	<footer>
	   			<%@include file="./../footer/footer.jsp" %>
			</footer><!-- <<< End Footer >>> -->
		</div><!-- End wrap -->
		
		<script type="text/javascript">
		function addNoteNameVerify( value ){
			if( !value ){
				$("#addNote_error_message_noteName").text( "请填写笔记名称" );
			}else{
				$("#addNote_error_message_noteName").text( " " );
			}
		}
		function addNoteSub(){
			var noteName = $("input[name='noteName']").val();
			var isOpen = $('input[name="isOpen"]:checked').val();
			if( !noteName ){
				$("#addNote_error_message_noteName").text( "请填写笔记名称" );
				return  ;
			}
			var picName = $("input[name='picName']").val();
			if( !picName ){
				$("#addNote_error_message_picName").text( "请选择笔记封面" );
				return ;
			}
			 $.ajax({
					type: "POST",
					url : "${ctx}/note/addNoteIn",
					data : /*  $("#add_note_form_id").serialize() */
					{
						 userId : ${userId},
						noteName : noteName,
						isOpen : isOpen,
						picName : picName
					} ,
					dataType:"json",
					success:function( res ){
						if (res.success == 1) {
							location.href  = "${ctx }/main_note_4.html";
						}else{
							$("#add_note_in_error_msg").text("* 添加失败");
							return ;
						}
					},
					error:function(err) {}
			});
		}
		</script>
		    	
	</body>
</html>