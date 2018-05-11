<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
#navbar {
	margin: 0;
	padding-left: 0px;
	padding-right: 0px;
	border-width: 0;
	border-radius: 0;
	-webkit-box-shadow: none;
	box-shadow: none;
	background: #438EB9;
	min-height: 45px;
	box-shadow: none;
}
</style>
<div class="navbar-container ace-save-state" id="navbar">
	<button type="button" class="navbar-toggle menu-toggler pull-left"
		id="menu-toggler" data-target="#sidebar">
		<span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span>

		<span class="icon-bar"></span> <span class="icon-bar"></span>
	</button>

	<div class="navbar-header pull-left">
		<a href="index.html" class="navbar-brand"> <small> <i class="fa fa-leaf"></i> 在线OA系统</small>
		</a>
	</div>

	<div class="navbar-buttons navbar-header pull-right" role="navigation">
		<ul class="nav ace-nav">
			<li class="purple dropdown-modal" style="width: 60px; text-align: center;">
				<span>
					<a data-toggle="dropdown" class="dropdown-toggle" href="#">
						<i class="ace-icon fa fa-bell icon-animated-bell" style="color:white;"></i>
						<span class="badge badge-important">2</span>
					</a>
				
				
				<ul class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
					<li class="dropdown-header">
						<i class="ace-icon fa fa-exclamation-triangle"></i> Notifications
					</li>

					<li class="dropdown-content">
						<ul class="dropdown-menu dropdown-navbar navbar-pink">
							<li><a href="#">
									<div class="clearfix">
										<span class="pull-left"> <i
											class="btn btn-xs no-hover btn-pink fa fa-comment"></i> New
											Announcement
										</span> <span class="pull-right badge badge-info">1</span>
									</div>
							</a></li>
						</ul>
					</li>

					<li class="dropdown-footer"><a href="announcement"> See all <i class="ace-icon fa fa-arrow-right"></i>
					</a></li>
				</ul>
				</span>
			</li>

			<li class="green dropdown-modal" style="width: 60px; text-align: center;">
				<span>
					<a data-toggle="dropdown" class="dropdown-toggle" href="#">
						<i class="ace-icon fa fa-envelope icon-animated-vertical" style="color:white;"></i>
						<span class="badge badge-important">${unRead}</span>
					</a>
				

				<ul class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
					<li class="dropdown-header"><i
						class="ace-icon fa fa-exclamation-triangle"></i> Notifications</li>

					<li class="dropdown-content">
						<ul class="dropdown-menu dropdown-navbar navbar-pink">
							<li><a href="#">
									<div class="clearfix">
										<span class="pull-left"> <i class="btn btn-xs no-hover btn-pink fa fa-comment"></i> New Email
										</span> <span class="pull-right badge badge-info">${unRead}</span>
									</div>
							</a></li>
						</ul>
					</li>

					<li class="dropdown-footer">
						<a href="inbox"> See <i class="ace-icon fa fa-arrow-right"></i></a>
					</li>
				</ul>
				</span>
			</li>

			<li class="light-blue dropdown-modal" style="background-color:#62A8D1; text-align: center;">
					<a data-toggle="dropdown" href="#" class="dropdown-toggle" style="margin-top: -10px;">
						<img class="nav-user-photo" src="static/assets/images/avatars/user.jpg" alt="Jason's Photo" />
						<span class="user-info"> <small>Welcome,</small>${user.name}
						</span> <i class="ace-icon fa fa-caret-down"></i>
					</a>

				<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
					<li><a href="#"> <i class="ace-icon fa fa-cog"></i>
							Settings
					</a></li>

					<li>
						<a href="updatePwd" data-toggle="modal" data-target="#register_modal"> <i class="ace-icon fa fa-user"></i>PassWord</a>
					</li>

					<li class="divider"></li>

					<li>
						<a href="Logout"><i class="ace-icon fa fa-power-off"></i>Logout</a>
					</li>
				</ul>
			</li>
		</ul>
	</div>
</div>