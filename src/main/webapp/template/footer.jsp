<%@ page import="com.crumbdev.*" %>



	<div class="container">
	<!-- Footer
      ================================================== -->
      <footer class="footer">
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>GIT Version: <%@ include file="/include/git.txt" %></p>
		<p><%= i18n.get("copyright") %></p>
      </footer>

    </div><!-- /container -->



    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>

    <% if (Properties.getProperty("analytics") != null && !Properties.getProperty("analytics").equalsIgnoreCase("OFF")) {%>
    <script type="text/javascript">

      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', '<%= Properties.getProperty("analytics") %>']);
      _gaq.push(['_trackPageview']);

      (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();
    </script>
    <% } %>
    <script type="text/javascript">
        $('#login').modal({
        keyboard: true,
        show: false,
        backdrop: true
     })
     $('#user-footer').modal({
        keyboard: true,
        show: false,
        backdrop: true
     })
     </script>
  </body>
</html>
