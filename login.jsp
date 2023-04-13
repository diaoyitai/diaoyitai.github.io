<%--
  Created by IntelliJ IDEA.
  User: Yitai
  Date: 2023/3/29
  Time: 22:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>请输入密码</title>
    <style>
        html {
            height:100%;
            background-image:url(sources/bj.jpg);
            background-size:cover;  /* 让背景图基于容器大小伸缩 */
        }
        #son {
            position: absolute;
            left: 50%;
            top: 80%;
            transform: translateX(-50%) translateY(-50%);
        }
        .box{
            width: 400px;
            height: 40px;
            display: inline-block;
            text-align: center;
            padding-top: 5px;
            transition:0.5s;
            background-color: transparent;
            font-size: 2rem;
        }
        .box:hover
        {
            transform: scale(1.5);
        }
        [align="center"]{
            color: #c82333;
        }

    </style>
</head>
<body >
<h1 align="center">下面框输入密钥</h1>
<h1 align="center">|</h1>
<h1 align="center">|</h1>
<h1 align="center">|</h1>
<h1 align="center">|</h1>
<h1 align="center">|</h1>
<h1 align="center">|</h1>
<h1 align="center">V</h1>

<div id="son"><input id="password" class="box" onclick="huiche()"><br>
</div>


<script>
    function huiche(){
        document.onkeydown = function(e){
            if((e||event).keyCode==13&&document.getElementById("password").value=="12345")
                window.location.href='space.jsp';
        };
    }
</script>
</body>
</html>
