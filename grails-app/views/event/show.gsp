<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
	</head>
	<body>
	<fb:initFbCommentsJS appId="596783563767537" />
	<input type="hidden" name="id" id="id" value="${event.id}" />
<div class="row">
<div class="col-sm-9">
<div class="blog-post">
<div class="post-item">
<div class="post-media">
<g:if test="${ event.cover=="" || !event.cover }"> <!-- || !( event.cover =~ /^https?:\/\/(?:[a-z\-]+\.)+[a-z]{2,6}(?:\/[^\/#?]+)+\.(?:jpe?g|gif|png)$/ )  -->
     <img class="img-full" alt="Event's Cover" src="${resource(dir:'images',file:'Event_Cover3.jpg')}" />
</g:if>
<g:else>
	<img class="img-full" alt="Event's Cover" src="${createLink(controller:'Event', action:'cover', id:event.id)}" style="width:100%;height:500px;" />
</g:else>
</div>
<div class="caption wrapper-lg">
<h2 class="post-title">
<a href="#">${event.title}</a>
</h2>
<div class="post-sum">
<p style="text-overflow:ellipsis;" id="description" >${event.description.toString().encodeAsRaw()}</p>
</div>
<div class="line line-lg"></div>
<div class="text-muted">
<i class="fa fa-user icon-muted"></i> by 
<a href="#" class="m-r-sm">${event.user.username}</a>
<i class="fa fa-clock-o icon-muted"></i> Created : ${event.created}&nbsp;&nbsp;
<i class="fa fa-clock-o icon-muted"></i> Modified : ${event.modified}
<i class="fa fa-clock-o icon-muted"></i> Tagged As : <g:if test="${event.isNews==true}" ><span class="label bg-info">News</span></g:if><g:else><span class="label bg-primary">Event</span></g:else>
<a href="#" class="m-l-sm">
<i class="fa fa-comment-o icon-muted"></i> ${event.comments.size()} comments
</a>
</div>
</div>
</div>
<sec:ifLoggedIn>
<g:if test="${event.showComments==true}">
<h4 class="m-t-lg m-b">${event.comments.size()} Comments</h4>
<section class="comment-list block">
	<g:if test="${event.comments.size()>0}" >
		<g:each in="${event.comments}" var="comment" >
		    <article id="comment-id-${comment.id} }" class="comment-item">
		        <a class="pull-left thumb-sm avatar">
		            <avatar:gravatar email="${comment.user.email}" class="img-circle" />
		            </a>
		            <span class="arrow left"></span>
		            <section class="comment-body panel panel-default">
		                <header class="panel-heading bg-white">
		                    <a href="#">${comment.user.username}</a>
		                    <g:if test="${comment.user.getAuthorities().authority[0]=='ROLE_SUPERADMIN'}" >
                   				&nbsp;&nbsp;<span class="label bg-primary">Super</span>
                   			</g:if>
                   			<g:elseif test="${comment.user.getAuthorities().authority[0]=='ROLE_ADMIN'}" >
                   				&nbsp;&nbsp;<span class="label bg-success">Admin</span>
                   			</g:elseif>
                   			<g:elseif test="${comment.user.getAuthorities().authority[0]=='ROLE_MEMBER'}" >
                   				&nbsp;&nbsp;<span class="label bg-info">Member</span>
                   			</g:elseif>
                   			<g:else test="${comment.user.getAuthorities().authority[0]=='ROLE_USER'}" >
                   				&nbsp;&nbsp;<span class="label bg-warning">Guest</span>
	                        </g:else>
		                    <span class="text-muted m-l-sm pull-right">
		                        <i class="fa fa-clock-o"></i> ${comment.modified} 
		                    </span>
		                </header>
		               <div class="panel-body">
		                    <div>${comment.description}</div>
		                    <sec:ifAnyGranted roles="ROLE_SUPERADMIN,ROLE_ADMIN,ROLE_MEMBER" >
		                    	<g:if test="${ comment.user.getAuthorities().id[0]>session.currentUser.getAuthorities().id[0] || comment.user.id==session.currentUser.id }" >
			                    	<!-- <div class="comment-action m-t-sm">
			                        <a href="#" data-toggle="class" class="btn btn-default btn-xs active">
			                            <i class="fa fa-star-o text-muted text"></i>
			                            <i class="fa fa-star text-danger text-active"></i> Like 
			                        </a>
			                        <a href="#comment-form" class="btn btn-default btn-xs">
			                            <i class="fa fa-mail-reply text-muted"></i> Reply 
			                        </a>
			                    	</div>-->
		                            <g:if test="${comment.user.id==session.currentUser.id}" >
		                            	<div class="comment-action m-t-sm">
		                                	<g:link controller="Comment" action="deleteMines" params="[id:"${comment.id}",event:"${comment.event.id}",controllerN:"${controllerName}",actionN:"${actionName}"]" data-dismiss="alert" class="btn btn-default btn-xs">
		                                    	<i class="fa fa-trash-o text-muted"></i> Remove 
		                                	</g:link>
		                            	</div>
		                            </g:if>
		                            <g:else>
		                            	<div class="comment-action m-t-sm">
		                                	<g:link controller="Comment" action="delete" params="[id:"${comment.id}",event:"${comment.event.id}",controllerN:"${controllerName}",actionN:"${actionName}"]" data-dismiss="alert" class="btn btn-default btn-xs">
		                                    	<i class="fa fa-trash-o text-muted"></i> Remove 
		                                	</g:link>
		                            	</div>
		                            </g:else>
	                            </g:if>
		                    </sec:ifAnyGranted>
		                </div>
		            </section>
		        </article>
		</g:each>
	</g:if>
</g:if>
                    <!-- comment form -->
<g:if test="${event.canComment==true}" >
	                    <article class="comment-item media" id="comment-form">
	                        <a class="pull-left thumb-sm avatar">
	                            <avatar:gravatar email="${session.currentUser.email}" class="img-circle" />
	                            </a>
	                            <section class="media-body">
	                                <g:form method="POST" class="m-b-none" role="form" url="[action:'create',controller:'Comment']" >
	                                	<input type="hidden" id="controllerN" name="controller" value="${controllerName}" />
	                                    <input type="hidden" id="actionN" name="action" value="${actionName}" />
	                                    <input type="hidden" id="event" name="event" value="${event.id}" />
	                                    <div class="input-group">
	                                        <input type="text" class="form-control" placeholder="Input your comment here" id="description" name="description" value="" >
	                                            <span class="input-group-btn">
	                                                <button class="btn btn-primary" type="submit">POST</button>
	                                            </span>
	                                        </div>
	                                    </g:form>
	                                </section>
	                            </article>
</g:if>
</section>
<br><br>
</sec:ifLoggedIn>
</div>
</div>
<div class="col-sm-3">
<fb:comments width="100%" />
<!--
<h5 class="font-bold">Categories</h5>
<ul class="list-group">
    <li class="list-group-item">
        <a href="#">
            <span class="badge pull-right">15</span> Photograph 
        </a>
    </li>
    <li class="list-group-item">
        <a href="#">
            <span class="badge pull-right">30</span> Life style 
        </a>
    </li>
    <li class="list-group-item">
        <a href="#">
            <span class="badge pull-right">9</span> Food 
        </a>
    </li>
    <li class="list-group-item">
        <a href="#">
            <span class="badge pull-right">4</span> Travel world 
        </a>
    </li>
</ul>
<div class="tags m-b-lg l-h-2x">
    <a href="#" class="label bg-primary">Bootstrap</a>
    <a href="#" class="label bg-primary">Application</a>
    <a href="#" class="label bg-primary">Apple</a>
    <a href="#" class="label bg-primary">Less</a>
    <a href="#" class="label bg-primary">Theme</a>
    <a href="#" class="label bg-primary">Wordpress</a>
</div>
-->
<!-- 
<h5 class="font-bold">Recent Posts</h5>
<div>
    <article class="media">
        <a class="pull-left thumb thumb-wrapper m-t-xs">
            <img src="${resource(dir:'images',file:'m1.jpg')}">
            </a>
            <div class="media-body">
                <a href="#" class="font-semibold">Bootstrap 3: What you need to know</a>
                <div class="text-xs block m-t-xs">
                    <a href="#">Travel</a> 2 minutes ago
                </div>
            </div>
        </article>
        <div class="line"></div>
        <article class="media m-t-none">
            <a class="pull-left thumb thumb-wrapper m-t-xs">
                <img src="${resource(dir:'images',file:'m2.jpg')}">
                </a>
                <div class="media-body">
                    <a href="#" class="font-semibold">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</a>
                    <div class="text-xs block m-t-xs">
                        <a href="#">Design</a> 2 hours ago
                    </div>
                </div>
            </article>
            <div class="line"></div>
            <article class="media m-t-none">
                <a class="pull-left thumb thumb-wrapper m-t-xs">
                    <img src="${resource(dir:'images',file:'m3.jpg')}">
                    </a>
                    <div class="media-body">
                        <a href="#" class="font-semibold">Sed diam nonummy nibh euismod tincidunt ut laoreet</a>
                        <div class="text-xs block m-t-xs">
                            <a href="#">MFC</a> 1 week ago
                        </div>
                    </div>
                </article>
            </div>
-->
        </div>
</div>
	<!-- Bootstrap -->
	<!-- App -->
	<script type="text/javascript" src="${resource(dir:'js',file:'app.v1.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js',file:'app.plugin.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js',file:'socket.io-1.0.6.js')}"></script>
	<script>
		$( document ).ready(function() { });
	</script>
	</body>
</html>
