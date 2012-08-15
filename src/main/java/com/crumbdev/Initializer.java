package com.crumbdev;

import com.crumbdev.auth.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Logger;

public class Initializer extends HttpServlet {
    public void init()
    {
        Logger.getLogger(getClass().getName()).info("Starting initialization");
        Security.secureGenerate();
        Logger.getLogger(getClass().getName()).info("MySQL Init");
        User.userExists("lol");
        Logger.getLogger(getClass().getName()).info("Properties Init");
        Properties.getProperty("herp");
        Logger.getLogger(getClass().getName()).info("Initialization Complete");
    }

    public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {}
}
