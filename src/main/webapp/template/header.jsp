<%@ page import="com.crumbdev.*" %>
<%@ page import="com.crumbdev.auth.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title><%= i18n.get("name") %></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
      <script src="https://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le styles -->
    <link href="/css/resba.css" rel="stylesheet">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/bootstrap-responsive.css" rel="stylesheet">
    

  </head>

  <body class="preview" data-spy="scroll" data-target=".subnav" data-offset="50">


  <!-- Navbar
    ================================================== -->
 <div class="navbar navbar-fixed-top">
   <div class="navbar-inner">
     <div class="container">
       <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
       </a>
       <a class="brand" href="/"><%= i18n.get("name") %></a>
       <div class="nav-collapse" id="main-menu">
	   <ul class="nav" id="main-menu">
      <li><a href="/download/">Download Plugin</a></li>
      <li><a href="#about">About</a></li>
      <li><a href="#omdex">Plugin Index</a></li>
      <li><a href="#statistics">Statistics</a></li>
	  </ul>
      <ul class="nav pull-right">
        <% if(session.getAttribute("loggedInAs") == null) { %><li><a data-toggle="modal" href="#login">Login</a></li><% }
         else { %>
            <li><a><img src="<%= (new User(session.getAttribute("loggedInAs").toString())).getGravatarURL(25)%>" style="margin-right: 4px"/><%= session.getAttribute("loggedInAs") %></a></li>
            <li><a href="/auth/logout.jsp">Log out</a></li>
         <% } %>
        </li>
      </ul>
       </div>
     </div>
   </div>
 </div>
 <div class="modal hide" id="login">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">x</button>
    <h3>Login</h3>
  </div>
  <div class="modal-body">
  <div class="well">
    <form method="post" action="/auth/login.jsp">
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
  <div class="modal-footer">
	<a class="btn btn-success" href="/auth/login.jsp">Register</a>
    <input class="btn btn-primary" type="submit" value="Login" />
  </div>
</div>
<br><br>
    <div class="container">
<!-- ================================================== -->
