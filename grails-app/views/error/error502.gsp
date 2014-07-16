<!DOCTYPE html>
<html lang="en" class="app">
<head>
	<title><g:if env="development">Grails Runtime Exception</g:if><g:else>Error</g:else></title>
	<g:if env="development">
		<asset:stylesheet src="errors.css"/>
	</g:if>
	<meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	<link rel="stylesheet" href="${resource(dir:'js/jPlayer',file:'jplayer.flat.css')}" />
	<link rel="stylesheet" href="${resource(dir:'css',file:'app.v1.css')}" />
	<link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
    <!--[if lt IE 9]>
		<script src="${resource(dir:'js/ie',file:'html5shiv.js')}"></script>
		<script src="${resource(dir:'js/ie',file:'respond.min.js')}"></script>
		<script src="${resource(dir:'js/ie',file:'excanvas.js')}"></script>
	<![endif]-->
</head>
<body class="bg-light dk">
	<section id="content">
		<div class="row m-n">
			<div class="col-sm-4 col-sm-offset-4">
				<div class="text-center m-b-lg">
					<h1 class="h text-white animated fadeInDownBig">502</h1>
					<hr />
					<g:if env="development">
						<g:renderException exception="${exception}" />
					</g:if>
					<g:else>
						<ul class="errors">
							<li>An error has occurred</li>
						</ul>
					</g:else>
				</div>
				<div class="list-group auto m-b-sm m-b-lg">
					<a href="/JetSetMag/" class="list-group-item">
					<i class="fa fa-chevron-right icon-muted"></i>
					<i class="fa fa-fw fa-home icon-muted"></i> Goto Homepage </a>
					<!-- <a href="#" class="list-group-item">
					<i class="fa fa-chevron-right icon-muted"></i>
					<i class="fa fa-fw fa-question icon-muted"></i> Send us a tip </a>-->
					<a href="#" class="list-group-item">
					<i class="fa fa-chevron-right icon-muted"></i>
					<span class="badge bg-info lt">(+216)-71-974-612</span>
					<i class="fa fa-fw fa-phone icon-muted"></i> Call us </a>
				</div>
			</div>
		</div>
	</section>
	<!-- footer -->
	<footer id="footer">
		<div class="text-center padder clearfix">
			<p> 
				<small>Jet7 Magazine<br>&copy; 2014</small> 
			</p> 
		</div> 
	</footer> 
	<!-- / footer -->
	<!-- Bootstrap -->
	<!-- App -->
	<script type="text/javascript" src="${resource(dir:'js',file:'app.v1.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js',file:'app.plugin.js')}"></script>
	</body>
</html>