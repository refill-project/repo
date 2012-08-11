package com.crumbdev.auth;

import com.crumbdev.MySQL;
import com.crumbdev.Security;

import java.math.BigInteger;
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

    public static boolean emailExists(String email)
    {
        try {
            PreparedStatement s = MySQL.getConnection().prepareStatement("SELECT COUNT(username) as count FROM users WHERE email = ?");
            s.setString(1, email);
            ResultSet result = s.executeQuery();
            result.next();
            return result.getInt("count") == 1;
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
            s.setString(2, Security.crypt(password));
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
        try {
            PreparedStatement s = MySQL.getConnection().prepareStatement("SELECT `password` FROM `users` WHERE `username`=?");
            s.setString(1, username);
            ResultSet result = s.executeQuery();
            result.next();
            return Security.crypt(password).equalsIgnoreCase(result.getString("password"));
        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }

    public void setPassword(String newPassword)
    {
        try {
            PreparedStatement s = MySQL.getConnection().prepareStatement("UPDATE `users` SET `password`=? WHERE `username`=?");
            s.setString(1, Security.crypt(newPassword));
            s.setString(2, username);
            s.executeUpdate();
        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }

    public String getEmail()
    {
        try {
            PreparedStatement s = MySQL.getConnection().prepareStatement("SELECT `email` FROM `users` WHERE `username`=?");
            s.setString(1, username);
            ResultSet result = s.executeQuery();
            result.next();
            return result.getString("email");
        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }

    }

    public void setEmail(String newEmail)
    {
        try {
            PreparedStatement s = MySQL.getConnection().prepareStatement("UPDATE `users` SET `email`=? WHERE `username`=?");
            s.setString(1, newEmail);
            s.setString(2, username);
            s.executeUpdate();
        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }

    public String getGravatarURL()
    {
        return getGravatarURL(80);
    }

    public String getGravatarURL(int size)
    {
        return String.format("http://www.gravatar.com/avatar/%s.png?s=%s", Security.crypt("MD5", getEmail()), size);
    }
}
