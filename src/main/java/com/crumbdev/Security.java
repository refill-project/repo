package com.crumbdev;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Formatter;
import java.util.Random;


public class Security {
    private static SecureRandom secure = null;
    private static Random insecure = null;
    public static String secureGenerate()
    {
        try {
            if(insecure == null)
                insecure = new Random();
            if(insecure.nextInt(3) == 1 || secure == null)
            {
                secure = SecureRandom.getInstance("SHA1PRNG");
                secure.setSeed(secure.generateSeed(insecure.nextInt(1024)));
            }
            byte[] bytes = new byte[20];
            secure.nextBytes(bytes);
            return new BigInteger(bytes).abs().toString(16);
        } catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }

    public static String crypt(String toCrypt)
    {
        return crypt("SHA-512", toCrypt);
    }

    public static String crypt(String cypher, String toCrypt)
    {
        try {
            return new BigInteger(1, MessageDigest.getInstance(cypher).digest(toCrypt.getBytes("UTF-8"))).toString(16);
        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }

}
