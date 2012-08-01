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
	   <ul class="nav" id="main-menu">
      <li><a href="/download.jsp">Download Plugin</a></li>
      <li><a href="#about">About</a></li>
      <li><a href="#omdex">Plugin Index</a></li>
      <li><a href="#statistics">Statistics</a></li>
	  </ul>
       </div>
     </div>
   </div>
 </div>

    <div class="container">
<!-- ================================================== -->
<header class="hero-unit" id="overview">
