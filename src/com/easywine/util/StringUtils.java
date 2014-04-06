package com.easywine.util;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtils {

	public static String listStringIntoDB(List<String> strs){
		if (strs==null||strs.isEmpty())return null;
		StringBuffer sb = new StringBuffer("(");
		for (int i = 0; i < strs.size(); i++) {
			sb.append("'").append(strs.get(i)).append("',");
		}
		return sb.substring(0,sb.length() - 1)+ ")";
	}
	public static String listIntegerIntoDB(List<Integer> ids){
		List<String> strs = new ArrayList<String>(ids.size());
		for (int i = 0; i < ids.size(); i++) {
			strs.add(ids.get(i)+"");
		}
		return listStringIntoDB(strs);
	}
	

	/**
	 * HTML按长度转换成txt
	 * */
	public static String Ellipsis = "...";
	public static String htmlToText( String inputString , int length  ){
		String text = StringUtils.htmlToText(inputString);
		if( text.length() > length ){
			text = text.substring(0, length)+StringUtils.Ellipsis;
		} 
		return text ;
	} 
	public static String htmlToText(String inputString) {
		if( inputString == null ) return "";
		String htmlStr = inputString;
		String textStr = "";
		String scriptRegEx = "<[\\s]*?script[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?script[\\s]*?>";
		String styleRegEx = "<[\\s]*?style[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?style[\\s]*?>";
		String htmlRegEx1 = "<[^>]*>";
		String htmlRegEx2 = "<[^>]*";
		try {
			Pattern scriptPattern = Pattern.compile(scriptRegEx,
					Pattern.CASE_INSENSITIVE);
			Matcher scriptMatcher = scriptPattern.matcher(htmlStr);
			htmlStr = scriptMatcher.replaceAll("");
			Pattern stylePattern = Pattern.compile(styleRegEx,
					Pattern.CASE_INSENSITIVE);
			Matcher styleMatcher = stylePattern.matcher(htmlStr);
			htmlStr = styleMatcher.replaceAll("");
			Pattern htmlPattern1 = Pattern.compile(htmlRegEx1,
					Pattern.CASE_INSENSITIVE);
			Matcher htmlMatcher1 = htmlPattern1.matcher(htmlStr);
			htmlStr = htmlMatcher1.replaceAll("");
			Pattern htmlPattern2 = Pattern.compile(htmlRegEx2,
					Pattern.CASE_INSENSITIVE);
			Matcher htmlMatcher2 = htmlPattern2.matcher(htmlStr);
			htmlStr = htmlMatcher2.replaceAll("");
			textStr = htmlStr;
		} catch (Exception e) {
			System.err.println("->htmlToText(String inputString):" + e.getMessage());
		}
		textStr = textStr.replaceAll("&acute;", "\'");
		textStr = textStr.replaceAll("&quot;", "\"");
		textStr = textStr.replaceAll("&lt;", "<");
		textStr = textStr.replaceAll("&gt;", ">");
		textStr = textStr.replaceAll("&nbsp;", " ");
		textStr = textStr.replaceAll("&amp;", "&");
		textStr = textStr.replaceAll( "＂", "“");
		textStr = textStr.replaceAll("＂", "”");
		return textStr;
	}


//    public static void main(String[] args){
//    	String htmlStr = "&lt;a href=\"www.baidu.com\"&gt;&lt;/a&gt;";
//    	System.out.println(StringUtils.htmlToText(htmlStr, 10));
//    }
}
