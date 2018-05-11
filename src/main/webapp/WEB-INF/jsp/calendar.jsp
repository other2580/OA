<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- bootstrap & fontawesome -->
		<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
		<!-- page specific plugin styles -->
		<link rel="stylesheet" href="static/assets/css/jquery-ui.custom.min.css" />
		<link rel="stylesheet" href="static/assets/css/fullcalendar.min.css" />
		<!-- ace styles -->
		<!--<link rel="stylesheet" href="static/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
		[if lte IE 9]>
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
		
		<script type="text/javascript">
			$(function(){
				$(".time").datetimepicker({
					format: "yyyy-mm-dd hh:ii",	//日期格式
					autoclose:true,     	//选择后自动关闭
					startDate:new Date()
				});
			});
		</script>         
	    
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
								<input type="hidden" value="" id="userId"/>
								<div class="space"></div>

								<div id="calendar"></div>
							</div>
							
							<div class="col-sm-3">
								<div class="widget-box transparent">
									<div class="widget-header">
										<h4>Draggable events</h4>
									</div>

									<div class="widget-body">
										<div class="widget-main no-padding">
											<div id="external-events">
												<div class="external-event label-grey" data-class="label-grey">
													<i class="ace-icon fa fa-arrows"></i>
													回家陪老婆
												</div>

												<div class="external-event label-success" data-class="label-success">
													<i class="ace-icon fa fa-arrows"></i>
													一个重要的会议
												</div>

												<div class="external-event label-danger" data-class="label-danger">
													<i class="ace-icon fa fa-arrows"></i>
													下午三点飞伦敦
												</div>

												<div class="external-event label-purple" data-class="label-purple">
													<i class="ace-icon fa fa-arrows"></i>
													提交会议方案
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							
						</div>

						<!-- PAGE CONTENT ENDS -->
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.page-content -->
		</div>
		
		<!-- 模态框显示当前日期的所有日程 -->
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">我的日程</h4>
		      </div>
		      <form class="form-horizontal" action="addActivity" method="post">
		      	<div class="modal-body">
				  <div class="form-group">
				    <label for="inputTitle" class="col-sm-2 control-label">标题</label>
				    <div class="col-sm-10">
				      <input type="text" name="title" size="24" placeholder="下午有个会议">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputTitle" class="col-sm-2 control-label">地点</label>
				    <div class="col-sm-10">
				      <input type="text" name="location" size="24" placeholder="广州广力科技有限公司">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputStars" class="col-sm-2 control-label">开始时间</label>
				    <div class="col-sm-10">
					    <input size="24" name="startTime" type="text" value="" class="time">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputEnd" class="col-sm-2 control-label">结束时间</label>
				    <div class="col-sm-10">
				      <input size="24" name="endTime" type="text" value="" class="time">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputConent" class="col-sm-2 control-label">会议内容</label>
				    <div class="col-sm-10">
				      <textarea class="form-control" rows="5" name="description"></textarea>
				    </div>
				  </div>
			    </div>
			    <div class="modal-footer">
			      <button type="submit" class="btn btn-primary">Save</button>
			      <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			    </div>
			  </form>
		    </div>
		  </div>
		</div>
		
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
		
			Date.prototype.Format = function(format){
	            var o = {
	                "M+" : this.getMonth()+1, //month
	                "d+" : this.getDate(), //day
	                "h+" : this.getHours(), //hour
	                "m+" : this.getMinutes(), //minute
	                "s+" : this.getSeconds(), //second
	                "q+" : Math.floor((this.getMonth()+3)/3), 
	                "S" : this.getMilliseconds() //millisecond
	            };
	            if(/(y+)/.test(format)) {
	                format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
	            }
	            for(var k in o) {
	                if(new RegExp("("+ k +")").test(format)) {
	                    format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
	                }
	            }
	            return format;
	        };
	        //将数据库的时间戳转成 *年*月*日 字符串
	        function getDate(DBTime){
	            var date = new Date(DBTime);
	            var year = date.getFullYear();
	            var month = date.getMonth()+1;
	            var day = date.getDate();
	            var dateStr;
	            if(month<10&&day<10){
	                dateStr = year+"-0"+month+"-0"+day;
	            }else if(month<10&&day>=10){
	                dateStr = year+"-0"+month+"-"+day;
	            }else if(month>=10&&day<10){
	                dateStr = year+"-"+month+"-0"+day;
	            }else if(month>=10&&day>=10){
	                dateStr = year+"-"+month+"-"+day;
	            }
	            return dateStr;
	        }
	        //将数据库的时间戳转成 *时*分 字符串
	        function getTime(DBTime){
	            var time = DBTime.substring(0,2)+"-"+DBTime.substring(3,5);
	            return time;
	        }
		
			var calendar = $('#calendar').fullCalendar({
				//isRTL: true,
				//firstDay: 1,// >> change first day of week 
				
				aspectRatio: 1.85,
				
				buttonHtml: {
					prev: '<i class="ace-icon fa fa-chevron-left"></i>',
					next: '<i class="ace-icon fa fa-chevron-right"></i>'
				},
			
				header: {
					left: 'prev,next today',
					center: 'title',
					right: 'month,agendaWeek,agendaDay',
				},
				//日程数据
                events: function (start, end, timezone, callback) {
                    var date = new Date();
                    var nowDate = date.Format("yyyyMMdd");
                    var nowTime = date.Format("hhmmss");
                    $.ajax({//
                        url: 'activity',
                        dataType: 'json',
                        type: 'post',
                        success: function (result) { // 获取当前月的数据
                        	$("#userId").val(result.userId);
                            var events = [];
                            if (result.data != null) {//result.data其实就是从后台返回前台的一个活动list，
                                var len = result.data.length;
                                var list = result.data;
                                for (var i = 0; i < len; i++) {
                                	var alist=list[i].activity;
                                    var startDate = getDate(alist.startTime);//通过getDate方法将日期格式进行转化
                                    var ccDate = startDate.replace(/\-/g, "");//去掉日期格式中的“-”
                                    var actEndDate=getDate(alist.endTimeLong);
                                    var userId=alist.employee.id;//创建者id
                                    var endTime = getTime(alist.endTimeInfo);//通过getTime方法将时间格式进行转化
                                    var ccTime = endTime.replace(/\-/g, "");//去掉时间格式中的“-”
                                    if ((ccDate > nowDate || (ccDate == nowDate && ccTime > nowTime))) {
                                    	if(userId==result.userId){  //${loginUser.id}
                                    		events.push({
                                                id: alist.id,//这里我是将活动id作为fullcalendar中event事件的Id
                                                title: alist.title,//title我显示的是活动的名称
                                                start: startDate,//start表示这个event事件放在哪个日期框中
                                                end:actEndDate,	
                                                color: 'green'//设置event的背景颜色，若该活动还没开始且该活动已经删除则显示为红色
                                            });
                                    	}else{
                                    		events.push({
                                                id: alist.id,//这里我是将活动id作为fullcalendar中event事件的Id
                                                title: alist.title,//title我显示的是活动的名称
                                                start: startDate,//start表示这个event事件放在哪个日期框中
                                                end:actEndDate,	
                                                color: '#ff9f2c'//设置event的背景颜色，若该活动还没开始且该活动已经删除则显示为红色
                                            });
                                    	}
                                    } 
                                    else {
                                        events.push({
                                            id: alist.id,
                                            title: alist.title,
                                            start: startDate,
                                            end:actEndDate,	
                                            color: 'gray'//若该活动已经结束则显示为灰色
                                        });
                                    }
                                }
                            }
                            callback(events);
                            
                        }
                    });
                },
				
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
					//我的日程模态框
					$("#myModal").modal('show');
				}
				,
				eventClick: function(calEvent, jsEvent, view) {
					var userId = $("#userId").val();
					console.log(calEvent.id+" 123");
					// 调用Ajax
					$.ajax({
						type: "get",
						url: "activityById",
						data: {"activityId":calEvent.id},
						dataType: "json",
						success: function(json){
							//判断该日程您是参与者还是创建者
							console.log(json.employee.id+" 123");
							if(json.employee.id == userId){
								$("#title").val(json.title);
								$("#address").val(json.location);
								$("#startTime").val(json.startTimeLong);
								$("#endTime").val(json.endTimeLong);
								$("#description").text(json.description);
								$("#hiddenId").val(json.id);
								$("#myTime").modal('show');
								$("#aa").attr("href","delActivity?id="+json.id+"");
							}else{
								var modal = 
									'<div class="modal fade">\
									   <div class="modal-dialog">\
									     <div class="modal-content">\
								            <div class="modal-body">\
								                <form class="form-horizontal" action="" method="post">\
								                    <div class="form-group" style="text-align:center;">\
								                        <label>'+json.title+'</label>\
								                    </div>\
								                    <div class="form-group" style="margin-left: 10px;">\
											   	  	  <label for="exampleInput">地点</label>\
											   	  	  <lable style="margin-left: 10px;">'+json.location+'</lable>\
												    </div>\
								                    <div class="form-group" style="margin-left: 10px;">\
											   	  	  <label for="exampleInput">开始时间</label>\
											   	  	  <lable style="margin-left: 10px;">'+json.startTimeLong+'</lable>\
												    </div>\
												    <div class="form-group" style="margin-left: 10px;">\
											   	  	  <label for="exampleInput">结束时间</label>\
													  <lable style="margin-left: 10px;">'+json.endTimeLong+'</lable>\
												    </div>\
								                    <div class="modal-footer" style="text-align:left;height:auto;">\
								                        <div>'+json.description+'</div>\
								                    </div>\
								                </form>\
								            </div>\
									    </div>\
									  </div>\
									</div>';	
							}
							
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
				
				
							//console.log(calEvent.id+" 123");
							//console.log(calEvent.title+" 123");
							//console.log(jsEvent+" 123");
							//console.log(view+" 123");
				
							// change the border color just for fun
							//$(this).css('border-color', 'red');
						}
					});
					
				},
			});
			
		})
		
		$(".time").datetimepicker({
			format: "yyyy-mm-dd hh:ii",	//日期格式
			autoclose:true,     	//选择后自动关闭
			startDate:new Date()
		});
		</script>
		
		<div class="modal fade" id="myTime" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog">
		   <div class="modal-content">
			   <form class="no-margin" action="updateActivity" method="post">
				 <div class="modal-body">
			   	      <button type="button" class="close" data-dismiss="modal" style="margin-top:-10px;">&times;</button>
				   	  <div class="form-group">
				   	    <label for="exampleInput">日程标题</label>
				   	    <input type="text" class="form-control" id="title" name="title" value="">
				   	  </div>
				   	  <div class="form-group">
				   	    <label for="exampleInput">地点</label>
				   	    <input type="text" class="form-control" id="address" name="location" value="">
				   	  </div>
				   	  <div class="form-group">
				   	  	<label for="exampleInput">开始时间</label>
						<input type="text" value="" class="time" id="startTime" name="startTime" style="margin-left: 10px;"/>
					  </div>
					  <div class="form-group">
					    <label for="exampleInput">结束时间</label>
					    <input type="text" value="" class="time" id="endTime" name="endTime" style="margin-left: 10px;"/>
					  </div>
				   	  <div class="form-group">
				   	    <label for="exampleInput">日程内容</label>
				   	 	<textarea class="form-control" rows="5" id="description" name="description"></textarea>
				   	  </div>
				 </div>
				 <div class="modal-footer">
				 	<input type="hidden" name="id" id="hiddenId" value=""/>
				 	<button type="submit" class="btn btn-sm btn-success"><i class="ace-icon fa fa-check"></i> Save</button>
					<a id="aa" class="btn btn-sm btn-danger" data-action="delete"><i class="ace-icon fa fa-trash-o"></i> Delete Event</a>
					<button type="button" class="btn btn-sm" data-dismiss="modal"><i class="ace-icon fa fa-times"></i> Cancel</button>
				 </div>
			  </form>
		   </div>
		 </div>
		</div>
		
		
		
		
		
		
		
		
		