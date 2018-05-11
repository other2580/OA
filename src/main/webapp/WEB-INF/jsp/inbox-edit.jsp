<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.sams.com/tags" prefix="sams"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/bootstrap-fileinput-master/css/fileinput.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/bootstrap-fileinput-master/js/fileinput.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/bootstrap-fileinput-master/js/locales/zh-TW.js"></script>
<style>
#depa li{list-style: none;padding: 0px }

#depa{
padding:0px;
}

.dname{
    margin:25px;
    font-size:18px;
}


</style>

<div class="main-content-inner">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div id="breadcrumbs">
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

			</div>
			<!-- /.col-md-12 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container-fluid -->
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-9">
			<div class="panel panel-default">
				<div class="panel-heading" style="background-color: #d6e9c6;">
					<a href="inbox-send?isSent=1" class="btn-a"
						style="text-decoration: none;">返回</a>
					<button class="draft" type="button">保存草稿</button>
					<button class="sent" type="button">发送</button>
					<button class="close" type="button">关闭</button>
				</div>

				<form action="save" method="post" id="form"
					enctype="multipart/form-data">
					<div id="employeeid"></div>
					<input type="hidden" name="index" id="index" />  
					<input name="isSent" value="1" type="hidden">
					<c:if test="${mid!=null }">
						<input name="id" value="${mid }" type="hidden">
					</c:if>
					<table class="table">
						<tr>
							<td>
								<p style="float: left; padding-right: 30px; font-weight: bold;">标题：</p>
								<input style="width: 600px;" type="text" name="title"
								value="${draft.title}" class="form-control" placeholder="请输入标题" />
							</td>
						</tr>
						<tr>

							<td>
								<p style="float: left; padding-right: 16px; font-weight: bold;">收件人：</p>
								<input style="width: 600px;" type="text" name="receivers"
								value="${draft.receivers}" class="form-control"
								readonly="readonly" placeholder="请输收件人" />
							</td>
						</tr>
						<tr>
							<td><i class="glyphicon glyphicon-paperclip"></i>&nbsp&nbsp<a
								href="">添加附件</a></td>
						</tr>
						<tr>
							<td><input type="file" name="file" class="file" /></td>
						</tr>
						<tr>
							<td>
								<p style="float: left; padding-right: 16px; font-weight: bold;">重要程度：</p>
								<select name="level">
									<option value="1"
										<c:if test="${draft.level==1}">selected="selected"</c:if>>普通</option>
									<option value="2"
										<c:if test="${draft.level==2}">selected="selected"</c:if>>重要</option>
									<option value="3"
										<c:if test="${draft.level==3}">selected="selected"</c:if>>紧急</option>
							</select>
							</td>
						</tr>
						<tr>
							<td><textarea id="content" name="content"
									class="ckeditor form-control">
									      ${draft.content}
									</textarea> <script>
										CKEDITOR.replace("content");
									</script></td>
						</tr>
						<tr>
							<td>发件人:${user.name}</td>
						</tr>
					</table>

					<div class="panel-heading" style="background-color: #d6e9c6;">
						<a href="inbox-send?isSent=1" class="btn-a"
							style="text-decoration: none;">返回</a>
						<button class="draft" type="button">保存草稿</button>
						<button class="sent" type="button">发送</button>
						<button class="close" type="button">关闭</button>
					</div>
				</form>
			</div>
		</div>
		<!-- /.col-md-10 -->
		<div class="col-md-2">
			<div class="panel panel-default" style="height: 400px;">

				<p style="text-align: center; font-size: 14px;">
					<span class="glyphicon glyphicon-user"></span>通讯录
				</p>
				<input type="text" class="form-control" placeholder="查找联系人.." /><span
					class="glyphicon glyphicon-search"
					style="margin-top: -25px; margin-left: 130px; border: 0px;"></span>
				<ul id="depa">
					<c:forEach var="d" items="${departments}">
						<li class="dname">&nbsp;&nbsp;&nbsp;&nbsp;<i  class="glyphicon glyphicon-user" aria-hidden="true"></i>&nbsp;&nbsp;${d.name}
							<ul class="emp" style="list-style-type: none;">
								<c:forEach var="e" items="${employees}">
									<c:if test="${d.id==e.department.id}">
										<li data-id="${e.id}" data-nr="${e.nr}" data-name="${e.name}"><i aria-hidden="true">&nbsp;&nbsp;</i>${e.name}
											<span style="margin-left: 20px;">${e.nr}</span>
										</li>
									</c:if>
								</c:forEach>
							</ul>
						</li>
					</c:forEach>
				</ul>


			</div>

		</div>
		<!-- /.col-md-2 -->
	</div>
	<!-- /.row -->
</div>
<!-- /.container-fluid -->

<script>
	$(function() {

		var receiverId = Array();
		var count = 0;

		//点击的时候
		$('#depa')
				.on(
						'click',
						'.emp li',
						function() {
							var id = $(this).attr('data-id'); //取出id
							var name = $(this).attr('data-name');//取出name
							var nr = $(this).attr('data-nr')//取出标识
							//console.log(id + "\t" + name+ "\t" + nr);

							// 判断重复
							if (receiverId.indexOf(parseInt(id)) != -1) {

								var arr = $("input[name='receivers']").val()
										.trim().split(';');
								arr.splice(receiverId.indexOf(parseInt(id)), 1);

								//清除多余空格
								for (var i = 0; i < arr.length; i++) {
									arr[i] = arr[i].trim();
								}

								//添加处理后的数组
								$("input[name='receivers']").val(
										arr.join(';  '));

								//移除数组中的值
								receiverId.splice(receiverId
										.indexOf(parseInt(id)), 1);
								count--;
								$("#employeeid input").eq(count).remove();
							} else {
								//给数组添加新的值
								receiverId[count++] = parseInt(id);

								//添加信息到文本框
								$("input[name='receivers']").val(
										$("input[name='receivers']").val()
												+ name + '<'+nr+'>;  ');
								$("#employeeid")
										.html(
												$("#employeeid").html()
														+ "<input name='listemployeeid' checked='checked' type='checkbox' style='display:none;' value='"+id+"'>");
							}
						});

		$(".draft").click(function() {
			$("input[name='isSent']").val(0);
			$("#form").submit();
		});
		$(".sent").click(function() {
			$("input[name='isSent']").val(1);
			$("#form").submit();
		});

		$(".close").click(function() {
			window.history.go(-1);
		});
		
		$(".emp").css("display","none");
		
		$(".dname").click(
			function(){
				$(this).children().fadeToggle();		
		});


	})
</script>



