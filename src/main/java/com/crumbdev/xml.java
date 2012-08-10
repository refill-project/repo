package com.crumbdev;

import org.w3c.dom.Element;
import org.xml.sax.InputSource;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.URL;

public class xml {
    public static Element parseXML(String url)
    {
        try {
            URL u = new URL(url);
            BufferedReader r = new BufferedReader(new InputStreamReader(u.openStream()));
            StringBuilder s = new StringBuilder();
            while(r.ready())
                s.append(String.format("%s\n", r.readLine()));
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
            DocumentBuilder db = dbf.newDocumentBuilder();
            InputSource sour = new InputSource(new StringReader(s.toString().replaceAll("\\&(.+);", "").replaceAll("\\&", "").replace("<br>", "")));
            return db.parse(sour).getDocumentElement();
        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }

}
