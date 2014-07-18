<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<link rel="stylesheet" href="${resource(dir:'js/datatables',file:'datatables.css')}" type="text/css"/>
		<link rel="stylesheet" href="${resource(dir:'css',file:'paginate.css')}" type="text/css"/>
	</head>
	<body>
		<div class="m-b-md">
			<h3 class="m-b-none">Users Management</h3>
		</div>
		<g:if test="${usersCount>0}" >
		<section class="panel panel-default">
		    <header class="panel-heading"> Users List </header>
		    	<div class="row wrapper">
			        <div class="col-sm-5 m-b-xs">
		                 <select class="input-sm form-control input-s-sm inline v-middle" id="selectAction" >
		                     <option value="show" selected class="OptShow" >Show</option>
		                     <option value="edit" class="OptEdit" >Edit</option>
		                     <option value="delete" class="OptDelete" >Delete</option>
		                 </select>
		                 <button class="btn btn-sm btn-default" onClick="applyAction();" id="applyAction" >Apply</button>
		                 <!--<g:link class="btn btn-info btn-sm" controller='User' action='create' >New User</g:link>-->
			        </div>
			        <div class="col-sm-4 m-b-xs"></div>
                 	<div class="col-sm-3">                 			
                   		<g:form url="[action:'search',controller:'User']" method="POST" >
                    		<div class="input-group">
                       			<input type="text" name="searchField" id="searchField" class="input-sm form-control" placeholder="Search for specific user detail !" >
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
                      		<g:sortableColumn property="username" title="Username" />
                    		<g:sortableColumn property="lastName" title="Last Name" />
                       		<g:sortableColumn property="firstName" title="First Name" />
                        	<g:sortableColumn property="email" title="Email" />
                        	<g:sortableColumn property="role" title="Role" />
                			<g:sortableColumn property="enabled" title="Enabled" />
                			<g:sortableColumn property="accountExpired" title="Account Expired" />
                			<g:sortableColumn property="accountLocked" title="Account Locked" />
                			<g:sortableColumn property="passwordExpired" title="Password Expired" />
                  		</tr>
						</thead>
                        	<tbody>
                           	<g:each in="${usersList}" var="user" >
                           		<g:if test="${ user.getAuthorities().id[0]>session.currentUser.getAuthorities().id[0] && user.id!=session.currentUser.id }" >
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
	                                 			<g:if test="${user.getAuthorities().authority[0]=='ROLE_SUPERADMIN'}" >
	                                 				<span class="label bg-primary">Super</span>
	                                 			</g:if>
	                                 			<g:elseif test="${user.getAuthorities().authority[0]=='ROLE_ADMIN'}" >
	                                 				<span class="label bg-success">Admin</span>
	                                 			</g:elseif>
	                                 			<g:elseif test="${user.getAuthorities().authority[0]=='ROLE_MEMBER'}" >
	                                 				<span class="label bg-info">Member</span>
	                                 			</g:elseif>
	                                 			<g:else test="${user.getAuthorities().authority[0]=='ROLE_USER'}" >
	                                 				<span class="label bg-warning">Guest</span>
	                                 			</g:else>
													 
	                                 		</td>
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
	                                  		<td>
	                                       		<g:if test="${user.accountExpired==true}">
	                                       			<a href="#" class="active" data-toggle="class" onClick="changeAccountExpiredState('${user.id}')" >
	                                       				<i class="fa fa-check text-success text-active"></i>
	                                       				<i class="fa fa-times text-danger text"></i>
	                                       			</a>
	                                       		</g:if>
	                                       		<g:else>
													<a href="#" data-toggle="class" onClick="changeAccountExpiredState('${user.id}')" >
														<i class="fa fa-check text-success text-active"></i>
														<i class="fa fa-times text-danger text"></i>
													</a>
	                                       		</g:else>
	                                    	</td>
	                                  		<td>
	                                       		<g:if test="${user.accountLocked==true}">
	                                       			<a href="#" class="active" data-toggle="class" onClick="changeAccountLockedState('${user.id}')" >
	                                       				<i class="fa fa-check text-success text-active"></i>
	                                       				<i class="fa fa-times text-danger text"></i>
	                                       			</a>
	                                       		</g:if>
	                                       		<g:else>
													<a href="#" data-toggle="class" onClick="changeAccountLockedState('${user.id}')" >
														<i class="fa fa-check text-success text-active"></i>
														<i class="fa fa-times text-danger text"></i>
													</a>
	                                       		</g:else>
	                                    	</td>
	                                  		<td>
	                                       		<g:if test="${user.passwordExpired==true}">
	                                       			<a href="#" class="active" data-toggle="class" onClick="changePasswordExpiredState('${user.id}')" >
	                                       				<i class="fa fa-check text-success text-active"></i>
	                                       				<i class="fa fa-times text-danger text"></i>
	                                       			</a>
	                                       		</g:if>
	                                       		<g:else>
													<a href="#" data-toggle="class" onClick="changePasswordExpiredState('${user.id}')" >
														<i class="fa fa-check text-success text-active"></i>
														<i class="fa fa-times text-danger text"></i>
													</a>
	                                       		</g:else>
	                                    	</td>
	                                   </tr>
                                   </g:if>
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
		</g:if>
		<g:else>
			<div class="alert alert-warning">
				<i class="fa fa-info-sign"></i><strong> INFO </strong> Everyone is missing !
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
				$(".who").each(function(){
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
				$(".who").each(function(){
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
							var whoChecked = getChecked(1);
							window.location.href="${request.contextPath}/user/"+action+"?"+whoChecked ; // show // edit just one user
						}else{
							alert("To select Edit/Show action, you must select one user !");
						}
					}else{
						var whoChecked = getChecked(2);
						window.location.href="${request.contextPath}/user/delete?"+whoChecked ; // delete on or a group of users
					}
				}else{
					alert("You must choose at least one user !");
				}
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
			function changeAccountLockedState(who){
				if(who>0){
					$.post( "changeAccountLockedState", { who: who }, function( data ) {
						console.log( "success" );
					}).fail(function() {
						console.log( "error" );
					});
				}
			}
			function changeAccountExpiredState(who){
				if(who>0){
					$.post( "changeAccountExpiredState", { who: who }, function( data ) {
						console.log( "success" );
					}).fail(function() {
						console.log( "error" );
					});
				}
			}
			function changePasswordExpiredState(who){
				if(who>0){
					$.post( "changePasswordExpiredState", { who: who }, function( data ) {
						console.log( "success" );
					}).fail(function() {
						console.log( "error" );
					});
				}
			}
			/*$( document ).ready(function() {
				$("input.who").each(function(){				
					$(this).change(function() {
						if($(this).is(':checked')){
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
			});*/
		</script>
	</body>
</html>