<%@ page import="refill_project.*" %><%@ include file="/template/header.jsp" %>
<header class="hero-unit" id="overview">
<h1>Plugin Information</h1>
<h2>EUREKA! IT WORKS!</h2>
<h3><%= PluginInfoServlet.getString() %></h3>
</header>
<%@ include file="/template/footer.jsp" %>