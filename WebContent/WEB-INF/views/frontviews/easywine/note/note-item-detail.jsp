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
		   			
		   				<h1> ITEM DETAIL </h1>
			         	<div class="portfolio-control">
				           	<a href="${ctx }/testing_note_items_${noteId }.html" data="All Projects" class="all black"><i class="icon-th"></i></a>
		   				</div>
		   				
		   			</div><!-- End control -->
		   		
		   		</div><!-- End Container -->
		   	
		   	</div><!-- End Page title -->
		   	
		   	
		   	<div class="container main-content clearfix">
		   		<!-- Start Project Slider -->
		   		<div class="sixteen columns top-1 bottom-3">
		   		
		   			<div class="slider-project">
		   				
		   				<div class="flex-container">
		   				
		   					<div class="flexslider2">
		   						
		   						<ul class="slides">
									<li>
						            	<img src="images/img/portfolio/single/image-2-1.jpg">
								  	</li>
						          	<li>
						            	<img src="images/img/portfolio/single/image-2-2.jpg">
								  	</li>
								</ul>
		   						
		   					</div>
		   				
		   				</div>
		   				
		   			</div>
		   		
		   		</div><!-- end Project Slider -->
		   		
		   		<div class="page-columns">
		   		
		   			<div class="sixteen columns bottom-4">
		   			
		   				<h3 class="title bottom-2"> 葡萄酒编号 ： ${project.grape_code }</h3>
        				<table class="style" style="text-align: left;">
        					<thead>
        						<tr><th >名称</th><th colspan="3">属性</th></tr>
        					</thead>
				          <tbody>
				           <tr>
				              <td>产区/国家</td>
				              <td colspan="3">sql没有加进去</td>
				            </tr>
				            <tr>
				              <td>生产商</td>
				              <td colspan="3">${project.manufacturer_name}</td>
				            </tr>
				            <tr>
				              <td>品种</td>
				              <td colspan="3">${project.grapeName }</td>
				            </tr>
				            <tr>
				              <td>年份</td>
				              <td colspan="3">${project.year }</td>
				            </tr>
				            <tr>
				              <td>品尝日期</td>
				              <td colspan="3">${project.date }</td>
				            </tr>
				             <tr>
				              <td>市场价格(￥)</td>
				              <td colspan="3">${project.price_market }</td>
				            </tr>
				            <c:if test="${project.price_visible_type == 1 }">
								<tr>
					              <td>入手价格(￥)</td>
					              <td colspan="3">${project.price_cost }</td>
					            </tr>
				            </c:if>
				            <tr>
				              <td colspan="4"> <strong>外观 ( Apprearance )</strong> </td>
				            </tr>
				            <tr>
				              <td>澄清度</td>
				              <td colspan="3">${project.clarityName }</td>
				            </tr>
				            <tr>
				              <td>颜色强度度</td>
				              <td colspan="3">${project.colorIntensityName }</td>
				            </tr>
				            <tr>
				              <td>颜色</td>
				              <td colspan="3">${project.colourName }</td>
				            </tr>
				            <tr>
				              <td colspan="4"><strong>嗅觉 ( Nose )</strong></td>
				            </tr>
				            <tr>
				              <td>状态</td>
				              <td colspan="3">${project.conditionName }</td>
				            </tr>
				            <tr>
				              <td>浓郁度</td>
				              <td colspan="3">${project.intensityName }</td>
				            </tr>
				            <tr>
				              <td colspan="4"><strong>味觉 ( Palate )</strong></td>
				            </tr>
				            <tr>
				              <td>甜度</td>
				              <td colspan="3">${project.sweetnessName }</td>
				            </tr>
				            <tr>
				              <td>酸度</td>
				              <td colspan="3">${project.acidityName }</td>
				            </tr>
				            <tr>
				              <td>单宁</td>
				              <td colspan="3">${project.tanninName }</td>
				            </tr>
				            <tr>
				              <td>酒体</td>
				              <td colspan="3">${project.bodyName }</td>
				            </tr>
				            <tr>
				              <td>香气/风味</td>
				              <td colspan="3">${project.relishName }</td>
				            </tr>
				            <tr>
				              <td>回味</td>
				              <td colspan="3">${project.aftertastName }</td>
				            </tr>
				            <tr>
				            	<td rowspan="3">描述</td>
				            	<td rowspan="3" colspan="3">${project.des }</td>
				            </tr>
				            <tr></tr>
				            <tr></tr>
				            <tr>
				              <td colspan="4"><strong>结论 ( Conclusion )</strong></td>
				            </tr>
				            <tr>
				              <td>品质</td>
				              <td colspan="3">${project.qualityName }</td>
				            </tr>
				          </tbody>
				        </table>
      				
      				</div>
		   		
		   		</div>
		   		
		   		
		   	
		   	</div>
		   	
		   	
	   		<footer>
	   			<%@include file="./../footer/footer.jsp" %>
			</footer><!-- <<< End Footer >>> -->
		</div><!-- End wrap -->    	
	</body>
</html>
		   	
		   	
		   	
		   	
		   	
		   	
		   	
		   	
		   	