<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
	</head>
	<body>
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
<a href="#" class="m-l-sm">
<i class="fa fa-comment-o icon-muted"></i> 3 comments
</a>
</div>
</div>
</div>
<h4 class="m-t-lg m-b">3 Comments</h4>
<!--  
<section class="comment-list block">
    <article id="comment-id-1" class="comment-item">
        <a class="pull-left thumb-sm">
            <img src="${resource(dir:'images',file:'a0.png')}" class="img-circle">
    </a>
    <section class="comment-body m-b">
        <header>
            <a href="#">
                <strong>John smith</strong>
            </a>
            <label class="label bg-info m-l-xs">Editor</label>
            <span class="text-muted text-xs block m-t-xs"> 24 minutes ago </span>
        </header>
        <div class="m-t-sm">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi id neque quam. Aliquam sollicitudin venenatis ipsum ac feugiat. Vestibulum.</div>
    </section>
</article>
<article id="comment-id-2" class="comment-item comment-reply">
 <a class="pull-left thumb-sm">
     <img src="${resource(dir:'images',file:'a1.png')}" class="img-circle">
    </a>
    <section class="comment-body m-b">
        <header>
            <a href="#">
                <strong>John smith</strong>
            </a>
            <label class="label bg-dark m-l-xs">Admin</label>
            <span class="text-muted text-xs block m-t-xs"> 26 minutes ago </span>
        </header>
        <div class="m-t-sm">Lorem ipsum dolor sit amet, consecteter adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet.</div>
    </section>
</article>
<article id="comment-id-2" class="comment-item">
    <a class="pull-left thumb-sm">
        <img src="${resource(dir:'images',file:'a2.png')}" class="img-circle">
        </a>
        <section class="comment-body m-b">
            <header>
                <a href="#">
                    <strong>John smith</strong>
                </a>
                <label class="label bg-dark m-l-xs">Admin</label>
                <span class="text-muted text-xs block m-t-xs"> 26 minutes ago </span>
            </header>
            <blockquote class="m-t">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
                <small>Someone famous in 
                    <cite title="Source Title">Source Title</cite>
                </small>
            </blockquote>
            <div class="m-t-sm">Lorem ipsum dolor sit amet, consecteter adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet.</div>
        </section>
    </article>
</section>
  <h4 class="m-t-lg m-b">Leave a comment</h4>
  <form>
  		<div class="form-group pull-in clearfix">
   		<div class="col-sm-6">
       		<label>Your name</label>
       			<input type="text" class="form-control" placeholder="Name">
       	</div>
       	<div class="col-sm-6">
           	<label>Email</label>
           		<input type="email" class="form-control" placeholder="Enter email">
           	</div>
       	</div>
       	<div class="form-group">
           	<label>Comment</label>
           		<textarea class="form-control" rows="5" placeholder="Type your comment" style="max-width:1350px;" ></textarea>
   	</div>
   	<div class="form-group">
       	<button type="submit" class="btn btn-success">Submit comment</button>
   	</div>
</form>
-->
<section class="comment-list block">
    <article id="comment-id-1" class="comment-item">
        <a class="pull-left thumb-sm avatar">
            <img src="${resource(dir:'images',file:'a1.png')}" class="img-circle" alt="...">
            </a>
            <span class="arrow left"></span>
            <section class="comment-body panel panel-default">
                <header class="panel-heading bg-white">
                    <a href="#">John smith</a>
                    <label class="label bg-info m-l-xs">Editor</label>
                    <span class="text-muted m-l-sm pull-right">
                        <i class="fa fa-clock-o"></i> Just now 
                    </span>
                </header>
                <div class="panel-body">
                    <div>Lorem ipsum dolor sit amet, consecteter adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet.</div>
                    <div class="comment-action m-t-sm">
                        <a href="#" data-toggle="class" class="btn btn-default btn-xs active">
                            <i class="fa fa-star-o text-muted text"></i>
                            <i class="fa fa-star text-danger text-active"></i> Like 
                        </a>
                        <a href="#comment-form" class="btn btn-default btn-xs">
                            <i class="fa fa-mail-reply text-muted"></i> Reply 
                        </a>
                    </div>
                </div>
            </section>
        </article>
        <!-- .comment-reply -->
        <article id="comment-id-2" class="comment-item comment-reply">
            <a class="pull-left thumb-sm avatar">
                <img src="${resource(dir:'images',file:'a8.png')}" alt="...">
                </a>
                <span class="arrow left"></span>
                <section class="comment-body panel panel-default text-sm">
                    <div class="panel-body">
                        <span class="text-muted m-l-sm pull-right">
                            <i class="fa fa-clock-o"></i> 10m ago 
                        </span>
                        <a href="#">Mika Sam</a>
                        <label class="label bg-dark m-l-xs">Admin</label> Report this comment is helpful 
                    </div>
                </section>
            </article>
            <!-- / .comment-reply -->
            <article id="comment-id-3" class="comment-item">
                <a class="pull-left thumb-sm avatar">
                    <img src="${resource(dir:'images',file:'a9.png')}" alt="...">
                    </a>
                    <span class="arrow left"></span>
                    <section class="comment-body panel panel-default">
                        <header class="panel-heading">
                            <a href="#">By me</a>
                            <label class="label bg-success m-l-xs">User</label>
                            <span class="text-muted m-l-sm pull-right">
                                <i class="fa fa-clock-o"></i> 1h ago 
                            </span>
                        </header>
                        <div class="panel-body">
                            <div>This comment was posted by you.</div>
                            <div class="comment-action m-t-sm">
                                <a href="#comment-id-3" data-dismiss="alert" class="btn btn-default btn-xs">
                                    <i class="fa fa-trash-o text-muted"></i> Remove 
                                </a>
                            </div>
                        </div>
                    </section>
                </article>
                <article id="comment-id-4" class="comment-item">
                    <a class="pull-left thumb-sm avatar">
                        <img src="${resource(dir:'images',file:'a5.png')}" alt="...">
                        </a>
                        <span class="arrow left"></span>
                        <section class="comment-body panel panel-default">
                            <header class="panel-heading">
                                <a href="#">Peter</a>
                                <label class="label bg-primary m-l-xs">Vip</label>
                                <span class="text-muted m-l-sm pull-right">
                                    <i class="fa fa-clock-o"></i> 2hs ago 
                                </span>
                            </header>
                            <div class="panel-body">
                                <blockquote>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
                                    <small>Someone famous in 
                                        <cite title="Source Title">Source Title</cite>
                                    </small>
                                </blockquote>
                                <div>Lorem ipsum dolor sit amet, consecteter adipiscing elit...</div>
                                <div class="comment-action m-t-sm">
                                    <a href="#" data-toggle="class" class="btn btn-default btn-xs">
                                        <i class="fa fa-star-o text-muted text"></i>
                                        <i class="fa fa-star text-danger text-active"></i> Like 
                                    </a>
                                    <a href="#comment-form" class="btn btn-default btn-xs">
                                        <i class="fa fa-mail-reply text-muted"></i> Reply
                                    </a>
                                </div>
                            </div>
                        </section>
                    </article>
                    <!-- comment form -->
                    <article class="comment-item media" id="comment-form">
                        <a class="pull-left thumb-sm avatar">
                            <img src="${resource(dir:'images',file:'a6.png')}" alt="...">
                            </a>
                            <section class="media-body">
                                <form action="index.html" class="m-b-none">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Input your comment here">
                                            <span class="input-group-btn">
                                                <button class="btn btn-primary" type="button">POST</button>
                                            </span>
                                        </div>
                                    </form>
                                </section>
                            </article>
                        </section>
                        <br><br>
</div>
</div>
<div class="col-sm-3">
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
