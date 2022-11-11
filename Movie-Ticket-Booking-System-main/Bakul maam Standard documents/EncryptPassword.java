import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptPassword {

	public static void main(String[] args) throws NoSuchAlgorithmException 
	{
		MessageDigest md = MessageDigest.getInstance("SHA-512");
		String password = "secret";
		byte [] pwd = password.getBytes();
		md.update(pwd);
		byte [] modified = md.digest();
		StringBuilder builder = new StringBuilder();
        for (byte b : modified) {      	
        	
        	 builder.append(Integer.toString((b & 0xff) + 0x100, 16).substring(1));  
            /*if ((b & 0xff) < 0x10) {
                builder.append("0");
            }
            builder.append(Long.toString(b & 0xff, 16));*/
        }
        System.out.println("Original : "+password);
        System.out.println("Encrypted : "+builder);

	}

}
