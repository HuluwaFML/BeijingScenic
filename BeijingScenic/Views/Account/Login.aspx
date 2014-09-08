<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="Stylesheet" type="text/css" href="../../Content/bootstrap.min.css"/>
    <link rel="Stylesheet" type="text/css" href="../../Content/site.css" />
    <script src="../../Scripts/jquery-1.7.1.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>
</head>
<body class="container">
    <div class="row">
        <h2 class="col-md-4 col-md-offset-4">景点管理小系统</h2>
        <div class="row">
            <%using (Html.BeginForm("LoginAction", "Account",  FormMethod.Post, new {@class="col-md-4 col-md-offset-4 login-form"}))%>
                <% {  %>
                <div class="form-group">
                    <label for="email-input">请输入邮箱：</label>
                    <input type="email" class="form-control" id="email-input" name="Email" placeholder="Email" />
                </div>
                <div class="form-group">
                    <label for="password-input">请输入密码</label>
                    <input type="password" class="form-control" id="password-input" name="Password" placeholder="Password" />
                </div>
                <button type="submit" class="btn btn-default col-md-offset-2">登陆</button>
                <% } %>
        </div>
    </div>
</body>
        <script type="text/javascript">
            //execute when the DOM has been loaded  
            $(document).ready(function () {
                //wire up to the form submit event  
                $(".login-form").submit(function (event) {
                    event.preventDefault();  //prevent the actual form post  
                    loginAction(this, callBackFun, "html");
                });
            });

            function loginAction(form, callback, format) {
                $.ajax({
                    url: form.action,
                    type: form.method,
                    dataType: format,
                    data: $(form).serialize(),
                    success: callback
                });
            }
            function callBackFun(result) {
                //clear the form  
                alert(result);
                if (result == "\"Error1\"")
                {
                    alert("没有这个邮箱!");
                }
                else if (result == "\"Error2\"")
                {
                    alert("密码不正确!");
                }
                else {
                    
                    location.href = "../Home/Index";
                }
            }
        </script>
</html>
