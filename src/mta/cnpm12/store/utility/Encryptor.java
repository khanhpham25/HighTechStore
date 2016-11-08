package mta.cnpm12.store.utility;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Encryptor {
	public static String encryptMD5(String input) throws NoSuchAlgorithmException {
		MessageDigest md;
		md = MessageDigest.getInstance("MD5");
		byte[] messageDigest = md.digest(input.getBytes());
		BigInteger number = new BigInteger(1, messageDigest);
		String hashText = number.toString(16);
		while (hashText.length() < 32) {
			hashText = "0" + hashText;
		}
		return hashText;
	}
}
