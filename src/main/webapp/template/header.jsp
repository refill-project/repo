<%@ page import="refill_project.*" %>
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
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le styles -->
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
      <li><a href="#typography">Download Plugin</a></li>
      <li><a href="#navbar">About</a></li>
      <li><a href="#buttons">Plugin Index</a></li>
      <li><a href="#forms">Statistics</a></li>
       </div>
     </div>
   </div>
 </div>

    <div class="container">
================================================== -->
<header class="hero-unit" id="overview">
  <h1>Get Plugins for your Bukkit Server.</h1>
  <h2>No politics. No confusing web interfaces. No silly business.</h2>
  <br>
  <h3>What is <%= i18n.get("name") %>?</h3>
  <p class="lead"><%= i18n.get("name") %> is a plugin repository system that manages Bukkit Plugins registered in this repository and from BukkitDev. Using our server plugin, you are one command away from getting any plugin, at any version, anywhere. No more clunky Web UIs. No more hosting politics. Just straight-up, honest-to-goodness plugin management.</p>
  <h3>Do you cater to only BukkitDev projects?</h3>
  <p class="lead"><b>No!</b> If you're not a big fan of BukkitDev then you don't need to use it in order to use this service. You can register your plugin with our Web interface, choose a location for download, and after an approval process (which is only in-place to make sure your plugin is downloadable) your plugin will be instantly available to any server owner running mod-get.</p>
</header>

	<div class="container">