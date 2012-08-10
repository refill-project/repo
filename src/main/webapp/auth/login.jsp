<%@ page import="com.crumbdev.*" %>
<%@ page import="org.apache.http.HttpResponse" %>
<%@ page import="org.apache.http.NameValuePair" %>
<%@ page import="org.apache.http.client.HttpClient" %>
<%@ page import="org.apache.http.client.entity.UrlEncodedFormEntity" %>
<%@ page import="org.apache.http.client.methods.HttpPost" %>
<%@ page import="org.apache.http.impl.client.DefaultHttpClient" %>
<%@ page import="org.apache.http.message.BasicNameValuePair" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%
String registermessage = "";
if ( request.getParameter("type") != null && (request.getParameter("type").equals("login") || request.getParameter("type").equals("register")))
{
    if(request.getParameter("type").equals("register")) {
        HttpClient client = new DefaultHttpClient();
        HttpPost req = new HttpPost("http://www.google.com/recaptcha/api/verify");
        try {
            List<NameValuePair> values = new ArrayList<NameValuePair>();
            values.add(new BasicNameValuePair("privatekey", Properties.getProperty("captcha_private_key")));
            values.add(new BasicNameValuePair("remoteip", request.getHeader("X-Forwarded-For")));
            values.add(new BasicNameValuePair("challenge", request.getParameter("recaptcha_challenge_field")));
            values.add(new BasicNameValuePair("response", request.getParameter("recaptcha_response_field")));
            req.setEntity(new UrlEncodedFormEntity(values));
            HttpResponse resp = client.execute(req);
            BufferedReader rd = new BufferedReader(new InputStreamReader(resp.getEntity().getContent()));
            String line = rd.readLine();
            if(Boolean.valueOf(line))
            {
                //Validate ALL THE THINGS (Captcha was successful)
            } else {
                registermessage = "Captcha response was incorrect. Please try again";
            }
        }
        catch (IOException e)
        {
            throw new RuntimeException(e);
        }
    }
}
%>
<%@ include file="/template/header.jsp" %>
    <div class="row">
        <div class="span6">
            <div class="well">
                <h1 class="page-title">Login</h1>
    <%
        if (request.getParameter("username") == null || request.getParameter("username").equals("") || request.getParameter("password") == null || request.getParameter("password").equals("")){%>
            <form method="post">
                <input type="hidden" name="type" value="login"/>
                Username: <input type="text" name="username"/><br/>
                Password: <input type="password" name="password"/><br/>
                <input type="submit"/>
            </form>
    <%  } else {%>
            Log in the user (<%= String.format("%s:%s", request.getParameter("username"), request.getParameter("password")) %>)
    <%  } %>
            </div>
        </div>
        <div class="span6">
            <div class="well">
                <h1 class="page-title">Register</h1>
                <form method="post">
                    <% if ( !registermessage.equals(""))  { %>
                        <span style="color: #FF0000; font-weight: bold"><%= registermessage %></span><br/>
                    <% } %>
                    <input type="hidden" name="type" value="register"/>
                    Username: <input type="text" name="username"/></br>
                    Password: <input type="password" id="pass" name="password"/></br>
                    Confirm Password: <input type="password" id="pass2"/><br/>
                    Email Address: <input type="text" id="email" name="email"/></br>
                    Confirm Email: <input type="text" id="email2"/> <br/>
                    <input type="submit"/>
                    <script type="text/javascript" src="http://www.google.com/recaptcha/api/challenge?k=<%= Properties.getProperty("captcha_public_key")%>" />
                    <noscript>
                        <iframe src="http://www.google.com/recaptcha/api/noscript?k=<%= Properties.getProperty("captcha_public_key")%>"
                            height="300" width="500" frameborder="0"></iframe><br>
                        <textarea name="recaptcha_challenge_field" rows="3" cols="40">
                        </textarea>
                        <input type="hidden" name="recaptcha_response_field"
                            value="manual_challenge">
                    </noscript>
                </form>
            </div>
        </div>
    </div>
<%@ include file="/template/footer.jsp" %>