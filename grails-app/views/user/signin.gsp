<!DOCTYPE html>
<html lang="en" class="bg-info">
<head>
    <meta charset="utf-8" />
    <title>Jet7 Magazine - Authentification</title>
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
<body class="bg-info">
    <section id="content" class="m-t-lg wrapper-md animated fadeInUp">
        <div class="container aside-xl">
       		<a class="navbar-brand block" href="index.html">
           		<span class="h1 font-bold">Jet7 Magazine</span>
       		</a>
       		<section class="m-b-lg">
           		<header class="wrapper text-center">
               		<strong>Sign in to get in touch</strong>
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
           		</header>
           		<form action="login" method="POST">
               		<div class="form-group">
                   		<input type="text" name="login" placeholder="login" class="form-control rounded input-lg text-center no-border" required >
                   	</div>
                	<div class="form-group">
                    	<input type="password" name="password" placeholder="Password" class="form-control rounded input-lg text-center no-border" required >
                    </div>
                    <button type="submit" class="btn btn-lg btn-warning lt b-white b-2x btn-block btn-rounded">
                        <i class="icon-arrow-right pull-right"></i>
                        <span class="m-r-n-lg">Sign in</span>
                    </button>
            		<div class="line line-dashed"></div>
                	<p class="text-muted text-center">
                		<small>Do not have an account?</small>
              		</p>
      				<a href="register" class="btn btn-lg btn-info btn-block rounded">Create an account</a>
           		</form>
			</section>
		</div>
    </section>
    <!-- footer -->
	<footer id="footer">
    <div class="text-center padder">
        <p>
            <small> Jet7 Magazine
                <br>&copy; 2014
                </small>
            </p>
        </div>
    </footer>
    <!-- / footer -->
<!-- Bootstrap -->
<!-- App -->
        <script type="text/javascript" src="${resource(dir:'js',file:'app.v1.js')}"></script>
        <script type="text/javascript" src="${resource(dir:'js',file:'app.plugin.js')}"></script>
        <script type="text/javascript" src="${resource(dir:'js/jPlayer',file:'jquery.jplayer.min.js')}"></script>
        <script type="text/javascript" src="${resource(dir:'js/jPlayer/add-on',file:'jplayer.playlist.min.js')}"></script>
        <script type="text/javascript" src="${resource(dir:'js/jPlayer',file:'demo.js')}"></script>
    </body>
</html>