package com.crumbdev;

import java.util.regex.Pattern;

/**
 * Created with IntelliJ IDEA.
 * User: 8381111
 * Date: 11/08/12
 * Time: 5:59 PM
 * To change this template use File | Settings | File Templates.
 */
public class Regex {
    public static boolean match(String regex, String toMatch)
    {
        Pattern p = Pattern.compile(regex);
        return p.matcher(toMatch).find();
    }
}
