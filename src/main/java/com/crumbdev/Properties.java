package com.crumbdev;

import java.io.*;
import java.util.Map;

public class Properties {
    private static java.util.Properties map = null;

    public static String getProperty(String key)
    {
        try {
            if(map == null)
            {
                map = new java.util.Properties();
                File file = new File((!System.getProperty("user.dir").equals("/var/cache/jetty/tmp") ? System.getProperty("user.dir") : "/crumb")+ "/config.properties");
                if(!file.exists())
                {
                    System.out.println(file.getAbsolutePath());
                    file.createNewFile();
                    BufferedWriter writer = new BufferedWriter(new FileWriter(file));
                    writer.write("captcha_public_key=CHANGEME\ncaptcha_private_key=CHANGEME\n\nmysql_host=localhost\nmysql_port=3306\nmysql_user=CHANGEME\nmysql_password=CHANGEME\nmysql_db=crumb\n\nanalytics=OFF");
                    writer.flush();
                    writer.close();
                }
                map.load(new FileReader(file));
            }
            return map.getProperty(key);
        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }
}
