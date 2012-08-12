package com.crumbdev;

import com.crumbdev.auth.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Logger;

/**
 * Created with IntelliJ IDEA.
 * User: 8381111
 * Date: 12/08/12
 * Time: 11:32 AM
 * To change this template use File | Settings | File Templates.
 */
public class Initializer extends HttpServlet {
    public void init()
    {
        Logger.getLogger(getClass().getName()).info("Starting initialization");
        Security.secureGenerate();
        User.userExists("lol");
        Properties.getProperty("herp");
        Logger.getLogger(getClass().getName()).info("Initialization Complete");
    }

    public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {}
}
