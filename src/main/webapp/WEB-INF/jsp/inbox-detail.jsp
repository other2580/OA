<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style type="text/css">
.fun {
	background-color: #c1d9f3;
	height: 40px;
}

#function  tr td button {
	margin-left: 30px;
	margin-top: 5px;
}

.inboxdetail {
	background-color: #eff5fb;
}

.advertise {
	background-color: #FFF1B4;
	height: 40px;
}

.content {
	margin-left: 20px;
	border: 0px solid black;
}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/ckeditor/ckeditor.js"></script>
<script>
	$(function() {
		$("#function .back").click(function() {
			window.history.go(-1);
		});

		$("#answer").click(function() {
			$('.panel-body').show();
		});

		$("#Sent").click(function() {
			CKEDITOR.instances["content"].updateElement();//更新内容
			$.ajax({
				url : "${pageContext.request.contextPath}/sent",
				type : "POST",
				data : $("#editForm").serialize(),
				success : function(json) {
					$("#result").text("此邮件已成功发送");
				}
			});
		});
	});
</script>
<div class="main-content-inner">

	<div class="breadcrumbs ace-save-state" id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
			</li>

			<li><a href="#">More Pages</a></li>
			<li class="active">Inbox</li>
		</ul>
		<!-- /.breadcrumb -->

		<div class="nav-search" id="nav-search">
			<form class="form-search">
				<span class="input-icon"> <input type="text"
					placeholder="Search ..." class="nav-search-input"
					id="nav-search-input" autocomplete="off" /> <i
					class="ace-icon fa fa-search nav-search-icon"></i>
				</span>
			</form>
		</div>
		<!-- /.nav-search -->
	</div>


	<div class="container-fluid">
		<div class="fun">
			<table id="function">
				<tr>
					<td><button class="back">
							<i class="ace-icon fa fa-mail-reply-all (alias)"></i>返回
						</button></td>
					<td><button>
							<i class="ace-icon fa fa-trash-o"></i>删除
						</button></td>
					<td><button>
							<i class="ace-icon fa fa-trash"></i>彻底删除
						</button></td>
					<td><button>全部标记为已读</button></td>
				</tr>
			</table>
		</div>
		<form id="editForm">
			<div class="table-responsive">
				<!--发送箱详情  -->
				<c:if test="${sdetail!=null}">
					<table class="table">
						<tr>
							<td>${sdetail.title}<i class="ace-icon fa fa-star"
								style="margin-left: 5px;"></i></td>
						</tr>
						<tr>
							<td>发件人：</td>
							<td>${sdetail.employee.name}</td>
						</tr>
						<tr>
							<td>时间：</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
									value="${sdetail.sendTime}" /></td>
						</tr>
						<tr>
							<td>收件人：</td>
							<td>${sdetail.receivers}</td>
						</tr>
					</table>
					<div class="advertise"></div>
					<div class="content">${sdetail.content}</div>
				</c:if>
				<!--收件箱  -->
				<c:if test="${detail!=null}">
					<input type="hidden" name="eid" value="${detail.employee.id}">
					<input type="hidden" name="title" value="${detail.message.title}">
					<input type="hidden" name="receivers"
						value="${detail.employee.name}">
					<table class="table">
						<tr>
							<td>${detail.message.title}<i class="ace-icon fa fa-star"
								style="margin-left: 5px;"></i></td>
						</tr>
						<tr>
							<td>发件人：</td>
							<td>${detail.employee.name}</td>
						</tr>
						<tr>
							<td>时间：</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
									value="${detail.message.sendTime}" /></td>
						</tr>
						<tr>
							<td>收件人：</td>
							<td>${detail.message.receivers}</td>
						</tr>
					</table>
					<div class="advertise"></div>

					<div class="content">${detail.message.content}</div>
				</c:if>
				<!-- 如果有附件就显示 -->
				<c:if test="${attRow>0}">
					<div class="panel panel-default">
						<!-- Default panel contents -->
						<div class="panel-heading">附件(${attRow}个)</div>
						<div class="panel-body">
							<p>普通附件</p>
							<table>
								<tr>
									<td></td>
									<td><span>${attachment.name}</span> <a href="">预览</a><a
										href="">下载</a></td>
								</tr>
							</table>
						</div>
					</div>
				</c:if>
				<c:if test="${detail!=null}">
					<div class="panel panel-default">
						<div class="panel-heading">
							<span id="answer">快捷回复</span><a href="inbox-edit"
								style="margin-left: 1200px;">切换到写信模式</a>
						</div>
						<div class="panel-body" style="display: none">
							<textarea id="content" name="content"
								class="ckeditor form-control">
									      ${draft.content}
									</textarea>
							<script>
								CKEDITOR.replace("content");
							</script>

							<button type="button" id="Sent"
								class="btn btn-default btn-lg active">发送</button>
						</div>

					</div>
				</c:if>

			</div>

			<div class="panel panel-success" id="result"></div>
			<!--发送成功 -->

		</form>
	</div>
</div>

