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
		         		
         				<h1> ${noteName }</h1>
        				<div class="portfolio-control">
	         				<c:if test="${user != null }">
					       		<a href="${ctx }/wine_tasting_note_item_add_${noteId}.html" class="all black" data="Add note item"><i class="icon-pencil"></i></a>
							</c:if>
				          	<a href="${ctx }/main_note_4.html" class="all black" data="Go back all notes" ><i class="icon-th"></i></a>
						</div><!-- End control -->

		       		</div>
	     		</div><!-- End Container -->
	   		</div><!-- End Page title -->
		   	
		   	<div class="container main-content clearfix">
		   	
		   		<div class="portfolio bottom-3">
		   		
		   				<div id="contain">
		   				
		   					<!-- item 1 -->
		   					<c:forEach items="${items }" var="item">
								<div class="eight columns item element-2" >
									<a href="${ctx}/note_item_detail_${item.noteId}_${item.itemId}.html">
										<img src="images/img/portfolio/thumb-1.jpg" alt="" class="pic" />
										<div class="img-caption">
							          		<div class="desc">
							          			<h3>${item.itemName}</h3>
							          			<p>${item.itemManufacturer}</p>
							          			<p>${item.itemArea}</p>
							          			<p>${item.crateDate}</p>
							          			<p>${item.des}</p>
							          			<span>+</span>
							          		</div>
							          	</div><!-- hover effect -->
									</a>
								</div>
							</c:forEach>
							<!-- End -->
		   					
		   				</div>
		   		
		   		</div>
		   	
		   	</div>
		   	
		   	<footer>
		   		<%@include file="./../footer/footer.jsp" %>
			</footer><!-- <<< End Footer >>> -->
		</div><!-- End wrap -->    	
	</body>
</html>
		   	