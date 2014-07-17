<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<link rel="stylesheet" href="${resource(dir:'js/datatables',file:'datatables.css')}" type="text/css"/>
		<link rel="stylesheet" href="${resource(dir:'css',file:'paginate.css')}" type="text/css"/>
	</head>
	<body>
		<div class="m-b-md">
			<h3 class="m-b-none">Events Management</h3>
		</div>
		<section class="panel panel-default">
		    <header class="panel-heading"> Events List </header>
		    	<div class="row wrapper">
			        <div class="col-sm-5 m-b-xs">
		                 <select class="input-sm form-control input-s-sm inline v-middle" id="selectAction" >
		                     <option value="show" selected class="OptShow" >Show</option>
		                     <option value="edit" class="OptEdit" >Edit</option>
		                     <option value="delete" class="OptDelete" >Delete</option>
		                 </select>
		                 <button class="btn btn-sm btn-default" onClick="applyAction();" id="applyAction" >Apply</button>
			        </div>
			        <div class="col-sm-4 m-b-xs"></div>
                 	<div class="col-sm-3">                 			
                   		<g:form url="[action:'search',controller:'event']" method="POST" >
                    		<div class="input-group">
                       			<input type="text" name="searchField" id="searchField" class="input-sm form-control" placeholder="Search for specific event detail !" >
                             		<span class="input-group-btn">
                              			<button class="btn btn-sm btn-default" type="button">Go!</button>
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
                  		</tr>
						</thead>
                        	<tbody>
                           	<g:each in="${eventsList}" var="event" >
                               	<tr>
                                  	<td>
                                       	<label class="checkbox m-n i-checks">
                                         	<input type="checkbox" name="eventChecked[]" value="${event.id}" class="which" >
                                         		<i></i>
                                        	</label>
                                   	</td>
                                    	<td>${event.title}</td>
                                     	<td>${event.description.substring(0,25)}</td>
                                 		<td>${event.startDate}</td>
                                 		<td>${event.endDate}</td>
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
                                   </tr>
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
		<!-- Bootstrap -->
		<!-- App -->
		<script type="text/javascript" src="${resource(dir:'js',file:'app.v1.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js',file:'app.plugin.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/datatables',file:'jquery.dataTables.min.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/datatables',file:'jquery.csv-0.71.min.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js',file:'socket.io-1.0.6.js')}"></script>
		<script>
			function countChecked(){
				var cpt = 0;
				$("input.which").each(function(){
					if(this.is(":checked")){
						cpt++;
					}
				});
			}
			function applyAction(){
				if(countChecked()>0){
					if( action=="show" || action=="edit" ){
						if(countChecked()==1){
							var action = $("select#selectAction option:selected").val();
							var whichChecked = $("").val()
							window.location.href="${request.contextPath}/event/"+action; // show // edit
						}else{
							alert("To select Edit/Show action, you must select one event !");
						}
					}else{
						var action = $("select#selectAction option:selected").val();
						var whichChecked = $("").val()
						window.location.href="${request.contextPath}/event/"+action; // delete
					}
				}else{
					alert("You must choose at least one event !");
				}
			}
			function changeState(which){
				if(which>0){
					$.post( "started", { which: which }, function( data ) {
						//console.log( "success" );
					}).fail(function() {
						//console.log( "error" );
					});
				}
			}
			$( document ).ready(function() {
				$("input.which").each(function(){				
					$(this).bind("click",function(){
						if(this.is(":checked")){
							if(countChecked()>1){
								$("select#selectAction option:eq(2)").show();
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
			});
		</script>
	</body>
</html>