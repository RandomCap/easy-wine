package com.easywine.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.easywine.user.pojo.User;
import com.easywine.util.base.Constants;

public class SessionUtil {
	

	/**
	 * 
	 *@description 此方法描述的是：向 session 保存 临时变量
	 *@author mf-luozg 
	 *@version 2014年3月12日下午11:42:08.
	 */
	public static void setTemporaryVariable(HttpServletRequest request,
			String key, Object obj) {
		request.getSession().setAttribute( key , obj);
	}
	/**
	 * 
	 *@description 此方法描述的是：向 session 保存 用户信息
	 *@author mf-luozg 
	 *@version 2014年3月10日下午11:13:47.
	 */
	public static void setCurrentUser(HttpServletRequest request, 
			HttpServletResponse response, User user) {
		request.getSession().setAttribute(Constants.USER_SESSION_INFO, user);
		HttpSession sess = request.getSession();
		Cookie cookie = new Cookie("JSESSIONID", sess.getId());
		cookie.setMaxAge(sess.getMaxInactiveInterval());
		response.addCookie(cookie);
	}
	/**
	 * 
	 *@description 此方法描述的是：等到 session 用户
	 *@author mf-luozg 
	 *@version 2014年3月10日下午11:16:22.
	 */
	public static User getCurrenUser(HttpServletRequest request){
		Object o  = request.getSession().getAttribute(Constants.USER_SESSION_INFO);
		return o == null ? null : (User) o;
	}
	
	/**
	 * 
	 *@description 此方法描述的是：获得 session 中用户的email
	 *@author mf-luozg 
	 *@version 2014年3月10日下午11:17:18.
	 */
	public static String getCurrenUserEmail( HttpServletRequest request ) {
		User user = getCurrenUser( request );
		if(user != null){
			return user.getEmail();
		}
		return null;
	}
	/**
	 * 
	 *@description 此方法描述的是： 获得session 中的用户登陆名
	 *@author mf-luozg 
	 *@version 2014年3月10日下午11:18:07.
	 */
	public static String getCurrenUserLoginName( HttpServletRequest request ) {
		User user = getCurrenUser( request );
		if(user != null){
			return user.getLogin_name();
		}
		return null;
	}
	/**
	 * 
	 *@description 此方法描述的是：清除session 中的用户信息
	 *@author mf-luozg 
	 *@version 2014年3月10日下午11:18:19.
	 */
	public static void clearCurrentUser( HttpServletRequest request ,HttpServletResponse response ){
		request.getSession().invalidate();
		clear(request, response);
	}
	/**
	 * 
	 *@description 此方法描述的是：清除全部cookies 
	 *@author mf-luozg 
	 *@version 2014年3月10日下午11:18:31.
	 */
	public static void clear(HttpServletRequest req,HttpServletResponse res) {
		Cookie[] cookies = req.getCookies();
		if( cookies!=null ){
			for(int i = 0,len = cookies.length; i < len; i++) {
				Cookie cookie = new Cookie(cookies[i].getName(),null);
				cookie.setMaxAge(0);
				//cookie.setPath("/");
				res.addCookie(cookie);
			}
		}
	}

	/**
	 * 
	 *@description 此方法描述的是：获得当前用户的  IP
	 *@author mf-luozg 
	 *@version 2014年3月10日下午11:18:47.
	 */
	public static String getIpAddr( HttpServletRequest request ) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }
	
}
