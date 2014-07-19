<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
	</head>
	<body>



<section class="hbox stretch">
<aside class="aside-lg bg-light lter b-r">
<section class="vbox">
<section class="scrollable">
<div class="wrapper">
<div class="text-center m-b m-t">
<a href="#" class="thumb-lg">
<avatar:gravatar email="${user.email}" class="img-circle" size="128" />
</a>
<div>
<div class="h3 m-t-xs m-b-xs">${user.username}</div>
<small class="text-muted">
<g:if test="${user.getAuthorities().authority[0]=='ROLE_SUPERADMIN'}" >
	<span class="label bg-primary">Super</span>
</g:if>
<g:elseif test="${user.getAuthorities().authority[0]=='ROLE_ADMIN'}" >
	<span class="label bg-success">Admin</span>
</g:elseif>
<g:elseif test="${user.getAuthorities().authority[0]=='ROLE_MEMBER'}" >
	<span class="label bg-info">Member</span>
</g:elseif>
<g:else test="${user.getAuthorities().authority[0]=='ROLE_USER'}" >
	<span class="label bg-warning">Guest</span>
</g:else> ${user.lastName} ${userfirstName}
</small>
</div>
</div>
<div class="panel wrapper">
<div class="row text-center">
<div class="col-xs-6">
<a href="#">
<span class="m-b-xs h4 block">${user.comments.size()}</span>
<small class="text-muted">Comments</small>
</a>
</div>
<div class="col-xs-6">
<a href="#">
<span class="m-b-xs h4 block">${user.events.size()}</span>
<small class="text-muted">Events</small>
</a>
</div>
</div>
</div>
<!--<div class="btn-group btn-group-justified m-b">
<a class="btn btn-success btn-rounded" data-toggle="button">
<span class="text">
<i class="fa fa-eye"></i> Follow 
</span>
<span class="text-active">
<i class="fa fa-eye"></i> Following 
</span>
</a>
<a class="btn btn-dark btn-rounded">
<i class="fa fa-comment-o"></i> Chat 
</a>
</div>-->
<div>
<small class="text-uc text-xs text-muted">Contact Me</small>
<p><a href="#" >${user.email}</a></p>
<small class="text-uc text-xs text-muted">About Me</small>
<p>${user.about}</p>
<small class="text-uc text-xs text-muted">Last Connection</small>
<p>${user.lastConnection}</p>
<div class="line"></div>
<!--<small class="text-uc text-xs text-muted">connection</small>
<p class="m-t-sm">
<a href="#" class="btn btn-rounded btn-twitter btn-icon">
<i class="fa fa-twitter"></i>
</a>
<a href="#" class="btn btn-rounded btn-facebook btn-icon">
<i class="fa fa-facebook"></i>
</a>
<a href="#" class="btn btn-rounded btn-gplus btn-icon">
<i class="fa fa-google-plus"></i>
</a>
</p>-->
</div>
</div>
</section>
</section>
</aside>
<aside class="bg-white">
<section class="vbox">
<header class="header bg-light lt">
<ul class="nav nav-tabs nav-white">
<li class="active">
<a href="#events" data-toggle="tab">Events</a>
</li>
<!--<li class="">
<a href="#comments" data-toggle="tab">Comments</a>
</li>-->
</ul>
</header>
<section class="scrollable">
<div class="tab-content">
<div class="tab-pane active" id="Events">
<ul class="list-group no-radius m-b-none m-t-n-xxs list-group-lg no-border">
<g:each in="${user.events}" var="event" >
<li class="list-group-item">
<g:link controller="Event" action="show" params="[id:"${event.id}"]" class="thumb-sm pull-left m-r-sm">
<g:if test="${event.isNews==true}" >
<g:link controller="Event" action="show" params="[id:"${event.id}"]" class="btn btn-sm btn-icon btn-danger"><i class="icon-drawer icon text-primary-lter"></i></g:link>
</g:if>
<g:else>
<g:link controller="Event" action="show" params="[id:"${event.id}"]" class="btn btn-sm btn-icon btn-info"><i class="icon-globe icon text-success"></i></g:link>
</g:else>
</g:link>
<a href="#" class="clear">
<small class="pull-right">1 hour ago</small>
<p style="padding-left:50px;" >
<strong class="block">${event.title}</strong>
<small>${event.description}</small>
</p>
</a>
</li>
</g:each>
</ul>
</div>
<!--<div class="tab-pane" id="comments">
    <div class="text-center wrapper">
    </div>
</div>-->
</div>
</section>
</section>
</aside>
<aside class="col-lg-3 b-l">
    <section class="vbox">
        <section class="scrollable padder-v">
            <div class="panel">
                <h4 class="font-thin padder">Latest Comments</h4>
                <ul class="list-group">
                    <!--<li class="list-group-item">
                        <p>Wellcome 
                            <a href="#" class="text-info">@Drew Wllon</a> and play this web application template, have fun1 
                        </p>
                        <small class="block text-muted">
                            <i class="fa fa-clock-o"></i> 2 minuts ago
                        </small>
                    </li>
                    <li class="list-group-item">
                        <p>Morbi nec 
                            <a href="#" class="text-info">@Jonathan George</a> nunc condimentum ipsum dolor sit amet, consectetur
                        </p>
                        <small class="block text-muted">
                            <i class="fa fa-clock-o"></i> 1 hour ago
                        </small>
                    </li>
                    <li class="list-group-item">
                        <p>
                            <a href="#" class="text-info">@Josh Long</a> Vestibulum ullamcorper sodales nisi nec adipiscing elit. Morbi id neque quam. Aliquam sollicitudin venenatis
                        </p>
                        <small class="block text-muted">
                            <i class="fa fa-clock-o"></i> 2 hours ago
                        </small>
                    </li>-->
                    <g:each in="${user.comments}" var="comment" >
	                    <li class="list-group-item">
	                        <p>
	                            <g:link controller="Event" action="show" params="[id:"${comment.event.id}"]" class="text-info">@Event#${comment.event.id}</g:link> ${comment.description}
	                        </p>
	                        <small class="block text-muted">
	                            <i class="fa fa-clock-o"></i> ${comment.modified}
	                        </small>
	                    </li>
                    </g:each>
                </ul>
            </div>
            <div class="panel clearfix">
                <!--<div class="panel-body">
                    <a href="#" class="thumb pull-left m-r">
                        <img src="images/a0.png" class="img-circle">
                        </a>
                        <div class="clear">
                            <a href="#" class="text-info">@Mike Mcalidek 
                                <i class="fa fa-twitter"></i>
                            </a>
                            <small class="block text-muted">2,415 followers / 225 tweets</small>
                            <a href="#" class="btn btn-xs btn-success m-t-xs">Follow</a>
                        </div>
                    </div>
                </div>-->
            </section>
        </section>
    </aside>
</section>



	<!-- Bootstrap -->
	<!-- App -->
	<script type="text/javascript" src="${resource(dir:'js',file:'app.v1.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js',file:'app.plugin.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js',file:'socket.io-1.0.6.js')}"></script>
	</body>
</html>