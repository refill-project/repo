package com.crumbdev;

import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RepositoryServlet extends GenericServlet {
    @Override
    public void service(ServletRequest servletRequest, ServletResponse servletResponse) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        String[] requesturl = ((HttpServletRequest) servletRequest).getRequestURI().split("/");
        try{
            response.setStatus(302);
            String slug = requesturl[2];
            if(slug.equalsIgnoreCase("repository")) {
                slug = requesturl[3];
            }
            response.sendRedirect(getFileDownloadURL(getFileDownloadPageURL(slug)));
        }catch(Exception e){
            response.setStatus(404);
        }
    }

    private String getFileDownloadPageURL(String project) throws IOException {

        Element el = xml.parseXML(String.format("http://dev.bukkit.org/server-mods/%s/files", project));
        NodeList n = el.getElementsByTagName("td");
        boolean broken = false;
        for(int i = 0; i < n.getLength() && !broken; i++)
        {
            Element newEl = (Element)n.item(i);
            NodeList newN = newEl.getElementsByTagName("a");
            for(int i2 = 0; i2 < newN.getLength() && !broken; i2++)
            {
                return String.format("http://dev.bukkit.org%s", ((Element) newN.item(i2)).getAttribute("href"));
            }
        }
        return "";
    }

    private String getFileDownloadURL(String downloadPageURL) throws IOException
    {
        Element el = xml.parseXML(downloadPageURL);
        NodeList n = el.getElementsByTagName("span");
        boolean broken = false;
        for(int i = 0; i < n.getLength() && !broken; i++)
        {
            Element newEl = (Element)n.item(i);
            NodeList newN = newEl.getElementsByTagName("a");
            for(int i2 = 0; i2 < newN.getLength() && !broken; i2++)
            {
                return ((Element)newN.item(i2)).getAttribute("href");
            }
        }
        return "";
    }
}
