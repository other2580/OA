<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<style type="text/css">
		.steesing{margin-left: 50px;}
		.container{
			margin-top: 50px;
			margin-right: 500px;
		}
	</style>
	
	 <style>
        #newTips,#confirmTips{
            margin-left: 5px;
            font-size: 12px;
        }
        label{
            width: 80px;
        }
    </style>
	
    <div class="main-content-inner">
    	<div class="steesing">
    		<div><h2><i class="fa fa-cogs" aria-hidden="true">&nbsp;&nbsp;员工信息设置</i></h2></div>
    	</div>
    	<div class="container">
	    	<div class="row">
	    	   <div class="col-md-8">
			  	<form class="form-horizontal" id="editForm" action="empSave" method="post">
			  	  <input type="hidden" name="id" value="${employee!=null?employee.id:0}" />
				  <div class="form-group">
				    <label for="editNr" class="col-sm-2 control-label">员工编号</label>
				    <div class="col-sm-7">
				      <input type="text" name="nr" id="editNr" value="${employee.nr}" class="form-control" placeholder="1001">
				    </div>
				    <div class="col-sm-3">
						<!-- 放置错误信息 -->
					</div>
				  </div>
				  <div class="form-group">
				    <label for="editName" class="col-sm-2 control-label">员工姓名</label>
				    <div class="col-sm-7">
				      <input type="text" name="name" id="editName" value="${employee.name}" class="form-control" placeholder=" 请输入员工姓名">
				    </div>
				    <div class="col-sm-3">
						<!-- 放置错误信息 -->
					</div>
				  </div>
				  <div class="form-group">
				    <label for="editGender" class="col-sm-2 control-label">性别</label>
				    <div class="col-sm-7">
				      <label class="checkbox-inline">
				      	<c:if test="${employee.gender == 1}">
					    	<input type="radio" id="editGender1" value="1" name="gender" checked="checked"> 男
					    </c:if>
					    <c:if test="${employee.gender != 1}">
					    	<input type="radio" id="editGender1" value="1" name="gender"> 男
					    </c:if>
					  </label>
				      <label class="checkbox-inline">
				      	<c:if test="${employee.gender == 0}">
							<input type="radio" id="editGender2" value="0" name="gender" checked="checked"> 女
						</c:if>
						<c:if test="${employee.gender != 0}">
							<input type="radio" id="editGender2" value="0" name="gender"> 女
						</c:if>
					  </label>
				    </div>
				    <div class="col-sm-3">
						<!-- 放置错误信息 -->
					</div>
				  </div>
				  <div class="form-group">
				    <label for="editPassword" class="col-sm-2 control-label">密码</label>
				    <div class="col-sm-7">
				      <input type="password" name="password" id="editPassword" value="${employee.password}" class="form-control">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="editEmail" class="col-sm-2 control-label">Email</label>
				    <div class="col-sm-7">
				      <input type="email" name="email" id="editEmail" value="${employee.email}" class="form-control" placeholder=" 请输入Email">
				    </div>
				    <div class="col-sm-3">
						<!-- 放置错误信息 -->
					</div>
				  </div>
				  
				   
				  <div class="form-group">
				    <label for="editDepartmentId" class="col-sm-2 control-label">部门</label>
				    <div class="col-sm-7">
				      <select name="departmentId" id="editDepartmentId" class="form-control">
				      	 <option value="0">请选择</option>
				      		<c:forEach var="c" items="${departments}">
								<c:if test="${c.id==employee.department.id}">
									<option selected="selected" value="${c.id}">${c.name}</option>
								</c:if>
								<c:if test="${c.id!=employee.department.id}">
									<option value="${c.id}">${c.name}</option>
								</c:if>							
							</c:forEach>
	                  </select>
				    </div>
				    <div class="col-sm-3">
						<!-- 放置错误信息 -->
					</div>
				  </div>
				  
				  
				  <%-- <div class="form-group">
				    <label for="editRoles" class="col-sm-2 control-label">角色</label>
				    <div class="col-sm-7">
				      <select name="role" id="editRoles" class="form-control">
				    	<option value="0">请选择</option>
							<c:forEach var="c" items="${departmentlist}">
								<option value="${c.id}">${c.name}</option>
							</c:forEach>
	                    </select>
				    </div>
				    <div class="col-sm-3">
						<!-- 放置错误信息 -->
					</div>
				  </div> --%>
				  
				  <div class="form-group">
				    <label for="editStatus" class="col-sm-2 control-label">状态</label>
				    <div class="col-sm-7">
				      <label class="checkbox-inline">
				      	<c:if test="${employee.status == 0 }">
					    	<input type="radio" name="status" id="editStatus1" value="0" checked="checked"> 注销
					    </c:if>
					    <c:if test="${employee.status != 0 }">
					    	<input type="radio" name="status" id="editStatus1" value="0"> 注销
					    </c:if>
					  </label>
				      <label class="checkbox-inline">
				      	<c:if test="${employee.status == 1 }">
							<input type="radio" name="status" id="editStatus2" value="1" checked="checked"> 可用
					  	</c:if>
					  	<c:if test="${employee.status != 1 }">
							<input type="radio" name="status" id="editStatus2" value="1"> 可用
					  	</c:if>
					  </label>
					  <label class="checkbox-inline">
					  	<c:if test="${employee.status == 2 }">
							<input type="radio" name="status" id="editStatus3" value="2" checked="checked"> 停用
						</c:if>
						<c:if test="${employee.status != 2 }">
							<input type="radio" name="status" id="editStatus3" value="2"> 停用
						</c:if>
					  </label>
				    </div>
				    <div class="col-sm-3">
						<!-- 放置错误信息 -->
					</div>
				  </div>
				  <div class="form-group">
				    <label for="editIsManager" class="col-sm-2 control-label">部门主管</label>
				    <div class="col-sm-7">
				      <label class="checkbox-inline">
				      	<c:if test="${employee.isManager == 1}">
					    	<input type="radio" name="isManager" id="editIsManager1" value="1" checked="checked"> 是
					    </c:if>
					    <c:if test="${employee.isManager != 1}">
					    	<input type="radio" name="isManager" id="editIsManager1" value="1"> 是
					    </c:if>
					  </label>
				      <label class="checkbox-inline">
				      	<c:if test="${employee.isManager == 0}">
							<input type="radio" name="isManager" id="editIsManager2" value="0" checked="checked"> 否
						</c:if>
						<c:if test="${employee.isManager != 0}">
							<input type="radio" name="isManager" id="editIsManager2" value="0"> 否
						</c:if>
					  </label>
				    </div>
				    <div class="col-sm-3">
						<!-- 放置错误信息 -->
					</div>
				  </div>
				  <div class="form-group">
				    <label for="editEntryDate" class="col-sm-2 control-label">入职时间</label>
				    <div class="col-sm-7">
				      <div class="input-group date form_date col-sm-3" data-date="" data-date-format="yyyy MM dd" data-link-field="dtp_input2">
	                    <input size="24" type="text" name="entryDate2" value="" id="editEntryDate" value="">
	                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
	                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
	                  </div>
				    </div>
				    <div class="col-sm-3">
						<!-- 放置错误信息 -->
					</div>
				  </div>
				 
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <button type="submit" class="btn btn-default" id="save">提交</button><!-- submit -->
				    </div>
				  </div>
				</form>
			  </div>
			  <div class="col-md-4"></div>
			</div>
	    </div>
    </div>
    
	<script type="text/javascript">
	    $('.form_date').datetimepicker({
	        format: "yyyy-mm-dd",	//日期格式
			autoclose:true,     	//选择后自动关闭
			startDate:new Date()
	    });
	</script>
    
    
    
    
    