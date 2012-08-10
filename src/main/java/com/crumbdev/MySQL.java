package com.crumbdev;

import java.sql.*;

public class MySQL {
    private static Connection con = null;
    public static Connection getConnection()
    {
        try {
            if(con == null || con.isClosed())
            {
                con = DriverManager.getConnection(String.format("jdbc:mysql://%s:%s/%s", Properties.getProperty("mysql_host"), Properties.getProperty("mysql_port"), Properties.getProperty("mysql_db")), Properties.getProperty("mysql_user"), Properties.getProperty("mysql_password"));
            }
            return con;
        } catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }
}
