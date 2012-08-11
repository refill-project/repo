package com.crumbdev;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Formatter;
import java.util.Random;

/**
 * Created with IntelliJ IDEA.
 * User: 8381111
 * Date: 12/08/12
 * Time: 12:57 AM
 * To change this template use File | Settings | File Templates.
 */
public class Security {
    private static SecureRandom secure = null;
    private static Random insecure = null;
    public static String secureGenerate()
    {
        try {
            if(secure == null)
                secure = SecureRandom.getInstance("SHA1PRNG");
            if(insecure == null)
                insecure = new Random();
            if(insecure.nextInt(3) == 1)
            {
                secure = SecureRandom.getInstance("SHA1PRNG");
                secure.setSeed(secure.generateSeed(1024));
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
            Formatter f = new Formatter();
            return new BigInteger(1, MessageDigest.getInstance(cypher).digest(toCrypt.getBytes("UTF-8"))).toString(16);
        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }

}
