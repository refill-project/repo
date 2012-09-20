<%@ page import="com.crumbdev.*" %><%@ include file="/template/header.jsp" %>
<header class="hero-unit" id="overview">
<h1>Plugin Information</h1>
<h2>EUREKA! IT WORKS!</h2>
<h3><%= request.getRequestURI().split("/")[1]%></h3>
<p><%= PluginInfoServlet.getPluginName() %></p>
</header>
<%@ include file="/template/footer.jsp" %>