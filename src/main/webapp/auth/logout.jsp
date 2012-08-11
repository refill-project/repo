<%@ page import="com.crumbdev.*" %>
<%@ page import="java.util.Enumeration" %>
<%  for(Enumeration<String> e = session.getAttributeNames(); e.hasMoreElements(); ) {
    session.setAttribute(e.nextElement(), null);
    }
%>
<%@ include file="/template/header.jsp" %>
<header class="hero-unit" id="overview">
<h2>You have now been logged out</h2>
<a href="/auth/login.jsp">Click here to log in again</a>
</header>

<%@ include file="/template/footer.jsp" %>
