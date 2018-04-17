<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<!-- datetimepicker -->
	<link href="${pageContext.request.contextPath}/static/datetimepicker/css/bootstrap-datetimepicker.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/static/datetimepicker/js/bootstrap-datetimepicker.js"></script>
	<script src="${pageContext.request.contextPath}/static/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<style type="text/css">
		#meet input,textarea{
			border-radius:5px;
			border:1px solid #1ABDE6;
		}
		#meet ul li{
			line-height: 45px;
		}
	</style>
	
	<script type="text/javascript">
		$(function(){
			$(".time").datetimepicker({
				format: "yyyy-mm-dd hh:ii",	//日期格式
				autoclose:true,     	//选择后自动关闭
				startDate:new Date()
			});
		});
		
		//鼠标悬停
		$("p").mouseover(function(){
		    $("p").css("background-color","yellow");
		});
		$("p").mouseout(function(){
		    $("p").css("background-color","#E9E9E4");
		});
	</script>        
	
	
	<div class="main-content-inner">
		<div class="breadcrumbs ace-save-state" id="breadcrumbs">
			<ul class="breadcrumb">
				<li>
					<i class="ace-icon fa fa-home home-icon"></i>
					<a href="#">Home</a>
				</li>
				<li class="active">Dashboard</li>
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
			<hr/>
			<div>
				<h2>定制会议</h2>
			</div>
			<div>
				<div style="width:35%;" id="meet">
					<ul>
						<li>标题
							<ul>
								<li><input type="text" class="form-control" id="inputTitle" placeholder="下午有个会议"></li>
							</ul>
						</li>
						<li>开始时间
							<ul>
								<li><input class="form-control" type="text" value="" id="inputStars" class="time"></li>
							</ul>
						</li>
						<li>结束时间
							<ul>
								<li><input class="form-control" type="text" value="" id="inputEnd" class="time"></li>
							</ul>
						</li>
						<li>会议内容
							<ul>
								<li><textarea class="form-control" rows="5"></textarea></li>
							</ul>
						</li>
					</ul>
					
				</div>
			</div>
		</div>
	</div>