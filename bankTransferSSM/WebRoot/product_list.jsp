<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="shortcut icon" href="<%=basePath%>img/favicon.ico">
	<link href="<%=basePath%>css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath%>css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="<%=basePath%>css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
    
    <!-- Sweet Alert -->
    <link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    

    <link href="<%=basePath%>css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath%>css/style.min862f.css?v=4.1.0" rel="stylesheet">

  </head>
  
  <body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                    	<div class="col-sm-1">
                        	<h3>产品信息</h3>	
                    	</div>
                    	<c:if test="${roler=='0' }">
	                    	<div class="col-sm-1">
                    			<a class="btn btn-success" href="<%=basePath%>product/beforeAddOrUpdateProduct?productId="><i class="fa fa-plus"></i></a>
                    		</div>
	                    </c:if>
                    </div>
                    <div class="ibox-content">
                        <table class="table table-striped table-bordered table-hover dataTables-example">
                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>产品名</th>
                                    <th>兑换所需积分</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${productList }" var="obj" varStatus="_v">
	                            	<tr class="gradeX">
	                                    <td>${_v.count }</td>
	                                    <td>${obj.productName }</td>
	                                    <td>${obj.integralNum }</td>
	                                    <td class="center">
	                                    	<c:if test="${roler=='0' }">
	                                    		<a class="btn btn-warning" href="<%=basePath%>product/beforeAddOrUpdateProduct?productId=${obj.productId}"><i class="fa fa-edit"></i></a>
	                                    		<button class="btn btn-danger" onclick="deleteRow('${obj.productId}')"><i class="fa fa-trash"></i></button>
	                                    	</c:if>
	                                    	<c:if test="${roler=='1' }">
	                                    		<a class="btn btn-warning" href="<%=basePath%>integral/addIntegral?productId=${obj.productId}">兑换</a>
	                                    	</c:if>
	                                    </td>
	                                </tr>
                            	</c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="<%=basePath%>js/jquery.min.js?v=2.1.4"></script>
    <script src="<%=basePath%>js/bootstrap.min.js?v=3.3.6"></script>
    <script src="<%=basePath%>js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="<%=basePath%>js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script src="<%=basePath%>js/plugins/sweetalert/sweetalert.min.js"></script>
    <script src="<%=basePath%>js/content.min.js?v=1.0.0"></script>
    <script>
        $(document).ready(function() {
			$(".dataTables-example").dataTable();
			
			var m = '${m}';
			if(m=='3'){
				swal("提示","积分不足！！！", "error");
			}
		});
		
		function deleteRow(id){
			swal({
				title : "您确定要删除这条信息吗",
				text : "删除后将无法恢复，请谨慎操作！",
				type : "warning",
				showCancelButton : true,
				confirmButtonColor : "#DD6B55",
				confirmButtonText : "是的，我要删除！",
				cancelButtonText : "让我再考虑一下…",
				closeOnConfirm : false,
				closeOnCancel : false
			}, function(isConfirm) {
				if (isConfirm) {
					window.location.href="<%=basePath%>product/deleteProduct?productId="+id;
				} else {
					swal("已取消", "您取消了删除操作！", "error")
				}
			});
		}
    </script>
</body>
</html>
