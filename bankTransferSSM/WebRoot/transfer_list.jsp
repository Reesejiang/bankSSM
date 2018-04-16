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
    				<div class="ibox-content">
    					<form role="form" class="form-inline">
                            <div class="form-group">
                                <label for="exampleInputEmail2" class="sr-only">记录类型：</label>
                                <select class="form-control" name="transferType">
                                	<option value="1" <c:if test="${transferType=='1' }">selected="selected"</c:if>>存款</option>
                                	<option value="2" <c:if test="${transferType=='2' }">selected="selected"</c:if>>取款</option>
                                	<option value="3" <c:if test="${transferType=='3' }">selected="selected"</c:if>>行内汇款</option>
                                	<option value="4" <c:if test="${transferType=='4' }">selected="selected"</c:if>>跨行汇款</option>
                                	<option value="5" <c:if test="${transferType=='5' }">selected="selected"</c:if>>多币种汇款</option>
                                </select>
                            </div>
                            <button class="btn btn-blue" type="submit">查询</button>
                        </form>
    				</div>
    			</div>
    		</div>
    	</div>
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                    	<h3>操作信息</h3>	
                    </div>
                    <div class="ibox-content">
                        <table class="table table-striped table-bordered table-hover dataTables-example">
                            <thead>
                            	<c:if test="${transferType=='1' }">
	                            	<tr>
	                                    <th>客户名</th>
	                                    <th>账户</th>
	                                    <th>存款金额</th>
	                                    <th>币种</th>
	                                    <th>存款时间</th>
	                                    <th>账户余额</th>
	                                    <th>存款地点</th>
	                                </tr>
                            	</c:if>
                            	<c:if test="${transferType=='2' }">
                            		<tr>
	                                    <th>客户名</th>
	                                    <th>账户</th>
	                                    <th>取款金额</th>
	                                    <th>币种</th>
	                                    <th>取款时间</th>
	                                    <th>账户余额</th>
	                                    <th>取款地点</th>
	                                </tr>
                            	</c:if>
                            	<c:if test="${transferType=='3' }">
                            		<tr>
	                                    <th>汇款人</th>
	                                    <th>汇款账户</th>
	                                    <th>收款人</th>
	                                    <th>收款账户</th>
	                                    <th>汇款金额</th>
	                                    <th>手续费</th>
	                                    <th>币种</th>
	                                    <th>汇款时间</th>
	                                    <th>账户余额</th>
	                                    <th>汇款地点</th>
	                                </tr>
                            	</c:if>
                            	<c:if test="${transferType=='4' }">
                            		<tr>
	                                    <th>汇款人</th>
	                                    <th>汇款账户</th>
	                                    <th>收款人</th>
	                                    <th>收款账户</th>
	                                    <th>汇款金额</th>
	                                    <th>手续费</th>
	                                    <th>币种</th>
	                                    <th>汇款时间</th>
	                                    <th>账户余额</th>
	                                    <th>汇款地点</th>
	                                </tr>
                            	</c:if>
                            	<c:if test="${transferType=='5' }">
                            		<tr>
	                                    <th>汇款人</th>
	                                    <th>汇款账户</th>
	                                    <th>收款人</th>
	                                    <th>收款账户</th>
	                                    <th>汇款金额(美元)</th>
	                                    <th>实际金额(元)</th>
	                                    <th>手续费</th>
	                                    <th>汇率</th>
	                                    <th>汇款时间</th>
	                                    <th>账户余额</th>
	                                    <th>汇款地点</th>
	                                </tr>
                            	</c:if>
                            </thead>
                            <tbody>
                            	<c:forEach items="${transferList }" var="obj" varStatus="_v">
	                            	<c:if test="${transferType=='1' }">
		                            	<tr>
		                                    <td>${obj.accountName }</td>
		                                    <td>${obj.accountCode }</td>
		                                    <td>${obj.actualAmount }</td>
		                                    <td>人名币</td>
		                                    <td>${obj.transferDate }</td>
		                                    <td>${obj.accountBalance }</td>
		                                    <td>${obj.location }</td>
		                                </tr>
	                            	</c:if>
	                            	<c:if test="${transferType=='2' }">
	                            		<tr>
		                                    <td>${obj.accountName }</td>
		                                    <td>${obj.accountCode }</td>
		                                    <td>${obj.actualAmount }</td>
		                                    <td>人名币</td>
		                                    <td>${obj.transferDate }</td>
		                                    <td>${obj.accountBalance }</td>
		                                    <td>${obj.location }</td>
		                                </tr>
	                            	</c:if>
	                            	<c:if test="${transferType=='3' }">
	                            		<tr>
		                                    <td>${obj.accountName }</td>
		                                    <td>${obj.accountCode }</td>
		                                    <td>${obj.payeeAccountName }</td>
		                                    <td>${obj.payeeAccountCode }</td>
		                                    <td>${obj.actualAmount }</td>
		                                    <td>${obj.chargePrice }</td>
		                                    <td>人民币</td>
		                                    <td>${obj.transferDate }</td>
		                                    <td>${obj.accountBalance }</td>
		                                    <td>${obj.location }</td>
		                                </tr>
	                            	</c:if>
	                            	<c:if test="${transferType=='4' }">
	                            		<tr>
		                                    <td>${obj.accountName }</td>
		                                    <td>${obj.accountCode }</td>
		                                    <td>${obj.payeeAccountName }</td>
		                                    <td>${obj.payeeAccountCode }</td>
		                                    <td>${obj.actualAmount }</td>
		                                    <td>${obj.chargePrice }</td>
		                                    <td>人民币</td>
		                                    <td>${obj.transferDate }</td>
		                                    <td>${obj.accountBalance }</td>
		                                    <td>${obj.location }</td>
		                                </tr>
	                            	</c:if>
	                            	<c:if test="${transferType=='5' }">
	                            		<tr>
		                                    <td>${obj.accountName }</td>
		                                    <td>${obj.accountCode }</td>
		                                    <td>${obj.payeeAccountName }</td>
		                                    <td>${obj.transferAmount }</td>
		                                    <td>${obj.chargePrice }</td>
		                                    <td>${obj.actualAmount }</td>
		                                    <td>${obj.chargePrice }</td>
		                                    <td>${obj.exchangeRate }</td>
		                                    <td>${obj.transferDate }</td>
		                                    <td>${obj.accountBalance }</td>
		                                    <td>${obj.location }</td>
		                                </tr>
	                            	</c:if>
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
</body>
</html>
