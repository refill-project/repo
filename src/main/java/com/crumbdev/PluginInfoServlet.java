package com.crumbdev;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class PluginInfoServlet extends GenericServlet {

	private String pluginName;

    @Override
    public void service(ServletRequest servletRequest, ServletResponse servletResponse) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        response.setStatus(200);
        pluginName = servletRequest.toString();
        request.getRequestDispatcher("/plugin.jsp").forward(request, response);
    }
    
    public String getPluginName(){
    	return pluginName;
    }
    
    
    
}