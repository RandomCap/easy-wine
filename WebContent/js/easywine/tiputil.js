

var TIP_FUNCTION = {
		/**
		 * 标准 弹出框 
		 * title : 标题 ( false时为无边框 )
		 * msg : 内容
		 * time ：自动关闭时间
		 * width ： 宽度（默认 auto）
		 * flag : 是否锁屏（默认  false  ）
		 */
		TIP_MESSAGE_SHOW : function ( title , msg, time , width , flag ){
			pup.dialog({
				width: width||'auto',
				title : title ,
			    id: 'message_1',
			    content: msg,
			    time : time || null, 
			    drag : false ,
			    lock: flag ||false
			});
		},
		/**
		 * 带图标的 弹出框 
		 * msg : 内容
		 * ioc ： 图标样式
		 * width ： 宽度（默认 auto）
		 */
		TIP_SIMPLE_SHOW : function ( msg , ioc , width ){
			pup.dialog({
				id: 'icon_id',
				width: width||'auto',
			    icon: ioc||'succeed',
			    content: msg,
			    drag : false
			});
		},
		/**
		 * 带 确定 取消按钮的 弹出框 
		 * title ：标题 ( false时为无边框 )
		 * msg : 内容
		 * width ： 宽度（默认 auto）
		 * callback ：当点击确定后的 回调函数
		 */
		TIP_OK_CANCEL_SHOW : function ( title , msg , width , callback ){
			pup.dialog({
				id: 'ok_cancel_id',
				width: width||'auto',
				title : title||'提示',
			    content: msg,
			    lock: true,
			    fixed: true,
			    ok: function () {
			    	callback();
			    },
			    cancelVal: '关闭',
			    cancel: true 
			});
		},
		/**
		 * 带 确定 取消按钮的 弹出框 
		 * title ：标题 ( false时为无边框 )
		 * imgUrl : 图片地址
		 * imgWidth ： 图片宽度
		 * imgHeight ：图片高度
		 */
		TIP_SINGLE_IMG_SHOW : function ( title, imgUrl, imgWidth, imgHeight ){
			pup.dialog({
				id: 'img_id',
			    padding: 0,
			    title: title||'照片',
			    content: '<img src="'+imgUrl+'" width="'+imgWidth+'" height="'+imgHeight+'" />',
			    lock: true
			});
		},
		/**
		 * 弹出框  iframe页面
		 */
		TIP_OPEN_HTML_SHOW : function( title, url, width, height , flag ){
			pup.dialog.open(
					url ,
					{ 	id:"iframe_show_id ",
						width : width,
						height : height||500,
						title : title || false,
						background : "#000",
						icon : null,
						lock : flag
					});
		} ,
		
		/**
		 * 无标题 弹出提示框
		 */
		TIP_NONE_BORDER_SHOW : function ( msg , time ){
			pup.dialog.tips(	msg, time||1.5 );
		},
		
		/**
		 * 关闭弹出框
		 */
		TIP_CLOSE_BY_ID : function ( ){
			pup.dialog.close();
		}
}