<!DOCTYPE html>
<html lang="en" class="bg-info">
<head>
    <meta charset="utf-8" />
    <title>Jet7 Magazine - Comment</title>
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
	<section id="content" class="m-t-lg wrapper-md animated fadeInDown">
	    <div class="container aside-xl">
	        <a class="navbar-brand block" href="index.html">
	            <span class="h1 font-bold">Jet7 Magazine</span>
	        </a>
	       	<section class="m-b-lg">
	           <header class="wrapper text-center">
	               	<strong> Add your Comment </strong>
	               	<br />
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
					<br />
				</header>
           		<form action="register" method="POST">
                   	 <input type="hidden" name="description" value="" />
		                <div class="form-group">
		                    <label class="col-sm-2 control-label">Title</label>
		                    <div class="col-sm-10">
		                        <input type="text" class="form-control" name="title" id="title" required >
		                            <span class="help-block m-b-none">pick a  title for your comment</span>
		                        </div>
		                    </div>
		                </div>
                   	<div class="form-group">
                       	<input type="text" name="Content" placeholder="Content" class="form-control rounded input-lg text-center no-border" required >
                    </div>
                   	<div class="form-group">
                    <label class="col-sm-2 control-label">Description</label>
                    <div class="col-sm-10">
		                        <div class="btn-toolbar m-b-sm btn-editor" data-role="editor-toolbar" data-target="#editor">
		                            <div class="btn-group">
		                                <a class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" title="" data-original-title="Font">
		                                    <i class="fa fa-font"></i>
		                                    <b class="caret"></b>
		                                </a>
		                                <ul class="dropdown-menu">
		                                    <li>
		                                        <a data-edit="fontName Serif" style="font-family:'Serif'">Serif</a>
		                                    </li>
		                                    <li>
		                                        <a data-edit="fontName Sans" style="font-family:'Sans'">Sans</a>
		                                    </li>
		                                    <li>
		                                        <a data-edit="fontName Arial" style="font-family:'Arial'">Arial</a>
		                                    </li>
		                                    <li>
		                                        <a data-edit="fontName Arial Black" style="font-family:'Arial Black'">Arial Black</a>
		                                    </li>
		                                    <li>
		                                        <a data-edit="fontName Courier" style="font-family:'Courier'">Courier</a>
                    
                    </div>
                    <div class="form-group">
                                  <div class="col-sm-4 col-sm-offset-2">
		                          <button type="reset" class="btn btn-default" id="res" >Cancel</button>
		                          <button type="submit" class="btn btn-primary" id="sub" >Save</button>
		                      </div>	
		                      	</form>		
		                      </form>
			</section>
		</div>
	</section>
	<!-- footer -->
	<footer id="footer">
		<div class="text-center padder clearfix">
	    	<p>
	        	<small>Jet7 Magazine
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