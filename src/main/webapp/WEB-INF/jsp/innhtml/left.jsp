<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springsecurity.org/jsp" prefix="sc" %>

	<script type="text/javascript">
		try{ace.settings.loadState('sidebar')}catch(e){}
	</script>

	<div class="sidebar-shortcuts" id="sidebar-shortcuts">
		<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
			<button class="btn btn-success">
				<i class="ace-icon fa fa-signal"></i>
			</button>

			<button class="btn btn-info">
				<i class="ace-icon fa fa-pencil"></i>
			</button>

			<button class="btn btn-warning">
				<i class="ace-icon fa fa-users"></i>
			</button>

			<button class="btn btn-danger">
				<i class="ace-icon fa fa-cogs"></i>
			</button>
		</div>

		<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
			<span class="btn btn-success"></span>

			<span class="btn btn-info"></span>

			<span class="btn btn-warning"></span>

			<span class="btn btn-danger"></span>
		</div>
	</div><!-- /.sidebar-shortcuts -->

	<ul class="nav nav-list">
		<li class="active">
			<a href="index">
				<i class="menu-icon fa fa-tachometer"></i>
				<span class="menu-text"> 主页 </span>
			</a>

			<b class="arrow"></b>
		</li>
		
		<sc:authorize code="organization,organization-department,organization-employee">
		<li class="">
			<a href="#" class="dropdown-toggle">
				<i class="menu-icon fa fa-desktop"></i>
				<span class="menu-text">
					组织管理功能
				</span>
				<b class="arrow fa fa-angle-down"></b>
			</a>
			<b class="arrow"></b>
			<ul class="submenu">
				<sc:authorize code="organization-employee">
				<li class="">
					<a href="empTable">
						<i class="menu-icon fa fa-caret-right"></i>
						员工管理
					</a>
					<b class="arrow"></b>
				</li>
				</sc:authorize>

				<li class="">
					<a href="addEmployee">
						<i class="menu-icon fa fa-caret-right"></i>
						添加员工
					</a>
					<b class="arrow"></b>
				</li>

				<sc:authorize code="organization-department">
				<li class="">
					<a href="depTable">
						<i class="menu-icon fa fa-caret-right"></i>
						部门管理
					</a>

					<b class="arrow"></b>
				</li>
				</sc:authorize>
			</ul>
		</li>
		</sc:authorize>

		<sc:authorize code="activity,activity-calendar,activity-list">
		<li class="">
			<a href="#" class="dropdown-toggle">
				<i class="menu-icon fa fa-calendar"></i>
				<span class="menu-text"> 日程管理 </span>
				<b class="arrow fa fa-angle-down"></b>
			</a>
			<b class="arrow"></b>
			
			<ul class="submenu">

				<sc:authorize code="activity-list">
				<li class="">
					<a href="mySchedule">
						<i class="menu-icon fa fa-caret-right"></i>
						 日程列表
					</a>
					<b class="arrow"></b>
				</li>
				</sc:authorize>

				<sc:authorize code="activity-calendar">
				<li class="">
					<a href="calendar">
						<i class="menu-icon fa fa-caret-right"></i>
						 我的日历
					</a>
					<b class="arrow"></b>
				</li>
				</sc:authorize>
				
				<li class="">
					<a href="customMeeting">
						<i class="menu-icon fa fa-caret-right"></i>
						 定制会议
					</a>
					<b class="arrow"></b>
				</li>
			</ul>
		</li>
		</sc:authorize>

		<sc:authorize code="message,message-inbox,message-outbox,message-draft">
		<li class="">
			<a href="#" class="dropdown-toggle">
				<i class="menu-icon fa fa-pencil-square-o"></i>
				<span class="menu-text"> 邮件功能 </span>

				<b class="arrow fa fa-angle-down"></b>
			</a>

			<b class="arrow"></b>

			<ul class="submenu">
				<li class="">
					<a href="inbox-edit">
						<i class="menu-icon fa fa-caret-right"></i>
						写信
					</a>
					<b class="arrow"></b>
				</li>
				
				<sc:authorize code="message-inbox">
				<li class="">
					<a href="inbox?status=0">
						<i class="menu-icon fa fa-caret-right"></i>
						收件箱
					</a>

					<b class="arrow"></b>
				</li>
				</sc:authorize>
				
				<sc:authorize code="message-draft">
				<li class="">
					<a href="inbox-send?isSent=0&&status=0">
						<i class="menu-icon fa fa-caret-right"></i>
						草稿箱
					</a>

					<b class="arrow"></b>
				</li>
				</sc:authorize>
				
				<sc:authorize code="message-outbox">
				<li class="">
					<a href="inbox-send?isSent=1&&status=0">
						<i class="menu-icon fa fa-caret-right"></i>
						已发送
					</a>
					<b class="arrow"></b>
				</li>
				</sc:authorize>
				
				<li class="">
					<a href="inbox-delete">
						<i class="menu-icon fa fa-caret-right"></i>
						回收站
					</a>
					<b class="arrow"></b>
				</li>				
			</ul>
		</li>
		</sc:authorize>

		<sc:authorize code="announcement,announcement-list,announcement-mine,announcement-approve">
		<li class="">
			<a href="#" class="dropdown-toggle">
				<i  class="menu-icon fa fa-file-o"></i>
				<span class="menu-text">公告管理 </span>

				<b class="arrow fa fa-angle-down"></b>
			</a>
			<b class="arrow"></b>

			<ul class="submenu">
				<sc:authorize code="announcement-list">
				<li class="">
					<a href="announcement">
						<i class="menu-icon fa fa-caret-right"></i>
						公告
					</a>
					<b class="arrow"></b>
				</li>
				</sc:authorize>
			</ul>
		</li>
		</sc:authorize>
		
		<sc:authorize code="security,security-role,security-user">
		<li class="">
			<a href="#" class="dropdown-toggle">
				<i class="menu-icon fa fa-tag"></i>
				<span class="menu-text">权限管理 </span>

				<b class="arrow fa fa-angle-down"></b>
			</a>

			<b class="arrow"></b>

			<ul class="submenu">
				<sc:authorize code="security-user">
				<li class="">
					<a href="empRole">
						<i class="menu-icon fa fa-caret-right"></i>
						员工角色
					</a>
					<b class="arrow"></b>
				</li>
				</sc:authorize>
				
				<sc:authorize code="security-role">
				<li class="">
					<a href="permissions">
						<i class="menu-icon fa fa-caret-right"></i>
						角色权限
					</a>
					<b class="arrow"></b>
				</li>
				</sc:authorize>
			</ul>
		</li>
		</sc:authorize>

		<sc:authorize code="document,document-manager">
		<li class="">
			<a href="#" class="dropdown-toggle">
				<i class="menu-icon fa fa-tasks"></i>
				<span class="menu-text">
					文件管理
					<span class="badge badge-primary"></span>
				</span>
				<b class="arrow fa fa-angle-down"></b>
			</a>
			<b class="arrow"></b>

			<ul class="submenu">
				<sc:authorize code="document-manager">
				<li class="">
					<a href="fileIO">
						<i class="menu-icon fa fa-caret-right"></i>
						操作文件夹
					</a>
					<b class="arrow"></b>
				</li>
				</sc:authorize>
			</ul>
		</li>
		</sc:authorize>
	</ul><!-- /.nav-list -->

	<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
		<i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
	</div>