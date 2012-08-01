<%@ page import="refill_project.*" %><%@ include file="/template/header.jsp" %>
<h1>Get Plugins for your Bukkit Server.</h1>
<h2>No politics. No confusing web interfaces. No silly business.</h2>
<br>
<h3>What is <%= i18n.get("name") %>?</h3>
<p class="lead"><%= i18n.get("name") %> is a plugin repository system that manages Bukkit Plugins registered in this repository and from BukkitDev. Using our server plugin, you are one command away from getting any plugin, at any version, anywhere. No more clunky Web UIs. No more hosting politics. Just straight-up, honest-to-goodness plugin management.</p>
<h3>Do you cater to only BukkitDev projects?</h3>
<p class="lead"><b>No!</b> If you're not a big fan of BukkitDev then you don't need to use it in order to use this service. You can register your plugin with our Web interface, choose a location for download, and after an approval process (which is only in-place to make sure your plugin is downloadable) your plugin will be instantly available to any server owner running mod-get.</p><%@ include file="/template/footer.jsp" %>