<%@ page import="refill_project.*" %>
<% for (java.util.Enumeration<String> e = request.getHeaderNames(); e.hasMoreElements();) {%>
    <% String value =  e.nextElement(); %>
    <%= String.format("%s: %s", value, request.getHeader(value)) %><br/>
<% } %>