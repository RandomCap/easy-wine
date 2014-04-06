<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/commons/taglibs.jsp" %>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
    <head>
		<title>About us - EASY WINE | Creative passion Theme</title>
		<meta name="description" content="Here you can find what you need">
		
		<!-- Mobile Specific Metas -->
       	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0,user-scalable=no">
		
		<%@include file="/commons/css.jsp" %>
		<link rel="stylesheet" type="text/css" href="${ctx }/css/jquery-ui.css" />
		<!--[if lt IE 9]>
			<script src="js/html5.js"></script>
		<![endif]-->
		
		<%@include file="/commons/script.jsp" %>
		<script src="${ctx }/js/easywine/note/note.js"></script>
		<script type="text/javascript" src="${ctx }/js/jquery-migrate-1.2.1.js"></script>
		<script type="text/javascript" src="${ctx }/js/jquery-ui-datepicker.js"></script>
		<script type="text/javascript">
			$(function (){
				$("#year_id").datepicker({
					dateFormat: 'yy / mm / dd'
				});
				$("#test_date_id").datepicker({
					dateFormat: 'yy / mm / dd'
				});
			});
		</script>
		
		
    </head>
    <body>
		<div id="wrap" class="boxed">
			<header>
				<%@include file="./../header/header.jsp" %>
		   	</header><!-- <<< End Header >>> -->
		   	<div class="page-title">
				<div class="container clearfix">
		       		<div class="sixteen columns"> 
		         		<h1>welcome to join us</h1>
		       		</div>
	     		</div><!-- End Container -->
	   		</div><!-- End Page title -->
		   	
		   	<div class="container main-content clearfix">
		   	
		   	
		   		<div class="five columns sidebar bottom-3">
		   			
		   			<div class="four columns tables-column color" 
		   					id="add_the_tasting_notes_nav_1"
		   					onclick="noteFunction.editForm( 1 );">
						<div class="header">
				        	<h3>基本信息</h3>
				      	</div><!-- End header -->
				     </div><!-- End column -->
				     
		   			<div class="four columns tables-column" id="add_the_tasting_notes_nav_2">
						<div class="header">
				        	<h3>外观/嗅觉</h3>
				      	</div><!-- End header -->
				     </div><!-- End column -->
				     
		   			<div class="four columns tables-column" id="add_the_tasting_notes_nav_3">
						<div class="header">
				        	<h3>味觉</h3>
				      	</div><!-- End header -->
				     </div><!-- End column -->
				     
				     <div class="four columns tables-column" id="add_the_tasting_notes_nav_4">
						<div class="header">
				        	<h3>照片</h3>
				      	</div><!-- End header -->
				     </div><!-- End column -->
		   		
		   		</div>
		   	
		   		<div class="eleven columns bottom-3 ">
	   				<form action="${ctx }/note/saveTestwineNote.do" class="form-elements" 
	   							id="add_test_wine_note_form" method="post">
	   					<input type="hidden" value="${noteId}" name="note_id">
	   					<!-- 基本信息 开始 -->
	   					<div id="add_the_tasting_notes_1">
	   						<h3 class="title bottom-2">基本信息 ：</h3>
	   						<fieldset>
								<span>葡萄酒编号 : </span>
					          	<input type="text" name="grape_code" value="" id="grape_code" onblur="noteFunction.removeBorderColour( 'grape_code' )"/>
				          	</fieldset>
				          	<fieldset>
								<span>葡萄酒名称 : </span>
					          	<input type="text" name="wine_name" value="" id="wine_name" onblur="noteFunction.removeBorderColour( 'grape_name' )"/>
				          	</fieldset>
							<fieldset>
				          		<span>国家/产区 : </span>
				          		<input type="text" id="producing_area_name" value="" readonly="readonly" onchange="noteFunction.removeBorderColour( 'producing_area_name' );"/>
				          		<input type="hidden" name="producing_area_id" value="" id="producing_area_id"/>
				          		<a href="javascript:;" style="padding-left: 5px" onclick="noteFunction.tipSelectPage( '国家/地区 (请双击选择)' , '${ctx}/wine_tasting_note_selectArea.html' );"><i class="icon-home  s-20"></i></a>
				          	</fieldset>
				          	<fieldset>
				          		<span>生产商 : </span>
				          		<input type="text" id="manufacturer_name" name="manufacturer_name" onchange="noteFunction.removeBorderColour( 'manufacturer_name' )"/>
				          		<input type="hidden" name="manufacturer_id" value="" id="manufacturer_id"/>
				          		<a href="javascript:;" style="padding-left: 5px" onclick="noteFunction.tipSelectPage( '生产商  (请双击选择)' , '${ctx}/wine_tasting_note_selectManufacturer.html' );"><i class="icon-home  s-20"></i></a>
				          	</fieldset>
				          	<fieldset>
				          		<span>品种 : </span>
				          		<input type="text" id="grape_name" value="" readonly="readonly" onchange="noteFunction.removeBorderColour( 'grape_name' )"/>
				          		<input type="hidden" name="grape_id" value="" id="grape_id"/>
				          		<a href="javascript:;" style="padding-left: 5px" onclick="noteFunction.tipSelectPage( '品种  (请双击选择)' , '${ctx}/wine_tasting_note_selectGrape.html' );" ><i class="icon-home  s-20"></i></a>
				          	</fieldset>
				          	<fieldset>
				          		<span>年份 : </span>
				          		<input type="text" name="year" value="" id="year_id" readonly onblur="noteFunction.removeBorderColour( 'year_id' )"/>
				          	</fieldset>
				          	<fieldset>
				          		<span>品尝日期 : </span>
				          		<input type="text" name="date" value="" id="test_date_id" readonly onblur="noteFunction.removeBorderColour( 'test_date_id' )"/>
				          	</fieldset>
				          	<fieldset>
				          		<span>入手价格(￥) : </span>
				          		<input type="text" name="price_cost" value="" id="price_cost_id" onblur="noteFunction.removeBorderColour( 'price_cost_id' )"/>
				          		公开 : <input type="checkbox" id="checkbox_price" name="price_visible_type" value="1"/><label for="checkbox_price">是</label>
				          	</fieldset>
				          	<fieldset>
				          		<span>市场价格(￥): </span>
				          		<input type="text" name="price_market" value="" id="price_market_id" onblur="noteFunction.removeBorderColour( 'price_market_id' )"/>
				          	</fieldset>
			          	</div>
			          	<!-- 基本信息 结束 -->
			          	<!-- 外观  嗅觉 开始  -->
			          	<div id="add_the_tasting_notes_2" style="display: none;">
			          		<h3 class="title bottom-2">外观 ：</h3>
			          		<fieldset>
			          			<span>澄清度 : </span>
								<c:forEach var="clarity" items="${resMap.clarities }">
						          	<input type="radio" name="clarity_id" id="clarity_${clarity.classify_id }" value="${clarity.classify_id }" onclick="noteFunction.removeRadioTipMessage( 'clarity' );"/>
									<label for="clarity_${clarity.classify_id }">${clarity.classify_name }</label>
								</c:forEach>
								<i class="icon-remove-circle s-20" style="padding-left: 50px;display: none;color: red;" id="clarity_message_id">请选择澄清度 </i>
							</fieldset>
							<fieldset>
								<span>颜色强度 : </span>
								<c:forEach var="colorIntensity" items="${resMap.colorIntensities }">
							          <input type="radio" name="colorIntensity_id" id="colorIntensity_${colorIntensity.classify_id }"  value="${colorIntensity.classify_id }" onclick="noteFunction.removeRadioTipMessage( 'colorIntensity' );"/>
							          <label for="colorIntensity_${colorIntensity.classify_id }">${colorIntensity.classify_name }</label>
								</c:forEach>
								<i class="icon-remove-circle s-20" style="padding-left: 50px;display: none;color: red;" id="colorIntensity_message_id">请选择颜色强度 </i>
							</fieldset>
							<fieldset>
				          		<span>颜色 : </span>
				          		<input type="text" id="colour_name" value="" readonly="readonly" onchange="noteFunction.removeBorderColour( 'colour_name' )"/>
				          		<input type="hidden" name="colour_id" value="" id="colour_id"/>
				          		<a href="javascript:;" style="padding-left: 5px" onclick="noteFunction.tipSelectPage( '颜色  (请双击选择)' , '${ctx}/wine_tasting_note_selectColour.html' );"><i class="icon-home  s-20"></i></a>
				          	</fieldset>
				          	<h3 class="title bottom-2">嗅觉 ：</h3>
			          		<fieldset>
								<span>状态 : </span>
								<c:forEach var="condition" items="${resMap.conditions }">
									<input type="radio" name="condition_id" id="condition_${condition.classify_id }" value="${condition.classify_id }" onclick="noteFunction.removeRadioTipMessage( 'condition' );"/>
						          	<label for="condition_${condition.classify_id }">${condition.classify_name }</label>
					          	</c:forEach>
					          	<i class="icon-remove-circle s-20" style="padding-left: 50px;display: none;color: red;" id="condition_message_id">请选择状态 </i>
							</fieldset>
							<fieldset>
								<span>浓郁度 : </span>
								<c:forEach var="intensity" items="${resMap.intensities }">
									<input type="radio" name="intensity_id" id="intensity_${intensity.classify_id }" value="${intensity.classify_id }" onclick="noteFunction.removeRadioTipMessage( 'intensity' );"/>
						          	<label for="intensity_${intensity.classify_id }">${intensity.classify_name }</label>
					          	</c:forEach>
					          	<i class="icon-remove-circle s-20" style="padding-left: 50px;display: none;color: red;" id="intensity_message_id">请选择浓郁度 </i>
							</fieldset>
						</div>
						<!-- 结束  嗅觉 结束  -->
						<!-- 味觉 开始  -->
						<div id="add_the_tasting_notes_3" style="display: none;">
							<h3 class="title bottom-2">味觉 ：</h3>
							<fieldset>
								<span>甜度 : </span>
						        <c:forEach var="sweet" items="${resMap.sweetness }">
									<input type="radio" name="sweetness_id" id="sweetness_${sweet.classify_id }" value="${sweet.classify_id }" onclick="noteFunction.removeRadioTipMessage( 'sweetness' );"/>
						          	<label for="sweetness_${sweet.classify_id }">${sweet.classify_name }</label>
					          	</c:forEach>
					          	<i class="icon-remove-circle s-20" style="padding-left: 50px;display: none;color: red;" id="sweetness_message_id">请选择甜度 </i>
							</fieldset>
							<fieldset>
								<span>酸度 : </span>
						        <c:forEach var="acidity" items="${resMap.acidities }">
									<input type="radio" name="acidity_id" id="acidity_${acidity.classify_id }" value="${acidity.classify_id }" onclick="noteFunction.removeRadioTipMessage( 'acidity' );"/>
						          	<label for="acidity_${acidity.classify_id }">${acidity.classify_name }</label>
					          	</c:forEach>
					          	<i class="icon-remove-circle s-20" style="padding-left: 50px;display: none;color: red;" id="acidity_message_id">请选择酸度 </i>
							</fieldset><fieldset>
								<span>单宁 : </span>
						        <c:forEach var="tannin" items="${resMap.tannins }">
									<input type="radio" name="tannin_id" id="tannin_${tannin.classify_id }" value="${tannin.classify_id }" onclick="noteFunction.removeRadioTipMessage( 'tannin' );"/>
						          	<label for="tannin_${tannin.classify_id }">${tannin.classify_name }</label>
					          	</c:forEach>
					          	<i class="icon-remove-circle s-20" style="padding-left: 50px;display: none;color: red;" id="tannin_message_id">请选择单宁 </i>
							</fieldset>
							<fieldset>
								<span>酒体 : </span>
								<c:forEach var="body" items="${resMap.bodies }">
									<input type="radio" name="body_id" id="body_${body.classify_id }" value="${body.classify_id }" onclick="noteFunction.removeRadioTipMessage( 'body' );"/>
						          	<label for="body_${body.classify_id }">${body.classify_name }</label>
					          	</c:forEach>
					          	<i class="icon-remove-circle s-20" style="padding-left: 50px;display: none;color: red;" id="body_message_id">请选择酒体 </i>
							</fieldset>
							<fieldset>
				          		<span>香味 : </span>
				          		<input type="text" id="relish_name" value="" readonly="readonly" onchange="noteFunction.removeBorderColour( 'relish_name' )"/>
				          		<input type="hidden" name="relish_id" value="" id="relish_id"/>
				          		<a href="javascript:;" style="padding-left: 5px" onclick="noteFunction.tipSelectPage( '香味  (请双击选择)' , '${ctx}/wine_tasting_note_selectRelish.html' );"><i class="icon-home  s-20"></i></a>
				          	</fieldset>
				          	<fieldset>
								<span>回味 : </span>
						        <c:forEach var="aftertast" items="${resMap.aftertasts }">
									<input type="radio" name="aftertast_id" id="aftertast_${aftertast.classify_id }" value="${aftertast.classify_id }" onclick="noteFunction.removeRadioTipMessage( 'aftertast' );"/>
						          	<label for="aftertast_${aftertast.classify_id }">${aftertast.classify_name }</label>
					          	</c:forEach>
					          	<i class="icon-remove-circle s-20" style="padding-left: 50px;display: none;color: red;" id="aftertast_message_id">请选择回味 </i>
							</fieldset>
							<fieldset>
								<span>品质 : </span>
						        <c:forEach var="quality" items="${resMap.qualities }">
									<input type="radio" name="quality_id" id="quality_${quality.classify_id }" value="${quality.classify_id }" onclick="noteFunction.removeRadioTipMessage( 'quality' );"/>
						          	<label for="quality_${quality.classify_id }">${quality.classify_name }</label>
					          	</c:forEach>
					          	<i class="icon-remove-circle s-20" style="padding-left: 50px;display: none;color: red;" id="quality_message_id">请选择品质 </i>
							</fieldset>
							<fieldset>
					          <span>酒评 : </span>
					          <textarea name="des"></textarea>
				          </fieldset>
						</div>
						<!-- 味觉 结束  -->
			          	
			          	
			          <div class="clear"></div>
			          <input type="button" value="下一步" class="button small color" 
			          			onclick="noteFunction.nextAction( 1 );" id="add_the_tasting_notes_action_button"/>
					</form>
		   		</div>
   				
		   	</div>
		   	
		   	<footer>
		   		<%@include file="./../footer/footer.jsp" %>
			</footer><!-- <<< End Footer >>> -->
		</div><!-- End wrap -->    	
	</body>
</html>
		   	