<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
	#table tr th,td{text-align: center;}
</style>

<div class="row" style="margin-top: 30px;">
  <div class="col-md-1"></div>
  <div class="col-md-9">
  	<!--头-->
	<div class="form-group">
	  <button class="btn btn-default" role="button" data-toggle="modal" data-target="#xx_modal">申请公告</button>
	  <br/>
	  <br/>
	  <form class="form-inline">
	    <label for="exampleInputName2">&nbsp;&nbsp;&nbsp;部门查询&nbsp;&nbsp;&nbsp;</label>
	    <select name="department" class="form-control">
                  <option value="1">人事部</option>
                  <option value="2">市场部</option>
                  <option value="3">研发部</option>
                  <option value="4">运维部</option>
                  <option value="5">综合部</option>
           </select>
	  	<button type="submit" class="btn btn-default">查找</button>
	  </form>
	</div>
  	
  	<form method="post" action="" id="listform" style="margin-top: 30px;" id="announ">
		<div class="panel admin-panel">
			<table class="table table-hover text-center" id="table">
				<!--表格标题-->
				<tr>
					<th width="30" style="text-align: left; padding-left: 20px;">ID</th>
					<th width="50">公告标题</th>
					<th width="50">创建者</th>
					<th width="50">创建时间</th>
					<th width="60">公告状态</th>
					<th width="210">操作</th>
				</tr>
				<c:forEach var="c" items="${all}">
					<tr>
						<td style="text-align: left; padding-left: 20px;">${c.id}</td>
						<td><a data-id="${c.id}" data-sid="${c.status}" class="status" data-toggle="modal" data-target="#tongguo_modal" color="#00CC99">${c.title}</a></td>
						<td>${c.employee.name}</td>
						<td>${c.createTimeLong}</td>
						<td>${c.statusToString}</td>
						<td>
							<div class="button-group">
								<a data-id="${c.id}" data-toggle="modal" data-target="#shanchu_modal" class="del"><span class="icon-remove"></span>删除</a>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</form>
  </div>
  <div class="col-md-2"></div>
</div>



<!--新增修改公告模态框-->
<div class="modal fade" id="xx_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">新增修改公告</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" action="register-Login" method="get">
					<!--公告标题-->
					<div class="form-group">
						<label class="col-sm-3 control-label">公告标题</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="title" id="name" placeholder="请输入标题" required> <label id="usernameErr" style="color: red"></label>
						</div>
					</div>
					<!--部门-->
					<div class="form-group">
						<label class="col-sm-3 control-label">部门：</label>
						<div class="col-sm-8">
							<select name="creatorId" class="input" style="width: 120px; line-height: 17px; display: inline-block">
								 <option value="1">人事部</option>
				                  <option value="2">市场部</option>
				                  <option value="3">研发部</option>
				                  <option value="4">运维部</option>
				                  <option value="5">综合部</option>
							</select>
						</div>
					</div>
					<input type="hidden" name="approverTime">
					<!--内容-->
					<div class="form-group">
						<label class="col-sm-3 control-label">内容</label>
						<div class="col-sm-8">
							<textarea class="input" name="content" style="height: 90px;"></textarea>
							<label id="" style="color: red"></label>
						</div>
					</div>
					<input type="hidden" name="status" value="0">
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">提交申请</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>


<!-- 审批模态框 -->
<div class="modal fade" id="tongguo_modal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="aaa"></h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" action="updateStatus" method="post">
					<div class="form-group">
						<label class="col-sm-8 control-label" id="annunTitle"></label>
						<input type="hidden" name="annunId" value="" id="annunId"/>
					</div>
					<div class="modal-footer" id="shenpi" style="background-color: white;">
						
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$('.form_date').datetimepicker({
		language : 'ch',
		weekStart : 1,
		todayBtn : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 2,
		minView : 2,
		forceParse : 0
	});
	
	//查看公告
	$(".status").click(function() {
		$("#shenpi").empty();
		var id = $(this).attr("data-id");
		var sid = $(this).attr("data-sid");
		var str = '<button type="submit" class="btn btn-primary" id="changePwd_btn">通过</button><a class="btn btn-default" href="updateStatus0?annunId='+id+'" role="button">不通过</a>';
		if(sid == 1){
			$("#shenpi").append(str);
		}
		$.ajax({
			url:"fetchByStatus",
			type:"GET",
			data:{"id":id},
			dataType:"json",
			success:function(data){
				$("#annunId").val(data.id);
				$("#aaa").text(data.title);
				$("#annunTitle").text(data.content);
			}
		});
	});
	
	//删除公告
	$(".del").click(function() {
		var id = $(this).attr("data-id");
		$.ajax({
			url : "delAnnun",
			type : "POST",
			data : {
				"annunId" : id
			},
			dataType : "json",
			success : function(data) {
				if (data.ok) {
					alert(data.error);
				} else {
					alert(data.error);
				}
			}
		});
		$(this).parent().parent().parent().remove();
	});
		
</script>



































