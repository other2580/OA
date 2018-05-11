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
		
		<!-- datetimepicker -->
		<link href="${pageContext.request.contextPath}/static/datetimepicker/css/bootstrap-datetimepicker.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/static/datetimepicker/js/bootstrap-datetimepicker.js"></script>
		<script src="${pageContext.request.contextPath}/static/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
		
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
		
		
		
		
		<!-- 重置密码模态框 -->
		<div class="modal fade" id="register_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		    <div class="modal-dialog" role="document">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
		                    <span aria-hidden="true">&times;</span></button>
		                <h4 class="modal-title" id="myModalLabel">修改密码</h4>
		            </div>
		            <div class="modal-body">
		                <form class="form-horizontal" id="editPwd" method="post">
		                    <div class="form-group">
		                        <label for="editNr" class="col-sm-2 control-label">员工编号</label>
		                        <div class="input-group col-sm-7">
		                            <input type="text" class="form-control" name="nr" value="${user.nr}" id="editNr" readonly="readonly"><!--<label style="line-height:33px;"> 1001</label> <input class="form-control" type="hidden" name="nr" id="editNr" placeholder="员工编号"> -->
		                        </div>
		                    </div>
		                     <div class="form-group">
		                        <label for="password" class="col-sm-2 control-label">原密码</label><span id="erro" style="color: red;"></span>
		                         <div class="input-group col-sm-7">
		                         <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
		                          <input type="password" class="form-control" name="password" id="password">  <!-- required -->
		                    
		                        </div>
		                        
		                    </div>
		                    <div class="form-group">
		                        <label for="new_password" class="col-sm-2 control-label">新密码</label><span id="newTips" style="color: red;"></span>
		                         <div class="input-group col-sm-7">
		                        	 <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
		                            <input type="password" class="form-control" name="new_password" id="new_password" placeholder="新密码长度为3-20个字符" >
	                            	<input type="text" class="form-control" id="newpwd" placeholder="新密码长度为3-20个字符" style="display: none">
	                            	<span class="input-group-addon"><span id="seeNewpwd" class="glyphicon glyphicon-eye-close" style="cursor: pointer"></span></span>
		                        </div>
		                    </div>
		                     <div class="form-group">
		                        <label for="confirm_password" class="col-sm-2 control-label">确认密码</label><span id="confirmTips" style="color: red;"></span>
		                         <div class="input-group col-sm-7">
		                             <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
		                             <input type="password" id="confirm_password" name="confirm_password" class="form-control" placeholder="新密码须和确认密码相同" >
	                            	 <input type="text" class="form-control" id="newConfirmPwd" placeholder="新密码须和确认密码相同" style="display: none">
	                            	 <span class="input-group-addon"><span id="seeConfirmPwd" class="glyphicon glyphicon-eye-close" style="cursor: pointer"></span></span>
		                        </div>
		                    </div>
		                    <div class="modal-footer">
		                        <button type="button" class="btn icon-check-square-o" id="savePwd">提交</button>
		                        <button type="button" class="btn icon-check-square-o" data-dismiss="modal">取消</button>
		                    </div>
		                </form>
		            </div>
		        </div>
		    </div>
		</div>
		
		
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

	<script type="text/javascript">
	    $(document).ready(function(){
	        $(function(){
	        	//输入原密码离开光标时
	        	$("#password").blur(function(){
	        		checkPwd();
	            });
	        	         	
	            $("#new_password").focus(function(){
	                $("#newTips").text("");
	            });
	            $("#new_password").blur(function(){
	                checkPass1();
	            });
	            $("#confirm_password").focus(function(){
	                $("#confirmTips").text("");
	            });
	            $("#confirm_password").blur(function(){
	                checkPass2();
	            });
	            $("#seeNewpwd").click(function()
	            {
	                if($(this).attr("class")=="glyphicon glyphicon-eye-close")
	                {
	                    $(this).attr("class","glyphicon glyphicon-eye-open");
	                    $("#newpwd").val($("#new_password").val());
	                    $("#new_password").hide();
	                    $("#newpwd").show();
	                }
	                else{
	                    $(this).attr("class","glyphicon glyphicon-eye-close");
	                    $("#new_password").val($("#newpwd").val());
	                    $("#new_password").show();
	                    $("#newpwd").hide();
	                }
	            });
	            $("#seeConfirmPwd").click(function(){
	                if($(this).attr("class")=="glyphicon glyphicon-eye-close")
	                {
	                    $(this).attr("class","glyphicon glyphicon-eye-open");
	                    $("#newConfirmPwd").val($("#confirm_password").val());
	                    $("#confirm_password").hide();
	                    $("#newConfirmPwd").show();
	                }
	                else{
	                    $(this).attr("class","glyphicon glyphicon-eye-close");
	                    $("#confirm_password").val($("#newConfirmPwd").val());
	                    $("#confirm_password").show();
	                    $("#newConfirmPwd").hide();
	                }
	            });
	            $("#savePwd").on("click",function(){
	                if(checkPass2())
	                {
	                    var password=$("#confirm_password").val();
	                    $.ajax({
	        				type : "post",
	        				url : "/MyOA/updatePwd",
	        				dataType : 'json',
	        				data : {
	        					'password':password
	        				},success:function(json){
	        					 if(json.ok){
	        						 alert("更改成功!");
	        						 window.location.href="Logout";
	        					 }else{
	        						 alert("更改失败!");
	        					 }
	        					 
	        				}
	        	    	});
	        	    	
	                }else{
	                    alert("填写的信息有误！");
	                }
	            });
	        });
	    });
	    function checkPass1()
	    {
	        if($("#new_password").attr("hidden")=="hidden")
	        {
	            $("#new_password").val($("#newpwd").val());
	        }
	        var new_password=$("#new_password").val();
	        if(new_password.length<3||new_password.length>20)
	        {
	            $("#newTips").text("*密码长度为"+new_password.length+",不符合要求");
	            return false;
	        }else{
	            return true;
	        }
	    }
	    function checkPass2()
	    {
	        if($("#new_password").attr("hidden")=="hidden")
	        {
	            $("#new_password").val($("#newpwd").val());
	        }
	        if($("#confirm_password").attr("hidden")=="hidden")
	        {
	            $("#confirm_password").val($("#newConfirmPwd").val());
	        }
	        var new_password=$("#new_password").val();
	        var confirm_password=$("#confirm_password").val();
	        if(new_password!=confirm_password)
	        {
	            $("#confirmTips").text("*两次输入的密码不相同");
	            return false;
	        }else{
	            return true;
	        }
	        	        
	    }
	    
	    
	    function checkPwd(){
	    	var password=$("#password").val();
	    	$.ajax({
				type : "get",
				url : "/MyOA/checkPwd",
				dataType : 'json',
				data : {
					'password':password
				},success:function(json){				 
					 if(json==0){
						 $("#erro").text("输入的原密码不正确！");
					 }
				},
	    	});
	    }
    
    </script>
	</body>
</html>