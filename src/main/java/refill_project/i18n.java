package refill_project;

import java.text.SimpleDateFormat;
import java.util.Date;

public class i18n {
    public static String get(String key)
    {
        if(key.equals("name"))
            return "Crumb";
        else if(key.equals("copyright"))
            return String.format("Copyright &copy; %s %s", new SimpleDateFormat("yyyy").format(new Date()), get("name"));
        return key;
    }
}
