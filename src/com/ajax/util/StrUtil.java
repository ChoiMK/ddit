package com.ajax.util;

public class StrUtil {
	public static String toJS(String str){
		if(str == null) return "";
		return str.replace("\\", "\\\\")
				  .replace("\"", "\\\"")
				  .replace("\'", "\\n")
				  .replace("\n", "\\n");
				  
				   
	}
}
