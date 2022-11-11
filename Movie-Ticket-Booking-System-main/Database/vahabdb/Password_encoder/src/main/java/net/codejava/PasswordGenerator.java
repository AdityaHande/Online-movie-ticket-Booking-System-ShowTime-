package net.codejava;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordGenerator {
    public static void main(String[] args) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        
        String rawPassword1 = "amol";
        String encodePassword1 = encoder.encode(rawPassword1);
        
        System.out.println(rawPassword1 +" =");
        System.out.println(encodePassword1);
        System.out.println();
        
        String rawPassword2 = "Vahab@123";
        String encodePassword2 = encoder.encode(rawPassword2);

        System.out.println(rawPassword2 +" =");
        System.out.println(encodePassword2);
        System.out.println();
        
        String rawPassword3 = "sourabh";
        String encodePassword3 = encoder.encode(rawPassword3);

        System.out.println(rawPassword3 +" =");
        System.out.println(encodePassword3);
        System.out.println();
        
        String rawPassword4 = "dummy2";
        String encodePassword4 = encoder.encode(rawPassword4);

        System.out.println(rawPassword4 +" =");
        System.out.println(encodePassword4);
        System.out.println();
    }
}
