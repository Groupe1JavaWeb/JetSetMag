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
       		<g:link controller="home" action="index" class="navbar-brand block">
           		<span class="h1 font-bold">Jet7 Magazine</span>
       		</g:link>
       		<section class="m-b-lg">
           		<header class="wrapper text-center">
               		<strong>Sign in to get in touch</strong>
	               	<div id="AjaxAndPostNotif" >
						<g:if test="${flash.error}">
							<p><div class="alert alert-error" style="display: block">${flash.error}</div></p>
						</g:if>
						<g:if test="${flash.danger}">
							<p><div class="alert alert-danger" style="display: block">${flash.danger}</div></p>
						</g:if>
						<g:if test="${flash.message}">
							<p><div class="alert alert-info" style="display: block">${flash.message}</div></p>
						</g:if>
						<g:if test="${flash.success}">
							<p><div class="alert alert-success" style="display: block">${flash.success}</div></p>
						</g:if>
						<g:if test="${flash.warning}">
							<p><div class="alert alert-warning alert-block" style="display: block">${flash.warning}</div></p>
						</g:if>
						<!-- Ajax Notif Here-->
					</div>
           		</header>
           		
           		<!-- <form action="${postUrl}" method="POST" autocomplete="off"> -->
           		<form method="POST" autocomplete="off" id="frmSignIn" autocomplete="off" >
               		<div class="form-group">
                   		<input type="text" name="j_username" id="username" value="" placeholder="login" class="form-control rounded input-lg text-center no-border" required >
                   	</div>
                	<div class="form-group">
                    	<input type="password" name="j_password" id="password" value="" placeholder="Password" class="form-control rounded input-lg text-center no-border" required >
                    </div>
					<div class="checkbox i-checks m-b">
						<label class="m-l">
							<input type="checkbox" <g:if test='${hasCookie}'>checked='checked'</g:if> name='${rememberMeParameter}' id='remember_me' ><i></i> Remember Me 
						</label>
					</div>
					<br />
					
                    <!-- 
	                    <button type="submit" class="btn btn-lg btn-warning lt b-white b-2x btn-block btn-rounded">
	                        <i class="icon-arrow-right pull-right"></i>
	                        <span class="m-r-n-lg">Sign in</span>
	                    </button>
                    -->
                    <input type="button" onclick='javascript:authAjax();' class="btn btn-lg btn-warning lt b-white b-2x btn-block btn-rounded" value="Sign In" />
                    
            		<div class="line line-dashed"></div>
                	<p class="text-muted text-center">
                		<small>Do not have an account?</small>
              		</p>
      				<g:link controller="Home" action="register" class="btn btn-lg btn-info btn-block rounded">Create an account</g:link>
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
	    <script type='text/javascript'>
		    function authAjax(){
		    		$("div#AjaxAndPostNotif").empty();
					var formdata = $('form#frmSignIn').serialize();
					var dataUrl = "${postUrl}"      
					jQuery.ajax({
					type : 'POST',
					url :  dataUrl ,
					data : formdata,
					success : function(response,textStatus){
			        	if(response.success){
			    			// var redirectUrl="${ createLink(action:'index' ,controller:'home') }";
			         		// window.location.assign(redirectUrl);
			         		window.location.href="${request.contextPath}${successUrl}";
			        	}
			        	else
			    		{
			         		//console.error(response.error);
			         		$("div#AjaxAndPostNotif").append('<p><div class="alert alert-danger" style="display: block">'+response.error+'</div></p>');
			    		}
					},error : function( XMLHttpRequest, textStatus, errorThrown) { 
						//console.error(dataUrl+"-"+XMLHttpRequest+"-"+textStatus+"-"+errorThrown);
						$("div#AjaxAndPostNotif").append('<p><div class="alert alert-warning" style="display: block">Error !</div></p>');
					}
				});
		    }
	    </script>
    </body>
</html>