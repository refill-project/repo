package refill_project;

import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

/**
 * Created with IntelliJ IDEA.
 * User: 8381111
 * Date: 31/07/12
 * Time: 8:15 PM
 * To change this template use File | Settings | File Templates.
 */
public class RepositoryServlet extends GenericServlet {
    @Override
    public void service(ServletRequest servletRequest, ServletResponse servletResponse) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        response.setStatus(302);
        response.setHeader("Location", getFileDownloadURL(getFileDownloadPageURL(((HttpServletRequest) servletRequest).getRequestURI().split("/")[2])));
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
