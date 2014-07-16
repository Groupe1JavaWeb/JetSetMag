<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<link rel="stylesheet" href="${resource(dir:'js/datatables',file:'datatables.css')}" type="text/css"/>
		<link rel="stylesheet" href="${resource(dir:'css',file:'paginate.css')}" type="text/css"/>
	</head>
	<body>
		<div class="m-b-md">
			<h3 class="m-b-none">Gestion des utilisateurs</h3>
		</div>
		<section class="panel panel-default">
		    <header class="panel-heading"> Liste Utilisateurs </header>
		    	<div class="row wrapper">
			        <div class="col-sm-5 m-b-xs">
		                 <select class="input-sm form-control input-s-sm inline v-middle" id="selectAction" >
		                     <option value="show" selected >Show</option>
		                     <option value="edit">Edit</option>
		                     <option value="delete">Delete</option>
		                 </select>
		                 <button class="btn btn-sm btn-default" onClick="applyAction();" style="display:none;" id="applyAction" >Apply</button>
			        </div>
			        <div class="col-sm-4 m-b-xs"></div>
                 	<div class="col-sm-3">                 			
                   		<g:form url="[action:'search',controller:'home']" method="POST" >
                    		<div class="input-group">
                       			<input type="text" name="searchField" id="searchField" class="input-sm form-control" placeholder="Search for specific user detail !" >
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
                      		<g:sortableColumn property="username" title="Username" />
                    		<g:sortableColumn property="lastName" title="Last Name" />
                       		<g:sortableColumn property="firstName" title="First Name" />
                        	<g:sortableColumn property="email" title="Email" />
                			<g:sortableColumn property="enabled" title="Enabled" />
                  		</tr>
						</thead>
                        	<tbody>
                           	<g:each in="${usersList}" var="user" >
                               	<tr>
                                  	<td>
                                       	<label class="checkbox m-n i-checks">
                                         	<input type="checkbox" name="userChecked[]" value="${user.id}" class="who" >
                                         		<i></i>
                                        	</label>
                                   	</td>
                                    	<td>${user.username}</td>
                                     	<td>${user.lastName}</td>
                                 		<td>${user.firstName}</td>
                                 		<td>${user.email}</td>
                                  		<td>
                                       		<g:if test="${user.enabled==true}">
                                       			<a href="#" class="active" data-toggle="class" onClick="changeState('${user.id}')" >
                                       				<i class="fa fa-check text-success text-active"></i>
                                       				<i class="fa fa-times text-danger text"></i>
                                       			</a>
                                       		</g:if>
                                       		<g:else>
												<a href="#" data-toggle="class" onClick="changeState('${user.id}')" >
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
		                 <!--<select class="input-sm form-control input-s-sm inline v-middle" id="selectAction" style="display:none;" >
		                     <option value="show" selected >Show</option>
		                     <option value="edit">Edit</option>
		                     <option value="delete">Delete</option>
		                 </select>
		                 <button class="btn btn-sm btn-default" onClick="applyAction();">Apply</button>-->
		             </div>
            		<div class="col-sm-4 text-center">
	             	</div>
	            	 <div class="col-sm-4 text-right text-center-xs">
	                 	<g:paginate controller="user" action="list" maxsteps="0" next="Next" prev="Prev" total="${usersCount}" />
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
		function applyAction(){
			var action = $("select#selectAction option:selected").val();
			window.location.href="${request.contextPath}/user/"+action;			
		}
		function changeState(who){
			if(who>0){
				$.post( "changeState", { who: who }, function( data ) {
					console.log( "success" );
				}).fail(function() {
					console.log( "error" );
				});
			}
		}
		$( document ).ready(function() {
			/*$("input.who").each(function(){				
				$(this).bind("click",function(){
					if(this.is(":checked")){
						$("button#applyAction").show();
					}
				});
			});*/
		});
	</script>
	</body>
</html>