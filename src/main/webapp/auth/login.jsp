<%@ page import="refill_project.*" %>
<%@ include file="/template/header.jsp" %>
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
<%@ include file="/template/footer.jsp" %>