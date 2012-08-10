<%@ page import="com.crumbdev.*" %>
<% if ( request.getParameter("type") != null && (request.getParameter("type").equals("login") || request.getParameter("type").equals("register")))
    { %>
        Login/register
<% return; } %>
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
                <input type="hidden" name="type" value="register"/>
                Username: <input type="text" name="username"/></br>
                Password: <input type="password" id="pass" name="password"/></br>
                Confirm Password: <input type="password" id="pass2"/><br/>
                Email Address: <input type="text" id="email" name="email"/></br>
                Confirm Email: <input type="text" id="email2"/> <br/>
                <script type="text/javascript" src="http://www.google.com/recaptcha/api/challenge?k=6LfJH9USAAAAACip4DSSdBrGeRKFaH-EpCbFU0uJ" />
                <noscript>
                    <iframe src="http://www.google.com/recaptcha/api/noscript?k=6LfJH9USAAAAACip4DSSdBrGeRKFaH-EpCbFU0uJ"
                        height="300" width="500" frameborder="0"></iframe><br>
                    <textarea name="recaptcha_challenge_field" rows="3" cols="40">
                    </textarea>
                    <input type="hidden" name="recaptcha_response_field"
                        value="manual_challenge">
                </noscript>
                <br/>
                <input type="submit"/>
            </form.
        </div>
    </div>
</div>
<%@ include file="/template/footer.jsp" %>