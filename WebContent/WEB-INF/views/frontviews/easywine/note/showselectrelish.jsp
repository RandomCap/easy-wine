<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/commons/taglibs.jsp" %>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
    <head>
    
    	<meta charset="utf-8">
		<%@include file="/commons/css.jsp" %>
		<!--[if lt IE 9]>
			<script src="js/html5.js"></script>
		<![endif]-->
		<script src="${ctx}/js/jquery-1.9.1.min.js"></script>
		<script src="${ctx}/js/jquery.easing.1.3.min.js"></script>
		<script src="${ctx}/js/jquery-ui/jquery.ui.core.js"></script>
		<script src="${ctx}/js/jquery-ui/jquery.ui.widget.js"></script>
		<script src="${ctx}/js/jquery-ui/jquery.ui.accordion.js"></script>  
		<script src="${ctx}/js/jquery-cookie.js"></script> 
		<script src="${ctx}/js/jquery.flexslider.js"></script> 
		<script src="${ctx}/js/colortip.js"></script> 
		<script src="${ctx}/js/tytabs.js"></script> 
		<script src="${ctx}/js/jquery.ui.totop.js"></script> 
		<script src="${ctx}/js/carousel.js"></script> 
		<script src="${ctx}/js/jquery.isotope.min.js"></script> 
		<script src="${ctx}/js/twitter/jquery.tweet.js"></script> 
		<script src="${ctx}/js/jflickrfeed.min.js"></script> 
		<script src="${ctx}/js/doubletaptogo.js"></script> 
		<script src="${ctx}/js/fancybox/jquery.fancybox.js"></script> 
		<script src="${ctx}/js/jquery.sticky.js"></script> 
		
		
		<script  src="${ctx}/js/popupbox/jquery.popup.box.js?skin=${tipSkin}"></script>
		<script  src="${ctx}/js/popupbox/iframeTools.js"></script>
		<script  src="${ctx}/js/easywine/tiputil.js"></script>
		
		<script type="text/javascript">
		function backfillRelish( id , name ){
			pup.dialog.top.noteFunction.backfillRelish( id , name );
			TIP_FUNCTION.TIP_CLOSE_BY_ID();
		}
		</script>
		
    </head>
	<body>
		<div id="wrap" class="boxed">
			<div class="container main-content clearfix">
				<div class="eight columns bottom-3">
					 <table class="style">
					 		<tbody>
					 			<tr>
					              <th>序号</th>
					              <th>英国/地区</th>
					            </tr>
					 			<c:forEach var="relish" items="${relishs}" varStatus="index">
					 				<tr ondblclick="backfillRelish( ${relish.id}, '${relish.name}');" style="cursor: pointer;">
					 					<td>${index.index+1}</td>
										<td> ${relish.name} </td>
						            </tr>
					 			</c:forEach>
					 		</tbody>
					 </table>
				</div>
			</div>
		</div>
	</body>
</html>