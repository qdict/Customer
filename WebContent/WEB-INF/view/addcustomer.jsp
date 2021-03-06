<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
.input-lg { /* 设置大的输入框input*/
	height: 80px;
	padding: 10px 16px;
	font-size: 18px;
	line-height: 1.33;
	border-radius: 6px;
}

.control-label {
	font-size: 18px;
	font-weight: bold;
}
</style>
<script type="text/javascript">
	var Gid = document.getElementById;
	var showArea = function() {
		Gid('show').innerHTML = "<h3>省" + Gid('s_province').value + " - 市"
				+ Gid('s_city').value + " - 县/区" + Gid('s_county').value
				+ "</h3>"
	}
	Gid('s_county').setAttribute('onchange', 'showArea()');
	function addcustomer() {
		var _form = document.getElementById("form1");
		//获取该表单下的所有input标签
		var a = _form.getElementsByTagName("input");
		for (var i = 0; i < a.length; i++) {
			if (a[i].value == "") {
				toastr.warning("您有空白未填写！");
				return false;
				break;
			}
			if (a[i].value.length < 2) {
				toastr.warning("至少输输两个字符！");
				return false;
				break;
			}
		}
		toastr.success("添加成功")
	}
</script>
</head>
<body>
	<div class="row-fluid">
		<div class="span12" style="margin-top: 80px;">
			<form name="form1" class="form-horizontal"
				action="<%=path%>/customer/addqr.do" method="post" id="form1">
				<div style='float: left;'>
					<div class="control-group">
						<label class="control-label">公司名称:</label>
						<div class="controls">
							<input type="text" style="height: 40px; width: 300px;"
								name="comname" placeholder="公司名称" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">申请类型:</label>
						<div class="controls">
							<select id="atype" name="atype"
								style="height: 40px; width: 300px;">
								<option value="企业">企业</option>
								<option value="院校">院校</option>
								<option value="代理">代理</option>
							</select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">公司背景:</label>
						<div class="controls">
							<select id="usertype" name="combackdrop"
								style="height: 40px; width: 300px;">
								<option value="机构组织">机构组织</option>
								<option value="农林牧渔">农林牧渔</option>
								<option value="医药卫生">医药卫生</option>
								<option value="建筑建材">建筑建材</option>
								<option value="冶金矿产">冶金矿产</option>
								<option value="交通运输">交通运输</option>
								<option value="信息产业">信息产业</option>
								<option value="机械机电">机械机电</option>
								<option value="轻工食品">轻工食品</option>
								<option value="服装纺织">服装纺织</option>
								<option value="专业服务">专业服务</option>
								<option value="安全防护">安全防护</option>
								<option value="家居用品">家居用品</option>
								<option value="包装">包装</option>
								<option value="体育">体育</option>
								<option value="办公">办公</option>
								<option value="物资">物资</option>
								<option value="其它">其它</option>
							</select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">公司地址:</label>

						<div class="info">
							<div  class="controls">
								 <select id="s_province" name="comaddress" style="height: 30px; width: 85px;"></select>  
								 <select id="s_city" name="comaddress" style="height: 30px; width: 85px;"></select>  
								 <select id="s_county" name="comaddress" style="height: 30px; width: 100px;"></select>
								 <script class="resources library" src="<%=path%>/js/liandong/area.js"
									type="text/javascript">
								 </script>
								<script type="text/javascript">
									_init_area();
								</script>
							</div>
							<div id="show"></div>
						</div>
					<!-- 	<div class="controls">
							<input type="text" style="height: 40px; width: 300px;"
								name="comaddress" placeholder="公司地址" />
						</div> -->
					</div>
					<div class="control-group">
						<label class="control-label">主营产品:</label>
						<div class="controls">
							<input type="text" style="height: 40px; width: 300px;"
								name="product" placeholder="主营产品" />
						</div>
					</div>
				</div>
				<div style="float: left;">
					<div class="control-group">
						<label class="control-label">组织结构:</label>
						<div class="controls">
							<input type="text" style="height: 40px; width: 300px;"
								name="structure" placeholder="组织结构" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">测试人:</label>
						<div class="controls">
							<select name="testman" style="height: 40px; width: 300px;">
								<c:forEach var="list" items="${userName}">
									<option value="${list.uname}">${list.uname}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">申请信息:</label>
						<div class="controls">
							<input type="text" style="height: 40px; width: 300px;"
								name="amessage" placeholder="申请信息" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">客户状态:</label>
						<div class="controls">
							<select id="usertype" name="state"
								style="height: 40px; width: 300px;">
								<option value="正式客户">正式客户</option>
								<option value="潜在客户">潜在客户</option>
								<option value="签约客户">签约客户</option>
							</select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">指派人：</label>
						<div class="controls">
							<select name="designated" style="height: 40px; width: 300px;">
								<c:forEach var="list" items="${userName}">
									<option value="${list.uname}">${list.uname}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<p style="clear: both;"></p>
				<div class="control-group"
					style="margin-left: 300px; margin-top: 40px;">
					<div class="controls">
						<button type="submit" class="btn"
							style="height: 40px; width: 150px;"
							onclick="return addcustomer()">确认</button>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
<link rel="stylesheet" href="<%=path%>/js/toastr/toastr.css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrap-theme.css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrap-combined.min.css">
<script src="<%=path%>/js/liandong/area.js"></script>
<script src="<%=path%>/js/zh-cn.js"></script>
<script src="<%=path%>/js/bootstrap.js"></script>
<script src="<%=path%>/js/jquery-ui.js"></script>
<script src="<%=path%>/js/jquery/jQuery-2.2.0.min.js"></script>
<script src="<%=path%>/js/jquery.ui.touch-punch.min.js"></script>
<script src="<%=path%>/js/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path%>/js/jquery-migrate-1.4.1.min (1).js"></script>
<script src="<%=path%>/js/toastr/toastr.min.js"></script>
<script src="<%=path%>/js/deletejs.js"></script>


</html>