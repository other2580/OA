<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<a href="index.html">
				<i class="menu-icon fa fa-tachometer"></i>
				<span class="menu-text"> 主页 </span>
			</a>

			<b class="arrow"></b>
		</li>

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
				<li class="">
					<a href="content-slider.html">
						<i class="menu-icon fa fa-caret-right"></i>
						员工检索
					</a>
					<b class="arrow"></b>
				</li>

				<li class="">
					<a href="treeview.html">
						<i class="menu-icon fa fa-caret-right"></i>
						添加员工
					</a>
					<b class="arrow"></b>
				</li>

				<li class="">
					<a href="jquery-ui.html">
						<i class="menu-icon fa fa-caret-right"></i>
						添加部门
					</a>

					<b class="arrow"></b>
				</li>

				<li class="">
					<a href="nestable-list.html">
						<i class="menu-icon fa fa-caret-right"></i>
						部门列表
					</a>
					<b class="arrow"></b>
				</li>
			</ul>
		</li>

		<li class="">
			<a href="#" class="dropdown-toggle">
				<i class="menu-icon fa fa-calendar"></i>
				<span class="menu-text"> 日程管理 </span>
				<b class="arrow fa fa-angle-down"></b>
			</a>
			<b class="arrow"></b>
			
			<ul class="submenu">
				<li class="">
					<a href="tables.html">
						<i class="menu-icon fa fa-caret-right"></i>
						个人日程
					</a>

					<b class="arrow"></b>
				</li>

				<li class="">
					<a href="jqgrid.html">
						<i class="menu-icon fa fa-caret-right"></i>
						 日程日历
					</a>

					<b class="arrow"></b>
				</li>
				
				<li class="">
					<a href="jqgrid.html">
						<i class="menu-icon fa fa-caret-right"></i>
						 定制会议
					</a>

					<b class="arrow"></b>
				</li>
			</ul>
		</li>

		<li class="">
			<a href="#" class="dropdown-toggle">
				<i class="menu-icon fa fa-pencil-square-o"></i>
				<span class="menu-text"> 邮件功能 </span>

				<b class="arrow fa fa-angle-down"></b>
			</a>

			<b class="arrow"></b>

			<ul class="submenu">
				<li class="">
					<a href="form-elements.html">
						<i class="menu-icon fa fa-caret-right"></i>
						我的邮件
					</a>

					<b class="arrow"></b>
				</li>

				<li class="">
					<a href="form-elements-2.html">
						<i class="menu-icon fa fa-caret-right"></i>
						垃圾箱
					</a>
					<b class="arrow"></b>
				</li>
			</ul>
		</li>

		<li class="">
			<a href="#" class="dropdown-toggle">
				<i  class="menu-icon fa fa-file-o"></i>
				<span class="menu-text">公告管理 </span>

				<b class="arrow fa fa-angle-down"></b>
			</a>

			<b class="arrow"></b>

			<ul class="submenu">
				<li class="">
					<a href="profile.html">
						<i class="menu-icon fa fa-caret-right"></i>
						公告审批
					</a>
					<b class="arrow"></b>
				</li>

				<li class="">
					<a href="inbox.html">
						<i class="menu-icon fa fa-caret-right"></i>
						公告申请
					</a>
					<b class="arrow"></b>
				</li>
			</ul>
		</li>

		<li class="">
			<a href="#" class="dropdown-toggle">
				<i class="menu-icon fa fa-tag"></i>
				<span class="menu-text">权限管理 </span>

				<b class="arrow fa fa-angle-down"></b>
			</a>

			<b class="arrow"></b>

			<ul class="submenu">
				<li class="">
					<a href="profile.html">
						<i class="menu-icon fa fa-caret-right"></i>
						编辑角色
					</a>
					<b class="arrow"></b>
				</li>

				<li class="">
					<a href="inbox.html">
						<i class="menu-icon fa fa-caret-right"></i>
						添加角色
					</a>
					<b class="arrow"></b>
				</li>
			</ul>
		</li>

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
				<li class="">
					<a href="faq.html">
						<i class="menu-icon fa fa-caret-right"></i>
						回收站
					</a>
					<b class="arrow"></b>
				</li>

				<li class="">
					<a href="blank.html">
						<i class="menu-icon fa fa-caret-right"></i>
						操作文件夹
					</a>
					<b class="arrow"></b>
				</li>
			</ul>
		</li>
	</ul><!-- /.nav-list -->

	<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
		<i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
	</div>