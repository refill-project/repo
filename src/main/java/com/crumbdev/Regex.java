package com.crumbdev;

import java.util.regex.Pattern;


public class Regex {
    public static boolean match(String regex, String toMatch)
    {
        Pattern p = Pattern.compile(regex);
        return p.matcher(toMatch).find();
    }
}
