<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<style type="text/css">
			#tumblelog .col1 { width: 220px; }
			#tumblelog .col2 { width: 460px; }
			#tumblelog .col3 { width: 700px; }
		</style>
	</head>
	<body>
	
		<g:if test="${eventsCount>0}" >		
			<div id="masonry" class="pos-rlt animated fadeInUpBig" style="height: auto;">
				<%
						//def i=0
				%>
				<g:each in="${eventsList}" var="event" >
				<% 		
						//i++ 
						//def styleItem = "width:25%;" 
						//if(i%2==0){styleItem = "width:25%;"}
						//else{styleItem = "width:50%;"}
				%>
				</g:each>
			</div>
		</g:if>
		<g:else>
			<div class="alert alert-info">
				<i class="fa fa-info-sign"></i><strong> INFO </strong> It's so boring, there is no saved events ! please add a new one &nbsp;&nbsp; <sec:ifLoggedIn><sec:ifAnyGranted roles="ROLE_SUPERADMIN,ROLE_ADMIN,ROLE_MEMBER" ><g:link controller="Event" action="create" class="btn btn-primary btn-sm">New Event</g:link></sec:ifAnyGranted></sec:ifLoggedIn>
			</div>
		</g:else>		
		<!-- Bootstrap -->
		<!-- App -->
		<script type="text/javascript" src="${resource(dir:'js',file:'app.v1.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js',file:'app.plugin.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/masonry',file:'tiles.min.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/masonry',file:'demo.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js',file:'socket.io-1.0.6.js')}"></script>
	</body>
</html>