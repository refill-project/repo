<%@ page import="com.crumbdev.*" %>
<%@ page import="com.crumbdev.auth.*" %>
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
String loginmessage = "";
Flash loggedinFlash = new Flash("Logged in Successfully!","success");
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
                if(!request.getParameter("password").equals(request.getParameter("password2")))
                {
                    loggedinFlash.setFlashed(false);
                    registermessage = "Passwords did not match";
                }
                else if(!Regex.match("^[A-Za-z0-9_\\-]{3,}$", request.getParameter("username")))
                {
                    loggedinFlash.setFlashed(false);
                    registermessage = "Username was invalid. Accepted characters are A-Z, a-z, 0-9, hyphen and underscore.";
                }
                else if(!Regex.match("^[A-Za-z0-9\\._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$", request.getParameter("email")))
                {
                    loggedinFlash.setFlashed(false);
                    registermessage = "Email address was invalid. Please use a valid email address";
                }
                else if(User.userExists(request.getParameter("username")))
                {
                    loggedinFlash.setFlashed(false);
                    registermessage = "A user by that name already exists. Please try another user name.";
                }
                else if(User.emailExists(request.getParameter("email")))
                {
                    loggedinFlash.setFlashed(false);
                    registermessage = "A user already exists using that email address. Please select another email address.";
                }
                else
                {
                    loggedinFlash.setFlashed(false);
                    User.createUser(request.getParameter("username"), request.getParameter("password"), request.getParameter("email"));
                    registermessage = "Please check your email inbox for a confirmation email (TODO)";
                }
            } else {
                loggedinFlash.setFlashed(false);
                registermessage = "Captcha response was incorrect. Please try again";
            }
        }
        catch (IOException e)
        {
            loggedinFlash.setFlashed(false);
            throw new RuntimeException(e);
        }
    }
    else if(request.getParameter("type").equals("login"))
    {
        if(User.userExists(request.getParameter("username")) && (new User(request.getParameter("username"))).passwordMatch(request.getParameter("password")))
        {
            loginmessage = "Successfully logged in";
            session.setAttribute("loggedInAs", request.getParameter("username"));
        }
        else
        {   
            loggedinFlash.setFlashed(false);
            loginmessage = "Username/password not recognized, please try again";
        }
    }
}
%>
<%@ include file="/template/header.jsp" %>
    <% if ( loggedinFlash.isFlashed() ) { %>
    <div class="row">
        <div class="span12">
            <div class="alert alert-<%= loggedinFlash.getType() %>">
                <%= loggedinFlash.getNotice() %>
            </div>
        </div>
    </div>
    <% } %>
    <div class="row">
        <div class="span6">
            <div class="well">
                <h1 class="page-title">Login</h1>
                <form method="post">
                    <% if ( !loginmessage.equals(""))  { %>
                        <span style="color: #FF0000; font-weight: bold"><%= loginmessage %></span><br/>
                    <% } %>
                    <input type="hidden" name="type" value="login"/>
                    <table>
                        <tr>
                            <td>Username:</td>
                            <td><input type="text" name="username"/></td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td><input type="password" name="password"/></td>
                        </tr>
                    </table>
                    <input type="submit"/>
                </form>
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
                    <table>
                        <tr>
                            <td>Username:</td>
                            <td><input type="text" name="username" value="<% if(request.getParameter("username") != null) out.print(request.getParameter("username"));%>"/></td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td><input type="password" name="password"/></td>
                        </tr>
                        <tr>
                            <td>Confirm Password:</td>
                            <td><input type="password" name="password2"/></td>
                        </tr>
                        <tr>
                            <td>Email Address:</td>
                            <td><input type="text" name="email" value="<% if(request.getParameter("email") != null) out.print(request.getParameter("email"));%>"/></td>
                        </tr>

                    </table>
                    <input type="submit"/>
                    <script type="text/javascript" src="https://www.google.com/recaptcha/api/challenge?k=<%= Properties.getProperty("captcha_public_key")%>" />
                    <noscript>
                        <iframe src="https://www.google.com/recaptcha/api/noscript?k=<%= Properties.getProperty("captcha_public_key")%>" height="300" width="500" frameborder="0"></iframe><br/>
                        <textarea name="recaptcha_challenge_field" rows="3" cols="40"></textarea>
                        <input type="hidden" name="recaptcha_response_field" value="manual_challenge">
                    </noscript>
                </form>
            </div>
        </div>
    </div>
<%@ include file="/template/footer.jsp" %>