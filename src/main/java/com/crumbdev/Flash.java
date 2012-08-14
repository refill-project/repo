package com.crumbdev;

public class Flash {

    public boolean isFlash;
    public String notice;
    public String type;
    
    
    /**
    
    @param type - can be info, success, warning, or block (standard alert)
    
    */
    
    public Flash(String notice, String type){
        this.notice = notice;
        this.type = type;
        this.isFlash = true;
    }
    
    public String getNotice(){
        return this.notice;
    }
    
    /**
    
    @param type - can be info, success, warning, or block (standard alert)
    
    */
    
    public String getType(){
        return this.type;
    }
    
    public boolean isFlashed(){
        return this.isFlash;
    }
    
    public void setNotice(String n){
        this.notice = n;
    }
    
    public void setType(String t){
        this.type = t;
    }
    
    public void setFlashed(boolean f){
        this.isFlash = f;
    }

}