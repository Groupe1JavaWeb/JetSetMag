<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<link rel="stylesheet" href="${resource(dir:'js/datatables',file:'datatables.css')}" type="text/css"/>
	</head>
	<body>
		<div class="m-b-md">
			<h3 class="m-b-none">La liste des utlisateurs</h3>
		</div>
		<section class="panel panel-default">
		    <header class="panel-heading"> Utilisateurs </header>
		    	<div class="row wrapper">
			        <div class="col-sm-5 m-b-xs">
			            <select class="input-sm form-control input-s-sm inline v-middle">
			                <option value="0">Bulk action</option>
			                <option value="1">Delete selected</option>
			                <option value="2">Bulk edit</option>
			                <option value="3">Export</option>
			            </select>
			            <button class="btn btn-sm btn-default">Apply</button>
			        </div>
			        <div class="col-sm-4 m-b-xs"></div>
                   	<div class="col-sm-3">
                       	<div class="input-group">
                          		<input type="text" class="input-sm form-control" placeholder="Search">
                               <span class="input-group-btn">
                                   <button class="btn btn-sm btn-default" type="button">Go!</button>
                               </span>
                           </div>
                       </div>
                   </div>
                   <div class="table-responsive">
                       <table class="table table-striped b-t b-light">
                       	<thead>
                       	<tr>			                                        
							<th style="width:20px;">
								<label class="checkbox m-n i-checks">
									<input type="checkbox">
                               		<i></i>
                            	</label>
                        	</th>
                      		<g:sortableColumn property="username" title="Username" />
                    		<g:sortableColumn property="lastName" title="Last Name" />
                       		<g:sortableColumn property="firstName" title="First Name" />
                        	<g:sortableColumn property="email" title="Email" />
                			<g:sortableColumn property="active" title="Status" />
                  		</tr>
						</thead>
                        	<tbody>
                           	<g:each in="${usersList}" var="user" >
                               	<tr>
                                  	<td>
                                       	<label class="checkbox m-n i-checks">
                                         	<input type="checkbox" name="userChecked[]" value="${user.id}" >
                                         		<i></i>
                                        	</label>
                                   	</td>
                                    	<td>${user.username}</td>
                                     	<td>${user.lastName}</td>
                                 		<td>${user.firstName}</td>
                                 		<td>${user.email}</td>
                                  		<td>
                                       		<g:if test="${user.active==true}">
                                       			<a href="#" class="active" data-toggle="class">
                                       				<i class="fa fa-check text-success text-active"></i>
                                       				<i class="fa fa-times text-danger text"></i>
                                       			</a>
                                       		</g:if>
                                       		<g:else>
												<a href="#" data-toggle="class">
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
		                 <select class="input-sm form-control input-s-sm inline v-middle">
		                     <option value="0">Bulk action</option>
		                     <option value="1">Delete selected</option>
		                     <option value="2">Bulk edit</option>
		                     <option value="3">Export</option>
		                 </select>
		                 <button class="btn btn-sm btn-default">Apply</button>
		             </div>
            		<div class="col-sm-4 text-center">
	             	</div>
	            	 <div class="col-sm-4 text-right text-center-xs">
	                 <g:paginate class="pagination pagination-sm m-t-none m-b-none" controller="user" action="list" maxsteps="0" next="&gt;&gt;" prev="&lt;&lt;" total="${usersCount}" />
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
	</body>
</html>