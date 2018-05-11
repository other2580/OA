<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.sams.com/tags" prefix="sams"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style type="text/css">
.main-content-inner {
	border: 0px solid black;
}

.fun {
	background-color: #fff;
	height: 50px;
}

#function  tr td button {
	margin-left: 30px;
	margin-top: 10px;
}

div.pager a {
	text-decoration: none;
	border: solid 1px gray;
	padding: 1px 3px;
}

div.pager span.current {
	padding: 1px 3px;
	background-color: gray;
	color: white;
}

div.pager span.pageInfo {
	margin-left: 10px;
}
</style>
<script type="text/javascript" src="../static/js/jquery-2.1.1.min.js"></script>
<script>
	//点击全选的时候
	$(function() {
		$(".all").click(function() {
			var flag = this.checked;
			$(".cho").each(function() {
				this.checked = flag;
			});
		});

		//单选
		$(".cho").click(function name() {
			if ($(".cho").length == $(".cho:checked").length)
				$(".all").prop("checked", true);
			else
				$(".all").prop("checked", false);
		});

		//点击删除的时候
		$("#delete").click(function() {
			//点击删除的时候判断是否选中
			if ($(".cho:checked").length == 0) {

				alert("请选择一行!");
			}

			if ($(".cho:checked").length > 0) {
				var ids = new Array();
				$(".cho:checked").each(function(index) {
					ids.push($(this).val());

				});
				//alert(ids);
				$.ajax({
					type : "POST",
					url : "/MyOA/delete",
					dataType : 'json',
					data : {
						'ids' : ids.toString()
					},
					success:function(json){
						location.reload();
					}
				});

			}

		});

		//点击彻底删除的时候
		$(".Redelete").click(function() {
			//点击删除的时候判断是否选中
			if ($(".cho:checked").length == 0) {
				alert("请选择一行!");
			} 
			
			if ($(".cho:checked").length > 0) {
				var ids = new Array();
				$(".cho:checked").each(function(index) {
					ids.push($(this).val());

				});
				//alert(ids);
				$.ajax({
					type : "POST",
					url : "/MyOA/Redelete",
					dataType : 'json',
					data : {
						'ids' : ids.toString()
					},
					success:function(json){
						location.reload();
					}
					
				});

			}
			
		});

	})
</script>
<div class="main-content-inner">
	<div id="breadcrumbs">
		<div id="logo">
			<img
				src="${pageContext.request.contextPath}/common/css/images/logo.png"
				alt="" />
		</div>
		<nav class="navbar navbar-default">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#navbar-collapse-menu">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="../index">首页</a>
			</div>
			<div class="collapse navbar-collapse" id="navbar-collapse-menu">
				<ul class="nav navbar-nav">
					<li class="active"><a href="mypersonal/person-home">个人主页</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">我的邮箱<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="inbox">收件箱</a></li>
							<li><a href="inbox-send">发件箱</a></li>
							<li class="divider"></li>
							<li><a href="inbox-edit">编写新邮件</a></li>
						</ul></li>
					<c:if test="${user!=null}">
						<li class="dropdown"><a href="../create-topic">发表主题</a></li>
					</c:if>
				</ul>
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="主题">
					</div>
					<button type="submit" class="btn btn-default">搜索</button>
				</form>
			</div>
		</nav>
	</div>



	<div class="container-fluid">
		<div class="row" style="margin-left: 60px;">
			<c:if test="${param.isSent==1}">
				<h3>
					<i class="fa fa-send-o (alias)" aria-hidden="true">已发送<span
						style="font-size: 16px;">(共${rows}封)</span></i>
				</h3>
			</c:if>
			<c:if test="${param.isSent==0}">
				<h3>
					<i class="fa fa-calendar" aria-hidden="true">草稿箱<span
						style="font-size: 16px;">(共${rows}封)</span></i>
				</h3>
			</c:if>
		</div>
		<form action="update-Mstatus" method="post" id="form">
			<input type="hidden" id="index" name="index" />
			<div class="fun" style="margin-left: 60px;">
			<c:if test="${param.isSent==1}">
				<table id="function">
					<tr>
						<td>
							<button type="button" id="delete" class="delete">
								<i class="ace-icon fa fa-trash-o"></i>&nbsp删除
							</button>
						</td>
						<td><button type="button" class="Redelete">
								<i class="ace-icon fa fa-trash"></i>&nbsp彻底删除
							</button></td>
						<td><button>移动到..</button></td>
					</tr>
				</table>
			</c:if>
			
			<c:if test="${param.isSent==0}">
				<table id="function">
					<tr>
						<td><button type="button" class="Redelete">
								<i class="ace-icon fa fa-trash"></i>&nbsp删除草稿
							</button></td>
					</tr>
				</table>
			</c:if>
			</div>
		 
			<div class="row"
				style="width: 90%; margin-left: 60px; text-align: center;">
				<table id="simple-table" class="table table-hover">
					<thead>
						<tr>
							<th class="center" style="width: 20px;"><label
								class="pos-rel"> <span class="lbl"><input
										class="all" type="checkbox" style="width: 20px; height: 20px;" /></span>
							</label></th>
							<th class="detail-col" style="text-align: center;"><i
								class="fa fa-envelope"></i></th>
							<th style="text-align: center;"><i class="fa fa-user">&nbsp&nbsp&nbsp</i>收件人</th>
							<th style="text-align: center;"><i class="fa fa-flag"></i>
								主题</th>
							<th style="text-align: center;"><i
								class="glyphicon glyphicon-alert"></i> 重要级别</th>
							<th style="text-align: center;"><i
								class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>时间</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="c" items="${messages}">
							<tr>
								<td><input class="cho" type="checkbox" name="id"
									style="width: 20px; height: 20px;" value="${c.id}" /></td>
								<td><c:if test="${c.isSent==0}">
										<i class="fa fa-calendar-o"
											style="text-align: center; margin-top: 6px;"></i>
									</c:if> <c:if test="${c.isSent==1}">
										<i class="fa fa-inbox"
											style="text-align: center; margin-top: 6px;"></i>
									</c:if> <c:if test="${c.status==1}&${c.isSent!=0}">
										<i class="ace-icon fa fa-trash-o"
											style="text-align: center; margin-top: 6px;"></i>
									</c:if></td>
								<c:if test="${c.isSent==0}">
									<td><a href="inbox-edit?id=${c.id}">${c.receivers}</a></td>
									<td><i class="fa fa-flag-o" style="margin-right: 10px"></i><a
										href="inbox-edit?id=${c.id}">${c.title}</a></td>

								</c:if>
								<c:if test="${c.isSent==1}">
									<td><a href="sinbox-detail?id=${c.id}">${c.receivers}</a></td>
									<td><i class="fa fa-flag-o" style="margin-right: 10px"></i><a
										href="sinbox-detail?id=${c.id}">${c.title}</a></td>

								</c:if>
								<td><i class="" style="margin-right: 10px"></i> <c:if
										test="${c.level==1}">
								                           普通
								       </c:if> <c:if test="${c.level==2}">
								                          重要
								       </c:if> <c:if test="${c.level==3}">
								                           紧急
								       </c:if></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
										value="${c.sendTime}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</form>
	</div>
	<div class="pager-container">
		<sams:pager
			urlFormat="inbox-send?isSent=${param.isSent}&status=${param.status}&pageNum=%d"
			pageSize="1" numbers="5" totalRows="${totalPages}"
			curPage="${param.pageNum}" />
	</div>
</div>





