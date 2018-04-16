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

	<!-- 向导 -->
    <link href="<%=basePath%>css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="<%=basePath%>css/plugins/steps/jquery.steps.css" rel="stylesheet">
    
	<!-- Sweet Alert -->
    <link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    
    <link href="<%=basePath%>css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath%>css/style.min862f.css?v=4.1.0" rel="stylesheet">

  </head>
  
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox">
                    <div class="ibox-title">
                        <h5>取款</h5>
                    </div>
                    <div class="ibox-content">
                        <h2>取款流程向导</h2>
                        <form id="form" action="<%=basePath%>transfer/addTransfer" class="wizard-big" method="post">
                            <h1>账户</h1>
                            <fieldset>
                                <h2>账户信息</h2>
                                <div class="row">
                                    <div class="col-sm-8">
                                    	<input type="hidden" id="accountId" name="accountId" value=""> <!-- 账号 -->
			                            <input type="hidden" id="balance" name="balance" value=""> <!-- 余额 -->
			                            <input type="hidden" id="integralNum" name="integralNum" value=""> <!-- 积分 -->
			                            
                                        <div class="form-group">
                                            <label>用户名 *</label>
                                            <input id="accountName" name="accountName" type="text" class="form-control required">
                                        </div>
                                        <div class="form-group">
                                            <label>账号 *</label>
                                            <input id="accountCode" name="accountCode" type="text" class="form-control required">
                                        </div>
                                        <div class="form-group">
                                            <label>取款密码 *</label>
                                            <input id="accountPwd" name="accountPwd" type="password" class="form-control required" maxlength="10">
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                            <h1>取款</h1>
                            <fieldset>
                                <h2>输入取款金额</h2>
                                <div class="row">
                                    <div class="col-sm-8">
                                    	<input type="hidden" name="transferId" value="">
			                            <input type="hidden" name="transferType" value="2"> <!-- 存款 -->
			                            <input type="hidden" name="transferName" value="取款"> <!-- 存款 -->
			                            <input type="hidden" name="currencyType" value="1"> <!-- 人民币 -->
			                            <input type="hidden" name="chargePrice" value="0"> <!-- 手续费 -->
			                            <input type="hidden" name="isBank" value="N"> <!-- 是否跨行 -->
                                        
                                        <div class="form-group">
                                            <label>取款金额 *</label>
                                            <input id="transferAmount" name="transferAmount" type="text" class="form-control required">
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                            <h1>完成</h1>
                            <fieldset>
                                <h2>取款确认</h2>
                                <div class="row">
                                	<div class="col-sm-4">
                                        <div class="form-group">
                                            <label>取款人姓名：</label>
                                            <input id="accountNameTemp" type="text" class="form-control" readonly="readonly">
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label>取款账户：</label>
                                            <input id="accountCodeTemp" type="text" class="form-control" readonly="readonly">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                	<div class="col-sm-4">
                                        <div class="form-group">
                                            <label>取款金额(元)：</label>
                                            <input id="transferAmountTemp" type="text" class="form-control" readonly="readonly">
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label>手续费(元)：</label>
                                            <input id="chargePriceTemp" type="text" value="0" class="form-control" readonly="readonly">
                                        </div>
                                    </div>
                                </div>
                                <input id="acceptTerms" name="acceptTerms" type="checkbox" class="required">
                                <label for="acceptTerms">确认取款信息</label>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="<%=basePath%>js/jquery.min.js?v=2.1.4"></script>
    <script src="<%=basePath%>js/bootstrap.min.js?v=3.3.6"></script>
    <script src="<%=basePath%>js/content.min.js?v=1.0.0"></script>
    <script src="<%=basePath%>js/plugins/staps/jquery.steps.min.js"></script>
    <script src="<%=basePath%>js/plugins/validate/jquery.validate.min.js"></script>
    <script src="<%=basePath%>js/plugins/validate/messages_zh.min.js"></script>
    <script src="<%=basePath%>js/plugins/sweetalert/sweetalert.min.js"></script>
    
    <script type="text/javascript">
	    $(document).ready(
			function() {
				var msg = '${msg}';
				if(msg!=null&&msg!=''){
					swal("提示",msg, "success");
				}
			
				$("#form").steps({
					bodyTag : "fieldset",
					onStepChanging : function(event, currentIndex, newIndex) {
						
						if (currentIndex > newIndex) {
							return true
						}
						if (newIndex === 3 && Number($("#age").val()) < 18) {
							return false
						}
						var form = $(this);
						if (currentIndex < newIndex) {
							$(".body:eq(" + newIndex + ") label.error", form).remove();
							$(".body:eq(" + newIndex + ") .error", form).removeClass("error")
						}
						form.validate().settings.ignore = ":disabled,:hidden";
						var flag= form.valid();
						if(flag){
							if(currentIndex==0){
							// 验证账号密码是否有效

								var accountName=$("#accountName").val();
								var accountCode=$("#accountCode").val();
								var accountPwd=$("#accountPwd").val();
								$.ajax({
									url:"<%=basePath%>account/checkAccount",
									type:"POST",
									dataType:"json",
									cache: false,
									async: false,
									data:{
										accountName:accountName,
										accountCode:accountCode,
										accountPwd:accountPwd,
										accountType:"N"
									},
									success:function (re){
										if(re.code=='0'){
											$("#accountId").val(re.data.accountId);
											$("#balance").val(re.data.balance);
											$("#integralNum").val(re.data.integralNum);
											
											$("#accountNameTemp").val(re.data.accountName);
											$("#accountCodeTemp").val(re.data.accountCode);
											
											flag=true;			
										}else if(re.code=='1'){
											swal("提示",re.message, "error");
											flag=false;
										}
									}
								});
							}else if(currentIndex==1){
								var transferAmount = Number($("#transferAmount").val());
								var balance = Number($("#balance").val());
								
								if(transferAmount>balance){
									swal("提示","余额不足！！", "warning");
									flag=false;
								}else{
									var transferAmount = Number($("#transferAmount").val());
									$("#transferAmountTemp").val(transferAmount);
									flag=true;
								}
							}
						}
						return flag;
					},
					onFinishing : function(event, currentIndex) {
						var form = $(this);
						form.validate().settings.ignore = ":disabled";
						return form.valid();
					},
					onFinished : function(event, currentIndex) {
						var form = $(this);
						form.submit();
					}
				}).validate({
					errorPlacement : function(error, element) {
						element.before(error);
					},
					rules : {
						accountPwd : {
							 maxlength: 8,
							 minlength: 6
						},
						transferAmount : {
							min:0
						}
					}
				});
			});
    </script>
</body>
</html>
