<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
    <div class="main-content-inner">
	    <div class="container-fluid">
	    	<div class="row" style="margin-left: 100px;margin-top: 5px;">
	    		<h1><img style="width: 100px; height:100;" alt="" src="static/images/emp.png">&nbsp;&nbsp;员工管理</h1>
	    	</div>
	    	<br/>
    		<div class="row">
			  <div class="col-md-4">
				<div class="form-group" style="margin-left: 100px;">
				
				  <form action="empTable" method="get" class="form-inline">
				    <label for="exampleInputName2">&nbsp;&nbsp;&nbsp;部门&nbsp;&nbsp;&nbsp;</label>
				     <select name="dids"class="form-control">
				      	<option value="0">请选择</option>
				      		<c:forEach var="c" items="${departments}">
								<c:if test="${c.id==param.dids}">
									<option selected="selected" value="${c.id}">${c.name}</option>
								</c:if>
								<c:if test="${c.id!=param.dids}">
									<option value="${c.id}">${c.name}</option>
								</c:if>						
							</c:forEach>
	                  </select>
		            <input type="text" name="nr" value="${param.nr}" placeholder="请输入搜索关键字" />
				  	<button type="submit" class="btn btn-default">查找</button>
				  </form>
				</div>
			  </div>
			  <div class="col-md-1"><a class="btn btn-default" href="addEmployee" role="button">添加员工</a></div>
			  <div class="col-md-6"></div>
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
							<th class="detail-col" style="text-align: center;">详情</th>
							<th style="text-align: center;">姓名</th>
							<th style="text-align: center;">部门</th>
							<th class="hidden-480" style="text-align: center;">员工编号</th>
							<th style="text-align: center;">
								<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>入职时间
							</th>
							<th style="text-align: center;">部门主管</th>
							<th style="text-align: center;">员工状态</th>
							<th></th>
						</tr>
					</thead>
		
					<tbody>
					
					<c:forEach var="e" items="${employees}">
						<tr>
							<td class="center">
								<label class="pos-rel">
									<span class="lbl">${e.id}</span>
								</label>
							</td>
	
							<td class="center">
								<div class="action-buttons">
									<a href="#" class="green bigger-140 show-details-btn" title="Show Details">
										<i class="ace-icon fa fa-angle-double-down"></i>
										<span class="sr-only">Details</span>
									</a>
								</div>
							</td>
	
							<td><a href="#">${e.name}</a></td>
							<td>${e.department.name}</td>
							<td class="hidden-480">${e.nr}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${e.entryDate}" /></td>
	
							<td>
								<c:if test="${e.isManager==0}">否</c:if>
								<c:if test="${e.isManager==1}">是</c:if>
							</td>
							<td>
								<c:if test="${e.status==0}">注销</c:if>
								<c:if test="${e.status==1}">可用</c:if>
								<c:if test="${e.status==2}">暂停</c:if>
							</td>
							<td>
								<div class="hidden-sm hidden-xs btn-group">
									<a class="btn btn-xs btn-info" href="addEmployee?id=${e.id}">
										<i class="ace-icon fa fa-pencil bigger-120"></i>
									</a>
									<button class="btn btn-xs btn-danger" data-toggle="modal" data-target="#shanchu_modal">
										<i class="ace-icon fa fa-trash-o bigger-120"></i>
									</button>
									<input type="hidden" value="${e.id}" class="delid"/>
								</div>
							</td>
						</tr>
			
						<tr class="detail-row">
							<td colspan="10">
								<div class="table-detail">
									<div class="row">
										<div class="col-xs-12 col-sm-2">
											<div class="text-center">
												<img height="150" class="thumbnail inline no-margin-bottom" alt="Domain Owner's Avatar"  src="static/assets/images/avatars/profile-pic.jpg" />
												<br />
												<div class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
													<div class="inline position-relative">
														<a class="user-title-label" href="#">
															<i class="ace-icon fa fa-circle light-green"></i>&nbsp;
															<span class="white">${e.name}</span>
														</a>
													</div>
												</div>
											</div>
										</div>
	
										<div class="col-xs-12 col-sm-7">
											<div class="space visible-xs"></div>
	
											<div class="profile-user-info profile-user-info-striped">
												<div class="profile-info-row">
													<div class="profile-info-name"> 员工编号 </div>
													<div class="profile-info-value">
														<span>${e.nr}</span>
													</div>
												</div>
											
												<div class="profile-info-row">
													<div class="profile-info-name"> 姓名 </div>
													<div class="profile-info-value">
														<span>${e.name}</span>
													</div>
												</div>
	
												<div class="profile-info-row">
													<div class="profile-info-name"> 性别 </div>
													<div class="profile-info-value">
														<span>
														<c:if test="${e.gender==0}">女</c:if>
														<c:if test="${e.gender==1}">男</c:if>
														</span>
													</div>
												</div>
												
												<div class="profile-info-row">
													<div class="profile-info-name"> 部门主管 </div>
													<div class="profile-info-value">
														<span>
														<c:if test="${e.isManager==0}">否</c:if>
														<c:if test="${e.isManager==1}">是</c:if>
														</span>
													</div>
												</div>
												
												<div class="profile-info-row">
													<div class="profile-info-name"> 员工状态 </div>
													<div class="profile-info-value">
														<span>
														<c:if test="${e.status==0}">注销</c:if>
														<c:if test="${e.status==1}">可用</c:if>
														<c:if test="${e.status==2}">暂停</c:if>
														</span>
													</div>
												</div>
												
												<div class="profile-info-row">
													<div class="profile-info-name"> 所在部门 </div>
													<div class="profile-info-value">
														<span>${e.department.name}</span>
													</div>
												</div>
	
												<div class="profile-info-row">
													<div class="profile-info-name"> 入职时间 </div>
													<div class="profile-info-value">
														<span><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${e.entryDate}" /></span>
													</div>
												</div>
	
												<div class="profile-info-row">
													<div class="profile-info-name"> Email </div>
													<div class="profile-info-value">
														<span>${e.email}</span>
													</div>
												</div>

											</div>
										</div>
	
										<div class="col-xs-12 col-sm-3">
											<div class="space visible-xs"></div>
											<h4 class="header blue lighter less-margin">给亚历克斯发信息</h4>
	
											<div class="space-6"></div>
	
											<form>
												<fieldset>
													<textarea class="width-100" resize="none" placeholder="类型的东西……"></textarea>
												</fieldset>
	
												<div class="hr hr-dotted"></div>
	
												<div class="clearfix">
													<label class="pull-left">
														<input type="checkbox" class="ace" />
														<span class="lbl">发邮件给我一份</span>
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
					</c:forEach>
					</tbody>
				</table>
				<c:if test="${pageNum>1 }">
				<a href="?page=${pageNum-1}&dids=${param.dids}&title=${param.title}" style="border: 1px solid #DDD;padding:5px 5px 5px 5px;">上一页</a>
				</c:if>
				<c:if test="${pageNum<totalPages}">
				<a href="?page=${pageNum+1}&dids=${param.dids}&title=${param.title}" style="border: 1px solid #DDD;padding:5px 5px 5px 5px;">下一页</a>
				</c:if>
				&nbsp;&nbsp;共 ${totalPages} 页，第 ${pageNum} 页
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
                        <label for="OldPassword" class="col-sm-8 control-label">你 确 定 要 删 除该员工 吗 ？</label>
                    </div>
	            </div>
	            <div class="modal-footer">
	            	<form action="delEmp" method="post">
		            	<input type="hidden" value="" name="id" id="empId"/>
		              	<button type="submit" class="btn btn-primary" id="changePwd_btn">确定</button>
		                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	                </form>
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
			
			
			//点击删除
			$("#simple-table").on("click", "[data-target='#shanchu_modal']", function(){
				$("#empId").val($(this).next(".delid").val());
			});
			
		})
		
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	