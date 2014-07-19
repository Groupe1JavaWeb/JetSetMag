<!DOCTYPE html>
<html lang="en" class="app js no-touch no-android chrome no-firefox no-iemobile no-ie no-ie8 no-ie10 no-ie11 no-ios no-ios7 ipad">
<head>
<meta charset="utf-8" />
<title><g:layoutTitle default="Jet7 Magazine | Votre Jet @ la #1" /></title>
<meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	<link rel="stylesheet" href="${resource(dir:'js/jPlayer',file:'jplayer.flat.css')}" type="text/css" />
	<link rel="stylesheet" href="${resource(dir:'css',file:'app.v1.css')}" />
	<link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
	<g:layoutHead />	
    <!--[if lt IE 9]>
		<script src="${resource(dir:'js/ie',file:'html5shiv.js')}"></script>
		<script src="${resource(dir:'js/ie',file:'respond.min.js')}"></script>
		<script src="${resource(dir:'js/ie',file:'excanvas.js')}"></script>
	<![endif]-->
</head>
<body class="">
<fb:initFbCommentsJS appId="596783563767537" />
<section class="vbox">
<header class="bg-white-only header header-md navbar navbar-fixed-top-xs">
<div class="navbar-header aside bg-info nav-xs">
<a class="btn btn-link visible-xs" data-toggle="class:nav-off-screen,open" data-target="#nav,html">
<i class="icon-list"></i>
</a>
<a href="${request.contextPath}" class="navbar-brand text-lt">
<i class="icon-earphones"></i>
<img src="${resource(dir:'images',file:'logo.png')}" alt="." class="hide">
<span class="hidden-nav-xs m-l-sm">JeT 7 MaG</span>
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
<form class="navbar-form navbar-left input-s-lg m-t m-l-n-xs hidden-xs" role="search" url="[action:'search',controller:'home']" method="POST" > 
<div class="form-group">
<div class="input-group">
<span class="input-group-btn">
<button type="submit" class="btn btn-sm bg-white btn-icon rounded">
<i class="fa fa-search"></i>
</button>
</span>
<input type="text" class="form-control input-sm no-border rounded" placeholder="events, songs, movies, albums ..." id="searchField" name="searchField" >
</div>
</div>
</form>
<div class="navbar-right ">
<sec:ifLoggedIn>
<ul class="nav navbar-nav m-n hidden-xs nav-user user">
<!--<li class="hidden-xs">
<a href="${request.contextPath}" class="dropdown-toggle lt" data-toggle="dropdown">
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
<a href="${request.contextPath}" class="media list-group-item">
<span class="pull-left thumb-sm">
<img src="${resource(dir:'images',file:'a0.png')}" alt="..." class="img-circle">
</span>
<span class="media-body block m-b-none"> news #1
<br>
<small class="text-muted">10 minutes ago</small>
</span>
</a>
<a href="${request.contextPath}" class="media list-group-item">
<span class="media-body block m-b-none"> event #2
<br>
<small class="text-muted">1 hour ago</small>
</span>
</a>
</div>
<div class="panel-footer text-sm">
<a href="${request.contextPath}" class="pull-right">
<i class="fa fa-cog"></i>
</a>
<a href="${request.contextPath}notes" data-toggle="class:show animated fadeInRight">See all the notifications</a>
</div>
</section>
</section>
</li>-->
<li class="dropdown">
<a href="${request.contextPath}" class="dropdown-toggle bg clear" data-toggle="dropdown">
<span class="thumb-sm avatar pull-right m-t-n-sm m-b-n-sm m-l-sm">
<avatar:gravatar email="${session.currentUser.email}" />
</span> ${session.currentUser.username}
<b class="caret"></b>
</a>
<ul class="dropdown-menu animated fadeInRight">
<li>
<span class="arrow top"></span>
<a href="${request.contextPath}">Settings</a>
</li>
<li>
<g:link controller="User" action="show" params="[id:session.currentUser.id]" >Profile</g:link>
</li>
<!--<li>
<a href="${request.contextPath}">
<span class="badge bg-danger pull-right">3</span> Notifications 
</a>
</li>-->
<li>
<g:link controller="help" action="index" >Help</g:link>
</li>
<li class="divider"></li>
<li>
<!--<g:link controller="user" action="logout" data-toggle="ajaxModal" >Logout</g:link>--><!--  nice loading with ajax -->
<g:link controller="Home" action="logout" >Logout</g:link>
</li>
</ul>
</li>
</ul>
</sec:ifLoggedIn>
<sec:ifNotLoggedIn>
<ul class="nav navbar-nav m-n hidden-xs nav-user user">
	<li class="hidden-xs"><g:link controller="Home" action="login" ><i class="fa fa-sign-in"></i> Sign In</g:link></li>
	<li class="hidden-xs"><g:link controller="Home"  action="register" ><i class="fa fa-asterisk"></i> Sign Up</g:link></li>
</ul>
</sec:ifNotLoggedIn>
</div>
</header>
<section>
<section class="hbox stretch">
<aside class="bg-black dk nav-xs aside hidden-print" id="nav">
<section class="vbox">
<section class="w-f-md scrollable">
<div class="slim-scroll" data-height="auto" data-disable-fade-out="true" data-distance="0" data-size="10px" data-railOpacity="0.2">
<!-- nav -->
<nav class="nav-primary hidden-xs">
<ul class="nav bg clearfix">
<li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted"> @7 Mag </li>
<li>
	<g:link controller="Event" action="index" params="[isNews:true]" >
		<i class="icon-globe icon text-success"></i>
		<b class="badge bg-success pull-right">${newsCount}</b>
		<span class="font-bold">7News</span>
	</g:link>
</li>
<li>
	<g:link controller="Event" action="index" params="[isNews:false]" >
		<i class="icon-book-open icon text-primary-lter"></i>
		<b class="badge bg-danger pull-right">${eventsCount}</b>
		<span class="font-bold">7Events</span>
	</g:link>
</li>
<li>
	<a href="${request.contextPath}">
		<i class="icon-music-tone-alt icon text-info"></i>
		<b class="badge bg-info pull-right">0</b>
		<span class="font-bold">7Songs</span>
	</a>
</li>
<li>
	<a href="${request.contextPath}" >
		<i class="icon-social-youtube icon text-primary"></i>
		<b class="badge bg-warning pull-right">0</b>
		<span class="font-bold">7Videos</span>
	</a>
</li>
<li class="m-b hidden-nav-xs"></li>
</ul>
<sec:ifAnyGranted roles="ROLE_SUPERADMIN,ROLE_ADMIN,ROLE_MEMBER" >
	<ul class="nav" data-ride="collapse">
	    <li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted"> Private Area </li>
	    <li>
	        <a href="#" class="auto">
	            <span class="pull-right text-muted">
	                <i class="fa fa-angle-left text"></i>
	                <i class="fa fa-angle-down text-active"></i>
	            </span>
	            <i class="icon-grid icon"></i>
	            <span>Management</span>
	        </a>
	        <ul class="nav dk text-sm">
	        	<sec:ifAnyGranted roles="ROLE_SUPERADMIN,ROLE_ADMIN" >
	            <li>
	                <g:link controller="User" action="list" class="auto" >
	                	<b class="badge bg-success pull-right">${usersCount}</b>
	                    <i class="fa fa-angle-right text-xs"></i>
	                    <span>Users</span>
	                </g:link>
	            </li>
	            </sec:ifAnyGranted>
	            <li>
	                <g:link controller="Event" action="listN" class="auto" >
	                	<b class="badge bg-default pull-right">${newsCount}</b>
	                    <i class="fa fa-angle-right text-xs"></i>
	                    <span>News</span>
	                </g:link>
	            </li>
	            <li>
	                <g:link controller="Event" action="listE" class="auto" >
	                	<b class="badge bg-danger pull-right">${eventsCount}</b>
	                    <i class="fa fa-angle-right text-xs"></i>
	                    <span>Events</span>
	                </g:link>
	            </li>
	            <li>
	                <g:link controller="Comment" action="list" class="auto" >
	                	<b class="badge bg-dark pull-right">${commentsCount}</b>
	                    <i class="fa fa-angle-right text-xs"></i>
	                    <span>Comments</span>
	                </g:link>
	            </li>
	            <li>
	                <a href="#" class="auto">
	                	<b class="badge bg-info pull-right">0</b>
	                    <i class="fa fa-angle-right text-xs"></i>
	                    <span>Songs</span>
	                </a>
	            </li>
	            <li>
	                <a href="#" class="auto">
	                	<b class="badge bg-warning pull-right">0</b>
	                    <i class="fa fa-angle-right text-xs"></i>
	                    <span>Videos</span>
	                </a>
	            </li>
	        </ul>
	    </li>
	</ul>
</sec:ifAnyGranted>
</nav>
<!-- / nav -->
</div>
</section>
<sec:ifLoggedIn>
<footer class="footer hidden-xs no-padder text-center-nav-xs">
<div class="bg hidden-xs ">
<div class="dropdown dropup wrapper-sm clearfix">
<a href="${request.contextPath}" class="dropdown-toggle" data-toggle="dropdown">
<span class="thumb-sm avatar pull-left m-l-xs">
<avatar:gravatar email="${session.currentUser.email}" />
<i class="on b-black"></i>
</span>
<span class="hidden-nav-xs clear">
<span class="block m-l">
<strong class="font-bold text-lt">${session.currentUser.username}</strong>
<b class="caret"></b>
</span>
<span class="text-muted text-xs block m-l">${session.currentUser.lastName} ${session.currentUser.firstName}</span>
</span>
</a>
<ul class="dropdown-menu animated fadeInRight aside text-left">
<!-- <li>
<span class="arrow bottom hidden-nav-xs"></span>
<a href="${request.contextPath}">Settings</a>
</li> -->
<li>
<g:link controller="User" action="show" params="[id:session.currentUser.id]" >Profile</g:link>
</li>
<!-- <li>
<a href="${request.contextPath}">
<span class="badge bg-danger pull-right">3</span> Notifications 
</a>
</li> -->
<li>
<g:link controller="help" action="index" >Help</g:link>
</li>
<li class="divider"></li>
<li>
<g:link controller="Home" action="logout" >Logout</g:link>
</li>
</ul>
</div>
</div>
</footer>
</sec:ifLoggedIn>
</section>
</aside>
<!-- /.aside -->
<section id="content">
<section class="hbox stretch">
<section>
<section class="vbox">
<g:if test="${ (controllerName=="event" && ( actionName=="index" || actionName=="" )) || (controllerName=="user" && actionName=="show" ) }" >
	<section class="scrollable">
</g:if>
<g:else>
	<section class="scrollable padder">
</g:else>
	<g:if test="${flash.error}">
		<br />
		<div class="alert alert-error" style="display: block">${flash.error}</div>
	</g:if>
	<g:if test="${flash.danger}">
		<br />
		<div class="alert alert-danger" style="display: block">${flash.danger}</div>
	</g:if>
	<g:if test="${flash.message}">
		<br />
		<div class="alert alert-info" style="display: block">${flash.message}</div>
	</g:if>
	<g:if test="${flash.success}">
		<br />
		<div class="alert alert-success" style="display: block">${flash.success}</div>
	</g:if>
	<g:if test="${flash.warning}">
		<br />
		<div class="alert alert-warning alert-block" style="display: block">${flash.warning}</div>
	</g:if>
	<g:layoutBody />
	<!-- <sec:ifNotLoggedIn>
		<br /> 
		<div class="row m-t-lg m-b-lg">
			<div class="col-sm-6">
				<div class="bg-primary wrapper-md r">
					<g:link controller="Home" action="login" > 
						<span class="h4 m-b-xs block"><i class=" icon-user-follow i-lg"></i> Login or Create account</span> 
						<span class="text-muted">Save and share your playlist with your friends when you log in or create an account.</span> 
					</g:link>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="bg-black wrapper-md r">
					<g:link controller="Home" action="downloadApp" >
						<span class="h4 m-b-xs block"><i class="icon-cloud-download i-lg"></i> Download our desktop application</span>
						<span class="text-muted">Get the app for desktop to start following music,movies,events at anywhere and anytime.</span>
					</g:link>
				</div>
			</div>
		</div>
	</sec:ifNotLoggedIn> -->
</section>
</section>
</section>
</section>
<a href="${request.contextPath}" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
</section>
</section>
</section>
</section>
</body>
</html>