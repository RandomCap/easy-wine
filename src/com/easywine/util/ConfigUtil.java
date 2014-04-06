package com.easywine.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * 
 *@company  
 *@ClassName ConfigUtil
 *@author mf-luozg 
 *@date 2014年3月9日下午6:57:37
 */
public class ConfigUtil {
	
	private static Properties props = new Properties();
	
	static {
		ClassLoader loader = ConfigUtil.class.getClassLoader();
		InputStream ips = loader.getResourceAsStream("config.properties");
		try {
			props.load(ips);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	public static String getValue(String key) {
		return props.getProperty(key);
	}
	
	public static void main(String[] args) {
		
		String str= ConfigUtil.getValue("test");
		System.out.println(str);
	}

}
