<!DOCTYPE html>
<html lang="en" class="app js no-touch no-android chrome no-firefox no-iemobile no-ie no-ie8 no-ie10 no-ie11 no-ios no-ios7 ipad">
<head>
<meta charset="utf-8" />
<title><g:layoutTitle default="Jet7 Magazine | Votre Jet à la une" /></title>
<meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	<link rel="stylesheet" href="${resource(dir:'js/jPlayer',file:'jplayer.flat.css')}" />
	<link rel="stylesheet" href="${resource(dir:'css',file:'app.v1.css')}" />
	<link rel="stylesheet" href="${resource(dir:'js/datatables',file:'datatables.css')}" />
	<link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
<g:layoutHead />	
    <!--[if lt IE 9]>
		<script src="${resource(dir:'js/ie',file:'html5shiv.js')}"></script>
		<script src="${resource(dir:'js/ie',file:'respond.min.js')}"></script>
		<script src="${resource(dir:'js/ie',file:'excanvas.js')}"></script>
	<![endif]-->
</head>
<body class="">
<section class="vbox">
<header class="bg-white-only header header-md navbar navbar-fixed-top-xs">
<div class="navbar-header aside bg-info nav-xs">
<a class="btn btn-link visible-xs" data-toggle="class:nav-off-screen,open" data-target="#nav,html">
<i class="icon-list"></i>
</a>
<a href="/JetSetMag" class="navbar-brand text-lt">
<i class="icon-earphones"></i>
<img src="${resource(dir:'images',file:'logo.png')}" alt="." class="hide">
<span class="hidden-nav-xs m-l-sm">Jet7 MaG</span>
</a>
<a class="btn btn-link visible-xs" data-toggle="dropdown" data-target=".user">
<i class="icon-settings"></i>
</a>
</div>
<ul class="nav navbar-nav hidden-xs">
<li>
<a href="#nav,.navbar-header" data-toggle="class:nav-xs,nav-xs" class="text-muted">
<i class="fa fa-indent text"></i>
<i class="fa fa-dedent text-active"></i>
</a>
</li>
</ul>
<form class="navbar-form navbar-left input-s-lg m-t m-l-n-xs hidden-xs" role="search">
<div class="form-group">
<div class="input-group">
<span class="input-group-btn">
<button type="submit" class="btn btn-sm bg-white btn-icon rounded">
<i class="fa fa-search"></i>
</button>
</span>
<input type="text" class="form-control input-sm no-border rounded" placeholder="Search songs, albums...">
</div>
</div>
</form>



<div class="navbar-right ">
<g:if test="${session.user}">
<ul class="nav navbar-nav m-n hidden-xs nav-user user">
<li class="hidden-xs">
<a href="/JetSetMag" class="dropdown-toggle lt" data-toggle="dropdown">
<i class="icon-bell"></i>
<span class="badge badge-sm up bg-danger count">2</span>
</a>
<section class="dropdown-menu aside-xl animated fadeInUp">
<section class="panel bg-white">
<div class="panel-heading b-light bg-light">
<strong>You have 
<span class="count">2</span> Notifications
</strong>
</div>
<div class="list-group list-group-alt">
<a href="/JetSetMag" class="media list-group-item">
<span class="pull-left thumb-sm">
<img src="${resource(dir:'images',file:'a0.png')}" alt="..." class="img-circle">
</span>
<span class="media-body block m-b-none"> Use awesome animate.css
<br>
<small class="text-muted">10 minutes ago</small>
</span>
</a>
<a href="/JetSetMag" class="media list-group-item">
<span class="media-body block m-b-none"> 1.0 initial released
<br>
<small class="text-muted">1 hour ago</small>
</span>
</a>
</div>
<div class="panel-footer text-sm">
<a href="/JetSetMag" class="pull-right">
<i class="fa fa-cog"></i>
</a>
<a href="/JetSetMagnotes" data-toggle="class:show animated fadeInRight">See all the notifications</a>
</div>
</section>
</section>
</li>
<li class="dropdown">
<a href="/JetSetMag" class="dropdown-toggle bg clear" data-toggle="dropdown">
<span class="thumb-sm avatar pull-right m-t-n-sm m-b-n-sm m-l-sm">
<avatar:gravatar email="${session.user.email}" />
</span> ${session.user.lastName} ${session.user.firstName}
<b class="caret"></b>
</a>
<ul class="dropdown-menu animated fadeInRight">
<li>
<span class="arrow top"></span>
<a href="/JetSetMag">Settings</a>
</li>
<li>
<g:link controller="user" action="index" >Profile</g:link>
</li>
<li>
<a href="/JetSetMag">
<span class="badge bg-danger pull-right">3</span> Notifications 
</a>
</li>
<li>
<a href="docs.html">Help</a>
</li>
<li class="divider"></li>
<li>
<g:link controller="user" action="logout" data-toggle="ajaxModal" >Logout</g:link>
</li>
</ul>
</li>
</ul>
</g:if>
<g:else>
<ul class="nav navbar-nav m-n hidden-xs nav-user user">
	<li class="hidden-xs"><g:link controller="user" action="login"><i class="fa fa-sign-in"></i> Sign In</g:link></li>
	<li class="hidden-xs"><g:link controller="user"  action="register"><i class="fa fa-asterisk"></i> Sign Up</g:link></li>
</ul>
</g:else>
</div>


</header>
<section>
<section class="hbox stretch">
<!-- .aside -->
<aside class="bg-black dk nav-xs aside hidden-print" id="nav">
<section class="vbox">
<section class="w-f-md scrollable">
<div class="slim-scroll" data-height="auto" data-disable-fade-out="true" data-distance="0" data-size="10px" data-railOpacity="0.2">
<!-- nav -->
<nav class="nav-primary hidden-xs">
<ul class="nav bg clearfix">
<li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted"> Discover </li>
<li>
<a href="/JetSetMag">
<i class="icon-disc icon text-success"></i>
<span class="font-bold">What's new</span>
</a>
</li>
<li>
<a href="genres.html">
<i class="icon-music-tone-alt icon text-info"></i>
<span class="font-bold">Genres</span>
</a>
</li>
<li>
<a href="/JetSetMag/Event">
<i class="icon-drawer icon text-primary-lter"></i>
<b class="badge bg-primary pull-right">6</b>
<span class="font-bold">Events</span>
</a>
</li>
<li>
<a href="listen.html">
<i class="icon-list icon text-info-dker"></i>
<span class="font-bold">Listen</span>
</a>
</li>
<li>
<a href="video.html" data-target="#content" data-el="#bjax-el" data-replace="true">
<i class="icon-social-youtube icon text-primary"></i>
<span class="font-bold">Video</span>
</a>
</li>
<li class="m-b hidden-nav-xs"></li>
</ul>
</nav>
<!-- / nav -->
</div>
</section>

<g:if test="${session.user}">
<footer class="footer hidden-xs no-padder text-center-nav-xs">
<div class="bg hidden-xs ">
<div class="dropdown dropup wrapper-sm clearfix">
<a href="/JetSetMag" class="dropdown-toggle" data-toggle="dropdown">
<span class="thumb-sm avatar pull-left m-l-xs">
<img src="${resource(dir:'images',file:'a3.png')}" class="dker" alt="...">
<i class="on b-black"></i>
</span>
<span class="hidden-nav-xs clear">
<span class="block m-l">
<strong class="font-bold text-lt">John.Smith</strong>
<b class="caret"></b>
</span>
<span class="text-muted text-xs block m-l">Art Director</span>
</span>
</a>
<ul class="dropdown-menu animated fadeInRight aside text-left">
<li>
<span class="arrow bottom hidden-nav-xs"></span>
<a href="/JetSetMag">Settings</a>
</li>
<li>
<a href="profile.html">Profile</a>
</li>
<li>
<a href="/JetSetMag">
<span class="badge bg-danger pull-right">3</span> Notifications 
</a>
</li>
<li>
<a href="docs.html">Help</a>
</li>
<li class="divider"></li>
<li>
<a href="modal.lockme.html" data-toggle="ajaxModal" >Logout</a>
</li>
</ul>
</div>
</div>
</footer>
</g:if>
</section>
</aside>
<!-- /.aside -->
<section id="content">
<section class="hbox stretch">
<section>
<section class="vbox">
<section class="scrollable padder-lg w-f-md" id="bjax-target">
	<section class="wrapper">
	<!-- <div class="m-b">
	<span class="h3 font-thin">
	<i class="i i-arrow-left3"></i> Fluid Layout
	</span>
	</div>
	<section class="panel panel-default">			                    
	</section>-->		                
	<!--  ICI  -->
	<g:if test="${flash.error}">
		<div class="alert alert-error" style="display: block">${flash.error}</div>
	</g:if>
	<g:if test="${flash.danger}">
		<div class="alert alert-danger" style="display: block">${flash.danger}</div>
	</g:if>
	<g:if test="${flash.message}">
		<div class="alert alert-info" style="display: block">${flash.message}</div>
	</g:if>
	<g:if test="${flash.success}">
		<div class="alert alert-success" style="display: block">${flash.success}</div>
	</g:if>
	<g:if test="${flash.warning}">
		<div class="alert alert-warning alert-block" style="display: block">${flash.warning}</div>
	</g:if>
	<br>
	<g:layoutBody />
	</section>
</section>
<footer class="footer bg-dark">
<div id="jp_container_N">
<div class="jp-type-playlist">
<div id="jplayer_N" class="jp-jplayer hide"></div>
<div class="jp-gui">
<div class="jp-video-play hide">
<a class="jp-video-play-icon">play</a>
</div>
<div class="jp-interface">
<div class="jp-controls">
<div>
<a class="jp-previous">
<i class="icon-control-rewind i-lg"></i>
</a>
</div>
<div>
<a class="jp-play">
<i class="icon-control-play i-2x"></i>
</a>
<a class="jp-pause hid">
<i class="icon-control-pause i-2x"></i>
</a>
</div>
<div>
<a class="jp-next">
<i class="icon-control-forward i-lg"></i>
</a>
</div>
<div class="hide">
<a class="jp-stop">
<i class="fa fa-stop"></i>
</a>
</div>
<div>
<a class="" data-toggle="dropdown" data-target="#playlist">
<i class="icon-list"></i>
</a>
</div>
<div class="jp-progress hidden-xs">
<div class="jp-seek-bar dk">
<div class="jp-play-bar bg-info"></div>
<div class="jp-title text-lt">
<ul>
<li></li>
</ul>
</div>
</div>
</div>
<div class="hidden-xs hidden-sm jp-current-time text-xs text-muted"></div>
<div class="hidden-xs hidden-sm jp-duration text-xs text-muted"></div>
<div class="hidden-xs hidden-sm">
<a class="jp-mute" title="mute">
<i class="icon-volume-2"></i>
</a>
<a class="jp-unmute hid" title="unmute">
<i class="icon-volume-off"></i>
</a>
</div>
<div class="hidden-xs hidden-sm jp-volume">
<div class="jp-volume-bar dk">
<div class="jp-volume-bar-value lter"></div>
</div>
</div>
<div>
<a class="jp-shuffle" title="shuffle">
<i class="icon-shuffle text-muted"></i>
</a>
<a class="jp-shuffle-off hid" title="shuffle off">
<i class="icon-shuffle text-lt"></i>
</a>
</div>
<div>
<a class="jp-repeat" title="repeat">
<i class="icon-loop text-muted"></i>
</a>
<a class="jp-repeat-off hid" title="repeat off">
<i class="icon-loop text-lt"></i>
</a>
</div>
<div class="hide">
<a class="jp-full-screen" title="full screen">
<i class="fa fa-expand"></i>
</a>
<a class="jp-restore-screen" title="restore screen">
<i class="fa fa-compress text-lt"></i>
</a>
</div>
</div>
</div>
</div>
<div class="jp-playlist dropup" id="playlist">
<ul class="dropdown-menu aside-xl dker">
<!-- The method Playlist.displayPlaylist() uses this unordered list -->
<li class="list-group-item"></li>
</ul>
</div>
<div class="jp-no-solution hide">
<span>Update Required</span> To play the media you will need to either update your browser to a recent version or update your 
<a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>. 
</div>
</div>
</div>
</footer>
</section>
</section>
<aside class="aside-md bg-light dk" id="sidebar" style="display:none;" >
<section class="vbox animated fadeInRight">
<section class="w-f-md scrollable hover">
<h4 class="font-thin m-l-md m-t">Connected</h4>
<ul class="list-group no-bg no-borders auto m-t-n-xxs">
<li class="list-group-item">
<span class="pull-left thumb-xs m-t-xs avatar m-l-xs m-r-sm">
<img src="${resource(dir:'images',file:'a1.png')}" alt="..." class="img-circle">
<i class="on b-light right sm"></i>
</span>
<div class="clear">
<div>
<a href="/JetSetMag">Chris Fox</a>
</div>
<small class="text-muted">New York</small>
</div>
</li>
<li class="list-group-item">
<span class="pull-left thumb-xs m-t-xs avatar m-l-xs m-r-sm">
<img src="${resource(dir:'images',file:'a2.png')}" alt="...">
<i class="on b-light right sm"></i>
</span>
<div class="clear">
<div>
<a href="/JetSetMag">Amanda Conlan</a>
</div>
<small class="text-muted">France</small>
</div>
</li>
<li class="list-group-item">
<span class="pull-left thumb-xs m-t-xs avatar m-l-xs m-r-sm">
<img src="${resource(dir:'images',file:'a3.png')}" alt="...">
<i class="busy b-light right sm"></i>
</span>
<div class="clear">
<div>
<a href="/JetSetMag">Dan Doorack</a>
</div>
<small class="text-muted">Hamburg</small>
</div>
</li>
<li class="list-group-item">
<span class="pull-left thumb-xs m-t-xs avatar m-l-xs m-r-sm">
<img src="${resource(dir:'images',file:'a4.png')}" alt="...">
<i class="away b-light right sm"></i>
</span>
<div class="clear">
<div>
<a href="/JetSetMag">Lauren Taylor</a>
</div>
<small class="text-muted">London</small>
</div>
</li>
<li class="list-group-item">
<span class="pull-left thumb-xs m-t-xs avatar m-l-xs m-r-sm">
<img src="${resource(dir:'images',file:'a5.png')}" alt="..." class="img-circle">
<i class="on b-light right sm"></i>
</span>
<div class="clear">
<div>
<a href="/JetSetMag">Chris Fox</a>
</div>
<small class="text-muted">Milan</small>
</div>
</li>
<li class="list-group-item">
<span class="pull-left thumb-xs m-t-xs avatar m-l-xs m-r-sm">
<img src="${resource(dir:'images',file:'a6.png')}" alt="...">
<i class="on b-light right sm"></i>
</span>
<div class="clear">
<div>
<a href="/JetSetMag">Amanda Conlan</a>
</div>
<small class="text-muted">Copenhagen</small>
</div>
</li>
<li class="list-group-item">
<span class="pull-left thumb-xs m-t-xs avatar m-l-xs m-r-sm">
<img src="${resource(dir:'images',file:'a7.png')}" alt="...">
<i class="busy b-light right sm"></i>
</span>
<div class="clear">
<div>
<a href="/JetSetMag">Dan Doorack</a>
</div>
<small class="text-muted">Barcelona</small>
</div>
</li>
<li class="list-group-item">
<span class="pull-left thumb-xs m-t-xs avatar m-l-xs m-r-sm">
<img src="${resource(dir:'images',file:'a8.png')}" alt="...">
<i class="away b-light right sm"></i>
</span>
<div class="clear">
<div>
<a href="/JetSetMag">Lauren Taylor</a>
</div>
<small class="text-muted">Tokyo</small>
</div>
</li>
<li class="list-group-item">
<span class="pull-left thumb-xs m-t-xs avatar m-l-xs m-r-sm">
<img src="${resource(dir:'images',file:'a9.png')}" alt="..." class="img-circle">
<i class="on b-light right sm"></i>
</span>
<div class="clear">
<div>
<a href="/JetSetMag">Chris Fox</a>
</div>
<small class="text-muted">UK</small>
</div>
</li>
<li class="list-group-item">
<span class="pull-left thumb-xs m-t-xs avatar m-l-xs m-r-sm">
<img src="${resource(dir:'images',file:'a1.png')}" alt="...">
<i class="on b-light right sm"></i>
</span>
<div class="clear">
<div>
<a href="/JetSetMag">Amanda Conlan</a>
</div>
<small class="text-muted">Africa</small>
</div>
</li>
<li class="list-group-item">
<span class="pull-left thumb-xs m-t-xs avatar m-l-xs m-r-sm">
<img src="${resource(dir:'images',file:'a2.png')}" alt="...">
<i class="busy b-light right sm"></i>
</span>
<div class="clear">
<div>
<a href="/JetSetMag">Dan Doorack</a>
</div>
<small class="text-muted">Paris</small>
</div>
</li>
<li class="list-group-item">
<span class="pull-left thumb-xs m-t-xs avatar m-l-xs m-r-sm">
<img src="${resource(dir:'images',file:'a3.png')}" alt="...">
<i class="away b-light right sm"></i>
</span>
<div class="clear">
<div>
<a href="/JetSetMag">Lauren Taylor</a>
</div>
<small class="text-muted">Brussels</small>
</div>
</li>
</ul>
</section>
<footer class="footer footer-md bg-black">
<form class="" role="search">
<div class="form-group clearfix m-b-none">
<div class="input-group m-t m-b">
<span class="input-group-btn">
<button type="submit" class="btn btn-sm bg-empty text-muted btn-icon">
<i class="fa fa-search"></i>
</button>
</span>
<input type="text" class="form-control input-sm text-white bg-empty b-b b-dark no-border" placeholder="Search members">
</div>
</div>
</form>
</footer>
</section>
</aside>
</section>
<href="/JetSetMag" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
</section>
</section>
</section>
</section>
<!-- Bootstrap -->
<!-- App -->
        <script type="text/javascript" src="${resource(dir:'js',file:'app.v1.js')}"></script>
        <script type="text/javascript" src="${resource(dir:'js',file:'app.plugin.js')}"></script>
        <script type="text/javascript" src="${resource(dir:'js/jPlayer',file:'jquery.jplayer.min.js')}"></script>
        <script type="text/javascript" src="${resource(dir:'js/jPlayer/add-on',file:'jplayer.playlist.min.js')}"></script>
        <script type="text/javascript" src="${resource(dir:'js/jPlayer',file:'demo.js')}"></script>
</body>
</html>