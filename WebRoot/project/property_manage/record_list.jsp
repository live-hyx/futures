<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.text.*"%>
<!-- record_list.jsp查询所有数据，xxx_list.jsp查询自己的数据 -->
<%
	//做调试用，这里要在正式发布的时候去掉
	System.out.println("[" + (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new java.util.Date())
			+ "]=======================调试：" + request.getServletPath() + "开始==============================");
			String user_email = (String) session.getAttribute("user_email");
	String user_pwd = (String) session.getAttribute("user_pwd");
	String user_name = (String) session.getAttribute("user_name");
	String user_city = (String) session.getAttribute("user_city");
	String user_role = (String) session.getAttribute("user_role");
	String user_margin = (String) session.getAttribute("user_margin");
	String user_balance = (String) session.getAttribute("user_balance");

	session.setAttribute("unit_db_name", "xm09");

	System.out.println("user_email=" + user_email + ",user_name=" + user_name + ",user_role=" + user_role
			+ ",user_margin=" + user_margin);
%>
<%
	String id = request.getParameter("id");
	String existResultset = request.getParameter("exist_resultset");
%>
<!DOCTYPE html>
<input type="hidden" id="exist_resultset" name="exist_resultset"
	value="<%=existResultset%>" />
<head>
<title>期货交易系统</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@include file="../../home/frame/frame_style.jsp"%>
<!-- BEGIN PAGE LEVEL STYLES -->
<!-- END PAGE LEVEL SCRIPTS -->
</head>
<body
	class="page-header-fixed page-quick-sidebar-over-content page-sidebar-closed-hide-logo page-container-bg-solid">
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
						<!-- BEGIN EXAMPLE TABLE PORTLET-->
						<div class="portlet box grey-cascade">
							<div class="portlet-title">
								<div class="caption">
									<i class="fa fa-globe"></i>交易管理信息表
								</div>
								<div class="tools">
									<a href="javascript:;" class="collapse"> </a> <a
										href="#portlet-config" data-toggle="modal" class="config">
									</a> <a href="javascript:reload();" class="reload"> </a>
								</div>
							</div>
							<div class="portlet-body">
								<div class="table-toolbar">
									<div class="row">
										<div class="col-md-6">
											
											<div class="btn-group">
												<a id="add_button" class="btn green" 
													href="list_add.jsp">新的交易<i class="fa fa-plus"></i>
												</a>
											</div>
											
											<button type="button" id="layout_button" class="btn green"
												title="布局切换">
												<i class="fa fa-th"></i>
											</button>
										</div>
										
									</div>
								</div>
								
								<!-- 显示金额 -->
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<div class="dashboard-stat green-haze">
										<div class="visual">
											<i class="fa fa-shopping-cart"></i>
										</div>
										<div class="details">
											<div class="number" id="money_info">0</div>
											<div class="desc">您的金额</div>
										</div>
										<a class="more" href="../money_manage/list_add.jsp">充值<i
											class="m-icon-swapright m-icon-white"></i>
										</a>
									</div>
								</div>
								<br>
								<div>
								<table
									class="table table-striped table-bordered table-hover datatable"
									id="record_list">
									
									
									<!--  此处添加 table信息！！！ -->
									<thead id="record_list_head">
									</thead>
								</table>
								</div>
							</div>
						</div>
						<!-- END EXAMPLE TABLE PORTLET-->
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
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE SCRIPTS -->
<script type="text/javascript"
	src="../../assets/module/scripts/property_manage/todo/record_list.js"></script>
<!-- END PAGE LEVEL SCRIPTS -->