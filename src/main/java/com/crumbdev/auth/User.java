package com.crumbdev.auth;

import com.crumbdev.MySQL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Created with IntelliJ IDEA.
 * User: 8381111
 * Date: 10/08/12
 * Time: 11:57 PM
 * To change this template use File | Settings | File Templates.
 */
public class User {
    public boolean userExists(String username)
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

    public static User createUser(String username, String password, String email)
    {
        return new User(username);
    }

    public User(String username) {
        try {
            if(!userExists(username))
                throw new NullPointerException();

        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }

}
