<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<link rel="stylesheet" href="${resource(dir:'js/datepicker',file:'datepicker.css')}" type="text/css" />
		<link rel="stylesheet" href="${resource(dir:'js/slider/',file:'slider.css')}" type="text/css" />
		<link rel="stylesheet" href="${resource(dir:'js/chosen/',file:'chosen.css')}" type="text/css" /> 
	</head>
	<body>
		<div class="m-b-md">
			<h3 class="m-b-none">Event Management</h3>
		</div>
		<section class="panel panel-default">
		    <header class="panel-heading font-bold">New Event </header>
		    <div class="panel-body">
		        <form class="form-horizontal" method="POST" url="[controller:'Event',action:'create']" enctype="multipart/form-data" autocomplete="off" id="eventAdd" name="eventAdd" role="form" onSubmit="javascript:return checkEventForm();" >
		                <input type="hidden" name="description" value="" />
		                <div class="form-group">
		                    <label class="col-sm-2 control-label">Title</label>
		                    <div class="col-sm-10">
		                        <input type="text" class="form-control" name="title" id="title" required >
		                            <span class="help-block m-b-none">Go ahead & pick a nice title for your next event !</span>
		                        </div>
		                    </div>
		                </div>
		                <div class="line line-dashed b-b line-lg pull-in"></div>
		                <div class="form-group">                                                                                                                                                                                                                                                       <label class="col-sm-2 control-label">Started</label>
			                <div class="col-sm-10">
			                    <label class="switch">
			                        <input type="checkbox" id="enabled" name="enabled" checked="true" >
			                            <span></span>
			                        </label>
			                    </div>
			                </div>
			            </div>
		                <div class="line line-dashed b-b line-lg pull-in"></div>
		                <div class="form-group">
		                    <label class="col-sm-2 control-label">Start Date</label>
		                    <div class="col-sm-10">
		                        <input class="input-sm input-s datepicker-input form-control" size="16" id="startDate" name="startDate" type="text" value="2017/07/17" data-date-format="yyyy/mm/dd" required >
		                    </div>
		                </div>
		                <br><br>
		                <div class="line line-dashed b-b line-lg pull-in"></div>
		                <div class="form-group">
		                	<label class="col-sm-2 control-label">End Date</label>
		                	<div class="col-sm-10">
		                    	<input class="input-sm input-s datepicker-input form-control" size="16" id="endDate" name="endDate" type="text" value="2017/07/17" data-date-format="yyyy/mm/dd" required >
		                    </div>
		                </div>
		                <br><br>
						<div class="line line-dashed b-b line-lg pull-in"></div>
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
		                                    </li>
		                                    <li>
		                                        <a data-edit="fontName Courier New" style="font-family:'Courier New'">Courier New</a>
		                                    </li>
		                                    <li>
		                                        <a data-edit="fontName Comic Sans MS" style="font-family:'Comic Sans MS'">Comic Sans MS</a>
		                                    </li>
		                                    <li>
		                                        <a data-edit="fontName Helvetica" style="font-family:'Helvetica'">Helvetica</a>
		                                    </li>
		                                    <li>
		                                        <a data-edit="fontName Impact" style="font-family:'Impact'">Impact</a>
		                                    </li>
		                                    <li>
		                                        <a data-edit="fontName Lucida Grande" style="font-family:'Lucida Grande'">Lucida Grande</a>
		                                    </li>
		                                    <li>
		                                        <a data-edit="fontName Lucida Sans" style="font-family:'Lucida Sans'">Lucida Sans</a>
		                                    </li>
		                                    <li>
		                                        <a data-edit="fontName Tahoma" style="font-family:'Tahoma'">Tahoma</a>
		                                    </li>
		                                    <li>
		                                        <a data-edit="fontName Times" style="font-family:'Times'">Times</a>
		                                    </li>
		                                    <li>
		                                        <a data-edit="fontName Times New Roman" style="font-family:'Times New Roman'">Times New Roman</a>
		                                    </li>
		                                    <li>
		                                        <a data-edit="fontName Verdana" style="font-family:'Verdana'">Verdana</a>
		                                    </li>
		                                </ul>
		                            </div>
		                            <div class="btn-group">
		                                <a class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" title="" data-original-title="Font Size">
		                                    <i class="fa fa-text-height"></i>&nbsp;
		                                    <b class="caret"></b>
		                                </a>
		                                <ul class="dropdown-menu">
		                                    <li>
		                                        <a data-edit="fontSize 5" style="font-size:24px">Huge</a>
		                                    </li>
		                                    <li>
		                                        <a data-edit="fontSize 3" style="font-size:18px">Normal</a>
		                                    </li>
		                                    <li>
		                                        <a data-edit="fontSize 1" style="font-size:14px">Small</a>
		                                    </li>
		                                </ul>
		                            </div>
		                            <div class="btn-group">
		                                <a class="btn btn-default btn-sm" data-edit="bold" title="" data-original-title="Bold (Ctrl/Cmd+B)">
		                                    <i class="fa fa-bold"></i>
		                                </a>
		                                <a class="btn btn-default btn-sm" data-edit="italic" title="" data-original-title="Italic (Ctrl/Cmd+I)">
		                                    <i class="fa fa-italic"></i>
		                                </a>
		                                <a class="btn btn-default btn-sm" data-edit="strikethrough" title="" data-original-title="Strikethrough">
		                                    <i class="fa fa-strikethrough"></i>
		                                </a>
		                                <a class="btn btn-default btn-sm" data-edit="underline" title="" data-original-title="Underline (Ctrl/Cmd+U)">
		                                    <i class="fa fa-underline"></i>
		                                </a>
		                            </div>
		                            <div class="btn-group">
		                                <a class="btn btn-default btn-sm" data-edit="insertunorderedlist" title="" data-original-title="Bullet list">
		                                    <i class="fa fa-list-ul"></i>
		                                </a>
		                                <a class="btn btn-default btn-sm" data-edit="insertorderedlist" title="" data-original-title="Number list">
		                                    <i class="fa fa-list-ol"></i>
		                                </a>
		                                <a class="btn btn-default btn-sm" data-edit="outdent" title="" data-original-title="Reduce indent (Shift+Tab)">
		                                    <i class="fa fa-dedent"></i>
		                                </a>
		                                <a class="btn btn-default btn-sm" data-edit="indent" title="" data-original-title="Indent (Tab)">
		                                    <i class="fa fa-indent"></i>
		                                </a>
		                            </div>
		                            <div class="btn-group">
		                                <a class="btn btn-default btn-sm" data-edit="justifyleft" title="" data-original-title="Align Left (Ctrl/Cmd+L)">
		                                    <i class="fa fa-align-left"></i>
		                                </a>
		                                <a class="btn btn-default btn-sm" data-edit="justifycenter" title="" data-original-title="Center (Ctrl/Cmd+E)">
		                                    <i class="fa fa-align-center"></i>
		                                </a>
		                                <a class="btn btn-default btn-sm" data-edit="justifyright" title="" data-original-title="Align Right (Ctrl/Cmd+R)">
		                                    <i class="fa fa-align-right"></i>
		                                </a>
		                                <a class="btn btn-default btn-sm" data-edit="justifyfull" title="" data-original-title="Justify (Ctrl/Cmd+J)">
		                                    <i class="fa fa-align-justify"></i>
		                                </a>
		                            </div>
		                            <div class="btn-group">
		                                <a class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" title="" data-original-title="Hyperlink">
		                                    <i class="fa fa-link"></i>
		                                </a>
		                                <div class="dropdown-menu">
		                                    <div class="input-group m-l-xs m-r-xs">
		                                        <input class="form-control input-sm" placeholder="URL" type="text" data-edit="createLink">
		                                            <div class="input-group-btn">
		                                                <button class="btn btn-default btn-sm" type="button">Add</button>
		                                            </div>
		                                        </div>
		                                    </div>
		                                    <a class="btn btn-default btn-sm" data-edit="unlink" title="" data-original-title="Remove Hyperlink">
		                                        <i class="fa fa-cut"></i>
		                                    </a>
		                                </div>
		                                <div class="btn-group hide">
		                                    <a class="btn btn-default btn-sm" title="" id="pictureBtn" data-original-title="Insert picture (or just drag &amp; drop)">
		                                        <i class="fa fa-picture-o"></i>
		                                    </a>
		                                    <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" style="opacity: 0; position: absolute; top: 0px; left: 0px; width: 0px; height: 0px;">
		                                    </div>
		                                    <div class="btn-group">
		                                        <a class="btn btn-default btn-sm" data-edit="undo" title="" data-original-title="Undo (Ctrl/Cmd+Z)">
		                                            <i class="fa fa-undo"></i>
		                                        </a>
		                                        <a class="btn btn-default btn-sm" data-edit="redo" title="" data-original-title="Redo (Ctrl/Cmd+Y)">
		                                            <i class="fa fa-repeat"></i>
		                                        </a>
		                                    </div>
		                                </div>
		                           <div id="description" class="form-control" style="overflow:scroll;height:350px;max-height:600px" contenteditable="true" >Your description, places to visit and all your event's details is Here !!</div><br>
		                       </div>
		                  </div>
		                  <br><br>
		                  <div class="line line-dashed b-b line-lg pull-in"></div>
		                  <!--<div class="form-group">
		                      <label class="col-sm-2 control-label">Event's Cover</label>
		                      <div class="col-sm-10">
		                          <div class="dropfile visible-lg">
		                              <small>Drag and Drop file here</small>
		                          </div><br>
		                      </div>
		                  </div>
		                  <br><br>
		                  <div class="line line-dashed b-b line-lg pull-in"></div>-->
							<div class="form-group">
								<label class="col-sm-2 control-label">Event's Cover</label>
								<div class="col-sm-10">
									<input type="file" class="filestyle" data-icon="false" data-classbutton="btn btn-primary" data-classinput="form-control inline v-middle input-s" id="filestyle-0" style="position: fixed; left: -500px;" name="cover" id="cover" value="" >
							    </div>
							</div>
						  <br><br>
		                  <div class="line line-dashed b-b line-lg pull-in"></div>
		                  <div class="form-group">
		                      <div class="col-sm-4 col-sm-offset-2">
		                          <button type="reset" class="btn btn-default" id="res" >Cancel</button>
		                          <button type="submit" class="btn btn-primary" id="sub" >Save</button>
		                      </div>
		                  </div>
		                  <br><br><br>
					</form>	
		       	</div>
		   	</section>
		<!-- Bootstrap -->
		<!-- App -->
			<script type="text/javascript" src="${resource(dir:'js',file:'app.v1.js')}"></script>
		<!-- datepicker -->
			<script type="text/javascript" src="${resource(dir:'js/datepicker',file:'bootstrap-datepicker.js')}"></script>
		<!-- slider -->
			<script type="text/javascript" src="${resource(dir:'js/slider',file:'bootstrap-slider.js')}"></script>
		<!-- file input -->
			<script type="text/javascript" src="${resource(dir:'js/file-input',file:'bootstrap-filestyle.min.js')}"></script>
		<!-- wysiwyg -->
			<script type="text/javascript" src="${resource(dir:'js/wysiwyg',file:'jquery.hotkeys.js')}"></script>
			<script type="text/javascript" src="${resource(dir:'js/wysiwyg',file:'bootstrap-wysiwyg.js')}"></script>
			<script type="text/javascript" src="${resource(dir:'js/wysiwyg',file:'demo.js')}"></script>
		<!-- chosen -->
			<script type="text/javascript" src="${resource(dir:'js/chosen',file:'chosen.jquery.min.js')}"></script>
		<!-- global -->
		<script type="text/javascript" src="${resource(dir:'js',file:'app.plugin.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js',file:'socket.io-1.0.6.js')}"></script>
		<script>
			var dates = {
			    convert:function(d) {
			        // Converts the date in d to a date-object. The input can be:
			        //   a date object: returned without modification
			        //  an array      : Interpreted as [year,month,day]. NOTE: month is 0-11.
			        //   a number     : Interpreted as number of milliseconds
			        //                  since 1 Jan 1970 (a timestamp) 
			        //   a string     : Any format supported by the javascript engine, like
			        //                  "YYYY/MM/DD", "MM/DD/YYYY", "Jan 31 2009" etc.
			        //  an object     : Interpreted as an object with year, month and date
			        //                  attributes.  **NOTE** month is 0-11.
			        return (
			            d.constructor === Date ? d :
			            d.constructor === Array ? new Date(d[0],d[1],d[2]) :
			            d.constructor === Number ? new Date(d) :
			            d.constructor === String ? new Date(d) :
			            typeof d === "object" ? new Date(d.year,d.month,d.date) :
			            NaN
			        );
			    },
			    compare:function(a,b) {
			        // Compare two dates (could be of any type supported by the convert
			        // function above) and returns:
			        //  -1 : if a < b
			        //   0 : if a = b
			        //   1 : if a > b
			        // NaN : if a or b is an illegal date
			        // NOTE: The code inside isFinite does an assignment (=).
			        return (
			            isFinite(a=this.convert(a).valueOf()) &&
			            isFinite(b=this.convert(b).valueOf()) ?
			            (a>b)-(a<b) :
			            NaN
			        );
			    },
			    inRange:function(d,start,end) {
			        // Checks if date in d is between dates in start and end.
			        // Returns a boolean or NaN:
			        //    true  : if d is between start and end (inclusive)
			        //    false : if d is before start or after end
			        //    NaN   : if one or more of the dates is illegal.
			        // NOTE: The code inside isFinite does an assignment (=).
			       return (
			            isFinite(d=this.convert(d).valueOf()) &&
			            isFinite(start=this.convert(start).valueOf()) &&
			            isFinite(end=this.convert(end).valueOf()) ?
			            start <= d && d <= end :
			            NaN
			        );
			    }
			}
			function getToday(){
				var today = new Date();
				var dd = today.getDate();
				var mm = today.getMonth()+1; //January is 0!
				var yyyy = today.getFullYear();
				if(dd<10) {dd='0'+dd}
				if(mm<10){mm='0'+mm}
				return yyyy+"/"+mm+"/"+dd;
			}
			function checkEventForm(){
				var description = $("div#description").html();
				var startDate = $("input#startDate").val();
				var endDate = $("input#endDate").val();
				if(!$.trim(startDate).length){
					alert("You must choose the starting date of this event !");
					return false;
				}
				if(!$.trim(endDate).length){
					alert("You must choose the ending date of this event !");
					return false;
				}
				today = dates.convert(getToday()); // string to date
				//alert(today);
				startDate = dates.convert(startDate); // string to date
				//alert(startDate);
				endDate = dates.convert(endDate); // string to date
				//alert(endDate);
				if(dates.compare(startDate,today)==-1){
					alert("You must choose a starting date equal or higher than "+today+" !");
					return false;
				}
				if(dates.compare(endDate,today)==-1){
					alert("You must choose an ending date equal or higher than "+today+" !");
					return false;
				}
				if(dates.compare(endDate,startDate)==-1){
					alert("You must choose an ending date equals or higher then the starting date !");
					return false;
				}
				if(!$.trim(description).length){
					alert("You must write the venet description !");
					return false;
				}else{
					$("input[name='description']").val(description);
				}
			}
			$(document).ready( function() {
				$('input#startDate,input#endDate').each(function(){$(this).val(getToday());});
			   	/*$('button#sub').click(function( event ) {
			    	event.preventDefault();
			    });*/
			});
			</script>
	</body>
</html>