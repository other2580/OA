<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

    <div class="main-content-inner">
	    <div class="container-fluid">
	    	<div class="row" style="margin-left: 100px;margin-top: 5px;">
	    		<h1><img style="width: 100px; height:100;" alt="" src="static/images/dep.png">&nbsp;&nbsp;部门列表</h1>
	    	</div>
	    	<br/>
    		<div class="row">
			  <div class="col-md-6">
				<div class="form-group" style="margin-left: 100px;">
				  	<a class="btn btn-default" href="#" data-toggle="modal" data-target="#register_modal" role="button">添加部门</a>
				</div>
			  </div>
			  <div class="col-md-7"></div>
			</div>
			
			<br/>
		    <div class="row" style="width: 90%;margin-left: 100px;text-align: center;">
				<table id="simple-table" class="table  table-bordered table-hover">
					<thead>
						<tr>
							<th class="center">
								<label class="pos-rel">
									<span class="lbl">ID</span>
								</label>
							</th>	
							<th style="text-align: center;">部门名称</th>
							<th style="text-align: center;">固定电话</th>
							<th class="hidden-480" style="text-align: center;">移动电话</th>
							<th style="text-align: center;">传真</th>
							<th style="text-align: center;">状态</th>
							<th></th>
						</tr>
					</thead>
		
					<tbody>
					<c:forEach var="c" items="${departmenties}">
						<tr>
							<td class="center">
								<label class="pos-rel">
									<span class="lbl">${c.id}</span>
								</label>
							</td>
							<td><a href="#">${c.name}</a></td>
							<td>${c.fixedPhone}</td>
							<td class="hidden-480">${c.movePhone}</td>
							<td>${c.fax}</td>
							<td>
								<c:if test="${c.status==0}">注销</c:if>
								<c:if test="${c.status==1}">可用</c:if>
							</td>
	
							<td>
								<div class="hidden-sm hidden-xs btn-group">
									<a class="btn btn-xs btn-info" href="#" data-toggle="modal" data-target="#register_modal">
										<i class="ace-icon fa fa-pencil bigger-120"></i>
									</a>
									<input type="hidden" class="delid" value="${c.id}"/>
									<button class="btn btn-xs btn-danger" data-toggle="modal" data-target="#shanchu_modal">
										<i class="ace-icon fa fa-trash-o bigger-120"></i>
									</button>
								</div>
							</td>
						</tr>
					</c:forEach>
						<tr class="detail-row">
							<td colspan="8">
								<div class="table-detail">
									<div class="row">
										
	
										<div class="col-xs-12 col-sm-7">
											<div class="space visible-xs"></div>
	
											<div class="profile-user-info profile-user-info-striped">
												<div class="profile-info-row">
													<div class="profile-info-name"> Username </div>
	
													<div class="profile-info-value">
														<span>alexdoe</span>
													</div>
												</div>
	
												<div class="profile-info-row">
													<div class="profile-info-name"> Location </div>
	
													<div class="profile-info-value">
														<i class="fa fa-map-marker light-orange bigger-110"></i>
														<span>Netherlands, Amsterdam</span>
													</div>
												</div>
	
												<div class="profile-info-row">
													<div class="profile-info-name"> Age </div>
	
													<div class="profile-info-value">
														<span>38</span>
													</div>
												</div>
	
												<div class="profile-info-row">
													<div class="profile-info-name"> Joined </div>
	
													<div class="profile-info-value">
														<span>2010/06/20</span>
													</div>
												</div>
	
												<div class="profile-info-row">
													<div class="profile-info-name"> Last Online </div>
	
													<div class="profile-info-value">
														<span>3 hours ago</span>
													</div>
												</div>
	
												<div class="profile-info-row">
													<div class="profile-info-name"> About Me </div>
	
													<div class="profile-info-value">
														<span>Bio</span>
													</div>
												</div>
											</div>
										</div>
	
										<div class="col-xs-12 col-sm-3">
											<div class="space visible-xs"></div>
											<h4 class="header blue lighter less-margin">Send a message to Alex</h4>
	
											<div class="space-6"></div>
	
											<form>
												<fieldset>
													<textarea class="width-100" resize="none" placeholder="Type something…"></textarea>
												</fieldset>
	
												<div class="hr hr-dotted"></div>
	
												<div class="clearfix">
													<label class="pull-left">
														<input type="checkbox" class="ace" />
														<span class="lbl"> Email me a copy</span>
													</label>
	
													<button class="pull-right btn btn-sm btn-primary btn-white btn-round" type="button">
														Submit
														<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
													</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</td>
						</tr>
						</tbody>
				</table>
			</div>
		</div>
	</div>
	
	
	<!-- 新增修改部门模态框 -->
	<div class="modal fade" id="register_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		    <div class="modal-dialog" role="document">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                    <span aria-hidden="true">&times;</span></button>
		                <h4 class="modal-title" id="myModalLabel">部门设置</h4>
		            </div>
		            <div class="modal-body">
		                <form class="form-horizontal" action="depSave" method="post">
		                    <div class="form-group">
		                        <label for="OldPassword" class="col-sm-3 control-label">部门名称：</label>
		                        <div class="col-sm-8">
		                            <input type="text" class="form-control" name="name" id="name" onblur="checkUsersname();" placeholder=" 请输入部门名称"  required>
		                            <label id="usernameErr" style="color:red"></label>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="newPassword" class="col-sm-3 control-label">固定电话：</label>
		                        <div class="col-sm-8">
		                            <input type="text" class="form-control" name="fixedPhone" id="fixedPhone" placeholder=" 请输入固定电话" required>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="Confirmation" class="col-sm-3 control-label">移动电话：</label>
		                        <div class="col-sm-8">
		                            <input type="text" name="movePhone" class="form-control" id="movePhone" placeholder=" 请输入移动电话" required>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="Confirmation" class="col-sm-3 control-label">传真：</label>
		                        <div class="col-sm-8">
		                            <input type="text" name="fax" class="form-control" id="fax" placeholder=" 请输入传真" required>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="Confirmation" class="col-sm-3 control-label">部门概述：</label>
		                        <div class="col-sm-8">
		                            <input type="text" name="description" class="form-control" id="description" placeholder=" 请描述" required>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="Confirmation" class="col-sm-3 control-label">状态：</label>
		                        <div class="col-sm-8" id="radio">
		                        	<label class="checkbox-inline">
									    <input type="radio" id="editGender1" value="1" name="status"> 可用
								    </label>
								    <label class="checkbox-inline">
									    <input type="radio" id="editGender2" value="0" name="status"> 注销
								    </label>
		                        </div>
		                    </div>
		                    <div class="modal-footer">
		                        <div class="form-group">
		                         	<div class="col-sm-8">
		                         		<input type="hidden" name="id" id="depId" value="0"/>
			                            <button type="submit" class="btn icon-check-square-o" id="changePwd_btn">提交</button>
			                            <button type="button" class="btn icon-check-square-o" data-dismiss="modal">取消</button>
		                            </div>
		                        </div>
		                    </div>
		                </form>
		            </div>
		        </div>
		    </div>
		</div>	
	
	
	
	<!-- 删除模态框 -->
	<div class="modal fade" id="shanchu_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span></button>
	                <h4 class="modal-title" id="myModalLabel">温馨提示</h4>
	            </div>
	            <div class="modal-body">
                    <div class="form-group">
                        <label for="OldPassword" class="col-sm-8 control-label">你 确 定 要 删 除 该部门吗 ？</label>
                    </div>
	            </div>
	            <div class="modal-footer">
	            	<input type="hidden" id="changePwd" value=""/>
	            	<button type="button" class="btn btn-default" data-dismiss="modal" id="click">确定</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	            </div>
	        </div>
	    </div>
	</div>
	
	<script type="text/javascript">
		if('ontouchstart' in document.documentElement) document.write("<script src='static/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
	</script>

	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		jQuery(function($) {
			
			/**查看详细信息**/
			$('.show-details-btn').on('click', function(e) {
				e.preventDefault();
				$(this).closest('tr').next().toggleClass('open');
				$(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
			});
			
			
			//点击编辑
			$("#simple-table").on("click", "[data-target='#register_modal']", function(){
				$("#depId").val($(this).next(".delid").val());
				var id = $(this).next(".delid").val();
				$.ajax({
		            url: 'findById',
		            dataType: 'json',
		            type: 'post',
		            data:{"id":id},
		            success: function (json) { 
		            	$("#name").val(json.name);
		            	$("#fixedPhone").val(json.fixedPhone);
		            	$("#movePhone").val(json.movePhone);
		            	$("#fax").val(json.fax);
		            	$("#description").val(json.description);
		            	if(json.status == 1){
		            		$("#editGender1").attr("checked", "checked");
		            	}else{
		            		$("#editGender2").attr("checked", "checked");
		            	}
		            }
		        });
			});
			
			
			//点击删除
			$("#simple-table").on("click", "[data-target='#shanchu_modal']", function(){
				$("#changePwd").val($(this).prev(".delid").val());
			});
			
			$("#click").click(function() {
				var id = $("#changePwd").val();
				$.ajax({
		            url: 'deleteDep',
		            dataType: 'json',
		            type: 'post',
		            data:{"id":id},
		            success: function (json) { 
		            	if(json){
		            		alert("删除成功！");
		            		window.location.href="depTable"; 
		            	}else{
		            		alert("该部门数据正在使用无法删除！");
		            	}
		            }
		        });
			});
			
		})
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	