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
                    	<div class="col-sm-1">
                    		<a class="btn btn-success" href="<%=basePath%>account/beforeAddOrUpdateAccount?accountId="><i class="fa fa-plus"></i> 开户</a>
                    	</div>
                    </div>
                    <div class="ibox-content">
                        <table class="table table-striped table-bordered table-hover dataTables-example">
                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>卡号</th>
                                    <th>账户密码</th>
                                    <th>账户类型</th>
                                    <th>所属银行</th>
                                    <th>开卡行</th>
                                    <th>开卡时间</th>
                                    <th>客户名</th>
                                    <th>客户住址</th>
                                    <th>出生年月</th>
                                    <th>联系电话</th>
                                    <th>余额</th>
                                    <th>积分</th>
                                    <th>账户状态</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${accountList }" var="obj" varStatus="_v">
	                            	<tr class="gradeX">
	                                    <td>${_v.count }</td>
	                                    <td>${obj.accountCode }</td>
	                                    <td>${obj.accountPwd }</td>
	                                    <td>
	                                    	<c:if test="${obj.accountType=='1'}">单币种</c:if>
	                                    	<c:if test="${obj.accountType=='2'}">多币种</c:if>
	                                    </td>
	                                    <td>${obj.bankName }</td>
	                                    <td>${obj.createBank }</td>
	                                    <td>${obj.createTime }</td>
	                                    <td>${obj.accountName }</td>
	                                    <td>${obj.address }</td>
	                                    <td>${obj.birthday }</td>
	                                    <td>${obj.phone }</td>
	                                    <td>${obj.balance }</td>
	                                    <td>${obj.integralNum }</td>
	                                    <td>
	                                    	<c:if test="${obj.status=='0'}">待审核</c:if>
	                                    	<c:if test="${obj.status=='1'}">正常</c:if>
	                                    	<c:if test="${obj.status=='2'}">审核未通过</c:if>
	                                    	<c:if test="${obj.status=='3'}">挂失中</c:if>
	                                    	<c:if test="${obj.status=='4'}">已注销</c:if>
	                                    </td>
	                                    <td class="center">
	                                    	<c:if test="${obj.status=='0' }">
												<a class="btn btn-warning" href="<%=basePath%>account/updateStatus?accountId=${obj.accountId}&status=1">通过</a>
												<a class="btn btn-warning" href="<%=basePath%>account/updateStatus?accountId=${obj.accountId}&status=2">拒绝</a>	                                    	
	                                    	</c:if>
	                                    	<c:if test="${obj.status=='1' }">
	                                    		<a class="btn btn-warning" href="<%=basePath%>account/updateStatus?accountId=${obj.accountId}&status=3">挂失</a>
	                                    		<a class="btn btn-warning" href="<%=basePath%>account/updateStatus?accountId=${obj.accountId}&status=4">销户</a>
	                                    	</c:if>
	                                    	<c:if test="${obj.status=='3' }">
												<a class="btn btn-warning" href="<%=basePath%>account/updateStatus?accountId=${obj.accountId}&status=1">解挂</a>	                                    	
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
    <script src="<%=basePath%>js/content.min.js?v=1.0.0"></script>
    <script>
        $(document).ready(function() {
			$(".dataTables-example").dataTable();
		});
    </script>
</body>
</html>
