<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/commons/taglibs.jsp" %>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
    <head>
    	<meta charset="utf-8">
		<title>Study notes - EASY WINE | Creative passion Theme</title>
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
		         		
						<div class="title clearfix" id="options" style="padding: 0px;margin-bottom: 0px;">
					        <ul id="filters" class="option-set clearfix" data-option-key="filter">
					        	<li><a href="#filter" data-option-value="*" class="selected">全部品酒笔记</a></li>
					        	<c:if test="${user != null }">
						        	<li><a href="#filter" data-option-value=".${user.name }">个人品酒笔记</a></li>
					        	</c:if>
					        </ul>
							<div class="portfolio-control" style="margin-top: -40px">
		         				<c:if test="${user != null }">
						       		<a href="${ctx }/wine_tasting_note_add.html" class="all black" data="Add note"><i class="icon-pencil"></i></a>
								</c:if>
							</div><!-- End control -->
						</div>

		       		</div>
	     		</div><!-- End Container -->
	   		</div><!-- End Page title -->
	   		
		   	<div class="container main-content clearfix">
		   		
		   		<div class="blog-3 bottom-2 ">
		   		
		   			<div id="contain">
		   			
		   				<c:forEach items="${notes }" var="note">
							<!-- ==================== Post ==================== -->
							<c:choose>
								<c:when test="${note.userName == user.name }">
									<div class="one-third column item ${note.userName }" data-categories="${note.userName }">
								</c:when>
								<c:otherwise>
									<div class="one-third column item " data-categories="visible">
								</c:otherwise>
							</c:choose>
								<div class="contain"> 
					        		<div class="image-post"> 
					        			<a href="#"><img src="${ctx }/images/img/portfolio/thumb-5.jpg"></a>
					        		</div><!-- End slider image-post -->
					        		<div class="data">
										<a href="${ctx }/testing_note_items_${note.noteId }.html" class="title">${note.noteTitle }</a><!-- Title Post -->
										<div class="post-meta">
											<div class="meta"><i class="icon-time"></i> ${note.createTime } </div><!-- Date -->
											<div class="meta"><i class="icon-tags"></i> <a href="#">${note.userName }</a> </div><!-- Category -->
								      	</div><!-- End post-meta -->
					      			</div><!-- End data -->
					     
					       		</div><!-- End contain --> 
	      					</div>
	      					<!-- ==================== End  ==================== -->
      					</c:forEach>
      
				     
				     </div>
		   			
		   		</div>
		   		
		   	</div>
		   	
		   	<footer>
		   		<%@include file="./../footer/footer.jsp" %>
			</footer><!-- <<< End Footer >>> -->
		</div><!-- End wrap -->    	
	</body>
</html>
		   	