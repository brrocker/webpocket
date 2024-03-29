package com.webpocket.commonservice;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Developer: Terry DateTime : 2007-12-18 下午03:36:22
 */

public class MD5 {
	public static String compute(String inStr) {
		String result = null;
		try {
			byte[] valueByte = inStr.getBytes();
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(valueByte);
			result = toHex(md.digest());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 将传递进来的字节数组转换成十六进制的字符串形式并返回
	private static String toHex(byte[] buffer) {
		StringBuffer sb = new StringBuffer(buffer.length * 2);
		for (int i = 0; i < buffer.length; i++) {
			sb.append(Character.forDigit((buffer[i] & 0xf0) >> 4, 16));
			sb.append(Character.forDigit(buffer[i] & 0x0f, 16));
		}
		return sb.toString();

	}
	
	public static void main(String[] args){
		System.out.println(compute("123456"));
	}
	
}

