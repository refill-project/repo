package com.crumbdev.auth;

import com.crumbdev.MySQL;

import java.security.MessageDigest;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Formatter;

/**
 * Created with IntelliJ IDEA.
 * User: 8381111
 * Date: 10/08/12
 * Time: 11:57 PM
 * To change this template use File | Settings | File Templates.
 */
public class User {
    public static boolean userExists(String username)
    {
        try {
            PreparedStatement s = MySQL.getConnection().prepareStatement("SELECT COUNT(username) as count FROM users WHERE username = ?");
            s.setString(1, username);
            ResultSet result = s.executeQuery();
            result.next();
            return result.getInt("count") == 1;
        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }

    public static String crypt(String toCrypt)
    {
        try {
            Formatter f = new Formatter();
            for(byte by : MessageDigest.getInstance("SHA-1").digest(toCrypt.getBytes()))
                f.format("%02x", by);
            return f.toString();
        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }

    public static User createUser(String username, String password, String email)
    {
        try {
            if(userExists(username))
                return new User(username);
            PreparedStatement s = MySQL.getConnection().prepareStatement("INSERT INTO `users` (`username`, `password`, `email`) VALUES (?, ?, ?)");
            s.setString(1, username);
            s.setString(2, crypt(password));
            s.setString(3, email);
            s.executeUpdate();
            return new User(username);
        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }


    public User(String username) {
        try {
            if(!userExists(username))
                throw new NullPointerException();
            this.username = username;
        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }

    private final String username;

    public boolean passwordMatch(String password)
    {

    }

    public void setPassword(String newPassword)
    {

    }

    public String getEmail()
    {

    }

    public void setEmail()
    {

    }
}
