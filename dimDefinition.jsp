<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>维度定义</title>
	<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="icon" type="image/png" href="${ctx}/resources/images/favicon.png">
	<link rel="stylesheet" type="text/css" href="${ctx}/resources/lib/awe/awesome.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/resources/images/iconfont.css?v=2" />
	<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/images/style.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/css/daterangepicker.css" />
	<script type="text/javascript" src="${ctx}/resources/js/tangram-min.js"></script>
	<script type="text/javascript" src="${ctx}/resources/js/tangram-ext.js"></script>
    <script type="text/javascript" src="${ctx}/resources/jQuery/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctx}/resources/js/moment.js"></script>  
    <script type="text/javascript" src="${ctx}/resources/js/daterangepicker.js"></script>  
	<script type="text/javascript" src="${ctx}/resources/js/baiduTemplate.js"></script>	

	<style>
		.in-block{display:inline-block;}
		label{font-weight:normal;}
		label.lab_inp input{margin:0;}
		.txt_inp.dd{cursor:pointer}
		#dropdown{text-align:center;}
		.fl_div{width:25%;vertical-align:top;}
		.rt_div{width:73%;height:805px;padding:0;padding-left:20px;}
		.rt_tab{border:1px solid #d3d3d3;padding-bottom:30px;}
		.rt_title{heigth:37px;line-height:37px;background:#E6F0F9;padding:0 8px;}
		.rt_title span,.rt_down_title span{font-size:15px;font-weight:600;color:#7e7e7e}
		.rt_title b{color:#2081b8}
		.rt_content{padding:0 8px;}
 		.rt_content table tr th,
 		.rt_content table tr td{border:1px solid #d3d3d3;} 
 		.rt_content table tr th{padding:6px 18px;background:#f6fbfe;text-align:center;font-weight:600;color:#7e7e7e;}
		.rt_content .rt_content_tit{margin:30px 0 6px;font-siae:14px;font-weight:600;color:#7e7e7e;}
		.rt_content table.rt_content_cen  tr td span{margin-right:15px;text-align:center;}
		.rt_content table.rt_content_cen,.rt_content table.rt_content_sec,.rt_down_cen table{width:100%}
		.rt_content table.rt_content_sec th{padding:8px 5px;}
		.rt_content table.rt_content_sec td{text-align:center;padding:6px 5px;}
		/*右侧下部分*/
		.rt_tab_down{border:1px solid #d3d3d3;margin-top:60px;margin-bottom:30px;}
		.rt_tab_down .rt_down_title{heigth:37px;line-height:37px;background:#2BC3B5;padding:0 8px;}
		.rt_tab_down .rt_down_cen{background:#DDF8F5;padding:15px;}
		.ver_align{vertical-align:middle;font-weight: normal;margin-right: 20px;}
		.rt_down_cen td{padding:4px 0;}
		.rt_down_cen td span{display:inline-block;width:70px;}
		
		/* 统计口径模态框 */
		#con_lf_lf tr.pull-down td{padding-top:4px;padding-left:8px;}
		#con_lf_lf table tr[id^='1'] td a{padding-left:5px;}
		#con_lf_lf table tr[id^='2'] td{padding-left:30px;}
		#con_lf_lf table tr[id^='2'] td a{padding-left:3px;}
		#con_lf_lf table tr td,#con_lf_rt table tr td{height:28px;border-bottom:1px solid #d4d4d4;}
		#con_lf_rt table tr td{padding-left:8px;}
		#con_lf_lf table tr td:hover,#con_lf_rt table tr td:hover{background-color:#ffd;border-color: #d4d4d4;}
		.opt_in{width:12px;height:14px;padding:2px 12px 2px 3px;}
		.checked{background-color:#e6f0f9;}
		.btn-primary:hover{color:#333;background-color:#3071a9; border-color:#285e8e;}
		
		/* 指标维度模态框 */
		.bor{border:1px solid #d3d3d3;}
		.dim_modBody{padding:10px 0 0 20px;}
		.dim_modTitle span{font-size:15px;color:#7e7e7e;font-weight:600;}
		.dim_modTitle .dim_name{color:#2081b8;}
		.dim_modContent{padding-top:15px;}
		.dim_modContent div.theme{width:18%;line-height:31px;text-align:center;background-color:#F6FBFE;margin-right:20px;}
		.dim_modContent div.theme_time div.theme{height:40px;line-height:40px;}
		.dim_modContent div.off_tree{height:325px;vertical-align:top;}
		.dim_modContent div.theme_dim{height:110px;vertical-align:top;}
		.dim_modContent .theme_time label{width:10px;margin-right:10px;}
		/* .dim_modContent .theme_dimVal label{width:81px;} */
		.dim_modContent .theme_dimVal{width:75%;}
		.count_modDown{margin-top:30px}
		#dim_box{height:70px;border:1px solid #d3d3d3;margin-top:6px;}
		#dim_box p{width:48%;display:inline-block;padding-left:15px;}
		#dim_box p label{margin:0px;}
	
		/* 界面 预览L 模态框 */
		#modal_tab table tr th,
		#modal_tab table tr td{min-width:125px;border:1px solid #d4d4d4;padding: 2px;text-align: center}
		#modal_tab table tr th:first-child,
		#modal_tab table tr td:first-child{min-width:50px;}
		#modal_tab table tr th{background-color:#f6fbfe;border-top:none;padding:8px 5px;font-weight:600;color:#7e7e7e;}
		#modal_tab table tr td{padding:6px 5px;}
		#modal_tab table tr th:first-child,
		#modal_tab table tr td:first-child{border-left:none;}
		.sum_title{font-weight:600;color:#7e7e7e;}
	
		.add{width:60px;height:26px;line-height:15px;font-size:29px;margin-left:80%;}
		button.btn.add:focus{outline:none;}
		.del button.btn{width:26px;height:26px;line-height:15px;font-size:25px;background:#e4393c;}
		#rt_content input{padding-left:6px;}
	
		/* 计算公式 指标一  */
		#index_table2 tr td{height:29px;border-bottom:1px solid #d3d3d3;text-align:center;}
		#index_table4 tr td{height:29px;border-bottom:1px solid #d3d3d3;text-align:center;}
	
	</style>

</head>
<body>

<div class="mr15">
	<span class="tab_title" style="margin-top: 3px;">维度定义</span>
	<hr style="background-color:#DBDBDB;height:2px;border:none;margin-top:10px;">
	
	<div class="in-block fl_div">
		<div style="text-align:right;">
			<input class="txt_inp" id="kpi_seek" placeholder="搜索" type="text" style="text-align:right;width:50%;padding-right:10px;">
			<button type="button" id="kpi_search" class="btn btn-primary fa fa-search" style="margin:5px 5px;height:26px;line-height:10px;"> 搜索</button>
		</div>
		<div style="max-height:878px;overflow-y:scroll;border:1px solid #d3d3d3;border-left:none;">
			<div style="text-align:center;" id="table1"></div>
		</div>
	</div>

	<div id="kpi_define"  class="rep15 container in-block rt_div">
		<div class="rt_tab">
			<div class="rt_title">
				<div class="in-block">
					<span>指标名称：</span>
					<b id="_kpi_name"></b>
				</div>
				<!-- <div class="in-block" style="float:right;">
					<button id="dim_kpi" type="button" class="btn btn-primary" disabled>指标维度</button>
					<button id="statistics_kpi" type="button" class="btn btn-primary" disabled>统计口径</button>
					<button id="search_kpi" type="button" class="btn btn-red" disabled>公式查询</button>
				</div> -->
			</div>
			<div class='rt_content'>
				<div class="rt_content_tit">指标维度：
					<div class="in-block" style="float:right;">
					<button id="dim_kpi" type="button" class="btn btn-primary" disabled>设置维度</button>
					<!-- <button id="statistics_kpi" type="button" class="btn btn-primary" disabled>统计口径</button> -->
					<!-- <button id="search_kpi" type="button" class="btn btn-red" disabled>公式查询</button> -->
					</div>
				</div>
				<div>
					<table class="rt_content_cen">
						<tr class="row">
							<th class="col-xs-2">时间维度</th>
							<td class="col-xs-10" id="zb_time">
								<span></span>
								<span></span>
								<span></span>
								<span></span>
							</td>
						</tr>
						<tr class="row">
							<th class="col-xs-2">科室维度</th>
							<td class="col-xs-10" id="zb_org">
								<span></span>
							</td>
						</tr>
						<tr class="row">
							<th class="col-xs-2">主题维度</th>
							<td class="col-xs-10" id="zb_dim">
								<span></span>
							</td>
						</tr>
					</table>
				</div>
			</div>
			
			<div class='rt_content'>
				<div class="rt_content_tit">统计口径查询条件：</div>
				<div>
					<table class="rt_content_cen">
						<tr class="row" id="thematic_dimension_tr2" style="display:none">
							<th id="dim_x_name2" class="col-xs-2"></th>
							<td class="col-xs-10" id=" ">
								<div class="pr in-block" style="width:30%;">
									<input type="hidden" id="thematic_dimension2" name="thematic_dimension2" value=""/>
									<input class="txt_inp input dd" type="text" id="_thematic_dimension2" title="请选择主题维度"  autocomplete="off" data-to="thematic_dimension2" data-type="json" data-src="_json_thematic_dimension" onkeydown="return false;" style="width:97%;height:16px;text-align:center;"/>
								</div>
							</td>
						</tr>
						<tr class="row">
							<th class="col-xs-2">出院科室</th>
							<td class="col-xs-10" id=" ">
								<div class="pr in-block" style="width:30%;">
									<input type="hidden" id="leaHos_office2" name="leaHos_office2" value=""/>
									<input class="txt_inp input dd" type="text" id="_leaHos_office2" title="请选择出院科室"  autocomplete="off" data-to="leaHos_office2" data-type="json" data-src="_json_leaHos_office" onkeydown="return false;" style="width:97%;height:16px;text-align:center;"/>
								</div>
							</td>
						</tr>
						<tr class="row">
							<th class="col-xs-2">日期</th>
							<td class="col-xs-10" id=" ">
								<!-- 按 xx 统计 -->
								<div class="pr" style="float:left;margin-right:15px;">
									<input type="hidden" id="dim_tj" name="dim_tj" value="1" />
									<input type="text" id="_dim_tj" class="txt_inp input dd" autocomplete="off"
										disableautocomplete data-to="dim_tj" data-type="json"
										data-src="_json_dims_tj" onkeydown="return false;"
										style="width: 80px;height:16px;text-align:center;" /> 
								</div>
								<!-- 按  年 -->
								<div class="pr" style="float:left;margin-right:15px;">
									<input type="hidden" id="year_s_tj" name="year_s_tj" value="" />
									<input type="text" id="_year_s_tj" class="txt_inp input dd" autocomplete="off"
										disableautocomplete data-to="year_s_tj" data-type="json"
										data-src="_json_years_tj" onkeydown="return false;"
										style="width: 80px;height:16px;text-align:center;" value="" />
								</div>
								<!-- 按  季 -->
								<div class="pr" style="float:left;margin-right:15px;" id="serson_div">
									<input type="hidden" id="serson_tj" name="serson_tj" value="S1" />
									<input type="text" id="_serson_tj" class="txt_inp input dd" autocomplete="off"
										disableautocomplete data-to="serson_tj" data-type="json"
										data-src="_json_serson_tj" onkeydown="return false;"
										style="width:80px;height:16px;text-align:center;" value="" />
								</div>
								<!-- 按  月 -->
								<div class="pr" style="float: left;margin-right:15px;">
									<input type="hidden" id="month_tj" name="month_tj" value="01" />
									<input type="text" id="_month_tj" class="txt_inp input dd"
										autocomplete="off" disableautocomplete data-to="month_tj"
										data-type="json" data-src="_json_months_tj" onkeydown="return false;"
										style="width: 70px;height:16px;text-align:center;" value="" />
								</div>
								<!-- 按  日 -->
								<div class="pr" style="float: left">
									<input type="hidden" id="day_tj" name="day_tj" value="01" />
									<input type="text" id="_day_tj" class="txt_inp input dd" autocomplete="off"
										disableautocomplete data-to="day_tj" data-type="json"
										data-src="_json_days_tj" onkeydown="return false;"
										style="width: 70px;height:16px;text-align:center;"  value=""/>
								</div> 
							</td>
						</tr>
						<tr class="row">
							<td class="col-xs-12" colspan="2" style="text-align:right;height:35px;">
								<button type="button" id="search_statistic" disabled onclick="search_statistic_caliber()" class="btn btn-primary">查询</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
			
			<div class='rt_content'>
				<div class="rt_content_tit">统计口径查询结果：
					<div class="in-block" style="float:right;">
						<!-- <button id="dim_kpi" type="button" class="btn btn-primary" disabled>设置维度</button> -->
						 <button id="statistics_kpi" type="button" class="btn btn-primary" disabled>设置口径</button> 
						<!-- <button id="search_kpi" type="button" class="btn btn-red" disabled>公式查询</button> -->
					</div>
				</div>
				<!-- <div  style="max-height:190px;border:1px solid #d3d3d3;overflow:auto;"> -->
				<div  style="max-height:190px;border:1px solid #d3d3d3;">
					<table class="rt_content_sec">
						<tr>
							<th style="width:5%">序号</th>
							<th style="width:15%">统计条件项</th>
							<th style="width:15%">条件关系</th>
							<th style="width:30%">取值范围</th>
							<th style="width:15%">条件内部关系</th>
						</tr>
						<tbody id="table_statistic_caliber">
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="rt_tab_down">
			<div class="rt_down_title">
				<div class="in-block">
					<span>指标数据验证</span>
				</div>
			</div>
			<div class="rt_down_cen">
				<table>
					<tr class="row" id="thematic_dimension_tr" style="display:none">
						<td class="col-xs-12" colspan="2">
						    <div>
								<div id="dim_x_name" class="in-block"></div>
								<div class="pr in-block" style="width:20%;">
									<input type="hidden" id="thematic_dimension" name="thematic_dimension" value=""/>
									<input class="txt_inp input dd" type="text" id="_thematic_dimension" title="请选择主题维度"  autocomplete="off" data-to="thematic_dimension" data-type="json" data-src="_json_thematic_dimension" onkeydown="return false;" style="width:97%;height:16px;text-align:center;"/>
								</div>
							</div> 
						</td>
					</tr>
					<tr class="row">
						<td class="col-xs-12" colspan="2">
						    <div class="in-block">
								<span>出院科室：</span>
								<div class="pr in-block" style="width:60%;">
									<input type="hidden" id="leaHos_office" name="leaHos_office" value=""/>
									<input class="txt_inp input dd" type="text" id="_leaHos_office" title="请选择出院科室"  autocomplete="off" data-to="leaHos_office" data-type="json" data-src="_json_leaHos_office" onkeydown="return false;" style="width:97%;height:16px;text-align:center;"/>
								</div>
							</div> 
						</td>
					</tr>
					<tr class="row">
						<td class="col-xs-12">
							<span>出院日期：</span>
						</td>
					</tr>
					<tr class="row" id="year_tr" style="display:none">
						<td class="col-xs-12" style="padding-top:2px;">
							<div>
								<div style="display:inline-block;width:70px;">
									<label style="height:28px;line-height:28px;margin-right:10px;font-weight:500;color:#555;" >
					       				<input type="radio" style="border-color:#555" id="yearcheck" name= "timecheck" value="1" checked="true" />
					       				年
					       			</label>
				       			</div>
				       			<div class="pr" style="width:10.6%;margin-right:19px;display:inline-block;vertical-align: middle;">   
									<input type="hidden" id="year" name="year"/>
									<input type="text" id="_year" class="input inp dd txt_inp" title="请选择起始年份" value="" autocomplete="off" data-to="year" data-type="json" data-src="_json_years" onkeydown="return false;" style="width:100%;height:16px;text-align:center;"/>																					
								</div>
								<i style="color:#999">—</i>
								<div class="pr" style="width:10.6%;margin-left:5px;display:inline-block;vertical-align: middle;">
									<input type="hidden" id="year2" name="year2"/>
									<input type="text" id="_year2" class="input inp dd txt_inp" title="请选择终止年份" value="" autocomplete="off" data-to="year2" data-type="json" data-src="_json_years2" onkeydown="return false;" style="width:100%;height:16px;text-align:center;"/>																							
								</div>
				
							</div>
						</td>
					</tr>
					<tr class="row" id="season_tr" style="display:none">
						<td class="col-xs-12" style="padding-top:0px;">
							<div>
								<div style="display:inline-block;width:70px;">
									<label style="height:28px;line-height:28px;margin-right:10px;font-weight:500;color:#555;">
					       				<input type="radio" style="border-color:#555" id="seasoncheck" value="2"  name="timecheck" />
					       				季
					       			</label>
				       			</div>
				       			<div class="pr" style="width:12%;margin-right:18px;display:inline-block;vertical-align: middle;">
									<input type="hidden" id="season_year" name="season_year"/>
									<input type="text" id="_season_year" class="input inp dd txt_inp" title="请选择起始年份" value="" autocomplete="off" data-to="season_year" data-type="json" data-src="_json_years_2" onkeydown="return false;" style="width:97%;height:16px;text-align:center;"/>																							
								</div>
								<div class="pr" style="width:12%;margin-right:17px;display:inline-block;vertical-align: middle;">
									<input type="hidden" id="season" name="season" value="S1"/>
									<input type="text" id="_season" class="input inp dd txt_inp" title="请选择起始季度" value="" autocomplete="off" data-to="season" data-type="json" data-src="_json_season1" onkeydown="return false;" style="width:97%;height:16px;text-align:center;"/>																							
								</div>
								<i style="color:#999">—</i>
								<div class="pr" style="width:12%;margin-left:5px;margin-right:19px;display:inline-block;vertical-align: middle;">					
									<input type="hidden" id="season_year2" name="season_year2"/>
									<input type="text" id="_season_year2" class="input inp dd txt_inp" title="请选择终止年份" value="" autocomplete="off" data-to="season_year2" data-type="json" data-src="_json_years2_2" onkeydown="return false;" style="width:98%;height:16px;text-align:center;"/>																		
								</div>
								<div class="pr" style="width:12%;display:inline-block;vertical-align: middle;">
									<input type="hidden" id="season2" name="season2" value="S4"/>
									<input type="text" id="_season2" class="input inp dd txt_inp" title="请选择终止季度" value="" autocomplete="off" data-to="season2" data-type="json" data-src="_json_season2" onkeydown="return false;" style="width:98%;height:16px;text-align:center;"/>																							
								</div>
							</div>
						</td>
					</tr>
					<tr class="row" id="month_tr" style="display:none">
						<td class="col-xs-12"  style="padding-top:2px;">
							<div>
								<div style="display:inline-block;width:70px;">
									<label style="height:28px;line-height:28px;margin-right:10px;font-weight:500;color:#555;">
					       				<input type="radio" style="border-color:#555" id="monthcheck" value="3" name="timecheck"/>
					       				月
					       			</label>
				       			</div>
				       			<div class="pr" style="width:12%;margin-right:18px;display:inline-block;vertical-align: middle;">
									<input type="hidden" id="month_year" name="month_year"/>
									<input type="text" id="_month_year" class="input inp dd txt_inp" title="请选择起始年份" value="" autocomplete="off" data-to="month_year" data-type="json" data-src="_json_years_3" onkeydown="return false;" style="width:97%;height:16px;text-align:center;"/>																							
								</div>
								<div class="pr" style="width:12%;margin-right:17px;display:inline-block;vertical-align: middle;">
									<input type="hidden" id="month" name="month" value="01"/>
									<input type="text" id="_month" class="input inp dd txt_inp" title="请选择起始月份" value="" autocomplete="off" data-to="month" data-type="json" data-src="_json_month1" onkeydown="return false;" style="width:97%;height:16px;text-align:center;"/>																							
								</div>
								<i style="color:#999">—</i>
								<div class="pr" style="width:12%;margin-left:5px;margin-right:19px;display:inline-block;vertical-align: middle;">					
									<input type="hidden" id="month_year2" name="month_year2"/>
									<input type="text" id="_month_year2" class="input inp dd txt_inp" title="请选择终止年份" value="" autocomplete="off" data-to="month_year2" data-type="json" data-src="_json_years2_3" onkeydown="return false;" style="width:98%;height:16px;text-align:center;"/>																		
								</div>
								<div class="pr" style="width:12%;display:inline-block;vertical-align: middle;">
									<input type="hidden" id="month2" name="month2" value="12"/>
									<input type="text" id="_month2" class="input inp dd txt_inp" title="请选择终止月份" value="" autocomplete="off" data-to="month2" data-type="json" data-src="_json_month2" onkeydown="return false;" style="width:98%;height:16px;text-align:center;"/>																							
								</div>
							</div>
						</td>
					</tr>
					<tr class="row"  id="day_tr" style="display:none">
						<td class="col-xs-12" style="padding-top:2px;">
							<div>
								<div style="display:inline-block;width:70px;">
									<label style="height:28px;line-height:28px;margin-right:10px;font-weight:500;color:#555;">
					       				<input type="radio" style="border-color:#555" value="4" name="timecheck"/>    				
					       				日
					       			</label>
				       			</div>
				       			<div class="demo pr" style="display:inline-block;width:27%;">
				            		<input type="text" id="config-demo" title="点击选取起始日期和终止日期" style="width:95%;height:16px;" value="" class="form-control input inp dd txt_inp">
				            		<!-- <i class="glyphicon glyphicon-calendar fa fa-calendar"></i> -->
				          		</div>
							</div>
						</td>
					</tr>
					<tr class="row">
						<td class="col-xs-12" colspan="2">
							<span>排序1：</span>
							<div class="pr in-block" style="width:13%">
								<input type="hidden" id="record" name="record"  value="FPRN"/>
								<input class="txt_inp input dd" type="text" id="_record" value="" title="请选择病案" autocomplete="off" data-to="record" data-type="json" data-src="_json_record" onkeydown="return false;" style="width:90%;height:16px;text-align:center;"/>
							</div>
							<div class="in-block ver_align" style="margin-left:8px;">
								<label class="lab_inp">
									<input class="ver_align" type="checkbox" id="sort1" name="sort1"/>
									<div class="in-block ver_align">降序</div>
								</label>
							</div>
					
							<span style="margin-left:3px;">排序2：</span>
							<div class="pr in-block" style="width:13%">
								<input type="hidden" id="inHos_num" name="inHos_num" value="FPRN"/>
								<input class="txt_inp input dd" type="text" id="_inHos_num" value="" title="请选择住院次数" autocomplete="off" data-to="inHos_num" data-type="json" data-src="_json_inHos_num" onkeydown="return false;" style="width:90%;height:16px;text-align:center;"/>
							</div>
							<div class="in-block ver_align" style="margin-left:8px">
								<label class="lab_inp">
									<input class="ver_align" type="checkbox" id="sort2" name="sort2"/>
									<div class="in-block ver_align">降序</div>
								</label>
							</div>
						</td>
					</tr>
					<tr class="row">
						<td class="col-xs-12" colspan="8">
							<button type="button" id="btn_preview" disabled onclick="preview()" class="btn btn-green">预览&nbspL</button>
							<!-- <div id="remind" class="red" style="display:none;">(请先选择统计口径)*</div> -->
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>

<!-- 指标统计口径模态框 -->
<div class="modal fade" id="modal_statistics" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog" style="width:85%;" >
		<div class="modal-content">
			<div class="modal-header" style="height:46px;background-color:#F7F7F7;border-radius: 5px 5px 0 0">			
				<button type="button" class="close" data-dismiss="modal">
					<span class="del_con" aria-hidden="true" style="font-size:30px;">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" style="color:#000;">指标统计口径设置</h4>
			</div>
			<div class="modal-body">
				<div style="width:100%;height:480px;border:2px solid #d3d3d3;padding:5px;">
					<!--左侧-->
					<div id="con_lf" class="in-block" style="width:45%; box-sizing: border-box;vertical-align:top;">
						<!--左侧的左边树列表-->
						<div id="con_lf_lf" style="float:left;width:45%;">
							<div style="text-align: right">
								<input type="text" id="con_seek"  style="width:50%;height:18px;cursor:text;border-radius:4px;"placeholder="搜索" class="form-control input inp">
								<button type="button" id="condition_search" class="btn btn-secondary" style="margin:5px 0 5px 5px;height:26px;line-height:10px;"> 搜索</button>
							</div>
							<div  style="border:2px solid #d3d3d3;height:425px;">
								<div style="max-height:421px;overflow:auto;z-index:1500;">
									<table id="con_lf_lf_tab" style="width:100%;">
										
									</table>
								</div>
							</div>
						</div>
						<!--左侧的中部两个按钮-->
						<div id="con_lf_cen" style="float:left;width:10%;padding:5px;">
							<div style="position:relative;top:200px;">
								<button id="rt_shift" class="btn btn-info" style="margin-bottom:40px;">&gt;&gt;</button>
								<button id="lf_shift" class="btn btn-info">&lt;&lt;</button>
							</div>
						</div>
						<!--左侧的右边已查询条件列表-->
						<div id="con_lf_rt" style="float:right;width:45%;">
							<div style="border:2px solid #d3d3d3;height:425px;">
								<div style="text-align: center;background-color:#f5f5f5;height:25px;line-height:25px;border-bottom:1px solid #d3d3d3;">已选查询条件项</div>
								<div style="max-height:421px;overflow:auto">
									<table id="con_lf_rt_tab" style="width:100%;">
									
									</table>
								</div>
							</div>
							<div id="logic_dad" style="text-align:center;">
								<div style="text-align:left;color:blue;">条件间关系</div>
								<div class="in-block" style="width:60px;">
									<label class="lab_inp">
										<input type="radio" checked  id="also2" name="relation"/>
										<span>并且</span>
									</label>
								</div>
								<div class="in-block" style="width:60px;">
									<label class="lab_inp">
										<input type="radio" id="maybe2" name="relation"/>
										<span>或者</span>
									</label>
								</div>
							</div>
						</div>
					</div>
					<!--右侧阴影背景色详情页-->
					<div id="con_rt" class="in-block" style="width:52%;height:425px;margin-left:10px;box-sizing:border-box">
						<div>
							<table style="width:100%;"	>
								<tr class="row">
									<td calss="col-xs-12">
										<p class="in-block">当前条件：</p>
										<b>
											<input id="current_val" type="text" value="" readonly style="border:none;color:blue;font-size:15px;"/>
										</b>
									</td>
									
								</tr>
							</table>
						</div>
						
						<div id="rt_content" style="height:425px;background-color:#f5f5f5;padding-top:10px;overflow:auto;">
							
						</div>
					</div>
			
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="statistics_confirm()" >确定</button>
				<button type="button" class="btn btn-default del_con" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>	


<!-- alert共用模态框 -->
<div class="modal fade" id="modal_alert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog" style="width:300px;margin:65px auto;" >
		<div class="modal-content">
			<div class="modal-header">			
				<button type="button" class="close" data-dismiss="modal">
					<span class="is_true" aria-hidden="true" style="position:relative;top:-8px;">&times;</span><span class="sr-only">Close</span>
				</button>
			</div>
			<div class="modal-body">
				<div style="height:65px;" id="txt_insert">
					<!-- <p>TEXT！</p> -->
				</div>
			</div>
			<div class="modal-footer" style="text-align:center;">
				<button type="button" class="btn btn-primary is_true" data-dismiss="modal">确定</button>
			</div>
		</div>
	</div>
</div>	
<!-- ajax共用模态框 -->
<div class="modal fade" id="modal_alert2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog" style="width:300px;margin:65px auto;" >
		<div class="modal-content">
			<div class="modal-header">			
				<button type="button" class="close" data-dismiss="modal">
					<span class="is_true" aria-hidden="true" style="position:relative;top:-8px;">&times;</span><span class="sr-only">Close</span>
				</button>
			</div>
			<div class="modal-body">
				<div style="height:65px;" id="txt_insert2">
					<!-- <p>TEXT！</p> -->
				</div>
			</div>
			<div class="modal-footer" style="text-align:center;">
				<button type="button" class="btn btn-primary" id="ajax_confirm" data-dismiss="modal">确定</button>
			</div>
		</div>
	</div>
</div>	
<!-- 删除模态框 -->
<div class="modal fade" id="modal_del" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog" style="width:300px;margin:65px auto;" >
		<div class="modal-content">
			<div class="modal-header" style="height:46px;background-color:#f7f7f7;border-radius: 5px 5px 0 0">			
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true" style="font-size:30px;">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">确认删除</h4>
			</div>
			<div class="modal-body">
				<div style="height:65px;">
					<p>确认删除该行？</p>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="del_true" data-dismiss="modal">确定</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>	

<!-- 左侧指标树 -->
<script id="tpl11" type="text/template">
	[%
	var colspan=calWidth(data,1);
	%]
	<table cellspacing="0" cellpadding="0" width="100%" class="list1" >
		<tr>
            <th style="width:500px;" colspan="[%= colspan %]">指标列表</th>
		</tr>

	[%
		process(data);	
	%]
		
	</table>

	[%
	function process(data) {
		for(var i in data) {
			if(data[i].children.length!=0) {
				var df='for_'+data[i].kpi_id;
				var pid=data[i].kpi_id;
	%]	[% if(data[i].kpi_type == 0){%]		
				<tr>
					<td id="[%=data[i].kpi_id %]_[%=data[i].kpi_type %]_[%= data[i].kpi_name %]" onclick="get_kpi_id(this)" colspan="[%= colspan %]" data-for="[%=df%]" data-row="[%=0%]"  data-child="[%= pid %]" style="text-align:left;">
						<i class="fa fa-minus" style="border:solid 1px #efefef;padding:2px 3px;"></i> 
						[%= data[i].kpi_name %]
					</td>
				</tr>
	[%}else if(data[i].kpi_type == 1){%]
				<tr>
					<td id="[%=data[i].kpi_id %]_[%=data[i].kpi_type %]_[%= data[i].kpi_name %]" onclick="get_kpi_id(this)" colspan="[%= colspan %]" data-for="[%=df%]" data-row="[%=0%]"  data-child="[%= pid %]" style="text-align:left;">
						<i class="fa fa-minus" style="border:solid 1px #efefef;padding:2px 3px;"></i> 
						[%= data[i].kpi_name %]
					</td>
				</tr>	
	[%}%]
	[%		
				var rowspan=calHeight(data[i])-1;
				var cls=['for_'+data[i].kpi_id];
				var rowcls=['row_'+data[i].kpi_id];
				tree(data[i].children,rowspan,colspan,cls,rowcls,pid);
			}else {
	%]
			[% if(data[i].kpi_type == 0){%]	
				<tr>
					<td id="[%=data[i].kpi_id %]_[%=data[i].kpi_type %]_[%= data[i].kpi_name %]" onclick="get_kpi_id(this)" colspan="[%= colspan %]" style="text-align:left">
						[%= data[i].kpi_name %]
					</td>
				</tr>
			[%}else if(data[i].kpi_type == 1){%]
				<tr>
					<td id="[%=data[i].kpi_id %]_[%=data[i].kpi_type %]_[%= data[i].kpi_name %]" onclick="get_kpi_id(this)" colspan="[%= colspan %]" style="text-align:left">
						[%= data[i].kpi_name %]
					</td>
				</tr>
			[%}%]
	[%									
			}
		}
	}
	%]
	[%
	function tree(data,rowspan,colspan,cls,rowcls,pid) {				
			colspan--;
			for(var i in data) {
				if(data[i].children.length!=0) {
					var ncls=[];
					ncls=ncls.concat(cls);
					ncls.push('for_'+data[i].kpi_id);
					var cid=data[i].kpi_id;					
	%]
			[% if(data[i].kpi_type == 0){%]	
					<tr class="[%for(var j in cls){%][%=cls[j]%] [%}%]" pid="[%= pid %]">
						[%if(i==0){%]<td style="width:30px;background:#fff;" rowspan="[%= rowspan %]" class="[%= rowcls[rowcls.length-1] %]"></td>[%}%]
						<td id="[%=data[i].kpi_id %]_[%=data[i].kpi_type %]_[%= data[i].kpi_name %]" onclick="get_kpi_id(this)" colspan="[%= colspan %]" data-for="[%=ncls[ncls.length-1]%]" data-row="[%for(var j in rowcls){%][%=rowcls[j]%] [%}%]" data-child="[%= cid %]" style="text-align:left;">
							<i class="fa fa-minus" style="border:solid 1px #efefef;padding:2px 3px;"></i> 
							[%= data[i].kpi_name %]
						</td>
					</tr>
			[%}else if(data[i].kpi_type == 1){%]
					<tr class="[%for(var j in cls){%][%=cls[j]%] [%}%]" pid="[%= pid %]">
						[%if(i==0){%]<td style="width:30px;background:#fff;" rowspan="[%= rowspan %]" class="[%= rowcls[rowcls.length-1] %]"></td>[%}%]
						<td id="[%=data[i].kpi_id %]_[%=data[i].kpi_type %]_[%= data[i].kpi_name %]" onclick="get_kpi_id(this)" colspan="[%= colspan %]" data-for="[%=ncls[ncls.length-1]%]" data-row="[%for(var j in rowcls){%][%=rowcls[j]%] [%}%]" data-child="[%= cid %]" style="text-align:left;">
							<i class="fa fa-minus" style="border:solid 1px #efefef;padding:2px 3px;"></i> 
							[%= data[i].kpi_name %]
						</td>
					</tr>
			[%}%]
	[%
					var h=calHeight(data[i])-1;
					var nrowcls=[];
					nrowcls=nrowcls.concat(rowcls);
					nrowcls.push('row_'+data[i].kpi_id);
					tree(data[i].children,h,colspan,ncls,nrowcls,cid);
				}else if(data[i].children.length==0) {
	%]
				[% if(data[i].kpi_type == 0){%]
					<tr class="[%for(var j in cls){%][%= cls[j] %] [%}%]" pid="[%= pid %]">
						[%if(i==0){%]<td style="width:30px; background:#fff;" rowspan="[%= rowspan %]" class="[%= rowcls[rowcls.length-1] %]"></td>[%}%]
						<td id="[%=data[i].kpi_id %]_[%=data[i].kpi_type %]_[%= data[i].kpi_name %]" onclick="get_kpi_id(this)" colspan="[%= colspan %]" style="text-align:left;">
							[%= data[i].kpi_name %]
						</td>
					</tr>
				[%}else if(data[i].kpi_type == 1){%]
					<tr class="[%for(var j in cls){%][%= cls[j] %] [%}%]" pid="[%= pid %]">
						[%if(i==0){%]<td style="width:30px; background:#fff;" rowspan="[%= rowspan %]" class="[%= rowcls[rowcls.length-1] %]"></td>[%}%]
						<td id="[%=data[i].kpi_id %]_[%=data[i].kpi_type %]_[%= data[i].kpi_name %]" onclick="get_kpi_id(this)" colspan="[%= colspan %]" style="text-align:left;">
							[%= data[i].kpi_name %]
						</td>
					</tr>
				[%}%]
	[%
				}
			} 
	}	
	%]

	[%
	function calHeight(data) {
		var height=0;
		if(data.children.length==0) {
			return 1;
		}else {
			for(var i in data.children) {
				if(data.children[i].length!=0) {
					height+=calHeight(data.children[i]);
				}			
			}
			height+=1;
			return height;
		}
	}
	function calWidth(data,width) {
		var w=width,w1=0;
		for(var i in data) {
			if(data[i].children.length!=0) {
				w1=calWidth(data[i].children,width+1);
			}else {
				w1=width;
			}
			if(w<w1) {
				w=w1;
			}
		}
		return w;
	}
	%]	
</script>
<!-- 左侧指标树搜索结果列表 -->
<script id="tpl13" type="text/template">
   <table cellspacing="0" cellpadding="0" width="100%" class="list1" >
        [%
        for(var i in data){
		%]
		<tr>
			<td id="[%=data[i].kpi_id %]_[%=data[i].kpi_type %]_[%= data[i].kpi_name %]" onclick="get_kpi_id(this)"  style="text-align:left;">[%= data[i].kpi_name %]</td>	
		</tr>
       [%}%]
    </table>
</script>


<!-- 指标维度模态框里的科室树 -->
<script id="tpl2" type="text/template">
    <table cellspacing="0" cellpadding="0" width="100%" class="list1" >
        [%
        for(var i in data){
        var item = data[i];
		%]
		<tr id = "[%= item.branch_id %]_[%= item.par_id %]">
			<td><a title="添加"><span>[%= item.name %]</span></a></td>
		</tr>
		[%}%]
    </table>
</script>
<!-- 不显示全院  KpiDefDao 中updim2
 <script id="tpl3" type="text/template"> 
    <table id="table3_rt" cellspacing="0" cellpadding="0" width="100%" class="list1" >
		
        [%
        for(var i in data.dim2){
        var item =data.dim2[i];
		%]
		[%if(item.dim2=="全院"){%]
		
		[%}else{%]
		<tr id = "[%= item.kpi_dim_value %]">
			<td class="del" ><a>[%= item.dim2 %]</a></td>
		</tr>
		[%}%]
		[%}%]
    </table>
</script>    -->

<!-- 显示全院  KpiDefDao 中updim2（） 也要去掉“and kpi_dim_value_id<>10”-->
<script id="tpl3" type="text/template">
    <table id="table3_rt" cellspacing="0" cellpadding="0" width="100%" class="list1" >
		
        [%
        for(var i in data.dim2){
        var item =data.dim2[i];
		%]
		<tr id = "[%= item.kpi_dim_value %]">
			<td class="del" ><a>[%= item.dim2 %]</a></td>
		</tr>
		[%}%]
    </table>
</script>  
<script id="tpl4" type="text/template">
	
	[%
	var j=1;
	for(var i in data){
	var item = data[i];
	%]
		<tr>
			<td>[%= j %]</td>
			<td>[%= item.name %]</td>
			<td>[%= item.operation %]</td>
			<td>[%= item.var_right %]</td>
			<td>[%= item.icd_logic %]</td>
		</tr>
	[%j++;};%]

</script>

<!-- 统计口径的左侧的树 -->
<script id="sta_tpl" type="text/template">
     [% for(var i in data){
		if(data[i].id.split('_')[0]==1) { %]
			<tr id="[%= data[i].id %]">
				<td style="padding-left:5px;"><i class="fa fa-plus"></i><a>[%= data[i].name %]</a></td>
			</tr>
	[%}else if(data[i].id.split('_')[0]==2){%]
		<tr id="[%= data[i].id %]" data-name=[%= data[i].type %]><td><i class="opt_in fa"></i><a>[%= data[i].name %]</a></td></tr>
	[%}}%]
</script>

<script type="text/javascript">
	  var tableToExcel = (function() {
	  var uri = 'data:application/vnd.ms-excel;base64,'
	    , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><meta charset="UTF-8"><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
	    , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
	    , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) };
	  return function(table, name) {
	       if (!table.nodeType) table = document.getElementById(table)
	       var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML};
	       window.location.href = uri + base64(format(template, ctx));
	   }
	})()
</script>

<script type="text/javascript">

var  kpi_id="-10";
/**************** 左侧指标树生成 *******************/
//后台传数据  
function generate_tree(){
	//后端
     T.getJson('${ctx}/RStat/select/kpi_manage', function(res) {
   	//T.getJson('${ctx}/resources/json/cz_tree.json', function(res) {
    	 datasearch = res.data2;
		_get('table1').innerHTML = baidu.template('tpl11', res);
		
	}); 
}	
generate_tree();  	

/*********父级点击收缩展开事件*******/
$('#table1').on('click','td[data-for]',function(){
 	var obj=T(this);
 	var dad=$('#table1');
 	shrint(obj,dad);
});	 

//父级点击收缩展开函数
function shrint(obj,dad){
	if(obj.find('i').hasClass('fa-minus')) {//收缩
		var d_for=obj.data('for');//下级元素
		var d_row=obj.data('row');//上级元素
		d_row=d_row.substr(0,d_row.length-1);//去掉' '
		d_row=d_row.split(' ');//需要变化的rowspan		
		
		var ele=dad.find('tr.'+d_for);//需要操作的元素
		//console.log(ele);
		var h=0;//变化的rowspan			
		ele.each(function(){
			if(T(this).css('display')!='none') {
				h++;
			}
		});			
		obj.find('i').removeClass('fa-minus').addClass('fa-plus');			
		if(d_row!=0) {//不是第一层
			ele.hide();
			for(var i in d_row) {
				var td_row=dad.find('td.'+d_row[i]);
				var l=parseInt(td_row.attr('rowspan'));//原来的rowspan
				td_row.attr('rowspan',l-h);
			}
			//console.log(d_row);
		}else {
			ele.hide();	
		}			
	}else {//展开
		var cid=obj.attr('data-child');//子id
		var c_ele=dad.find('[pid='+cid+']');//直接子元素
		var c_l=0;
		var next_r=obj.parent().next().children().first();
		c_ele.each(function(){
			c_l++;
			var ts=T(this).find('i');
			if(ts.hasClass('fa-minus')) {
				ts.removeClass('fa-minus').addClass('fa-plus');
			}
		});
		c_ele.show();
		next_r.attr('rowspan',c_l);
		obj.find('i').removeClass('fa-plus').addClass('fa-minus');
		var cur_tr=obj.parent();//当前行
		var pid=cur_tr.attr('pid');			
		if(pid!=undefined) {//不是第一层
			var name_r=obj.data('row');
			name_r=name_r.substr(0,name_r.length-1);
			var arr_r=name_r.split(' ');
			for(var i in arr_r) {
				var row=dad.find('td.'+arr_r[i]);
				var par=row.parent().prev();
				var d_for=par.children('td[data-for]').data('for');
				c_ele=dad.find('tr.'+d_for);
				c_l=0;
				c_ele.each(function(){
					var ts=T(this);
					if(ts.css('display')!='none') {
						c_l++;
					}
				});
				row.attr('rowspan',c_l);
			}
		}
	}		    	
};

/****************左侧树的搜索按钮事件********************/
T("#kpi_search").click(function(){
	var kpi_name=T("#kpi_seek").val();
	if(kpi_name.length==0){
		$("#txt_insert p").remove();
		$("#txt_insert").append("<p>请输入搜索关键词！</p>");
		$("#modal_alert").modal("toggle");
		T.getJson('${ctx}/RStat/select/kpi_manage', function(res) {
			_get('table1').innerHTML = baidu.template('tpl11', res);
		})

	}else{
 		T.getJson("${ctx}/RStat/getTreeresWithType?kpi_name="+kpi_name, function(res) {
 			if(res.data.length==0){
				$("#txt_insert p").remove();
				$("#txt_insert").append("<p>没有找到相关指标,请核对搜索关键词！</p>");
				$("#modal_alert").modal("toggle");
			}else{
				_get('table1').innerHTML = baidu.template('tpl13', res);
			}
	   })
	
	}		
})


/************** 点击左侧树的最后一节子菜单修改右侧表头名称 **************/
function get_kpi_id(e){
	//初始化
	$('#year_tr').hide();
	$('#yearcheck').prop("checked",true);
	$('#season_tr').hide();
	$('#month_tr').hide();
	$('#day_tr').hide();
	$('#thematic_dimension_tr').hide();
	$('#thematic_dimension_tr2').hide();
	
	//清空统计口径的日期条件
	$("#dim_tj").val("1");
	$("#serson_div").hide();
	$("#_month_tj").hide();
	$("#_day_tj").hide();
	//清空统计口径结果表格
	$("#table_statistic_caliber").find("tr").remove();
	
	kpi_id = e.id.split('_')[0];
	var kpi_type = e.id.split('_')[1];
	var kpi_name = e.id.split('_')[2];
	T.getJson('${ctx}/RStat/get_Source?kpi_id='+kpi_id, function(res) {	
		var status_kpi=res.source;
		 if(status_kpi=='2'){
			 	$("#zb_time_s").find('span').remove();
				$("#zb_org_s").find('span').remove();
				$("#zb_org_s").find('a').remove();
				$("#zb_dim_s").find('span').remove();
				T.getJson('${ctx}/RStat/getKpi_detail_tod?kpi_id='+kpi_id, function(res) {	
					var t=res.Freq;
					if(t=='1'){
						t="年";
					
					}else if(t=='2'){
						t="年  季  ";
						
					}else if(t=='3'){
						t="年  季  月";
						
					}else if(t=='4'||t=='-10'){
						t="年  季  月  日"
						
					}
					$('#zb_time_s').append('<span>'+t+'</span>');
					for(var i=0;i<res.dim2.length;i++){
						$('#zb_org_s').append('<span>'+res.dim2[i].dim2+'</span>');
					}
					$('#zb_dim_s').append('<span>'+res.dim3+'</span>');
				})
				
			T.getJson('${ctx}/RStat/getKpi_backfill?kpi_id='+kpi_id, function(res) {
				if(res.kpi_name=="underfine"){
					 T('#add_index1').val("点击添加指标一");
					 T('#add_index2').val("点击添加指标二");
					 T('#operation').val("3");
				}else{
					T('#formula_true').attr("disabled",true); 
					 T('#add_index1').val(res.kpi_name1);
					 T('#add_index2').val(res.kpi_name2);
					 T('#operation').val(res.formula);
					
				}
				
			})	
				
				$('#kpi_define').css('display','none');
				$('#kpi_formula').css('display','inline-block');
				 T('#_operation').dropdown({after:function(){
					 $('#formula_true').attr("disabled",false); 
				 }});
				 
			}else{
				$('#kpi_formula').css('display','none');
				$('#kpi_define').css('display','inline-block');
			}
	})

	if(kpi_type=='0'){//目录
		$("#dim_kpi").attr("disabled",true);
		$("#statistics_kpi").attr("disabled",true);
		$("#search_statistic").attr("disabled",true);
		$("#btn_preview").attr("disabled",true);
	}else if(kpi_type=='1'){//指标
		
		$("#zb_time").find('span').remove();
		$("#zb_org").find('span').remove();
		$("#zb_org").find('a').remove();
		$("#zb_dim").find('span').remove();
		T.getJson('${ctx}/RStat/getKpi_detail_tod?kpi_id='+kpi_id, function(res) {	
			var t=res.Freq;
			if(t=='1'){
				t="年";
				$('#year_tr').show();
				_json_dims_tj = [
	             	{id : '1', text : '按年'}
	             ];
				T("#_dim_tj").dropdown({after:_dim_tj});
			}else if(t=='2'){
				t="年  季  ";
				$('#year_tr').show();
				$('#season_tr').show();
				_json_dims_tj = [
	             	{id : '1', text : '按年'},
	             	{id : '2', text : '按季'}
	             ];
				T("#_dim_tj").dropdown({after:_dim_tj});
			}else if(t=='3'){
				t="年  季  月";
				$('#year_tr').show();
				$('#season_tr').show();
				$('#month_tr').show();
				_json_dims_tj = [
	             	{id : '1', text : '按年'},
	             	{id : '2', text : '按季'},
	             	{id : '3', text : '按月'}
	             ];
				T("#_dim_tj").dropdown({after:_dim_tj});
			}else if(t=='4'||t=='-10'){
				t="年  季  月  日"
				$('#year_tr').show();
				$('#season_tr').show();
				$('#month_tr').show();
				$('#day_tr').show();
				_json_dims_tj = [
	             	{id : '1', text : '按年'},
	             	{id : '2', text : '按季'},
	             	{id : '3', text : '按月'},
	             	{id : '4', text : '按日'}
	             ];
				T("#_dim_tj").dropdown({after:_dim_tj});
			}
			
			_json_leaHos_office=[];
			if(res.dim2.length!=0){
				$("#leaHos_office").val(res.dim2[0].kpi_dim_value);
				$("#leaHos_office2").val(res.dim2[0].kpi_dim_value);
				$("#_leaHos_office").val(res.dim2[0].dim2);
				$("#_leaHos_office2").val(res.dim2[0].dim2);
			}else{
				$("#leaHos_office").val("");
				$("#leaHos_office2").val("");
				$("#_leaHos_office").val("");
				$("#_leaHos_office2").val("");
			}
			
			for(var i=0;i<res.dim2.length;i++){
				$('#zb_org').append('<span>'+res.dim2[i].dim2+'</span>');
				 _json_leaHos_office.push({id : res.dim2[i].kpi_dim_value, text :res.dim2[i].dim2 });
			}
			T('#_leaHos_office').dropdown({height:"250"});
			T('#_leaHos_office2').dropdown({height:"250"});
			
			$('#zb_time').append('<span>'+t+'</span>'); 
			
			$('#zb_dim').append('<span>'+res.dim3+'</span>');
			_json_thematic_dimension=[];
			if(res.dim3 != ""){
				$("#dim_x_name").html(res.dim3+"：");
				$("#dim_x_name2").text(res.dim3);
				dim_x_id=res.dim_name;
				
				if (res.dimlist.length!=0) {
					$("#thematic_dimension").val(res.dimlist[0].kpi_dim_id);
					$("#thematic_dimension2").val(res.dimlist[0].kpi_dim_id);
					$("#_thematic_dimension").val(res.dimlist[0].kpi_dim_value_name);
					$("#_thematic_dimension2").val(res.dimlist[0].kpi_dim_value_name);
				}else{
					$("#thematic_dimension").val("");
					$("#thematic_dimension2").val("");
					$("#_thematic_dimension").val("");
					$("#_thematic_dimension2").val("");
				}
				for (var j = 0; j < res.dimlist.length; j++) {
					_json_thematic_dimension.push({id:res.dimlist[j].kpi_dim_id,text:res.dimlist[j].kpi_dim_value_name});
				}
				T('#_thematic_dimension').dropdown({height:'250px'});
				T('#_thematic_dimension2').dropdown({height:'250px'});
				$("#thematic_dimension_tr").show();
				$("#thematic_dimension_tr2").show();
			}else{
				dim_x_id="";
			}
			//查询统计口径结果表格数据		
			search_statistic_caliber();
		}); 	
	
		//修改右侧表头指标名称
		$('#_kpi_name').text(kpi_name);    
		$('.dim_name').text(kpi_name);    
		
		$('#_kpi_name2').text(kpi_name);    
		
		/* 让右侧的按钮可用 */
		$("#dim_kpi").attr("disabled",false);
		$("#statistics_kpi").attr("disabled",false);
		$("#search_statistic").attr("disabled",false);
		$("#btn_preview").attr("disabled",false);
	}
	
}


//运算符下拉框
var _json_operation=[
     {id:'0',text:'+'},                
     {id:'1',text:'-'},                
     {id:'2',text:'*'},                
     {id:'3',text:'/'},                
     {id:'4',text:'%'}               
     ];
//T('#_operation').dropdown();

/************************ 选择计算 指标一 模态框 *******************************************/
//$("#add_index1").click(function(){
function add_index1(){
	$("#modal_index1").modal('toggle');
	//加载指标一的json数据，去除计算型
	T.getJson('${ctx}/RStat/getleft_kpi',function(res){
		var data = {"data":res};
		_get('index_table1').innerHTML = baidu.template('tp_ly',data);
	})
};	
//});
//计算指标一  点击收缩
$('#index_table1').on('click','td[data-for]',function(){
 	var obj=T(this);
 	var dad=$('#index_table1');
 	shrint(obj,dad);
});
//计算指标一树搜索
T("#search_index1").click(function(){
	var kpi_name=T("#search_inp").val();
	if(kpi_name.length==0){
		$("#txt_insert p").remove();
		$("#txt_insert").append("<p>请输入搜索关键词！</p>");
		$("#modal_alert").modal("toggle");
		T.getJson('${ctx}/RStat/getleft_kpi',function(res){
			var data = {"data":res};
			_get('index_table1').innerHTML = baidu.template('tp_ly',data);
		})

	}else{
 		T.getJson("${ctx}/RStat/left_kpi_s?kpiname="+kpi_name, function(res) {
 			if(res.data.length==0){
				$("#txt_insert p").remove();
				$("#txt_insert").append("<p>没有找到相关指标,请核对搜索关键词！</p>");
				$("#modal_alert").modal("toggle");
			}else{
				var data = {"data":res};
				_get('index_table1').innerHTML = baidu.template('tp_ly',data);
			}
	   })
	
	}
})
//计算指标一的指标树最后一节子节点点击事件  //赋值给右侧table（只能赋一个）
var left_kpi_id;
var right_kpi_id;
var kpi_symbol;
function kpi_index1(e){
	var id=e.id;
	
	 left_kpi_id=e.id.split('_')[0];
	
	$('#index_table2 tr').find('td').remove();
	var td_id=T(e).attr('id');
	var txt=T(e).text();
	clone_td="<td id='"+td_id+"_rt'>"+txt+"</td>";
	$('#index_table2 tr').append(clone_td);
	$("#sure_index1").click(function(){
		/* $("#zb_org_s").find('span').remove();
		$("#zb_org_s").find('a').remove();	 */	
		$('#formula_true').attr("disabled",false); 
		var txt_clone=$('#index_table2 tr').find('td').text();
		if(txt_clone){$("#add_index1").val(txt_clone);}
		else{$("#add_index1").val("点击添加指标1");}
		var data_id=td_id.substr(0,3)
		$("#add_index1").attr("data_id",data_id);
/* 		var kpi_res=T('#add_index1').val();
		$('#zb_org_s').append('<span>'+kpi_res+'</span>'); */
	});
	$("#"+td_id+"_rt").click(function(){
		$(this).remove();//点击右侧的td时删除
	});
}
$(".del_index").click(function(){
	$('#index_table2 tr').find('td').remove();	//清除所选
	$("#search_inp").val("");
});


/******************************** 选择计算 指标二 模态框 *******************************************/
//$("#add_index2").click(function(){
function add_index2(){
	$("#modal_index2").modal('toggle');
	//加载树
	T.getJson('${ctx}/RStat/getleft_kpi',function(res){
		var data = {"data":res};
		_get('index_table3').innerHTML = baidu.template('tp_ly_s',data);
	})
	
}
//});
//计算指标二  点击收缩
$('#index_table3').on('click','td[data-for]',function(){
 	var obj=T(this);
 	var dad=$('#index_table3');
 	shrint(obj,dad);
});
//计算指标二  树搜索
T("#search_index2").click(function(){
	var kpi_name=T("#search_inp2").val();
	if(kpi_name.length==0){
		$("#txt_insert p").remove();
		$("#txt_insert").append("<p>请输入搜索关键词！</p>");
		$("#modal_alert").modal("toggle");
		T.getJson('${ctx}/RStat/getleft_kpi',function(res){
			var data = {"data":res};
			_get('index_table3').innerHTML = baidu.template('tp_ly_s',data);
		})

	}else{
 		T.getJson("${ctx}/RStat/getTreeresWithType?kpi_name="+kpi_name, function(res) {
 			if(res.data.length==0){
				$("#txt_insert p").remove();
				$("#txt_insert").append("<p>没有找到相关指标,请核对搜索关键词！</p>");
				$("#modal_alert").modal("toggle");
			}else{
				var data = {"data":res};
				_get('index_table3').innerHTML = baidu.template('tp_ly_s',data);
			}
	   })
	
	}
})

//计算指标二 的指标树最后一节子节点点击事件  //赋值给右侧table（只能赋一个）
function kpi_index2(e){
	
	right_kpi_id=e.id.split('_')[0];
	
	$('#index_table4 tr').find('td').remove();
	var td_id=T(e).attr('id');
	var txt=T(e).text();
	clone_td="<td id='"+td_id+"_rt' >"+txt+"</td>";
	$('#index_table4 tr').append(clone_td);  
	$("#sure_index2").click(function(){
		T('#formula_true').attr("disabled",false); 
		var txt_clone=$('#index_table4 tr').find('td').text();
		if(txt_clone){$("#add_index2").val(txt_clone);}
		else{$("#add_index2").val("点击添加指标2");}
		var data_id=td_id.substr(0,3)
		$("#add_index2").attr("data_id",data_id);
	});
	$("#"+td_id+"_rt").click(function(){
		$(this).remove();//点击右侧的td时删除
	});
}
$(".del_index2").click(function(){
	$('#index_table4 tr').find('td').remove();	//清除所选
	$("#search_inp2").val("");
});

function formula_true(){
	kpi_symbol=T('#_operation').val();
	if(left_kpi_id==null){
		$("#txt_insert p").remove();
		$("#txt_insert").append("<p>公式已修改,请重新确认指标一！</p>");
		$("#modal_alert").modal("toggle");
		T('#formula_true').attr("disabled",true); 
		
		if(kpi_symbol=='+'){
			kpi_symbol='sum';
		}
		T.getJson('${ctx}/RStat/kpi_calculation?kpi_id='+kpi_id+'&a='+left_kpi_id+'&cal='+kpi_symbol+'&b='+right_kpi_id, function(res) {
			if(res.kpi_result=='200'){
				$("#txt_insert p").remove();
				$("#txt_insert").append("<p>公式添加成功！</p>");
				$("#modal_alert").modal("toggle");
			}else{
				$("#txt_insert p").remove();
				$("#txt_insert").append("<p>添加失败！</p>");
				$("#modal_alert").modal("toggle");
			}
		});
	}else if(right_kpi_id==null){
		$("#txt_insert p").remove();
		$("#txt_insert").append("<p>公式已修改,请重新确认指标二！</p>");
		$("#modal_alert").modal("toggle");
		T('#formula_true').attr("disabled",true); 
		
		if(kpi_symbol=='+'){
			kpi_symbol='sum';
		}
		T.getJson('${ctx}/RStat/kpi_calculation?kpi_id='+kpi_id+'&a='+left_kpi_id+'&cal='+kpi_symbol+'&b='+right_kpi_id, function(res) {
			if(res.kpi_result=='200'){
				$("#txt_insert p").remove();
				$("#txt_insert").append("<p>公式添加成功！</p>");
				$("#modal_alert").modal("toggle");
			}else{
				$("#txt_insert p").remove();
				$("#txt_insert").append("<p>添加失败！</p>");
				$("#modal_alert").modal("toggle");
			}
		});
	}else{
		
		T('#formula_true').attr("disabled",true); 
		if(kpi_symbol=='+'){
			kpi_symbol='sum';
		}
		T.getJson('${ctx}/RStat/kpi_calculation?kpi_id='+kpi_id+'&a='+left_kpi_id+'&cal='+kpi_symbol+'&b='+right_kpi_id, function(res) {
			if(res.kpi_result=='200'){
				$("#txt_insert p").remove();
				$("#txt_insert").append("<p>公式添加成功！</p>");
				$("#modal_alert").modal("toggle");
			}else{
				$("#txt_insert p").remove();
				$("#txt_insert").append("<p>添加失败！</p>");
				$("#modal_alert").modal("toggle");
			}
		});
	}
	
}

/***********起始终止时间控件***********/
$('#config-demo').daterangepicker({
	locale: {
		format: 'DD/MM/YYYY',
		applyLabel: '确认',
		cancelLabel: '取消',
		fromLabel : '起始时间',
		toLabel : '结束时间',
		customRangeLabel : '自定义',
		firstDay : 1,
		daysOfWeek:["日", "一", "二", "三", "四", "五", "六"],
		monthNames:["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"]
	}
});

	
/********************************** 主界面 指标数据验证  *************************************/	
	/* 下拉选框  */
	var _json_record = [
		{id : 'FPRN', text : '病案号'},
		{id : 'FTIMES', text : '住院次数'},
		{id : 'FNAME', text : '病人姓名'},
		{id : 'FSEX', text : '性别'},
		{id : 'FICDM', text : 'ICD码'},
		{id : 'FZDLX', text : '诊断类型'},
		{id : 'FJBNAME', text : '疾病名称'}
	];
	var _json_inHos_num = [
		{id : 'FPRN', text : '病案号'},
		{id : 'FTIMES', text : '住院次数'},
		{id : 'FNAME', text : '病人姓名'},
		{id : 'FSEX', text : '性别'},
		{id : 'FICDM', text : 'ICD码'},
		{id : 'FZDLX', text : '诊断类型'},
		{id : 'FJBNAME', text : '疾病名称'}
	];
	var _json_leaHos_office = [];
	
	T('#_record').dropdown();
	T('#_inHos_num').dropdown();
	T('#_leaHos_office').dropdown({height:"250"});
	T('#_leaHos_office2').dropdown({height:"250"});
	
	
/*************************************** 统计口径条件 table 的下拉框 *************************************/	
//按 XX 统计下拉框
var _json_dims_tj = [
	{id : '1', text : '按年'},
	{id : '2', text : '按季'},
	{id : '3', text : '按月'},
	{id : '4', text : '按日'}
];

$("#_year_s_tj").show();
$("#serson_div").hide();
$("#_month_tj").hide();
$("#_day_tj").hide();
T("#_dim_tj").dropdown({after:_dim_tj});
//按 XX 下拉框点击时的函数
function _dim_tj(){
	var dim_tj=$("#dim_tj").val();			
	if(dim_tj=="1"){
		$("#_year_s_tj").show();
		$("#serson_div").hide();
		$("#_month_tj").hide();
		$("#_day_tj").hide();
	}else if(dim_tj=="2"){
		$("#_year_s_tj").show();
		$("#serson_div").show();
		$("#_month_tj").hide();
		$("#_day_tj").hide();
	}else if(dim_tj=="3"){
		$("#_year_s_tj").show();
		$("#serson_div").hide();
		$("#_month_tj").show();
		$("#_day_tj").hide();
	}else if(dim_tj=="4"){
		$("#_year_s_tj").show();
		$("#serson_div").hide();
		$("#_month_tj").show();
		$("#_day_tj").show();
	}
}

//按 年 
var _json_years_tj=[];

//按 季
var _json_serson_tj=[
	{id : 'S1', text : '第一季度'},
	{id : 'S2', text : '第二季度'},
	{id : 'S3', text : '第三季度'},
	{id : 'S4', text : '第四季度'}
];

//按 月
var _json_months_tj = [
	{id : '01', text : '01月'},
	{id : '02', text : '02月'},
	{id : '03', text : '03月'},
	{id : '04', text : '04月'},
	{id : '05', text : '05月'},
	{id : '06', text : '06月'},
	{id : '07', text : '07月'},
	{id : '08', text : '08月'},
	{id : '09', text : '09月'},
	{id : '10', text : '10月'},
	{id : '11', text : '11月'},
	{id : '12', text : '12月'}
];

//按 日
var _json_days_tj=[];
var _json_days1_tj = [//28天
	{id : '01', text : '01号'},
	{id : '02', text : '02号'},
	{id : '03', text : '03号'},
	{id : '04', text : '04号'},
	{id : '05', text : '05号'},
	{id : '06', text : '06号'},
	{id : '07', text : '07号'},
	{id : '08', text : '08号'},
	{id : '09', text : '09号'},
	{id : '10', text : '10号'},
	{id : '11', text : '11号'},
	{id : '12', text : '12号'},
	{id : '13', text : '13号'},
	{id : '14', text : '14号'},
	{id : '15', text : '15号'},
	{id : '16', text : '16号'},
	{id : '17', text : '17号'},
	{id : '18', text : '18号'},
	{id : '19', text : '19号'},
	{id : '20', text : '20号'},
	{id : '21', text : '21号'},
	{id : '22', text : '22号'},
	{id : '23', text : '23号'},
	{id : '24', text : '24号'},
	{id : '25', text : '25号'},
	{id : '26', text : '26号'},
	{id : '27', text : '27号'},
	{id : '28', text : '28号'}
];
var _json_days2_tj = [//29天
	{id : '01', text : '01号'},
	{id : '02', text : '02号'},
	{id : '03', text : '03号'},
	{id : '04', text : '04号'},
	{id : '05', text : '05号'},
	{id : '06', text : '06号'},
	{id : '07', text : '07号'},
	{id : '08', text : '08号'},
	{id : '09', text : '09号'},
	{id : '10', text : '10号'},
	{id : '11', text : '11号'},
	{id : '12', text : '12号'},
	{id : '13', text : '13号'},
	{id : '14', text : '14号'},
	{id : '15', text : '15号'},
	{id : '16', text : '16号'},
	{id : '17', text : '17号'},
	{id : '18', text : '18号'},
	{id : '19', text : '19号'},
	{id : '20', text : '20号'},
	{id : '21', text : '21号'},
	{id : '22', text : '22号'},
	{id : '23', text : '23号'},
	{id : '24', text : '24号'},
	{id : '25', text : '25号'},
	{id : '26', text : '26号'},
	{id : '27', text : '27号'},
	{id : '28', text : '28号'},
	{id : '29', text : '29号'}
];
var _json_days3_tj = [//30天
	{id : '01', text : '01号'},
	{id : '02', text : '02号'},
	{id : '03', text : '03号'},
	{id : '04', text : '04号'},
	{id : '05', text : '05号'},
	{id : '06', text : '06号'},
	{id : '07', text : '07号'},
	{id : '08', text : '08号'},
	{id : '09', text : '09号'},
	{id : '10', text : '10号'},
	{id : '11', text : '11号'},
	{id : '12', text : '12号'},
	{id : '13', text : '13号'},
	{id : '14', text : '14号'},
	{id : '15', text : '15号'},
	{id : '16', text : '16号'},
	{id : '17', text : '17号'},
	{id : '18', text : '18号'},
	{id : '19', text : '19号'},
	{id : '20', text : '20号'},
	{id : '21', text : '21号'},
	{id : '22', text : '22号'},
	{id : '23', text : '23号'},
	{id : '24', text : '24号'},
	{id : '25', text : '25号'},
	{id : '26', text : '26号'},
	{id : '27', text : '27号'},
	{id : '28', text : '28号'},
	{id : '29', text : '29号'},
	{id : '30', text : '30号'}
];
var _json_days4_tj = [//31天
	{id : '01', text : '01号'},
	{id : '02', text : '02号'},
	{id : '03', text : '03号'},
	{id : '04', text : '04号'},
	{id : '05', text : '05号'},
	{id : '06', text : '06号'},
	{id : '07', text : '07号'},
	{id : '08', text : '08号'},
	{id : '09', text : '09号'},
	{id : '10', text : '10号'},
	{id : '11', text : '11号'},
	{id : '12', text : '12号'},
	{id : '13', text : '13号'},
	{id : '14', text : '14号'},
	{id : '15', text : '15号'},
	{id : '16', text : '16号'},
	{id : '17', text : '17号'},
	{id : '18', text : '18号'},
	{id : '19', text : '19号'},
	{id : '20', text : '20号'},
	{id : '21', text : '21号'},
	{id : '22', text : '22号'},
	{id : '23', text : '23号'},
	{id : '24', text : '24号'},
	{id : '25', text : '25号'},
	{id : '26', text : '26号'},
	{id : '27', text : '27号'},
	{id : '28', text : '28号'},
	{id : '29', text : '29号'},
	{id : '30', text : '30号'},
	{id : '31', text : '31号'}
];

//下拉框 drodown 控件
getYears_tj();
T('#_year_s_tj').dropdown({after : getDays_tj});
T('#_serson_tj').dropdown();
T('#_month_tj').dropdown({height:"200",after : getDays_tj});

//根据按 xx 统计来隐显 按 年\按季\按月\按日


//获取近四年年份
function getYears_tj(){
	var nowDate = new Date();
	var year_f = nowDate.getFullYear();
	$("#year_s_tj").val(year_f);
	var year_s = year_f - 3;
	var id, text;
	for (var y = year_f; y >= year_s; y--) {
		id = y.toString();
		text = id + '年';
		_json_years_tj.push({
			id : id,
			text : text
		});
	}
}

//获取当前月份的天数
function getDays_tj() {
	var year = T('#year_s_tj').val();
	var month = T('#month_tj').val();
	switch (month) {//判断当前月份的天数
	case '01':
	case '03':
	case '05':
	case '07':
	case '08':
	case '10':
	case '12':
		_json_days_tj = _json_days4_tj;
		break;

	case '04':
	case '06':
	case '09':
	case '11':
		_json_days_tj = _json_days3_tj;
		break;

	case '02':
		var yy = parseInt(year);
		if (yy % 4 == 0 && yy % 100 != 0 || yy % 400 == 0) {//如果是闰年
			_json_days_tj = _json_days2_tj;
		} else {
			_json_days_tj = _json_days1_tj;
		}
		break;
	}
	T('#_day_tj').dropdown({height: '200'});
}	
	
	
	
/************************************** 指标统计口径模态框  *****************************************/
	 /*点击统计口径按钮 */
 $("#statistics_kpi").click(function(){
	 $("#modal_statistics").modal('toggle');
	
	 /* 统计口径左侧树生成 */
	T.getJson('${ctx}/RStat/get_tree_statistic_caliber', function(res) {
		
		_get('con_lf_lf_tab').innerHTML = baidu.template('sta_tpl', res);
			
		/*树菜单*/
		var sec_td1=$("#con_lf_lf_tab tr[id^='1']");//一级菜单所有tr
		var sec_td2=$("#con_lf_lf_tab tr[id^='2']");//二级菜单所有tr
		sec_td2.hide();//页面出来时二级菜单隐藏
		sec_td1.click(function(){
			var this_id=$(this).attr('id').split('_')[2];//00、01、02...
			for(var i=0;i<sec_td2.length;i++){
				var td=sec_td2.eq(i).attr("id").split('_')[2];//00、01、02...
				if(this_id==td){sec_td2.eq(i).toggle();}//如果当前点击的一级菜单的id最后两位数等于二级菜单id的最后两位数，则显 隐
			}
			$(this).find('i').toggleClass("fa-minus").toggleClass("fa-plus")//为一级菜单加 + - 图标
			/* if(sec_td2.css('display')=='none'){
				sec_td2.find('.checked').removeClass('checked');
			} */
		});
	
		/*遍历左侧的table树表*/
		for (var i = 0; i < sec_td2.length; i++) {
			sec_td2[i].onclick = function () {
				if ($("#con_lf_rt_tab tr").length != 0) {
					var all_rt_td = $("#con_lf_rt_tab tr td").find('a');
					var is_exist = false;
					/*判断如果右侧的table树表，如果已有，不能选中*/
					for (var j = 0; j < all_rt_td.length; j++) {
						if ($(this).find("a").text() == all_rt_td[j].innerText) {
							is_exist = true;
							$(this).find('td').removeClass("checked");;
						};
					}
					if (!is_exist) {$(this).find('td').toggleClass("checked");}
				} else {
					$(this).find('td').toggleClass("checked");
				}
			}
		}
	
		/*点击 ">>" 按钮时*/
		$("#rt_shift").click(function(){
			var is_checked=$("#con_lf_lf_tab tr").find('.checked');
			if(is_checked){
				var all_tr=is_checked.parent();
				var rt_update='';
				var ICD_update='';
				for(var i=0;i<all_tr.length;i++){
					var clone=all_tr[i].cloneNode(true);
					clone.setAttribute('id', all_tr[i].id+'_rt');
					clone.setAttribute('style','display: table-row');
					$("#con_lf_rt_tab").append(clone);//克隆选中的行，赋值给右侧树表
					/* 当type为1、2、3状态时分别为当前选中的td附加相联的div */
					var data_name=all_tr[i].attributes["data-name"].value;
					var data_txt=all_tr[i].innerText;
					if(data_name==1){
						ICD_update='<div id="'+all_tr[i].id+'_rt_update" style="display:none;width:100%">'+
										'<div id="rel_dad" style="position:absolute;top:50px;">'+
										'</div>'+
										'<button class="btn add btn-primary" onclick="add_data_name1(this)">+</button>'+
										'<div class="rt_child" style="padding:5px 0 5px 20px;">'+
											'<div class="pr in-block">'+
												'<input type="text" class="inp_val" style="display:none" value="FZDLX"/>'+
												'<input type="text" class="inp_val" style="display:none" value="1"/>'+
												'<select onclick="select_val(this)">'+
													'<option value="1">主要诊断</option>'+
													'<option value="2">附属诊断</option>'+
													/* '<option value="3">其他诊断</option>'+
													'<option value="4">院内感染</option>'+
													'<option value="5">并发症</option>'+
													'<option value="6">损伤中毒</option>'+ */
												'</select>'+ 
											'</div>'+
											'<i style="font-style:normal;margin:0 2px 0 5px;">从</i>'+
											'<div class="demo pr in-block" style="width:16%;">'+
												'<input class="txt_inp inp_val" type="text" style="width:90%;cursor:text;">'+
											'</div>'+
											'<i style="font-style:normal;margin:0 2px 0 5px;">至</i>'+
											'<div class="demo pr in-block" style="width:16%;">'+
												'<input class="txt_inp inp_val" type="text" style="width:90%;cursor:text;">'+
											'</div>'+
											'<i style="font-style:normal;margin:0 2px 0 5px;">除</i>'+
											'<div class="demo pr in-block" style="width:16%;">'+
												'<input class="txt_inp inp_val" type="text" style="width:90%;cursor:text;">'+
											'</div>'+
										'</div>'+
									  '</div>';
						$("#rt_content").append(ICD_update);
					} 
					if(data_name==2){
						rt_update='<div id="'+all_tr[i].id+'_rt_update" style="display:none;width:100%">'+
		 							'<button class="btn add btn-primary" onclick="add_data_name2(this)">+</button>'+
									'<div class="rt_child" style="padding:5px 0 5px 20px;">'+
										'<div class="demo pr in-block" style="width:30%;">'+
											'<input class="txt_inp inp_val" type="text" style="width:90%;cursor:text;">'+
										'</div>'+
										'<div class="demo pr in-block" style="width:30%;">'+
											'(模糊查询加  * 号)'+
										'</div>'+
									'</div>'+
								  '</div>';
						$("#rt_content").append(rt_update);
					} 
					if(data_name==3){
						 rt_update='<div id="'+all_tr[i].id+'_rt_update" style="display:none;width:100%">'+
					 				'<button class="btn add btn-primary" onclick="add_data_name3(this)">+</button>'+
									'<div style="padding:5px 0 5px 20px;">'+
										'<i style="font-style:normal;">从</i>'+
										'<div class="demo pr in-block" style="width:16%;">'+
											'<input class="txt_inp inp_val" type="text" style="width:90%;cursor:text;">'+
										'</div>'+
										'<i style="font-style:normal;margin:0 2px 0 5px;">至</i>'+
										'<div class="demo pr in-block" style="width:16%;">'+
											'<input class="txt_inp inp_val" type="text" style="width:90%;cursor:text;">'+
										'</div>'+
										'<i style="font-style:normal;margin:0 2px 0 5px;">除</i>'+
										'<div class="demo pr in-block" style="width:16%;">'+
											'<input class="txt_inp inp_val" type="text" style="width:90%;cursor:text;">'+
										'</div>'+
									'</div>'+
								  '</div>';
			 			$("#rt_content").append(rt_update);
					}
					if(data_name==4 && data_txt=="入院日期"){
						 rt_update='<div id="'+all_tr[i].id+'_rt_update" style="display:none;width:100%">'+
								 		'<div style="padding:5px 0 5px 20px;">'+
											 '<div style="margin-left:8px;margin-bottom:10px;"><span>选择时间维度：</span></div>'+			 
											 '<div class="pr in-block" style="width:45%;margin-left:8px;">'+
												'<input type="text" id="config-demo2" title="点击选取起始日期和终止日期" style="width:95%;height:16px;" value="" class="form-control input inp dd txt_inp inp_val config-InHospital">'+
											 '</div>'+
										'</div>'+
								  '</div>';
			 			$("#rt_content").append(rt_update);
					}
					if(data_name==4 && data_txt=="手术日期"){
						 rt_update='<div id="'+all_tr[i].id+'_rt_update" style="display:none;width:100%">'+
								 		'<div style="padding:5px 0 5px 20px;">'+
											 '<div style="margin-left:8px;margin-bottom:10px;"><span>选择时间维度：</span></div>'+			 
											 '<div class="pr in-block" style="width:45%;margin-left:8px;">'+
												'<input type="text" id="config-demo2" title="点击选取起始日期和终止日期" style="width:95%;height:16px;" value="" class="form-control input inp dd txt_inp inp_val config-surgery">'+
// 											 '</div>'+
										'</div>'+
								  '</div>';
			 			$("#rt_content").append(rt_update);
					}
					if(data_name==5){
						 rt_update='<div id="'+all_tr[i].id+'_rt_update" style="display:none;width:100%">'+
									'<div style="padding:5px 0 5px 20px;">'+
										'<div class="demo pr">'+
											'<label>'+
												'<input type="checkbox" value="1" class="ver_align" style="margin:0;"/>'+
												'<span class="ver_align">医嘱离院</span>'+
											'</label>'+
										'</div>'+
										'<div class="demo pr">'+
											'<label>'+
												'<input type="checkbox" value="2" class="ver_align" style="margin:0;"/>'+
												'<span class="ver_align">医嘱转院</span>'+
											'</label>'+
										'</div>'+
										'<div class="demo pr">'+
											'<label>'+
												'<input type="checkbox" value="3" class="ver_align" style="margin:0;"/>'+
												'<span class="ver_align">医嘱转社区卫生服务机构/乡村卫生院</span>'+
											'</label>'+
										'</div>'+
										'<div class="demo pr">'+
											'<label>'+
												'<input type="checkbox" value="4" class="ver_align" style="margin:0;"/>'+
												'<span class="ver_align">非医嘱离院</span>'+
											'</label>'+
										'</div>'+
										'<div class="demo pr">'+
											'<label>'+
												'<input type="checkbox" value="5" class="ver_align" style="margin:0;"/>'+
												'<span class="ver_align">死亡</span>'+
											'</label>'+
										'</div>'+
											'<div class="demo pr">'+
											'<label>'+
												'<input type="checkbox" value="6" class="ver_align" style="margin:0;"/>'+
												'<span class="ver_align">其他</span>'+
											'</label>'+
										'</div>'+
									'</div>'+
								  '</div>';
			 			$("#rt_content").append(rt_update);
					}
					if(data_name==6){
						 rt_update='<div id="'+all_tr[i].id+'_rt_update" style="display:none;width:100%">'+
									'<div style="padding:5px 0 5px 20px;">'+
										'<div class="demo pr">'+
											'<label>'+
												'<input type="radio" name="sex" checked="true" value="男"/>'+
												'<span>男</span>'+
											'</label>'+
										'</div>'+
										'<div class="demo pr">'+
											'<label>'+
												'<input type="radio" name="sex" value="女"/>'+
												'<span>女</span>'+
											'</label>'+
										'</div>'+
									'</div>'+
								  '</div>';
			 			$("#rt_content").append(rt_update);
					}
					
				}
				
				$("#con_lf_rt_tab tr").find(".checked").removeClass('checked');//移除赋值到右侧鼠标中行的选中样式
				$("#con_lf_lf_tab tr[id^='2']").find(".checked").find('i').addClass('fa-file-text');//为左侧中已移动的行加小图标
				$("#con_lf_lf_tab tr[id^='2']").find(".checked").removeClass('checked');//移除左侧已移动的行的选中样式
				var lf_rt_td=$("#con_lf_rt_tab tr td");
				var lf_rt_tr=$("#con_lf_rt_tab tr");
				for (var i = 0; i < lf_rt_td.length; i++) {
					lf_rt_td[i].onclick=function(){
						lf_rt_td.removeClass('checked');
						$(this).addClass("checked");//当右侧树表有行时，为单击选中时设置样式
						$("#current_val").val($(this).find('a').html());//为右侧当前条件赋值
				
						/* 根据点击的td判断所对应的div是否在右侧显示 */
						var id=$(this).parent();;	
						var rt_div_updata=$("#rt_content div[id^='"+id[0].id+"']");//div的id以id[0].id开头的元素（匹配当前点击的tr的id）
						var rt_divelse_updata=rt_div_updata.siblings();//除了当前元素外的所有兄弟元素
						rt_divelse_updata.css('display','none');
						rt_div_updata.css('display','inline-block');
					}
				}
			}
			
			/*起始终止时间控件2*/
			$('.config-InHospital').daterangepicker({
				locale: {
					format: 'DD/MM/YYYY',
					applyLabel: '确认',
					cancelLabel: '取消',
					fromLabel : '起始时间',
					toLabel : '结束时间',
					customRangeLabel : '自定义',
					firstDay : 1,
					daysOfWeek:["日", "一", "二", "三", "四", "五", "六"],
					monthNames:["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"]
				}
			});
			$('.config-surgery').daterangepicker({
				locale: {
					format: 'DD/MM/YYYY',
					applyLabel: '确认',
					cancelLabel: '取消',
					fromLabel : '起始时间',
					toLabel : '结束时间',
					customRangeLabel : '自定义',
					firstDay : 1,
					daysOfWeek:["日", "一", "二", "三", "四", "五", "六"],
					monthNames:["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"]
				}
			});
		})
		
		/*点击 "<<" 按钮时*/
		$("#lf_shift").click(function(){
			//找出左侧有小图标的和右侧选中的a标签
			var all_inchecked=$("#con_lf_rt_tab tr").find(".checked a");
			var all_ifa_text=$("#con_lf_lf_tab tr").find('i.fa-file-text').next();
			
			var now_checked=$("#con_lf_rt_tab tr").find(".checked").parent();
			var del_updata=$("#rt_content div[id^='"+now_checked[0].id+"']");
			del_updata.remove();
			
			for(var i=0;i<all_inchecked.length;i++){
				for(var j=0;j<all_ifa_text.length;j++){
					if(all_inchecked[i].innerText==all_ifa_text[j].innerText){//对比，如果右侧选中的和左侧有小图标的a标签文本一样
						all_ifa_text[j].previousElementSibling.setAttribute("class","opt_in fa");//去掉左侧小图标
						all_inchecked[i].parentElement.parentElement.remove();//删除右侧选中的行
						$("#current_val").val('');//为右侧当前条件赋值
					}
				}
			};
		})
	});
 })
 
 
/* 状态为1时新加的div */	 
 function add_data_name1(e){
	var _dad=T(e).parent().find('div.rt_child');
	if(_dad.length==1){
		//第一次点击 + 按钮时，添加条件间关系 
		var rel_child=  '<label class="lab_inp in-block" style="margin-right:20px;margin-left:20px;" onclick="add_val(this)">'+
							'<input type="radio" checked class="inp_val"  name="chack1" value="1"/>'+
							'<span>并且</span>'+
						'</label>'+
						'<label class="lab_inp in-block" onclick="add_val(this)">'+
							'<input type="radio"  name="chack1" value="2"/>'+
							'<span>或者</span>'+
						'</label>';
		T("#rel_dad").append(rel_child);

		var add_div='<div class="rt_child" style="padding:5px 0 5px 20px;">'+
						'<div style="position:absolute;top:50px;">'+
							
						'</div>'+
						'<div class="pr in-block">'+
							'<input type="text" class="inp_val" style="display:none" value="FZDLX"/>'+
							'<input type="text" class="inp_val" style="display:none" value="1"/>'+
							'<select onclick="select_val(this)">'+
								'<option value="1">主要诊断</option>'+
								'<option value="2">附属诊断</option>'+
								/* '<option value="3">其他诊断</option>'+
								'<option value="4">院内感染</option>'+
								'<option value="5">并发症</option>'+
								'<option value="6">损伤中毒</option>'+ */
							'</select>'+ 
						'</div>'+
						'<i style="font-style:normal;margin:0 2px 0 5px;">从</i>'+
						'<div class="demo pr in-block" style="width:16%;">'+
							'<input class="txt_inp inp_val" type="text" style="width:90%;cursor:text;">'+
						'</div>'+
						'<i style="font-style:normal;margin:0 2px 0 5px;">至</i>'+
						'<div class="demo pr in-block" style="width:16%;">'+
							'<input class="txt_inp inp_val" type="text" style="width:90%;cursor:text;">'+
						'</div>'+
						'<i style="font-style:normal;margin:0 2px 0 5px;">除</i>'+
						'<div class="demo pr in-block" style="width:16%;">'+
							'<input class="txt_inp inp_val" type="text" style="width:90%;cursor:text;">'+
						'</div>'+
						'<div class="in-block del" style="margin-left:10px;">'+
							'<button class="btn" onclick="del_data_name1(this)">-</button>'+
						'</div>'+
					'</div>';
		T(e).parent().append(add_div);
	}else{
		var add_div='<div class="rt_child" style="padding:5px 0 5px 20px;">'+
						'<div class="pr in-block">'+
							'<input type="text" class="inp_val" style="display:none" value="FZDLX"/>'+
							'<input type="text" class="inp_val" style="display:none" value="1"/>'+
							'<select onclick="select_val(this)">'+
								'<option value="1">主要诊断</option>'+
								'<option value="2">附属诊断</option>'+
								/* '<option value="3">其他诊断</option>'+
								'<option value="4">院内感染</option>'+
								'<option value="5">并发症</option>'+
								'<option value="6">损伤中毒</option>'+ */
							'</select>'+ 
						'</div>'+
						'<i style="font-style:normal;margin:0 2px 0 5px;">从</i>'+
						'<div class="demo pr in-block" style="width:16%;">'+
							'<input class="txt_inp inp_val" type="text" style="width:90%;cursor:text;">'+
						'</div>'+
						'<i style="font-style:normal;margin:0 2px 0 5px;">至</i>'+
						'<div class="demo pr in-block" style="width:16%;">'+
							'<input class="txt_inp inp_val" type="text" style="width:90%;cursor:text;">'+
						'</div>'+
						'<i style="font-style:normal;margin:0 2px 0 5px;">除</i>'+
						'<div class="demo pr in-block" style="width:16%;">'+
							'<input class="txt_inp inp_val" type="text" style="width:90%;cursor:text;">'+
						'</div>'+
						'<div class="in-block del" style="margin-left:10px;">'+
							'<button class="btn" onclick="del_data_name1(this)">-</button>'+
						'</div>'+
					'</div>';
		T(e).parent().append(add_div);
	}
}
function del_data_name1(e){
	$("#modal_del").modal('toggle');	
	$("#del_true").click(function(){
		var _dad_dad=T(e).parent().parent().parent().find('div.rt_child');
		if(_dad_dad.length==2){
			T("#rel_dad").find('label').remove();
			T(e).parent().parent().remove();
		}else{
			T(e).parent().parent().remove();
		}
		
	});
} 
 
/* 状态为2时新加的div */
function add_data_name2(e){
	var add_div='<div class="rt_child" style="padding:5px 0 5px 20px;">'+
					'<div class="demo pr in-block" style="width:30%;">'+
					'<input class="txt_inp inp_val" type="text" style="width:90%;cursor:text;">'+
				'</div>'+
				'<div class="demo pr in-block" style="width:30%;">'+
					'(模糊查询加  * 号)'+
				'</div>'+
				'<div class="in-block del" style="margin-left:10px;">'+
					'<button class="btn" onclick="del_data_name2(this)">-</button>'+
				'</div>'+
				'</div>';
	T(e).parent().append(add_div);		
}
function del_data_name2(e){
	$("#modal_del").modal('toggle');	
	$("#del_true").click(function(){
		T(e).parent().parent().remove();
	});
}

/* 状态为3时新加的div */
function add_data_name3(e){
	var add_div= '<div style="padding:5px 0 5px 20px;">'+
					'<i style="font-style:normal;">从</i>'+
					'<div class="demo pr in-block" style="width:16%;">'+
						'<input class="txt_inp inp_val" type="text" style="width:90%;cursor:text;">'+
					'</div>'+
					'<i style="font-style:normal;margin:0 2px 0 5px;">至</i>'+
					'<div class="demo pr in-block" style="width:16%;">'+
						'<input class="txt_inp inp_val" type="text" style="width:90%;cursor:text;">'+
					'</div>'+
					'<i style="font-style:normal;margin:0 2px 0 5px;">除</i>'+
					'<div class="demo pr in-block" style="width:16%;">'+
						'<input class="txt_inp inp_val" type="text" style="width:90%;cursor:text;">'+
					'</div>'+
					'<div class="in-block del" style="margin-left:10px;">'+
						'<button class="btn" onclick="del_data_name3(this)">-</button>'+
					'</div>'+
				'</div>';		 
	T(e).parent().append(add_div);	 
}
function del_data_name3(e){
	$("#modal_del").modal('toggle');	
	$("#del_true").click(function(){
		T(e).parent().parent().remove();
	});
}	 
	
/* 点击select下拉框  取到对应的 值*/
function select_val(e){
	var opt_val=T(e).find('option:selected').val();
	T(e).prev().val(opt_val); 
}
/* 判断ICD码的div的条件间关系 （并且/或者） */
function add_val(e){
	T(e).parent().find('input').removeClass();
	T(e).find('input').addClass('inp_val');
}
 

/* 点击统计口径模态框的  确认 按钮 */
 function statistics_confirm(){
	var logic='';
	var boreList=[];
	var log_txt=$("#logic_dad").find(":checked").next().text();
	if(log_txt=='并且'){logic='1'}else if(log_txt=='或者'){logic='2'};
	var have_cekd=$("#rt_content").find('input:checked');
	if(have_cekd){have_cekd.addClass('inp_val')}
	
	var day_all="";
	
	dim_x_value_id = $("#thematic_dimension2").val();
	var org_id = $("#leaHos_office2").val();
	var time_id = $("#dim_tj").val();
	
	if(time_id==1){//年
		day_all = $("#year_s_tj").val();
	}else if(time_id==2){//季
		day_all = $("#year_s_tj").val()+$("#serson_tj").val();
	}else if(time_id==3){//月
		day_all = $("#year_s_tj").val()+$("#month_tj").val();
	}else if(time_id==4){//日
		day_all = $("#year_s_tj").val()+$("#month_tj").val()+$("#day_tj").val();
	}
	
	var all_dad_div=$("#rt_content>div");//3
	for(var i=0;i<all_dad_div.length;i++){
		var cond_id=all_dad_div[i].id.split('_')[3];
		var all_son=[];
		//var son_inp=all_dad_div[i].getElementsByTagName("input.inp_val");	
		var son_inp=all_dad_div[i].getElementsByClassName("inp_val");	
		for(var j=0;j<son_inp.length;j++){
			all_son.push(son_inp[j].value);
		}
		boreList.push({kpi_id:kpi_id,logic:logic,condition_id:cond_id,value:all_son,dim_x_id:dim_x_id,dim_x_value_id:dim_x_value_id,org_id:org_id,day_all:day_all});
	}
	//console.log(boreList)
	//console.log(JSON.stringify(boreList))
	
	
	if(boreList.length == 0){
		
		$("#txt_insert p").remove();
		$("#txt_insert").append("<p>请添加查询条件！</p>");
		$("#modal_alert").modal("toggle");
	}else{
		$.ajax({
			url: '${ctx}/RStat/update_statistic_caliber',
			type: 'post',
			data: JSON.stringify(boreList),
			dataType: "text",
			contentType: 'application/json',				
			success:function(data){
				$("#modal_statistics").hide();				
				$("#btn_preview").attr("disabled",false);
				
				search_statistic_caliber();
			},
			error:function(){
				
				$("#txt_insert2 p").remove();
				$("#txt_insert2").append("<p>指标统计口径设置失败！</p>");
				$("#modal_alert2").modal("toggle");
				$("#ajax_confirm").click(function(){
					$("#modal_statistics").hide();
				});
			}				
		});
		
		del_content();//清空已选项
	}
	$('body').removeClass('modal-open'); 
	
 }; 
 
 /* 关闭模态框时 清楚 中 右 侧的东西 */
 $(".del_con").click(function(){
	 del_content()
 });
 /* 删除统计口径模态框 中 右 侧的东西 */
 function del_content(){
	 $("#con_lf_rt_tab").find('tr').remove();
	 $("#rt_content>div").remove();
	 $("#current_val").val('');
 }
 
 


/****************************** 指标维度设置模态框  ******************************************/
	/* 显示右侧科室表头 */
	//T.getJson('${ctx}/RStat/get_kpi_dim_value.do', function(kipDeptList){
// 		var data=[];
// 		_get('table3').innerHTML = baidu.template('tpl3', data);
		
// 		/*点击右侧移除*/
// 		T("#table3").find(".del").click(function(){
// 			var tr=T(this).parent();
//             tr.remove();
// 		});
	//});
	
	/* 获取所有的科室 */
	T.getJson('${ctx}/RStat/get_all_dept.do', function(deptList){
		allDept=deptList;
		_get('table2').innerHTML = baidu.template('tpl2', deptList);
		/*将二级科室隐藏*/
		for(var i=1; i<T('#table2').find('tr').length; i++){
			var tr_id = T('#table2').find('tr').eq(i).attr('id');
			if(tr_id.split('_')[1] != 200){
				T('#table2').find('tr').eq(i).hide();
				T('#table2').find('tr').eq(i).find('a').css('margin-left','20px');
			} 
		}
		/*左侧点击展开列表*/
		T("#table2").find("tr").click(function() {
	    	var click_id = T(this).attr('id').split('_')[0];
	    	var click_par_id = T(this).attr('id').split('_')[1];
	    	if(click_par_id != 200){
		    	var is_exist = false;//判断科室是否已分配
		    	var choose_tr = T("#table3").find("tr");
		    	for(var i=1; i<choose_tr.length; i++){
		    		if(T(this).attr('id').split('_')[0] == choose_tr.eq(i).attr('id').split('_')[0]){ 
		    			is_exist = true;
		    		}
		    	}
		    	if(!is_exist && T(this).find("th").length==0){
			    	var clone = T(this).clone();
			    	$(clone).delegate('td','click',function(){
			            if($(this).text()!=""){
			            	clone.remove();
			            }
					});
			    	var status = T(this).find("td").eq(0).html();
			    	T("#table3").children("table").append(clone);
		    	}
		    	
	    	} else {//父id=200即一级目录
	    		all_tr = T('#table2').find('tr');
	    		//判断当前是否已经展开
	    		var is_open = true;
	    		for(var i=1; i<all_tr.length; i++){
	    			if(all_tr.eq(i).css('display')=="none" && all_tr.eq(i).attr('id').split('_')[1] == click_id){
	    				is_open = false;
	    				break;
	    			}
	    		}
	    		for(var i=1; i<all_tr.length; i++){
	    			if(all_tr.eq(i).attr('id').split('_')[1] == click_id){//当前遍历的节点的父节点等于用户点击的节点
	    				if(is_open){
		    				all_tr.eq(i).hide();
	    				} else {
	    					all_tr.eq(i).show();
	    				}
	    			}
	    		}
	    	}
		});
	});
	
	/*搜索科室功能*/
	/* document.onkeydown=function(e) {
		if(e.keyCode==13) {T('#search').click();}
	} */
	T('#search').unbind();
	T('#search').on('click', function(){
		var search_res = {data:[]};
		 var input = T('#keshi').val(); 
		if(input != ""){						
			for(var i=0; i<allDept.data.length; i++){
				if(allDept.data[i].name.indexOf(input)>-1&&allDept.data[i].par_id!=200){
					search_res.data.push(allDept.data[i]);
				}
			}
			if(search_res.data.length == 0){
				//alert("没有找到相关科室");
				$("#txt_insert p").remove();
				$("#txt_insert").append("<p>没有找到相关科室，请核对搜索关键词！</p>");
				$("#modal_alert").modal("toggle");
				$(".is_true").click(function(){	
					T.getJson('${ctx}/RStat/get_all_dept.do', function(deptList){
						alert(JSON.stringify(deptList));
					
						allDept=deptList;
						_get('table2').innerHTML = baidu.template('tpl2', deptList);
						/*将二级科室隐藏*/
						for(var i=1; i<T('#table2').find('tr').length; i++){
							var tr_id = T('#table2').find('tr').eq(i).attr('id');
							if(tr_id.split('_')[1] != 200){
								T('#table2').find('tr').eq(i).hide();
								T('#table2').find('tr').eq(i).find('a').css('margin-left','20px');
							}
						}
						/*左侧点击展开列表*/
						T("#table2").find("tr").click(function() {
					    	var click_id = T(this).attr('id').split('_')[0];
					    	var click_par_id = T(this).attr('id').split('_')[1];
					    	if(click_par_id != 200){
						    	var is_exist = false;//判断科室是否已分配
						    	var choose_tr = T("#table3").find("tr");
						    	for(var i=1; i<choose_tr.length; i++){
						    		if(T(this).attr('id').split('_')[0] == choose_tr.eq(i).attr('id').split('_')[0]){ 
						    			is_exist = true;
						    		}
						    	}
						    	if(!is_exist && T(this).find("th").length==0){
							    	var clone = T(this).clone();
							    	$(clone).delegate('td','click',function(){
							            if($(this).text()!=""){
							            	clone.remove();
							            }
									});
							    	var status = T(this).find("td").eq(0).html();
							    	T("#table3").children("table").append(clone);
						    	}
						    	
					    	} else {//父id=200即一级目录
					    		all_tr = T('#table2').find('tr');
					    		//判断当前是否已经展开
					    		var is_open = true;
					    		for(var i=1; i<all_tr.length; i++){
					    			if(all_tr.eq(i).css('display')=="none" && all_tr.eq(i).attr('id').split('_')[1] == click_id){
					    				is_open = false;
					    				break;
					    			}
					    		}
					    		for(var i=1; i<all_tr.length; i++){
					    			if(all_tr.eq(i).attr('id').split('_')[1] == click_id){//当前遍历的节点的父节点等于用户点击的节点
					    				if(is_open){
						    				all_tr.eq(i).hide();
					    				} else {
					    					all_tr.eq(i).show();
					    				}
					    			}
					    		}
					    	}
						});
					});
				});
			   
			} else {
				_get('table2').innerHTML = baidu.template('tpl2', search_res);
				T('#table2').find('tr').find('a').css('margin-left','20px');
			}
		} else {
			//alert("请输入要搜索的科室名称");
			$("#txt_insert p").remove();
			$("#txt_insert").append("<p>请输入要搜索的科室名称！</p>");
			$("#modal_alert").modal("toggle");
			
			
			$(".is_true").click(function(){	
				T.getJson('${ctx}/RStat/get_all_dept.do', function(deptList){
					allDept=deptList;
					_get('table2').innerHTML = baidu.template('tpl2', deptList);
					/*将二级科室隐藏*/
					for(var i=1; i<T('#table2').find('tr').length; i++){
						var tr_id = T('#table2').find('tr').eq(i).attr('id');
						if(tr_id.split('_')[1] != 200){
							T('#table2').find('tr').eq(i).hide();
							T('#table2').find('tr').eq(i).find('a').css('margin-left','20px');
						}
					}
					/*左侧点击展开列表*/
					T("#table2").find("tr").click(function() {
				    	var click_id = T(this).attr('id').split('_')[0];
				    	var click_par_id = T(this).attr('id').split('_')[1];
				    	if(click_par_id != 200){
					    	var is_exist = false;//判断科室是否已分配
					    	var choose_tr = T("#table3").find("tr");
					    	for(var i=1; i<choose_tr.length; i++){
					    		if(T(this).attr('id').split('_')[0] == choose_tr.eq(i).attr('id').split('_')[0]){ 
					    			is_exist = true;
					    		}
					    	}
					    	if(!is_exist && T(this).find("th").length==0){
						    	var clone = T(this).clone();
						    	$(clone).delegate('td','click',function(){
						            if($(this).text()!=""){
						            	clone.remove();
						            }
								});
						    	var status = T(this).find("td").eq(0).html();
						    	T("#table3").children("table").append(clone);
					    	}
					    	
				    	} else {//父id=200即一级目录
				    		all_tr = T('#table2').find('tr');
				    		//判断当前是否已经展开
				    		var is_open = true;
				    		for(var i=1; i<all_tr.length; i++){
				    			if(all_tr.eq(i).css('display')=="none" && all_tr.eq(i).attr('id').split('_')[1] == click_id){
				    				is_open = false;
				    				break;
				    			}
				    		}
				    		for(var i=1; i<all_tr.length; i++){
				    			if(all_tr.eq(i).attr('id').split('_')[1] == click_id){//当前遍历的节点的父节点等于用户点击的节点
				    				if(is_open){
					    				all_tr.eq(i).hide();
				    				} else {
				    					all_tr.eq(i).show();
				    				}
				    			}
				    		}
				    	}
					});
				});
			});
		   
		}
		/*左侧点击展开列表*/
		T("#table2").find("tr").click(function() {
	    	var click_id = T(this).attr('id').split('_')[0];
	    	var click_par_id = T(this).attr('id').split('_')[1];
	    	if(click_par_id != 200){
		    	var is_exist = false;//判断科室是否已分配
		    	var choose_tr = T("#table3").find("tr");
		    	for(var i=1; i<choose_tr.length; i++){
		    		if(T(this).attr('id').split('_')[0] == choose_tr.eq(i).attr('id').split('_')[0]){
		    			is_exist = true;
		    		}
		    	}
		    	if(!is_exist && T(this).find("th").length==0){
			    	var clone = T(this).clone();
			    	$(clone).delegate('td','click',function(){
			            if($(this).text()!=""){
			            	clone.remove();
			            }
					});
			    	var status = T(this).find("td").eq(0).html();
			    	/* clone.append('<td style="text-align:center;"></td>'); */
			    	T("#table3").children("table").append(clone);
		    	}
		    	
	    	} else {//父id=200即一级目录
	    		all_tr = T('#table2').find('tr');
	    		//判断当前是否已经展开
	    		var is_open = true;
	    		for(var i=1; i<all_tr.length; i++){
	    			if(all_tr.eq(i).css('display')=="none" && all_tr.eq(i).attr('id').split('_')[1] == click_id){
	    				is_open = false;
	    				break;
	    			}
	    		}
	    		for(var i=1; i<all_tr.length; i++){
	    			if(all_tr.eq(i).attr('id').split('_')[1] == click_id){//当前遍历的节点的父节点等于用户点击的节点
	    				if(is_open){
		    				all_tr.eq(i).hide();
	    				} else {
	    					all_tr.eq(i).show();
	    				}
	    			}
	    		}
	    	}
		});
	});
	/* 指标维度模态框 */
	$("#dim_kpi").click(function(){	
	T.getJson('${ctx}/RStat/getKpi_detail_tod?kpi_id='+kpi_id, function(res) {
		var data={"data":res};
		 _get('table3').innerHTML = baidu.template('tpl3', data);
		 //console.log(data);
		 /*点击右侧移除*/
			T("#table3").find(".del").click(function(){
				var tr=T(this).parent();
	            tr.remove();
			});
		var t=res.Freq;
		var dim_3_s="";	
		if(t=='2'){
			$('.sea_i').find('input').prop('checked',true);
			$('.mon_i').find('input').prop('checked',false);
			$('.day_i').find('input').prop('checked',false);	
		}else if(t=='3'){
			$('.sea_i').find('input').prop('checked',true);
			$('.mon_i').find('input').prop('checked',true);
			$('.day_i').find('input').prop('checked',false);	
		}else if(t=='4'||t=='-10'){
			$('.sea_i').find('input').prop('checked',true);
			$('.mon_i').find('input').prop('checked',true);
			$('.day_i').find('input').prop('checked',true);			
		}else if(t=='1'){
			$('.sea_i').find('input').prop('checked',false);
			$('.mon_i').find('input').prop('checked',false);
			$('.day_i').find('input').prop('checked',false);
		}
		
		var dim_3=res.dim3;
		
		if(dim_3=='院感手术级别'||dim_3=='院感手术'){			
			dim_3_s="7";
			$('.dim_7').find('input').prop('checked',true);
		}else if(dim_3=='重点疾病'){
			dim_3_s="3";
			$('.dim_3').find('input').prop('checked',true);	
		}else if(dim_3=='重点手术'||dim_3=='住院重点手术病种'){
			dim_3_s="4";
			$('.dim_4').find('input').prop('checked',true);	
		}else if(dim_3=='单病种'||dim_3=='单病种名称'){
			dim_3_s="5";
			$('.dim_5').find('input').prop('checked',true);	
		}else if(dim_3=='择期手术'||dim_3=='择期手术后并发症'){
			dim_3_s="6";
			$('.dim_6').find('input').prop('checked',true);	
		}else if(dim_3==''){
			dim_3_s="0";	
			$('.dim_0').find('input').prop('checked',true);
		}
	}); 
		$("#modal_dim").modal('toggle');	
	});
	
	
	
		
	
	
	
	/* 点击时间维度的选项时的判断 */
	function check_time(e){
		var len = T(e).siblings().find('input:checked').length + 1;
		T(e).siblings().find('input:checked').prop('checked',false);
		var txt=T(e).next('span').text();	
		//alert(txt);
		if(txt=="年"){
			T(e).find('input').prop('checked',true);			
		}else if(txt=="季"){
			if(len < 2) {			
				T(e).find('input').prop('checked',true);			
			}
			T(e).prevAll().find('input').prop('checked',true);
		}else if(txt=="月"){
			if(len < 3) {			
				T(e).find('input').prop('checked',true);			
			}
			T(e).prevAll().find('input').prop('checked',true);
		}else if(txt=="日"){
			if(len < 4) {			
				T(e).find('input').prop('checked',true);			
			}
			T(e).prevAll().find('input').prop('checked',true);
		}
		
	}

	
	/* 点击确定后获取数据 */
	$("#dim_sure1").click(function(){	
	var dim1="1";
	var times_a=T('#theme_time').find('input:checked').length;
	if(times_a==1){
		dim1="1";
		}else if(times_a==2){
			dim1="2";	
		}else if(times_a==3){
			dim1="3";
		}else{
			dim1="4";
	}
	
	var dim3=T("input[type=radio][name='theme']:checked").val();
	
	var adds=T("input[type=checkbox][name='dims_ss']");
	var check_val=[];
	for(k in adds){
		if(adds[k].checked)
			check_val.push(adds[k].value);
	}
	if(check_val.length!=0){
		T.getJson('${ctx}/RStat/dim_define_s?kpi_ids='+check_val+'&dim3='+dim3+'&kpi_id='+kpi_id, function(){	
				
		})
	}
	
	var dim2_id=[];
	var orgid1=T('#table3_rt').find('tr');
	for(var i=0;i<orgid1.length;i++){
	 dim2_id.push(orgid1[i].id);
	}
	
	T.getJson('${ctx}/RStat/dim_define?kpi_id='+kpi_id+'&dim1='+dim1+'&dim2_id='+dim2_id+'&dim3='+dim3, function(){					
		$('#year_tr').hide();
		$('#yearcheck').prop("checked",true);
		$('#season_tr').hide();
		$('#month_tr').hide();
		$('#day_tr').hide();
		$('#thematic_dimension_tr').hide();
		$('#thematic_dimension_tr2').hide();
		
		$("#zb_time").find('span').remove();
		$("#zb_org").find('span').remove();
		$("#zb_org").find('a').remove();
		$("#zb_dim").find('span').remove();
		T.getJson('${ctx}/RStat/getKpi_detail_tod?kpi_id='+kpi_id, function(res) {	
			var t=res.Freq;
			if(t=='1'){
				t="年";
				$('#year_tr').show();
				_json_dims_tj = [
	             	{id : '1', text : '按年'}
	             ];
				T("#_dim_tj").dropdown({after:_dim_tj});
			}else if(t=='2'){
				t="年  季  ";
				$('#year_tr').show();
				$('#season_tr').show();
				_json_dims_tj = [
	             	{id : '1', text : '按年'},
	             	{id : '2', text : '按季'}
	             ];
				T("#_dim_tj").dropdown({after:_dim_tj});
			}else if(t=='3'){
				t="年  季  月";
				$('#year_tr').show();
				$('#season_tr').show();
				$('#month_tr').show();
				_json_dims_tj = [
	             	{id : '1', text : '按年'},
	             	{id : '2', text : '按季'},
	             	{id : '3', text : '按月'}
	             ];
				T("#_dim_tj").dropdown({after:_dim_tj});
			}else if(t=='4'||t=='-10'){
				t="年  季  月  日"
				$('#year_tr').show();
				$('#season_tr').show();
				$('#month_tr').show();
				$('#day_tr').show();
				_json_dims_tj = [
	             	{id : '1', text : '按年'},
	             	{id : '2', text : '按季'},
	             	{id : '3', text : '按月'},
	             	{id : '4', text : '按日'}
	             ];
				T("#_dim_tj").dropdown({after:_dim_tj});
			}
			if(res.dim2.length!=0){
				$("#leaHos_office").val(res.dim2[0].kpi_dim_value);
				$("#leaHos_office2").val(res.dim2[0].kpi_dim_value);
				$("#_leaHos_office").val(res.dim2[0].dim2);
				$("#_leaHos_office2").val(res.dim2[0].dim2);
			}else{
				$("#leaHos_office").val("");
				$("#leaHos_office2").val("");
				$("#_leaHos_office").val("");
				$("#_leaHos_office2").val("");
			}
			
			_json_leaHos_office=[];
			for(var i=0;i<res.dim2.length;i++){
				$('#zb_org').append('<span>'+res.dim2[i].dim2+'</span>');
				 _json_leaHos_office.push({id : res.dim2[i].kpi_dim_value, text :res.dim2[i].dim2 });
			}
			T('#_leaHos_office').dropdown({height:"250"});
			T('#_leaHos_office2').dropdown({height:"250"});
			$('#zb_time').append('<span>'+t+'</span>'); 
			
			$('#zb_dim').append('<span>'+res.dim3+'</span>');
			
			_json_thematic_dimension=[];
			if(res.dim3 != ""){
				$("#dim_x_name").html(res.dim3+"：");
				$("#dim_x_name2").text(res.dim3);
				dim_x_id=res.dim_name;
				
				if (res.dimlist.length!=0) {
					$("#thematic_dimension").val(res.dimlist[0].kpi_dim_id);
					$("#thematic_dimension2").val(res.dimlist[0].kpi_dim_id);
					$("#_thematic_dimension").val(res.dimlist[0].kpi_dim_value_name);
					$("#_thematic_dimension2").val(res.dimlist[0].kpi_dim_value_name);
				}else{
					$("#thematic_dimension").val("");
					$("#thematic_dimension2").val("");
					$("#_thematic_dimension").val("");
					$("#_thematic_dimension2").val("");
				}
				for (var j = 0; j < res.dimlist.length; j++) {
					_json_thematic_dimension.push({id:res.dimlist[j].kpi_dim_id,text:res.dimlist[j].kpi_dim_value_name});
				}
				T('#_thematic_dimension').dropdown({height:'250px'});
				T('#_thematic_dimension2').dropdown({height:'250px'});
				$("#thematic_dimension_tr").show();
				$("#thematic_dimension_tr2").show();
			}else{
				dim_x_id="";
			}
			
			//查询统计口径结果表格数据		
			search_statistic_caliber();
			
		}); 
	})
	
	});
	
	//根据选择的维度信息查询统计口径信息
	function search_statistic_caliber(){
		var day_all="";
		
		dim_x_value_id = $("#thematic_dimension2").val();
		var org_id = $("#leaHos_office2").val();
		var time_id = $("#dim_tj").val();
		
		if(time_id==1){//年
			day_all = $("#year_s_tj").val();
		}else if(time_id==2){//季
			day_all = $("#year_s_tj").val()+$("#serson_tj").val();
		}else if(time_id==3){//月
			day_all = $("#year_s_tj").val()+$("#month_tj").val();
		}else if(time_id==4){//日
			day_all = $("#year_s_tj").val()+$("#month_tj").val()+$("#day_tj").val();
		}
		
		
		var data_info={'kpi_id':kpi_id,'dim_name2':dim_x_id,'dim_id':dim_x_value_id,'org_id':org_id,'day':day_all};
		
		$.ajax({
			url: '${ctx}/RStat/getJsonStatisticCaliber',
			type: 'post',
    		data: JSON.stringify(data_info),
    		dataType: 'text',
    		contentType: 'application/json',				
    		success:function(res2){
    			var res=eval("("+res2+")");
    			_get('table_statistic_caliber').innerHTML = baidu.template('tpl4', res);
			},
			error:function(){
				$("#txt_insert p").remove();
				$("#txt_insert").append("<p>获取数据失败！</p>");
				$("#modal_alert").modal("toggle");
			}				
		});
	}


/********************************* 界面 预览L 模态框  ************************************/	
	/* 模态框 */
	
	var _json_years =[];//第一个年
	var _json_years2=[];//第二个年
	var _json_years_2 =[];//第一个季度的年
	var _json_years2_2=[];//第二个季度的年
	var _json_years_3 =[]; //第一个月的年
	var _json_years2_3 =[]; //第二个月的年
	var _json_season1 = [
	                    {id:'S1', text:'第1季度'},
	                    {id:'S2', text:'第2季度'},
	                    {id:'S3', text:'第3季度'},
	                    {id:'S4', text:'第4季度'}
	                ];
	var _json_season2 = [
	                     {id:'S1', text:'第1季度'},
	                     {id:'S2', text:'第2季度'},
	                     {id:'S3', text:'第3季度'},
	                     {id:'S4', text:'第4季度'}
	                 ];
	var _json_month1 = [
	                     {id:'01', text:'1月'},
	                     {id:'02', text:'2月'},
	                     {id:'03', text:'3月'},
	                     {id:'04', text:'4月'},
	                     {id:'05', text:'5月'},
	                     {id:'06', text:'6月'},
	                     {id:'07', text:'7月'},
	                     {id:'08', text:'8月'},
	                     {id:'09', text:'9月'},
	                     {id:'10', text:'10月'},
	                     {id:'11', text:'11月'},
	                     {id:'12', text:'12月'}
	                     
	                 ];
	var _json_month2 = [
	                    {id:'01', text:'1月'},
	                    {id:'02', text:'2月'},
	                    {id:'03', text:'3月'},
	                    {id:'04', text:'4月'},
	                    {id:'05', text:'5月'},
	                    {id:'06', text:'6月'},
	                    {id:'07', text:'7月'},
	                    {id:'08', text:'8月'},
	                    {id:'09', text:'9月'},
	                    {id:'10', text:'10月'},
	                    {id:'11', text:'11月'},
	                    {id:'12', text:'12月'}
	                    
	                ];
	var year_last="";
	var year_f ="";
	//获取近四年的年份
	function getYears() {
		var nowDate = new Date();
		year_f = nowDate.getFullYear();
		year_last = year_f-1;
		var year_s = year_f - 3;
		var id,text;
		for(var y=year_f;y>=year_s;y--) {
			id=y.toString();
			text=id+"年";
			_json_years.push({id:id,text:text});  
			_json_years_2.push({id:id,text:text});
			_json_years_3.push({id:id,text:text});
		}
	}
	
	getYears();
	
	$("#year").val(year_last);
	$("#_year").val(year_last); 
	$("#season_year").val(year_last);
	$("#_season_year").val(year_last);
	$("#month_year").val(year_last);
	$("#_month_year").val(year_last);
	year_change();
	year_change_2();
	year_change_3();
	
	T('#_year').dropdown({after:year_change});
	function year_change(){
		var nowDate = new Date();
		var year_f = nowDate.getFullYear();
		var firstyear=T("#_year").val().substr(0,4);
		var secyear=T("#_year2").val();
		if(secyear<firstyear){
			T("#year2").val(year_f);
			T("#_year2").val(year_f+"年");
		}
		_json_years2=[];
		var id,text;
			for(var y=year_f;y>=firstyear;y--) {
				id=y.toString();
				text=id+"年";
				_json_years2.push({id:id,text:text});    		
			}
		T('#_year2').dropdown();
	}
	 //季度下拉框的实现
	T("#_season_year").dropdown({after:year_change_2});
	function year_change_2(){
		var nowDate = new Date();
		var year_f = nowDate.getFullYear();
		var firstyear=T("#_season_year").val().substr(0,4);
		var secyear=T("#_season_year2").val();
		if(secyear<firstyear){
			T("#season_year2").val(year_f);
			T("#_season_year2").val(year_f+"年");
		}
		_json_years2_2=[];
		var id,text;
			for(var y=year_f;y>=firstyear;y--) {
				id=y.toString();
				text=id+"年";
				_json_years2_2.push({id:id,text:text});    		
			}
		
		//判断季度
		season_change();
		T("#_season2").dropdown();
		T('#_season_year2').dropdown({after:season_change});
	}
	  
// 	T("#_season2").dropdown();
	T("#_season").dropdown({after:season_change});
	function season_change(){
	  	var firstyear=parseInt(T("#_season_year").val());
	  	var secyear=parseInt(T("#_season_year2").val());
		if (firstyear==secyear){
			var firstseason=parseInt(T("#season").val().substr(1,1));
			var secseason = parseInt(T("#season2").val().substr(1,1));
			if(secseason<firstseason){

				T("#season2").val('S'+firstseason);
				T("#_season2").val("第"+firstseason+"季度");
			}
			_json_season2=[];
		  	for(var i=firstseason;i<=4;i++) {
	 	   		id=i.toString();
	 	   		text="第"+id+"季度";
	 	   		_json_season2.push({id:'S'+id,text:text});    		
	 	   	}
		}else if(firstyear<secyear){
			_json_season2=[];
			for(var i=1;i<=4;i++) {
	 	   		id=i.toString();
	 	   		text="第"+id+"季度";
	 	   		
	 	   		_json_season2.push({id:'S'+id,text:text});    		
	 	   	}
		}
		T("#_season2").dropdown();
	  }
	  
	  //月份下拉框的实现
	T("#_month_year").dropdown({after:year_change_3});
	function year_change_3(){
		var nowDate = new Date();
		var year_f = nowDate.getFullYear();
		var firstyear=T("#_month_year").val().substr(0,4);
		var secyear=T("#_month_year2").val();
		if(secyear<firstyear){
			T("#month_year2").val(year_f);
			T("#_month_year2").val(year_f+"年");
		}
		_json_years2_3=[];
		var id,text;
		for(var y=year_f;y>=firstyear;y--) {
			id=y.toString();
			text=id+"年";
			_json_years2_3.push({id:id,text:text});    		
		}
		
		//判断月份
		month_change();
		T("#_month2").dropdown();
	    T('#_month_year2').dropdown({after:month_change});
	  }
	  
	//T("#_month2").dropdown();
	T("#_month").dropdown({after:month_change});
	function month_change(){
	  	var firstyear=parseInt(T("#_month_year").val());
	  	var secyear=parseInt(T("#_month_year2").val());
		if (firstyear==secyear){
			var firstmonth=parseInt(T("#month").val());
			var secmonth = parseInt(T("#month2").val());
			if(secmonth<firstmonth){
				if(firstmonth<10){
					T("#month2").val('0'+firstmonth);
				}else{
					T("#month2").val(firstmonth);
				}
				T("#_month2").val(firstmonth+"月");
			}
			_json_month2=[];
		  	for(var i=firstmonth;i<=12;i++) {
	 	   		id=i.toString();
	 	   		text=id+"月";
	 	   		if(i<10){id='0'+id}
	 	   		_json_month2.push({id:id,text:text});    		
	 	   	}
		}else if(firstyear<secyear){
			_json_month2=[];
			for(var i=1;i<=12;i++) {
	 	   		id=i.toString();
	 	   		text=id+"月";
		 	   	if(i<10){id='0'+id}
	 	   		_json_month2.push({id:id,text:text});
	 	   	}
		}
	   T("#_month2").dropdown();
	}
	
	var dim_x_id="";
	var dim_x_value_id="";
	
	/*预览按钮，点击事件*/
	function preview(){
		/* var year_start="";
		var year_end="";
		var season_start="";
		var season_end="";
		var month_start="";
		var month_end="";
		var day_all="";
		var flag=true;
		
		dim_x_value_id = $("#thematic_dimension").val();
		var org_id = $("#leaHos_office").val();
		var time_id = $("input[type='radio'][name='timecheck']:checked").val();
		
		if(time_id==1){//年
			year_start = $("#year").val();
			year_end = $("#year2").val();
			if (parseInt(year_start) > parseInt(year_end)) {
				flag=false;
			}
		}else if(time_id==2){//季
			year_start = $("#season_year").val();
			year_end = $("#season_year2").val();
			season_start = $("#season").val();
			season_end = $("#season2").val();
			if (parseInt(year_start+season_start.substring(1,2)) > parseInt(year_end+season_end.substring(1,2))) {
				flag=false;
			}
		}else if(time_id==3){//月
			year_start = $("#month_year").val();
			year_end = $("#month_year2").val();
			month_start = $("#month").val();
			month_end = $("#month2").val();
			if (parseInt(year_start+month_start) > parseInt(year_end+month_end)) {
				flag=false;
			}
		}else if(time_id==4){//日
			day_all = $("#config-demo").val();
		}
		$("input[type='checkbox'][id='sort1']:checked")
		var sort_1 = $("#sort1").prop('checked');
		var sort_2 = $("#sort2").prop('checked');
		var sort_1_column=$("#inHos_num").val();
		var sort_2_column=$("#record").val();

		var data_info={'kpi_id':kpi_id,'dim_name2':dim_x_id,'dim_id':dim_x_value_id,'org_id':org_id,'time':time_id,'year_start':year_start,'year_end':year_end,'quarter_start':season_start,'quarter_end':season_end,'month_start':month_start,'month_end':month_end,'day':day_all,'sort_1':sort_1,'sort_1_column':sort_1_column,'sort_2':sort_2,'sort_2_column':sort_2_column};
		 */
		
		var day_all="";
		dim_x_value_id = $("#thematic_dimension2").val();
		var org_id = $("#leaHos_office2").val();
		var time_id = $("#dim_tj").val();
		
		if(time_id==1){//年
			day_all = $("#year_s_tj").val();
		}else if(time_id==2){//季
			day_all = $("#year_s_tj").val()+$("#serson_tj").val();
		}else if(time_id==3){//月
			day_all = $("#year_s_tj").val()+$("#month_tj").val();
		}else if(time_id==4){//日
			day_all = $("#year_s_tj").val()+$("#month_tj").val()+$("#day_tj").val();
		}
		
		var data_info={'kpi_id':kpi_id,'dim_name2':dim_x_id,'dim_id':dim_x_value_id,'org_id':org_id,'day':day_all};
		
		/* if (flag) {
			
		}else{
			$("#txt_insert p").remove();
			$("#txt_insert").append("<p>时间选择有误！</p>");
			$("#modal_alert").modal("toggle");
		} 
		} */
			$.ajax({
				url: '${ctx}/RStat/add_sql_where',
				type: 'post',
	    		data: JSON.stringify(data_info),
	    		dataType: 'text',
	    		contentType: 'application/json',				
	    		success:function(res2){
	    			var res=eval("("+res2+")");
	    			$("#result_tab").modal("toggle");
    				_get('preview_detail').innerHTML = baidu.template('preview_detail_tpl', res);
	    			
    				//表格数据条数 
	    			var sum_tr=$("#modal_tab table").find('tr').length-1;
	    			$("#sum_tr").val(sum_tr);	
				},
				error:function(){
					$("#txt_insert p").remove();
					$("#txt_insert").append("<p>查询出错！</p>");
					$("#modal_alert").modal("toggle");
				}				
			});
		
		
 		 
	}
</script>

</body>
</html>
