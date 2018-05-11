<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    
	<style type="text/css">
		#meet input,textarea{
			border-radius:5px;
			border:1px solid #1ABDE6;
		}
		#meet ul li{
			line-height: 45px;
		}
		
		#table tr{line-height: 30px;}
		
	</style>
	
	<div class="main-content-inner">
	
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
	
		<div class="container-fluid">
			<form action="addCustomMeeting" method="post">
			    <div class="row">
			        <div class="col-md-12" style="margin-left: 50px;">
			            <div><h2><i class="fa fa-cogs" aria-hidden="true">&nbsp;&nbsp;定制会议</i></h2></div>
			        </div>
			    </div>
			
			    <div class="row" >
			        <div class="col-md-12"style="height: 500px;">
			            <div class="row">
							
			                <div class="col-md-7">
			                    <div class="form-horizontal" style="padding-top: 60px;">
			
			                        <div class="form-group" style="padding-bottom: 20px;">
			                            <label for="input" class="col-sm-2 control-label">标题</label>
			                            <div class="col-sm-7">
			                                <input type="text" name="title" class="form-control" placeholder=" 请填写标题">
			                            </div>
			                        </div>
			
									<div class="form-group" style="padding-bottom: 20px;">
			                            <label for="input" class="col-sm-2 control-label">地点</label>
			                            <div class="col-sm-7">
			                                <input type="text" name="location" class="form-control" placeholder=" 请填写地点">
			                            </div>
			                        </div>
			
			                        <div class="form-group" style="padding-bottom: 20px;">
			                            <label for="input" class="col-sm-2 control-label">开始时间</label>
			                            <div class="col-sm-10">
			                                <div class="input-group date form_date col-sm-3" data-date="" data-date-format="yyyy MM dd" data-link-field="dtp_input2">
			                                    <input size="24" name="startTime" type="text" value="" readonly>
			                                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
			                                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
			                                </div>
			                            </div>
			                        </div>
			
			                        <div class="form-group" style="padding-bottom: 20px;">
			                            <label for="input" class="col-sm-2 control-label">结束时间</label>
			                            <div class="col-sm-10">
			                                <div class="input-group date form_date col-sm-3" data-date="" data-date-format="yyyy MM dd" data-link-field="dtp_input2">
			                                    <input size="24" name="endTime" type="text" value="" readonly>
			                                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
			                                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
			                                </div>
			                            </div>
			                        </div>
			
			
			                        <div class="form-group" style="padding-bottom: 20px;">
			                            <label for="input" class="col-sm-2 control-label">内容</label>
			                            <div class="col-sm-7">
			                                <textarea name="description" class="form-control" rows="5" placeholder=" 请填写内容..." style="resize:none;height: 160px;width: 555px;max-height: 160px;max-width: 600px;"></textarea>
			                            </div>
			                        </div>
			
			                    </div>
			                </div>
				
			                <div class="col-md-5"style="height: 500px;">
			                    <div class="form-group" style="padding-top: 18px;">
			                        <h5>员工列表</h5>
			                        
			                        <input name="department" class="form-control" style="width:200px; line-height:17px; display:inline-block">
			                        <button type="submit" class="btn btn-default">查找</button>
			                        
			                        <div style="width:200px; height:500px; border: 1px solid #adadad;margin-top: 10px; border-radius: 5px;">
			                            <table id="table" style="margin-left: 15px;">
			                            	<c:forEach var="c" items="${employee}">
			                            		<tr><td><input name="emplo" type="checkbox" value="${c.id}"/>&nbsp;${c.name}</td></tr>
			                            	</c:forEach>
			                            </table>
			                        </div>
			                    </div>
			                </div>
							
			            </div>
			        </div>
			    </div>
					
			    <div class="row">
			        <div class="col-md-12">
			            <div class="form-group">
			                <div class="col-sm-offset-2 col-sm-10" style="margin-left: 150px;padding-top: 40px;">
			                    <button type="submit" class="btn btn-default">保存</button>
			                    <button type="submit" class="btn btn-default">重置</button>
			                </div>
			            </div>
			        </div>
			    </div>
		    </form>
	    </div>
	</div>
	
	
	<script type="text/javascript">
	    $('.form_date').datetimepicker({
	        format: "yyyy-mm-dd HH:ii",	//日期格式
	        autoclose:true,     	//选择后自动关闭
	        startDate:new Date()
	    });
	    
	    
	    $('#myTabs a').click(function (e) {
	    	  e.preventDefault()
	    	  $(this).tab('show');
	    })
	    
	    $('#myTabs a[href="#profile"]').tab('show') // Select tab by name
		$('#myTabs a:first').tab('show') // Select first tab
		$('#myTabs a:last').tab('show') // Select last tab
	    
	</script>
	
	
	