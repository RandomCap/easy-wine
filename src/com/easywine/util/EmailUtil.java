package com.easywine.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 
 *@company：美福科技
 *@package com.bjmf.srd.utils.txt
 *@title 文件名：EmailUtil.java
 *@author (作者): luozg 
 *@date 日期：2013年12月28日下午5:28:18
 *@version (版本信息)： Copyright 2013 版权所有
 */
public class EmailUtil {
	
	public static boolean chechEmailFormat( String email ) {
        Pattern pattern     =   null;
        Matcher matcher     =   null;
		pattern =   Pattern.compile("\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*", Pattern.CASE_INSENSITIVE);
		matcher =   pattern.matcher( email );
		return  matcher.find();
	}
	
}
