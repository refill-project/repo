<%@ page import="refill_project.*" %>
<%@ include file="/template/header.jsp" %>
<div class="row">
    <div class="span5">
        <div class="well">
            <h1 class="page-title">Login</h1>
<%
    if (request.getParameter("username") == null || request.getParameter("username").equals("") || request.getParameter("password") == null || request.getParameter("password").equals("")){%>
        <form method="post">
            Username: <input type="text" name="username"/><br/>
            Password: <input type="password" name="password"/><br/>
            <input type="submit"/>
        </form>
<%  } else {%>
        Log in the user (<%= String.format("%s:%s", request.getParameter("username"), request.getParameter("password")) %>)
<%  } %>
        </div>
    </div>
    <div class="span5 pull-right">
        <div class="well">
            <h1 class="page-title">Register</h1>
            <p><small>Not available yet.. please try back soon!</small></p>
        </div>
    </div>
</div>
<%@ include file="/template/footer.jsp" %>