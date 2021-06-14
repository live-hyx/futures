<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.text.*"%>
<%
	//做调试用，这里要在正式发布的时候去掉
	System.out.println("["+(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new java.util.Date())+"]=======================调试："+request.getServletPath()+"开始==============================");
%>
<!DOCTYPE html>
	<head>
		<title>期货交易系统-天气信息管理-添加新天气信息</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta content="width=device-width, initial-scale=1" name="viewport" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<%@include file="../../home/frame/frame_style.jsp"%>
		<!-- BEGIN PAGE LEVEL STYLES -->
		<link rel="stylesheet" type="text/css" href="../../assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" />
		<!-- END PAGE LEVEL SCRIPTS -->
	</head>
	<body class="page-header-fixed page-quick-sidebar-over-content page-sidebar-closed-hide-logo page-container-bg-solid">
		<%@include file="../../home/frame/frame_top.jsp"%>
		<div class="clearfix"></div>
		<!-- BEGIN CONTAINER -->
		<div class="page-container">
			<%@include file="../../home/frame/frame_left.jsp"%>
			<div class="page-content-wrapper">
				<!-- BEGIN CONTENT -->
				<div class="page-content">
					<%@include file="../../home/frame/frame_portlet.jsp"%>
					<%@include file="../../home/frame/frame_theme_color.jsp"%>
					<%@include file="../../home/frame/frame_page_header.jsp"%>
					<!-- BEGIN PAGE CONTENT-->
					<!-- ----------------------------------------页面开始，替换这里即可---------------------------------------- -->
					<div class="row">
						<div class="col-md-12">
							<div class="portlet box blue ">
								<div class="portlet-title">
									<div class="caption">
										<i class="fa fa-gift"></i>新建天气信息
									</div>
									<div class="tools">
										<a href="" class="reload"> </a>
									</div>
								</div>
								<div class="portlet-body form">
									<form class="form-horizontal" role="form" id="page_form" name="page_form" action="#">
										<input type="hidden" id="action" name="action" value="add_record"/>
										<div class="form-body">
											
											<div class="form-group">
												<label class="col-md-3 control-label">城市（必填）<font color="red">*</font></label>
												<div class="col-md-9">
													<input type="text" id="city" name="city" class="form-control" placeholder="请填写城市" value=""/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">温度℃（必填）<font color="red">*</font></label>
												<div class="col-md-9">
													<input type="text" id="temp" name="temp" class="form-control" placeholder="请输入温度，请填写整数，单位为摄氏度" value=""/>
												</div>
											</div>
											<!-- div class="form-group">
												<label class="col-md-3 control-label">
													用户权限
												</label>
												<div class="col-md-9">
													<select class="table-group-action-input form-control input-medium" id="user_role" name="user_role">
														<option value="normal">普通用户</option>
														<option value="manager">管理员</option>
													</select>
												</div>
											</div> -->
											<div class="form-group">
												<label class="col-md-3 control-label">天气（必填）<font color="red">*</font></label>
												<div class="col-md-9">
													<input type="text" id="text" name="text" class="form-control" placeholder="请输入天气描述，例如：晴，多云" value=""/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">风向（必填）<font color="red">*</font></label>
												<div class="col-md-9">
													<input type="text" id="wind_dir" name="wind_dir" class="form-control" placeholder="请填写风向" value=""/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">风力（必填）<font color="red">*</font></label>
												<div class="col-md-9">
													<input type="text" id="wind_scale" name="wind_scale" class="form-control" placeholder="请填写风力几级，请填写整数" value="1"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">风速（必填）<font color="red">*</font></label>
												<div class="col-md-9">
													<input type="text" id="wind_speed" name="wind_speed" class="form-control" placeholder="请填写风速（米/秒），请填写整数" value="1"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">能见度（必填）<font color="red">*</font></label>
												<div class="col-md-9">
													<input type="text" id="vis" name="vis" class="form-control" placeholder="请填能见度，请填写整数" value="1"/>
												</div>
											</div>
										</div>
										<div class="form-actions right1">
											<button type="button" id="submit_button" class="btn green">
												添加新的天气信息
											</button>
											<button type="button" id="return_button" class="btn green">
												返回
											</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- ----------------------------------------页面结束，替换上面即可---------------------------------------- -->
					<!-- END PAGE CONTENT-->
				</div>
				<!-- END CONTENT -->
				<%@include file="../../home/frame/frame_sidebar.jsp"%>
			</div>
			<!-- END CONTENT WRAPPER-->
		</div>
		<!-- END CONTAINER -->
		<%@include file="../../home/frame/frame_bottom.jsp"%>
		<%@include file="../../home/frame/frame_ajax_modal.jsp"%>
	</body>
</html>
<%@include file="../../home/frame/frame_page_component.jsp"%>
<%@include file="../../home/frame/frame_javascript.jsp"%>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="../../assets/global/plugins/bootstrap-daterangepicker/moment.min.js"></script>
<script type="text/javascript" src="../../assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE SCRIPTS -->
<script type="text/javascript" src="../../assets/module/scripts/weather/todo/list_add.js"></script>
<!-- END PAGE LEVEL SCRIPTS -->
