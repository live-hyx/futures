<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.text.*"%>
<%
	//做调试用，这里要在正式发布的时候去掉
	System.out.println("["+(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new java.util.Date())+"]=======================调试："+request.getServletPath()+"开始==============================");
%>
<!DOCTYPE html>
	<head>
		<title>期货交易系统-新闻管理-添加新闻</title>
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
										<i class="fa fa-gift"></i>添加新闻
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
												<label class="col-md-3 control-label">发布时间（必填）<font color="red">*</font></label>
												<div class="col-md-9">
													<input type="text" id="createtime" name="createtime" class="form-control" placeholder="请填写新闻发布时间" value=""/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">标题（必填）<font color="red">*</font></label>
												<div class="col-md-9">
													<input type="text" id="title" name="title" class="form-control" placeholder="请输入新闻标题" value=""/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">来源（必填）<font color="red">*</font></label>
												<div class="col-md-9">
													<input type="text" id="description" name="description" class="form-control" placeholder="请输入新闻发布平台" value=""/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">封面链接（必填）<font color="red">*</font></label>
												<div class="col-md-9">
													<input type="text" id="picurl" name="picurl" class="form-control" placeholder="请填写封面图片链接" value=""/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">链接（必填）<font color="red">*</font></label>
												<div class="col-md-9">
													<input type="text" id="url" name="url" class="form-control" placeholder="请填写新闻网址" value=""/>
												</div>
											</div>
											
										</div>
										<div class="form-actions right1">
											<button type="button" id="submit_button" class="btn green">
												添加新闻
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
<script type="text/javascript" src="../../assets/module/scripts/news/todo/list_add.js"></script>
<!-- END PAGE LEVEL SCRIPTS -->
