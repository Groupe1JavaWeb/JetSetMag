<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
	</head>
	<body>
<g:if test="${eventsCount>0}" >		
<div id="masonry" class="pos-rlt animated fadeInUpBig" style="height: auto;">
<g:each in="${eventsList}" var="event" >
	<div tile-id="${event.id}" class="pos-abt" style="left: 614px; width: 307px; height: 614px;">
	<div class="item">
	<div class="item-overlay gd animated fadeInUp wrapper bg-info">
	<p class="text-white">${event.title}</p>
	<div class="center text-center m-t-n">
	<a href="#">
	<i class="icon-control-play i-2x"></i>
	</a>
	</div>
	</div>
	<div class="bottom gd bg-info wrapper">
	<div class="m-t m-b">
	<a href="#" class="b-b b-info h4 text-u-c text-lt font-bold">${event.title}</a>
	</div>
	<p class="hidden-xs"><!-- ${event.description.toString().encodeAsRaw()} --> </p>
	</div>
	<a href="#">
		<g:if test="${ event.cover=="" || !event.cover }"> <!-- || !( event.cover =~ /^https?:\/\/(?:[a-z\-]+\.)+[a-z]{2,6}(?:\/[^\/#?]+)+\.(?:jpe?g|gif|png)$/ )  -->
		     <img class="img-full" src="${resource(dir:'images',file:'Event_Cover3.jpg')}" />
		</g:if>
		<g:else>
			<img class="img-full" src="${resource(dir:'images',file:'Event_Cover2.jpg')}" />
		</g:else>
	</a>
	</div>
	</div>
</g:each>
<div tile-id="1" class="pos-abt" style="width: 614px; height: 614px;">
<div class="item">
<div class="carousel slide auto" data-interval="3000">
<div class="carousel-inner">
<div class="item">
<div class="item-overlay opacity animated fadeInDown wrapper bg-info">
<p class="text-white">N.01</p>
<div class="center text-center m-t-n">
<a href="#">
<i class="icon-control-play i-2x"></i>
</a>
</div>
</div>
<div class="bottom wrapper bg-info gd">
<div class="m-t m-b">
<a href="#" class="b-b b-danger h2 text-u-c text-lt font-bold">Teideal</a>
</div>
<p class="hidden-xs">Morbi nec nunc condimentum, egestas dui nec, fermentum diam. Vivamus vel tincidunt libero, vitae elementum ligula</p>
</div>
<a href="#">
<img src="${resource(dir:'images',file:'m20.jpg')}" alt="" class="img-full">
</a>
</div>
<div class="item active">
<div class="item-overlay opacity animated fadeInDown wrapper bg-info">
<p class="text-white">N.02</p>
<div class="center text-center m-t-n">
<a href="#">
<i class="icon-control-play i-2x"></i>
</a>
</div>
</div>
<div class="bottom wrapper bg-info gd">
<div class="m-t m-b">
<a href="#" class="b-b b-warning h2 text-u-c text-lt font-bold">Tincidunt</a>
</div>
<p class="hidden-xs">Gestas dui nec, fermentum diam. Vivamus vel tincidunt libero, vitae ligula elementum</p>
</div>
<a href="#">
<img src="${resource(dir:'images',file:'m22.jpg')}" alt="" class="img-full">
</a>
</div>
</div>
</div>
</div>
</div>
<!--<div tile-id="2" class="pos-abt" style="left: 614px; width: 307px; height: 614px;">
<div class="item">
<div class="item-overlay gd animated fadeInUp wrapper bg-info">
<p class="text-white">Watch later</p>
<div class="center text-center m-t-n">
<a href="#">
<i class="icon-control-play i-2x"></i>
</a>
</div>
</div>
<div class="bottom gd bg-info wrapper">
<div class="m-t m-b">
<a href="#" class="b-b b-info h4 text-u-c text-lt font-bold">Tincidunt</a>
</div>
<p class="hidden-xs">Vivamus vel tincidunt libero, lementum ligula vitae</p>
</div>
<a href="#">
<img src="${resource(dir:'images',file:'m31.jpg')}" alt="" class="img-full">
</a>
</div>
</div>-->
<div tile-id="3" class="pos-abt" style="left: 921px; width: 307px; height: 307px;">
<div class="item">
<div class="bottom gd bg-info wrapper">
<div class="m-t m-b">
<a href="#" class="b-b b-warning h4 text-u-c text-lt font-bold">Duis</a>
</div>
<p class="hidden-xs">Tincidunt libero vitae elementum</p>
</div>
<a href="#">
<img src="${resource(dir:'images',file:'m10.jpg')}" alt="" class="img-full">
</a>
</div>
</div>
<div tile-id="4" class="pos-abt" style="left: 1228px; width: 307px; height: 307px;">
<div class="item">
<div class="item-overlay active bg-primary dker wrapper text-center">
<div class="m-t m-b">
<a href="#" class="b-b b-white h4 text-u-c text-lt font-bold">lementum</a>
</div>
<p class="hidden-xs">lementum ligula vitae est quis congue ero</p>
</div>
</div>
</div>
<div tile-id="5" class="pos-abt" style="left: 1535px; width: 307px; height: 307px;">
<div class="item">
<div class="bottom gd bg-info wrapper">
<div class="m-t m-b">
<a href="#" class="b-b b-info h4 text-u-c text-lt font-bold">Diam</a>
</div>
<p class="hidden-xs">Con malesuada est, quis congue nibhs</p>
</div>
<a href="#">
<img src="${resource(dir:'images',file:'m4.jpg')}" alt="" class="img-full">
</a>
</div>
</div>
<div tile-id="6" class="pos-abt" style="left: 921px; top: 307px; width: 307px; height: 307px;">
<div class="item">
<div class="carousel carousel-fade bg-info slide auto" data-interval="6000">
<div class="carousel-inner">
<div class="item active">
<div class="item-overlay active dker wrapper text-center">
<div class="m-t m-b">
<a href="#" class="b-b b-info h4 text-u-c text-lt font-bold">Cosies</a>
</div>
<p class="hidden-xs">Duis non malesuada est, quis congue nibh</p>
</div>
<a href="#">
<img src="${resource(dir:'images',file:'m4.jpg')}" alt="" class="img-full">
</a>
</div>
<div class="item">
<div class="item-overlay active dk wrapper text-center">
<div class="m-t m-b">
<a href="#" class="b-b b-info h4 text-u-c text-lt font-bold">Malesuada</a>
</div>
<p class="hidden-xs">Aliquam sollicitudin venenatis congue nibh</p>
</div>
<a href="#">
<img src="${resource(dir:'images',file:'m4.jpg')}" alt="" class="img-full">
</a>
</div>
</div>
</div>
</div>
</div>
<div tile-id="7" class="pos-abt" style="left: 1228px; top: 307px; width: 307px; height: 307px;">
<div class="item">
<div class="bottom gd bg-info wrapper">
<div class="m-t m-b">
<a href="#" class="b-b b-info h4 text-u-c text-lt font-bold">Vivamus</a>
</div>
<p class="hidden-xs">Morbi id neque quam. Aliquam sollicitudin venenatis ipsum</p>
</div>
<a href="#">
<img src="${resource(dir:'images',file:'m13.jpg')}" alt="" class="img-full">
</a>
</div>
</div>
<div tile-id="8" class="pos-abt" style="left: 1535px; top: 307px; width: 307px; height: 614px;">
<div class="item">
<div class="bottom gd bg-info wrapper">
<div class="m-t m-b">
<a href="#" class="b-b b-warning h4 text-u-c text-lt font-bold">Libero</a>
</div>
<p class="hidden-xs">Aliquam sollicitudin venenatis ipsum</p>
</div>
<a href="#">
<img src="${resource(dir:'images',file:'m30.jpg')}" alt="" class="img-full">
</a>
</div>
</div>
<div tile-id="9" class="pos-abt" style="top: 614px; width: 307px; height: 307px;">
<div class="item">
<div class="bottom gd bg-info wrapper">
<div class="m-t m-b">
<a href="#" class="b-b b-info h4 text-u-c text-lt font-bold">habitant</a>
</div>
<p class="hidden-xs">Vel tincidunt libero, vitae ligula tristique</p>
</div>
<a href="#">
<img src="${resource(dir:'images',file:'m19.jpg')}" alt="" class="img-full">
</a>
</div>
</div>
<div tile-id="10" class="pos-abt" style="left: 307px; top: 614px; width: 307px; height: 307px;">
<div class="item">
<div class="item-overlay active bg-success dker wrapper text-center">
<div class="m-t m-b">
<a href="#" class="b-b b-info h4 text-u-c text-lt font-bold">Ligula</a>
</div>
<p class="hidden-xs">Sesuada est, quis congue tincidunt libero nibh ligula</p>
</div>
</div>
</div>
<div tile-id="11" class="pos-abt" style="left: 614px; top: 614px; width: 307px; height: 307px;">
<div class="item">
<div class="bottom gd bg-info wrapper">
<div class="m-t m-b">
<a href="#" class="b-b b-info h4 text-u-c text-lt font-bold">Malesuada</a>
</div>
<p class="hidden-xs">Pellentesque habitant morbi tristique sodales</p>
</div>
<a href="#">
<img src="${resource(dir:'images',file:'m7.jpg')}" alt="" class="img-full">
</a>
</div>
</div>
<div tile-id="12" class="pos-abt" style="left: 921px; top: 614px; width: 307px; height: 307px;">
<div class="item">
<div class="bottom gd bg-info wrapper">
<div class="m-t m-b">
<a href="#" class="b-b b-info h4 text-u-c text-lt font-bold">Donec</a>
</div>
<p class="hidden-xs">Vestibulum ullamcorper</p>
</div>
<a href="#">
<img src="${resource(dir:'images',file:'m18.jpg')}" alt="" class="img-full">
</a>
</div>
</div>
<div tile-id="13" class="pos-abt" style="left: 1228px; top: 614px; width: 307px; height: 614px;">
<div class="item">
<div class="bottom gd bg-info wrapper">
<div class="m-t m-b">
<a href="#" class="b-b b-primary h4 text-u-c text-lt font-bold">Eleifend</a>
</div>
<p class="hidden-xs">Malesuada augue. Donec eleifend condimentum</p>
</div>
<a href="#">
<img src="${resource(dir:'images',file:'m32.jpg')}" alt="" class="img-full">
</a>
</div>
</div>
<div tile-id="14" class="pos-abt" style="top: 921px; width: 614px; height: 307px;">
<div class="item">
<div class="bottom gd bg-info wrapper">
<div class="m-t m-b">
<a href="#" class="b-b b-info h4 text-u-c text-lt font-bold">Sollicitudin </a>
</div>
<p class="hidden-xs">Mauris convallis mauris at pellentesque volutpat</p>
</div>
<a href="#">
<img src="${resource(dir:'images',file:'m40.jpg')}" alt="" class="img-full">
</a>
</div>
</div>
<div tile-id="15" class="pos-abt" style="left: 614px; top: 921px; width: 614px; height: 614px;">
<div class="item">
<div class="bottom gd bg-info wrapper">
<div class="m-t m-b">
<a href="#" class="b-b b-warning h2 text-u-c text-lt font-bold">Senectus </a>
</div>
<p class="hidden-xs">Fermentum diam. Vivamus vel tincidunt libero, vitae elementum ligula</p>
</div>
<a href="#">
<img src="${resource(dir:'images',file:'m21.jpg')}" alt="" class="img-full">
</a>
</div>
</div>
<div tile-id="16" class="pos-abt" style="left: 1535px; top: 921px; width: 307px; height: 307px;">
<div class="item">
<div class="bottom gd bg-info wrapper">
<div class="m-t m-b">
<a href="#" class="b-b b-info h4 text-u-c text-lt font-bold">Phasellus</a>
</div>
<p class="hidden-xs">Senectus et netus et malesuada fames</p>
</div>
<a href="#">
<img src="${resource(dir:'images',file:'m5.jpg')}" alt="" class="img-full">
</a>
</div>
</div>
<div tile-id="17" class="pos-abt" style="top: 1228px; width: 307px; height: 307px;">
<div class="item">
<div class="bottom gd bg-info wrapper">
<div class="m-t m-b">
<a href="#" class="b-b b-white h4 text-u-c text-lt font-bold">Neque</a>
</div>
<p class="hidden-xs">Consectetur adipiscing elit. Morbi id neque quam</p>
</div>
<a href="#">
<img src="${resource(dir:'images',file:'a10.png')}" alt="" class="img-full">
</a>
</div>
</div>
<div tile-id="18" class="pos-abt" style="left: 307px; top: 1228px; width: 307px; height: 307px;">
<div class="item">
<div class="bottom gd bg-info wrapper">
<div class="m-t m-b">
<a href="#" class="b-b b-info h4 text-u-c text-lt font-bold">Nisi ne</a>
</div>
<p class="hidden-xs">Orbi tristique senectus et netus et malesuada</p>
</div>
<a href="#">
<img src="${resource(dir:'images',file:'m4.jpg')}" alt="" class="img-full">
</a>
</div>
</div>
<div tile-id="19" class="pos-abt" style="left: 1228px; top: 1228px; width: 307px; height: 307px;">
<div class="item">
<div class="item-overlay active bg-warning dker wrapper text-center">
<div class="m-t m-b">
<a href="#" class="b-b b-white h4 text-u-c text-lt font-bold">Morbi</a>
</div>
<p class="hidden-xs">Dolor sit amet, consectetur adipiscing elit.</p>
</div>
</div>
</div>
<div tile-id="20" class="pos-abt" style="left: 1535px; top: 1228px; width: 307px; height: 307px;">
<div class="item">
<div class="bottom gd bg-info wrapper">
<div class="m-t m-b">
<a href="#" class="b-b b-info h4 text-u-c text-lt font-bold">Congue</a>
</div>
<p class="hidden-xs">Malesuada est, quis congue nibh</p>
</div>
<a href="#">
<img src="${resource(dir:'images',file:'m6.jpg')}" alt="" class="img-full">
</a>
</div>
</div>
<div tile-id="21" class="pos-abt" style="top: 1535px; width: 307px; height: 307px;">
<div class="item">
<div class="item-overlay active bg-info lt wrapper text-center">
<div class="m-t m-b">
<a href="#" class="b-b b-white h4 text-u-c text-lt font-bold">Csesoi</a>
</div>
<p class="hidden-xs">Dolor sit ectetur elit senectus et malesuada</p>
</div>
</div>
</div>
<div tile-id="22" class="pos-abt" style="left: 307px; top: 1535px; width: 614px; height: 307px;">
<div class="item">
<div class="bottom gd bg-info wrapper">
<div class="m-t m-b">
<a href="#" class="b-b b-info h4 text-u-c text-lt font-bold">Consectetur</a>
</div>
<p class="hidden-xs">Adipiscing elit senectus et netus mal.</p>
</div>
<a href="#">
<img src="${resource(dir:'images',file:'m42.jpg')}" alt="" class="img-full">
</a>
</div>
</div>
<div tile-id="23" class="pos-abt" style="left: 921px; top: 1535px; width: 307px; height: 307px;">
<div class="item">
<div class="bottom gd bg-info wrapper">
<div class="m-t m-b">
<a href="#" class="b-b b-info h4 text-u-c text-lt font-bold">Morbi</a>
</div>
<p class="hidden-xs">Dolor sit amet, consectetur adipiscing elit.</p>
</div>
<a href="#">
<img src="${resource(dir:'images',file:'m9.jpg')}" alt="" class="img-full">
</a>
</div>
</div>
<div tile-id="24" class="pos-abt" style="left: 1228px; top: 1535px; width: 307px; height: 307px;">
<div class="item">
<div class="bottom gd bg-info wrapper">
<div class="m-t m-b">
<a href="#" class="b-b b-info h4 text-u-c text-lt font-bold">Soesle</a>
</div>
<p class="hidden-xs">Adipiscing elituis congue</p>
</div>
<a href="#">
<img src="${resource(dir:'images',file:'a7.png')}" alt="" class="img-full">
</a>
</div>
</div>
<div tile-id="25" class="pos-abt" style="left: 1535px; top: 1535px; width: 307px; height: 307px;">
<div class="item">
<div class="bottom gd bg-info wrapper">
<div class="m-t m-b">
<a href="#" class="b-b b-info h4 text-u-c text-lt font-bold">Congue</a>
</div>
<p class="hidden-xs">Malesuada est, congue nibh quis elituis</p>
</div>
<a href="#">
<img src="${resource(dir:'images',file:'m12.jpg')}" alt="" class="img-full">
</a>
</div>
</div>
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