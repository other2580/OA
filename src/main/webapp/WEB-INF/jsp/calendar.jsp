<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- bootstrap & fontawesome -->
		<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
		<!-- page specific plugin styles -->
		<link rel="stylesheet" href="static/assets/css/jquery-ui.custom.min.css" />
		<link rel="stylesheet" href="static/assets/css/fullcalendar.min.css" />
		<!-- ace styles -->
		<link rel="stylesheet" href="static/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
		<!--[if lte IE 9]>
			<link rel="stylesheet" href="static/assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
		<link rel="stylesheet" href="static/assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="static/assets/css/ace-rtl.min.css" />
		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="static/assets/css/ace-ie.min.css" />
		<![endif]-->
		<!-- inline styles related to this page -->
		<!-- ace settings handler -->
		<script src="static/assets/js/ace-extra.min.js"></script>
		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->
		<!--[if lte IE 8]>
		<script src="static/assets/js/html5shiv.min.js"></script>
		<script src="static/assets/js/respond.min.js"></script>
		<![endif]-->
    
		<div class="main-content-inner">
			<div class="breadcrumbs ace-save-state" id="breadcrumbs">
				<ul class="breadcrumb">
					<li>
						<i class="ace-icon fa fa-home home-icon"></i>
						<a href="#">Home</a>
					</li>
					<li class="active">Calendar</li>
				</ul><!-- /.breadcrumb -->

				<div class="nav-search" id="nav-search">
					<form class="form-search">
						<span class="input-icon">
							<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
							<i class="ace-icon fa fa-search nav-search-icon"></i>
						</span>
					</form>
				</div><!-- /.nav-search -->
			</div>

			<div class="page-content">
				<div class="ace-settings-container" id="ace-settings-container">
					<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
						<i class="ace-icon fa fa-cog bigger-130"></i>
					</div>

					<div class="ace-settings-box clearfix" id="ace-settings-box">
						<div class="pull-left width-50">
							<div class="ace-settings-item">
								<div class="pull-left">
									<select id="skin-colorpicker" class="hide">
										<option data-skin="no-skin" value="#438EB9">#438EB9</option>
										<option data-skin="skin-1" value="#222A2D">#222A2D</option>
										<option data-skin="skin-2" value="#C6487E">#C6487E</option>
										<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
									</select>
								</div>
								<span>&nbsp; Choose Skin</span>
							</div>

							<div class="ace-settings-item">
								<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-navbar" autocomplete="off" />
								<label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
							</div>

							<div class="ace-settings-item">
								<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-sidebar" autocomplete="off" />
								<label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
							</div>

							<div class="ace-settings-item">
								<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-breadcrumbs" autocomplete="off" />
								<label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
							</div>

							<div class="ace-settings-item">
								<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" autocomplete="off" />
								<label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
							</div>

							<div class="ace-settings-item">
								<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-add-container" autocomplete="off" />
								<label class="lbl" for="ace-settings-add-container">
									Inside
									<b>.container</b>
								</label>
							</div>
						</div><!-- /.pull-left -->

						<div class="pull-left width-50">
							<div class="ace-settings-item">
								<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover" autocomplete="off" />
								<label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
							</div>

							<div class="ace-settings-item">
								<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact" autocomplete="off" />
								<label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
							</div>

							<div class="ace-settings-item">
								<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight" autocomplete="off" />
								<label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
							</div>
						</div><!-- /.pull-left -->
					</div><!-- /.ace-settings-box -->
				</div><!-- /.ace-settings-container -->

				<div class="page-header">
					<h1>
						Full Calendar
						<small>
							<i class="ace-icon fa fa-angle-double-right"></i>
							with draggable and editable events
						</small>
					</h1>
				</div><!-- /.page-header -->

				<div class="row">
					<div class="col-xs-12">
						<!-- PAGE CONTENT BEGINS -->
						<div class="row">
							<div class="col-sm-9">
								<div class="space"></div>

								<div id="calendar"></div>
							</div>
						</div>

						<!-- PAGE CONTENT ENDS -->
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.page-content -->
		</div>
		
		
		<!--[if !IE]> -->
		<script src="http://www.jq22.com/jquery/jquery-2.1.1.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
		<script src="static/assets/js/jquery-1.11.3.min.js"></script>
		<![endif]-->
				<script type="text/javascript">
					if('ontouchstart' in document.documentElement) document.write("<script src='static/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
				</script>
		
				<!-- page specific plugin scripts -->
				<script src="static/assets/js/jquery-ui.custom.min.js"></script>
				<script src="static/assets/js/jquery.ui.touch-punch.min.js"></script>
				<script src="static/assets/js/moment.min.js"></script>
				<script src="static/assets/js/fullcalendar.min.js"></script>
				<!--<script src="static/assets/js/bootbox.js"></script>
		
				 ace scripts 
				<script src="static/assets/js/ace-elements.min.js"></script>
				<script src="static/assets/js/ace.min.js"></script>-->
		
				<!-- inline scripts related to this page -->
				<script type="text/javascript">
					jQuery(function($) {
		
		/* initialize the external events
			-----------------------------------------------------------------*/
		
			$('#external-events div.external-event').each(function() {
		
				var eventObject = {
					title: $.trim($(this).text()) // use the element's text as the event title
				};
		
				// store the Event Object in the DOM element so we can get to it later
				$(this).data('eventObject', eventObject);
		
				// make the event draggable using jQuery UI
				$(this).draggable({
					zIndex: 999,
					revert: true,      // will cause the event to go back to its
					revertDuration: 0  //  original position after the drag
				});
				
			});
		
			/* initialize the calendar
			-----------------------------------------------------------------*/
		
			var date = new Date();
			var d = date.getDate();
			var m = date.getMonth();
			var y = date.getFullYear();
		
		
			var calendar = $('#calendar').fullCalendar({
				//isRTL: true,
				//firstDay: 1,// >> change first day of week 
				
				buttonHtml: {
					prev: '<i class="ace-icon fa fa-chevron-left"></i>',
					next: '<i class="ace-icon fa fa-chevron-right"></i>'
				},
			
				header: {
					left: 'prev,next today',
					center: 'title',
					right: 'month,agendaWeek,agendaDay'
				},
				events: [
				  {
					  title: 'All Day Event',
	                  start: '2018-04-12'
				  },
		          {
		              id: 3,
		              title: '给一点颜色',
		              start: '2018-04-16 10:00',
		              color: 'red'
		          },
		          {
	                  id: 5,
	                  title: '使用className:doing',
	                  start: '2018-04-16 16:30',
	                  end: '2018-04-16 17:30',
	                  color: 'green',
	                  className: 'doing'
		          }
				]
				,
				
				/**eventResize: function(event, delta, revertFunc) {
		
					alert(event.title + " end is now " + event.end.format());
		
					if (!confirm("is this okay?")) {
						revertFunc();
					}
		
				},*/
				
				editable: true,
				droppable: true, // this allows things to be dropped onto the calendar !!!
				drop: function(date) { // this function is called when something is dropped
				
					// retrieve the dropped element's stored Event Object
					var originalEventObject = $(this).data('eventObject');
					var $extraEventClass = $(this).attr('data-class');
					
					
					// we need to copy it, so that multiple events don't have a reference to the same object
					var copiedEventObject = $.extend({}, originalEventObject);
					
					// assign it the date that was reported
					copiedEventObject.start = date;
					copiedEventObject.allDay = false;
					if($extraEventClass) copiedEventObject['className'] = [$extraEventClass];
					
					// render the event on the calendar
					// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
					$('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
					
					// is the "remove after drop" checkbox checked?
					if ($('#drop-remove').is(':checked')) {
						// if so, remove the element from the "Draggable Events" list
						$(this).remove();
					}
					
				}
				,
				selectable: true,
				selectHelper: true,
				select: function(start, end, allDay) {
					
					bootbox.prompt("New Event Title:", function(title) {
						if (title !== null) {
							calendar.fullCalendar('renderEvent',
								{
									title: title,
									start: start,
									end: end,
									allDay: allDay,
									className: 'label-info'
								},
								true // make the event "stick"
							);
						}
					});
					
		
					calendar.fullCalendar('unselect');
				}
				,
				eventClick: function(calEvent, jsEvent, view) {
					
		
					//display a modal
					var modal = 
					'<div class="modal fade">\
					  <div class="modal-dialog">\
					   <div class="modal-content">\
						 <div class="modal-body">\
						   <button type="button" class="close" data-dismiss="modal" style="margin-top:-10px;">&times;</button>\
						   <form class="no-margin">\
							  <label>Change event name &nbsp;</label>\
							  <input class="middle" autocomplete="off" type="text" value="' + calEvent.title + '" />\
							 <button type="submit" class="btn btn-sm btn-success"><i class="ace-icon fa fa-check"></i> Save</button>\
						   </form>\
						 </div>\
						 <div class="modal-footer">\
							<button type="button" class="btn btn-sm btn-danger" data-action="delete"><i class="ace-icon fa fa-trash-o"></i> Delete Event</button>\
							<button type="button" class="btn btn-sm" data-dismiss="modal"><i class="ace-icon fa fa-times"></i> Cancel</button>\
						 </div>\
					  </div>\
					 </div>\
					</div>';
				
				
					var modal = $(modal).appendTo('body');
					modal.find('form').on('submit', function(ev){
						ev.preventDefault();
						calEvent.title = $(this).find("input[type=text]").val();
						calendar.fullCalendar('updateEvent', calEvent);
						modal.modal("hide");
					});
					modal.find('button[data-action=delete]').on('click', function() {
						calendar.fullCalendar('removeEvents' , function(ev){
							return (ev._id == calEvent._id);
						})
						modal.modal("hide");
					});
					
					modal.modal('show').on('hidden', function(){
						modal.remove();
					});
		
		
					console.log(calEvent.id+" 123");
					console.log(calEvent.title+" 123");
					console.log(jsEvent+" 123");
					console.log(view+" 123");
		
					// change the border color just for fun
					//$(this).css('border-color', 'red');
		
				}
				
			});
		
		
		})
		</script>