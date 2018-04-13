<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title><tiles:insertAttribute name="title" /></title>
		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		
		<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
		<link rel="stylesheet" href="static/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
		<link rel="stylesheet" href="static/assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="static/assets/css/ace-rtl.min.css" />	
		<script src="static/assets/js/ace-extra.min.js"></script>
		
		<script src="http://www.jq22.com/jquery/jquery-2.1.1.js"></script>
		<script src="http://www.jq22.com/jquery/bootstrap-3.3.4.js"></script>
		<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/bootstrap-3.3.4.css">
		
	</head>
	<body class="no-skin">
		<div id="navbar" class="navbar navbar-default ace-save-state">
			<tiles:insertAttribute name="head" />
		</div>

		<div class="main-container ace-save-state" id="main-container">
			<script type="text/javascript">
				try{ace.settings.loadState('main-container')}catch(e){}
			</script>

			<div id="sidebar" class="sidebar responsive ace-save-state">
				<tiles:insertAttribute name="left" />
			</div>

			<div class="main-content">
				<tiles:insertAttribute name="main" />
			</div><!-- /.main-content -->

			<div class="footer">
				<div class="footer-inner">
					<div class="footer-content">
						<span class="bigger-120">
							<span class="blue bolder">Ace</span>
							Application &copy; 2013-2014
						</span>
						&nbsp; &nbsp;
						<span class="action-buttons">
							<a href="#">
								<i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
							</a>
							<a href="#">
								<i class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
							</a>
							<a href="#">
								<i class="ace-icon fa fa-rss-square orange bigger-150"></i>
							</a>
						</span>
					</div>
				</div>
			</div>
			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->
		<!-- basic scripts -->
		
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='static/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		
		<script src="static/assets/js/jquery-ui.custom.min.js"></script>
		<script src="static/assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="static/assets/js/jquery.easypiechart.min.js"></script>
		<script src="static/assets/js/jquery.sparkline.index.min.js"></script>
		<script src="static/assets/js/jquery.flot.min.js"></script>
		<script src="static/assets/js/jquery.flot.pie.min.js"></script>
		<script src="static/assets/js/jquery.flot.resize.min.js"></script>

		<!-- ace scripts -->
		<script src="static/assets/js/ace-elements.min.js"></script>
		<script src="static/assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->
	</body>
</html>