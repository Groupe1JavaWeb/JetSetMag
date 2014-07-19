<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<link rel="stylesheet" href="${resource(dir:'js/datatables',file:'datatables.css')}" type="text/css"/>
		<link rel="stylesheet" href="${resource(dir:'css',file:'paginate.css')}" type="text/css"/>
	</head>
	<body>
		<div class="m-b-md">
			<h3 class="m-b-none">Events/News Management</h3>
		</div>
        <g:if test="${eventsCount>0}" >
		<section class="panel panel-default">
		    <header class="panel-heading"> Events/News List </header>
		    	<div class="row wrapper">
			        <div class="col-sm-5 m-b-xs">
		                 <select class="input-sm form-control input-s-sm inline v-middle" id="selectAction" >
		                     <option value="show" selected class="OptShow" >Show</option>
		                     <option value="edit" class="OptEdit" >Edit</option>
		                     <option value="delete" class="OptDelete" >Delete</option>
		                 </select>
		                 <button class="btn btn-sm btn-default" onClick="applyAction();" id="applyAction" >Apply</button>
		                 <g:link class="btn btn-info btn-sm" controller='Event' action='create' >New Event/News</g:link>
			        </div>
			        <div class="col-sm-4 m-b-xs">
						<div class="btn-group" data-toggle="buttons">
							<g:if test="${FilterIsNews==true}" ><label class="btn btn-sm btn-info active" onClick="javascript:renderTable(1);" ></g:if><g:else><label class="btn btn-sm btn-info" onClick="javascript:renderTable(1);" ></g:else>
								<input type="radio" name="Eselector" >
								<i class="fa fa-check text-active"></i> News 
							</label>
							<g:if test="${FilterIsNews==false}" ><label class="btn btn-sm btn-success active" onClick="javascript:renderTable(2);" ></g:if><g:else><label class="btn btn-sm btn-success" onClick="javascript:renderTable(2);" ></g:else>
								<input type="radio" name="Eselector" >
								<i class="fa fa-check text-active"></i> Events
							</label>
							<g:if test="${FilterIsNews==null}" ><label class="btn btn-sm btn-primary active" onClick="javascript:renderTable(0);" ></g:if><g:else><label class="btn btn-sm btn-primary" onClick="javascript:renderTable(0);" ></g:else>
								<input type="radio" name="Eselector" >
								<i class="fa fa-check text-active"></i> All
							</label>
						</div>
			        </div>
                 	<div class="col-sm-3">                 			
                   		<g:form url="[action:'search',controller:'Event']" method="POST" >
                    		<div class="input-group">
                       			<input type="text" name="searchField" id="searchField" class="input-sm form-control" placeholder="Search for specific event details !" >
                             		<span class="input-group-btn">
                              			<button class="btn btn-sm btn-default" type="submit">Go!</button>
                             		</span>
                        	</div>
                       	</g:form>
                   	</div>
                   	</div>
                   	<div class="table-responsive">
                       <table class="table table-striped b-t b-light">
                       	<thead>
                       	<tr>			                                        
							<th style="width:20px;">
								<!-- <label class="checkbox m-n i-checks">
									<input type="checkbox">
                               		<i></i>
                            	</label> -->
                        	</th>
                      		<g:sortableColumn property="title" title="Title" />
                    		<g:sortableColumn property="description" title="Description" />
                       		<g:sortableColumn property="startDate" title="Start Date" />
                        	<g:sortableColumn property="endDate" title="End Date" />
                			<g:sortableColumn property="enabled" title="Enabled" />
                			<g:sortableColumn property="isNews" title="Tagged As News" />
                			<g:sortableColumn property="canComment" title="can Comment ?" />
                			<g:sortableColumn property="showComments" title="Show Comments ?" />
                  		</tr>
						</thead>
                        	<tbody>
                           	<g:each in="${eventsList}" var="event" >
                           		<g:if test="${FilterIsNews==true}" >
                           			<g:if test="${event.isNews==true}" >
		                               	<tr>
		                                  	<td>
		                                       	<label class="checkbox m-n i-checks">
		                                         	<input type="checkbox" name="eventChecked[]" value="${event.id}" class="which" ><!-- alos can be a newsChecked via the isNews tag -->
		                                         		<i></i>
		                                        	</label>
		                                   	</td>
		                                    	<td style="width:350px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" >${event.title}</td>
		                                     	<td style="width:600px;max-width:800px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" >${event.description.toString()}</td><!--  .encodeAsRaw() // encodeAsHTML() // decodeHTML() // .substring(0,40) -->
		                                 		<td>${event.startDate.format("yyyy/MM/dd")}</td>
		                                 		<td>${event.endDate.format("yyyy/MM/dd")}</td>
		                                  		<td>
		                                       		<g:if test="${event.enabled==true}">
		                                       			<a href="#" class="active" data-toggle="class" onClick="changeState('${event.id}')" >
		                                       				<i class="fa fa-check text-success text-active"></i>
		                                       				<i class="fa fa-times text-danger text"></i>
		                                       			</a>
		                                       		</g:if>
		                                       		<g:else>
														<a href="#" data-toggle="class" onClick="changeState('${event.id}')" >
															<i class="fa fa-check text-success text-active"></i>
															<i class="fa fa-times text-danger text"></i>
														</a>
		                                       		</g:else>
		                                    	</td>
		                                  		<td>
		                                       		<g:if test="${event.isNews==true}">
		                                       			<a href="#" class="active" data-toggle="class" onClick="changeStateTaggedAs('${event.id}')" >
		                                       				<i class="fa fa-check text-success text-active"></i>
		                                       				<i class="fa fa-times text-danger text"></i>
		                                       			</a>
		                                       		</g:if>
		                                       		<g:else>
														<a href="#" data-toggle="class" onClick="changeStateTaggedAs('${event.id}')" >
															<i class="fa fa-check text-success text-active"></i>
															<i class="fa fa-times text-danger text"></i>
														</a>
		                                       		</g:else>
		                                    	</td>
		                                  		<td>
		                                       		<g:if test="${event.canComment==true}">
		                                       			<a href="#" class="active" data-toggle="class" onClick="changeStateCanComment('${event.id}')" >
		                                       				<i class="fa fa-check text-success text-active"></i>
		                                       				<i class="fa fa-times text-danger text"></i>
		                                       			</a>
		                                       		</g:if>
		                                       		<g:else>
														<a href="#" data-toggle="class" onClick="changeStateCanComment('${event.id}')" >
															<i class="fa fa-check text-success text-active"></i>
															<i class="fa fa-times text-danger text"></i>
														</a>
		                                       		</g:else>
		                                    	</td>
		                                  		<td>
		                                       		<g:if test="${event.showComments==true}">
		                                       			<a href="#" class="active" data-toggle="class" onClick="changeStateShowComments('${event.id}')" >
		                                       				<i class="fa fa-check text-success text-active"></i>
		                                       				<i class="fa fa-times text-danger text"></i>
		                                       			</a>
		                                       		</g:if>
		                                       		<g:else>
														<a href="#" data-toggle="class" onClick="changeStateShowComments('${event.id}')" >
															<i class="fa fa-check text-success text-active"></i>
															<i class="fa fa-times text-danger text"></i>
														</a>
		                                       		</g:else>
		                                    	</td>
		                                   </tr>
                           			</g:if>
                           		</g:if>
                           		<g:elseif test="${FilterIsNews==false}" >
                           			<g:if test="${event.isNews==false}" >
		                               	<tr>
		                                  	<td>
		                                       	<label class="checkbox m-n i-checks">
		                                         	<input type="checkbox" name="eventChecked[]" value="${event.id}" class="which" ><!-- alos can be a newsChecked via the isNews tag -->
		                                         		<i></i>
		                                        	</label>
		                                   	</td>
		                                    	<td style="width:350px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" >${event.title}</td>
		                                     	<td style="width:600px;max-width:800px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" >${event.description.toString()}</td><!--  .encodeAsRaw() // encodeAsHTML() // decodeHTML() // .substring(0,40) -->
		                                 		<td>${event.startDate.format("yyyy/MM/dd")}</td>
		                                 		<td>${event.endDate.format("yyyy/MM/dd")}</td>
		                                  		<td>
		                                       		<g:if test="${event.enabled==true}">
		                                       			<a href="#" class="active" data-toggle="class" onClick="changeState('${event.id}')" >
		                                       				<i class="fa fa-check text-success text-active"></i>
		                                       				<i class="fa fa-times text-danger text"></i>
		                                       			</a>
		                                       		</g:if>
		                                       		<g:else>
														<a href="#" data-toggle="class" onClick="changeState('${event.id}')" >
															<i class="fa fa-check text-success text-active"></i>
															<i class="fa fa-times text-danger text"></i>
														</a>
		                                       		</g:else>
		                                    	</td>
		                                  		<td>
		                                       		<g:if test="${event.isNews==true}">
		                                       			<a href="#" class="active" data-toggle="class" onClick="changeStateTaggedAs('${event.id}')" >
		                                       				<i class="fa fa-check text-success text-active"></i>
		                                       				<i class="fa fa-times text-danger text"></i>
		                                       			</a>
		                                       		</g:if>
		                                       		<g:else>
														<a href="#" data-toggle="class" onClick="changeStateTaggedAs('${event.id}')" >
															<i class="fa fa-check text-success text-active"></i>
															<i class="fa fa-times text-danger text"></i>
														</a>
		                                       		</g:else>
		                                    	</td>
		                                  		<td>
		                                       		<g:if test="${event.canComment==true}">
		                                       			<a href="#" class="active" data-toggle="class" onClick="changeStateCanComment('${event.id}')" >
		                                       				<i class="fa fa-check text-success text-active"></i>
		                                       				<i class="fa fa-times text-danger text"></i>
		                                       			</a>
		                                       		</g:if>
		                                       		<g:else>
														<a href="#" data-toggle="class" onClick="changeStateCanComment('${event.id}')" >
															<i class="fa fa-check text-success text-active"></i>
															<i class="fa fa-times text-danger text"></i>
														</a>
		                                       		</g:else>
		                                    	</td>
		                                  		<td>
		                                       		<g:if test="${event.showComments==true}">
		                                       			<a href="#" class="active" data-toggle="class" onClick="changeStateShowComments('${event.id}')" >
		                                       				<i class="fa fa-check text-success text-active"></i>
		                                       				<i class="fa fa-times text-danger text"></i>
		                                       			</a>
		                                       		</g:if>
		                                       		<g:else>
														<a href="#" data-toggle="class" onClick="changeStateShowComments('${event.id}')" >
															<i class="fa fa-check text-success text-active"></i>
															<i class="fa fa-times text-danger text"></i>
														</a>
		                                       		</g:else>
		                                    	</td>
		                                   </tr>
                           			</g:if>
                           		</g:elseif>
                           		<g:else>
	                               	<tr>
	                                  	<td>
	                                       	<label class="checkbox m-n i-checks">
	                                         	<input type="checkbox" name="eventChecked[]" value="${event.id}" class="which" ><!-- alos can be a newsChecked via the isNews tag -->
	                                         		<i></i>
	                                        	</label>
	                                   	</td>
	                                    	<td style="width:350px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" >${event.title}</td>
	                                     	<td style="width:600px;max-width:800px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;" >${event.description.toString()}</td><!--  .encodeAsRaw() // encodeAsHTML() // decodeHTML() // .substring(0,40) -->
	                                 		<td>${event.startDate.format("yyyy/MM/dd")}</td>
	                                 		<td>${event.endDate.format("yyyy/MM/dd")}</td>
	                                  		<td>
	                                       		<g:if test="${event.enabled==true}">
	                                       			<a href="#" class="active" data-toggle="class" onClick="changeState('${event.id}')" >
	                                       				<i class="fa fa-check text-success text-active"></i>
	                                       				<i class="fa fa-times text-danger text"></i>
	                                       			</a>
	                                       		</g:if>
	                                       		<g:else>
													<a href="#" data-toggle="class" onClick="changeState('${event.id}')" >
														<i class="fa fa-check text-success text-active"></i>
														<i class="fa fa-times text-danger text"></i>
													</a>
	                                       		</g:else>
	                                    	</td>
	                                  		<td>
	                                       		<g:if test="${event.isNews==true}">
	                                       			<a href="#" class="active" data-toggle="class" onClick="changeStateTaggedAs('${event.id}')" >
	                                       				<i class="fa fa-check text-success text-active"></i>
	                                       				<i class="fa fa-times text-danger text"></i>
	                                       			</a>
	                                       		</g:if>
	                                       		<g:else>
													<a href="#" data-toggle="class" onClick="changeStateTaggedAs('${event.id}')" >
														<i class="fa fa-check text-success text-active"></i>
														<i class="fa fa-times text-danger text"></i>
													</a>
	                                       		</g:else>
	                                    	</td>
	                                  		<td>
	                                       		<g:if test="${event.canComment==true}">
	                                       			<a href="#" class="active" data-toggle="class" onClick="changeStateCanComment('${event.id}')" >
	                                       				<i class="fa fa-check text-success text-active"></i>
	                                       				<i class="fa fa-times text-danger text"></i>
	                                       			</a>
	                                       		</g:if>
	                                       		<g:else>
													<a href="#" data-toggle="class" onClick="changeStateCanComment('${event.id}')" >
														<i class="fa fa-check text-success text-active"></i>
														<i class="fa fa-times text-danger text"></i>
													</a>
	                                       		</g:else>
	                                    	</td>
	                                  		<td>
	                                       		<g:if test="${event.showComments==true}">
	                                       			<a href="#" class="active" data-toggle="class" onClick="changeStateShowComments('${event.id}')" >
	                                       				<i class="fa fa-check text-success text-active"></i>
	                                       				<i class="fa fa-times text-danger text"></i>
	                                       			</a>
	                                       		</g:if>
	                                       		<g:else>
													<a href="#" data-toggle="class" onClick="changeStateShowComments('${event.id}')" >
														<i class="fa fa-check text-success text-active"></i>
														<i class="fa fa-times text-danger text"></i>
													</a>
	                                       		</g:else>
	                                    	</td>
	                                   </tr>                           		
                           			</g:else>
                                </g:each>
                      		</tbody>
                  		</table>
					</div>
			</header>
			<footer class="panel-footer">
	         	<div class="row">
		             <div class="col-sm-4 hidden-xs">
		             </div>
            		<div class="col-sm-4 text-center">
	             	</div>
	            	 <div class="col-sm-4 text-right text-center-xs">
	                 	<g:paginate controller="event" action="list" maxsteps="0" next="Next" prev="Prev" total="${eventsCount}" />
	                </div>
	            </div>
			</footer>
		</section>
		</g:if>
		<g:else>
			<div class="alert alert-info">
				<i class="fa fa-info-sign"></i><strong> INFO </strong> It's so boring, there is no saved events ! please add a new one &nbsp;&nbsp; <g:link controller="Event" action="create" class="btn btn-primary btn-sm">New Event</g:link>
			</div>
		</g:else>
		<!-- Bootstrap -->
		<!-- App -->
		<script type="text/javascript" src="${resource(dir:'js',file:'app.v1.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js',file:'app.plugin.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/datatables',file:'jquery.dataTables.min.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/datatables',file:'jquery.csv-0.71.min.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js',file:'socket.io-1.0.6.js')}"></script>
		<script>
			function getChecked(mode){
				var checkedStr = "" ;
				var cpt = 0;
				$(".which").each(function(){
					if($(this).is(":checked")){
						cpt++
						if(cpt==1){
							if(mode==2){checkedStr += "id="+$(this).val();}else{checkedStr = $(this).val();}
						}else{
							if(mode==2){checkedStr += "&id="+$(this).val();}
						}
					}
				});			
				return checkedStr;
			}
			function countChecked(){
				var cpt = 0;
				$(".which").each(function(){
					if($(this).is(':checked')){
					//if($(this).prop('checked')){
					//if($(this).attr('checked')){
						cpt++;
					}
				});
				return cpt;
			}
			function applyAction(){
				var action = $("select#selectAction option:selected").val();
				if(countChecked()>0){
					if( action=="show" || action=="edit" ){
						if(countChecked()==1){
							var whichChecked = getChecked(1);
							window.location.href="${request.contextPath}/event/"+action+"/"+whichChecked ; // show // edit just one event
						}else{
							alert("To select Edit/Show action, you must select one event !");
						}
					}else{
						var whichChecked = getChecked(2);
						window.location.href="${request.contextPath}/event/delete?"+whichChecked ; // delete on or a group of events
					}
				}else{
					alert("You must choose at least one event !");
				}
			}
			function changeState(which){
				if(which>0){
					$.post( "started", { which: which }, function( data ) {
						console.log( "success" );
					}).fail(function() {
						console.log( "error" );
					});
				}
			}
			function changeStateTaggedAs(wich){
				if(which>0){
					$.post( "taggedAs", { which: which }, function( data ) {
						console.log( "success" );
					}).fail(function() {
						console.log( "error" );
					});
				}
			}
			function changeStateCanComment(wich){
				if(which>0){
					$.post( "canComment", { which: which }, function( data ) {
						console.log( "success" );
					}).fail(function() {
						console.log( "error" );
					});
				}
			}
			function changeStateShowComments(wich){
				if(which>0){
					$.post( "showComments", { which: which }, function( data ) {
						console.log( "success" );
					}).fail(function() {
						console.log( "error" );
					});
				}
			}
			/*$( document ).ready(function() {
				$(".which").each(function(){
					$(this).change(function() {
						if($(this).is(':checked')){
							if(countChecked()>1){
								$("select#selectAction option:eq(2)").show(); // delete
							}else{
								$("select#selectAction option:eq(2)").hide();
							}
						}else{
							if(countChecked()>1){
								$("select#selectAction option:eq(2)").show();
							}else{
								$("select#selectAction option:eq(2)").hide();
							}
						}
					});
				});
			});*/

			function renderTable(mode){
				ajaxAction = 'list' ;
				if(mode==1){ajaxAction = 'listN' ;}
				if(mode==2){ajaxAction = 'listE' ;}
				window.location.href='${request.contextPath}/event/'+ajaxAction;
			}
		</script>
	</body>
</html>