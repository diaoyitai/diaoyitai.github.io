<%--
  Created by IntelliJ IDEA.
  User: Yitai
  Date: 2023/3/23
  Time: 23:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>空间</title>
    <!--  /Bootstrap/bootstrap-4.3.1/css/bootstrap.min.css -->
    <link rel="stylesheet" href="Bootstrap/bootstrap-4.3.1/css/bootstrap.min.css" >

    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="Jquery/jquery-3.4.1.min.js"></script>

    <script src="Popper/popper.min.js"></script>

    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="Bootstrap/bootstrap-4.3.1/js/bootstrap.min.js"></script>
    <style>
        body{
            background:url("sources/lingya.jpg")  no-repeat;   /*加载背景图*/
            background-size: 100% 100%;
            background-attachment: fixed;
         }

        #昵称{
            font-size:45px ;
        }
        #个性签名::before{
            content:"个性签名:";
            font-size: 15px;
            color:#c82333;

        }
        #个性签名{
            font-family: "Times New Roman";
            font-size: 25px;
            color:  yellow;
        }
        #欢迎{
            font-size: 40px;
            color: #c82333;
        }
        .ab{
            font-size: 25px;
            color:  yellow;
        }
        #网址{
            color:crimson;
        }
        .动态{
            border-radius: 50%;
            overflow: hidden;
            width: 60px;
        }
        .点赞{
            color: #ffc107;
        }

    </style>
</head>
<body>
<!--导航栏-->
<div class="container">
    <div class="row"></div>
<nav class="navbar bg-info navbar-light "> <!-- navbar navbar-expand-sm -->
    <a class="navbar-brand  " href="#"><span class="text-light">个人空间</span></a>
    <span class="text-light col-7"></span>

    <div class="btn-group ">

            <a href="login.jsp" class="btn btn-info " >退出此页面</a>


        <button type="button" class="btn btn-info dropdown-toggle " data-toggle="dropdown">
            联系方式
        </button>

        <div class="dropdown-menu ">
            <a class="dropdown-item" href="#" title="1754813368" onclick='return confirm("QQ:1754813368")'>
                <img src="https://s1.chu0.com/src/img/png/ca/ca8f0304cfe2445aa3f3456dadddd980.png?e=1735488000&token=1srnZGLKZ0Aqlz6dk7yF4SkiYf4eP-YrEOdM1sob:USpiUxFUTK6NTnjoG5NeE5g-Mw8="height="20">
                QQ
            </a>
            <a class="dropdown-item" href="#" title="Yitai18507610850" onclick='return confirm("微信:Yitai18507610850")'>
                <img src="https://s1.chu0.com/src/img/png/d3/d3ba59f695bb4bce9f5c723a1daccaec.png?imageMogr2/auto-orient/thumbnail/!132x132r/gravity/Center/crop/132x132/quality/85/&e=1735488000&token=1srnZGLKZ0Aqlz6dk7yF4SkiYf4eP-YrEOdM1sob:uazp7uNMyVxFSeAb9gt30Q6ifqQ=" height="20">
                WeChat
            </a>
        </div>
    </div>
</nav>
</div>


<div class="container" >
    <div class="row">
        <div class="col-2 ">
            <br>
            <img src="sources/GG%20Bond.jpg" width="150" content="头像"><br><br>

        </div>

        <div class="col-1">
            <br>
            <span id="昵称">TAI</span>

        </div>
        <div class="col-1"></div>
        <div class="col-3" >
            <div id="欢迎">TAI的空间</div>
            <span id="网址">http://localhost:8080/Web/space</span>

        </div>
        <div class="col-4">
            <br><br><br>
            <div  >
            <span id="个性签名">乌云背后是阳光，阳光背后是彩虹。</span>
            </div>
        </div>

    </div>
</div>


<div class="container-fluid">
    <div class="row">
        <div class="col-3">

            <div class="row">
                <div class="col-6"></div>
                <div class="col-6">
                    <div class="card bg-white " >

                        <span><img src="sources/GG.gif" width="50" content="GIF">了解更多</span>
                        <a href="#轮播图片" class="list-group-item"><span class="text-success">
                    <img src="https://s1.aigei.com/src/img/png/24/24fd99adb924462ba6d14ec516802a6f.png?imageMogr2/auto-orient/thumbnail/!240x240r/gravity/Center/crop/240x240/quality/85/&e=1735488000&token=P7S2Xpzfz11vAkASLTkfHN7Fw-oOZBecqeJaxypL:zL-D3NxvfnNlqnas310ANCat8O8=" width="25">
                    相册>></span></a>
                        <a href="#视频" class="list-group-item"><span class="text-success">
                    <img src="https://s1.chu0.com/src/img/png/9d/9d9f97773e1c44d7ad7e79f30ea301f1.png?e=1735488000&token=1srnZGLKZ0Aqlz6dk7yF4SkiYf4eP-YrEOdM1sob:Ccn33lpDsRYZuQXccc1jbq6e-RI=" width="25">
                    视频>></span></a>
                        <a class="list-group-item" href="#动态" ><span class="text-success">
                    <img src="https://s1.chu0.com/src/img/png/8c/8cfbe65ada0a46b3923b2d90a107ca75.png?e=1735488000&token=1srnZGLKZ0Aqlz6dk7yF4SkiYf4eP-YrEOdM1sob:Y47lsAu2I0gNFwLihOV3wb-qIig=" width="25">
                    动态>></span></a>
                        <a class="list-group-item" href="https://www.douyin.com/user/self?showTab=like" target='_blank'><span class="text-success">
                    <img src="https://s1.aigei.com/src/img/png/24/24b1946e5eab420682a679fed987c05f.png?e=1735488000&token=P7S2Xpzfz11vAkASLTkfHN7Fw-oOZBecqeJaxypL:N51ycTOnY7qb4aAnF01F4S0xqcI=" width="25">
                    喜欢>></span></a>

                    </div>
                </div>
            </div>



            <br><br><br>
            <span style="color: #c82333 ;font-size: 30px" >相册</span>
<!------------------------------------------------------------------------轮播-->
                <div id="demo" class="carousel slide" data-ride="carousel">

                   <!- 指示符 -->
                    <ul class="carousel-indicators">
                        <li data-target="#demo" data-slide-to="0" class="active"></li>
                        <li data-target="#demo" data-slide-to="1"></li>
                        <li data-target="#demo" data-slide-to="2"></li>
                    </ul>

                    <!-- 轮播图片 -->
                    <div class="carousel-inner" id="轮播图片">
                        <div class="carousel-item active">
                            <img src="https://n.sinaimg.cn/ent/transform/60/w550h310/20221212/c0f4-8dac316ffb8d745ddba3093064e4980c.jpg" width="340px" height="340">
                        </div>
                        <div class="carousel-item">
                            <img src="https://tse4-mm.cn.bing.net/th/id/OIP-C.AKAfbZPUXtoirmSb8k0NWgHaFm?w=228&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7" width="340px" height="340">
                        </div>
                        <div class="carousel-item">
                            <img src="sources/lunbo1.jpg" width="340px" height="340">
                        </div>
                    </div>

                    <!-- 左右切换按钮 -->
                    <a class="carousel-control-prev" href="#demo" data-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </a>
                    <a class="carousel-control-next" href="#demo" data-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </a>
                <!----------------------------------------------------------------------------------------------轮播-->
                                </div>

            <br><br>
            <span style="color: #c82333 ;font-size: 30px">视频</span>
            <video controls width="340" id="视频">
                <source src="sources/But%20U.mp4">
            </video>


        </div>

                        <div class="col-3">
                            <div class="card bg-info text-white">
                                <div class="card-header">个人简介</div>
                                <div class="card-body">
                                    <table class="table table-bordered table-info">
                                        <tr>
                                            <th>姓名</th>
                                            <td>刁一泰</td>
                                        </tr>
                                        <tr>
                                            <th>年龄</th>
                                            <td>20</td>
                                        </tr>
                                        <tr>
                                            <th>爱好</th>
                                            <td>看书、学习</td>
                                        </tr>
                                        <tr>
                                            <th>性格</th>
                                            <td>不开朗</td>
                                        </tr>
                                        <tr>
                                            <th>家乡</th>
                                            <td>广东河源</td>
                                        </tr>
                                        <tr>
                                            <th>专业</th>
                                            <td>网络工程</td>
                                        </tr>

                                    </table>


                                </div>
                            </div>
<br>
                            <!----我的专业-->
                            <div class="card bg-info">
                                <span class="text-white  card-header">关于我的专业</span>
                                <div class="card-body"> <img src="https://img95.699pic.com/photo/50079/3249.jpg_wh860.jpg" width="300"> </div>
                                <p class="text-white  card-footer">网络工程是指按计划进行的以工程化的思想、方式、方法，设计、研发和解决网络系统问题的工程。是按计划进行的网络综合性工作，它包括网络管理，组装组网（综合布线）等内容。</p>
                            </div>

                        <!---->
                        </div>
                        <div class="col-3">
                            <div class="card bg-info">
                            <span class="text-white  card-header">关于我</span>
                            <div class="card-body"> <img src="https://tse2-mm.cn.bing.net/th/id/OIP-C.dRRBaxqSdQM9Cf0Sk4o3BgHaFj?w=241&h=181&c=7&r=0&o=5&dpr=1.3&pid=1.7"> </div>
                            <p class="text-white  card-footer">本人思想积极上进，性格开朗，生活作风严谨，责任心强，办事沉稳、执着，能吃苦耐劳，适应性强，具有良好的心理素质。</p>
                            </div>
                            <!-------我的家乡----><br>

                            <div class="card bg-info" >
                                <span class="text-white  card-header">关于我的家乡</span>
                                <div class="card-body"><img src="https://tse3-mm.cn.bing.net/th/id/OIP-C.ZThP8wYrnUQECEYEPS4vFwHaE7?w=297&h=197&c=7&r=0&o=5&dpr=1.3&pid=1.7" width="300"></div>
                                <p class="text-white  card-footer">万绿湖在蓝天、白云、朝霞夕阳映衬下，青山延绵，碧水浩淼，峰峦叠秀，飞瀑扬波，松涛拍岸，鸟语蝉鸣，纯真静谥，天然野趣，展现出一幅迷人画卷，如镜花水月般的人间仙境。 </p>
                            </div>



                        </div>
                <div class="col-3">
                    <audio src="sources/Shots.mp3" controls width="200" >
                    </audio>
                    <br>
             <span class="ab" style="color: #c82333">&nbsp;&nbsp;放首音乐听听吧</span>
                </div>

    </div>
    </div>
<br>
<!---- 动态-->
<div class="container">
    <div class="row">
    <div class="col-2"></div>
    <div class="col-8  card-header bg-info">
         <img src="https://s1.chu0.com/src/img/png/8c/8cfbe65ada0a46b3923b2d90a107ca75.png?e=1735488000&token=1srnZGLKZ0Aqlz6dk7yF4SkiYf4eP-YrEOdM1sob:Y47lsAu2I0gNFwLihOV3wb-qIig=" width="30" >
        <span id="动态" style="font-size: 30px">动态</span>
    </div>

    </div>
    </div>

<!-------------------1111111111111111--->
<div class="container">
    <div class="row">
        <div class="col-2"></div>
    <div class="col-8  card-body bg-info">

        <div class="row">

            <div class="col-1" ><img src="sources/GG%20Bond.jpg" class="动态"> </div>
            <div class="col-3">TAI<br>昨天 11:55</div>
        </div>
        <div class="row">
            <div class="col-12" ><span class="动态1">好久没见我的小菲菲了</span><img src="https://pic2.zhimg.com/v2-b01d2f676474d3f34dd078bfa6f7eb01_b.webp" width="45">
            <br><br>
                <img src="sources/lunbo1.jpg" width="700">

            </div>
            <div class="col-12 card-footer">
                <img src="https://s1.aigei.com/src/img/png/db/db71566451a04ceeb343235818b893c0.png?imageMogr2/auto-orient/thumbnail/!240x240r/gravity/Center/crop/240x240/quality/85/&e=1735488000&token=P7S2Xpzfz11vAkASLTkfHN7Fw-oOZBecqeJaxypL:GW5JXraL9sE2aSOmR5ispW5FuHU=" width="20">
                <span class="点赞">迷糊老师、波比、菲菲公主、小呆呆、菲斯拉、刘强东、丁真 共7人觉得很赞</span>
            </div>
        </div>
<br>


    </div>

    </div>
</div>
<br>
<!-------------------2222222222--->

<div class="container">
    <div class="row">
        <div class="col-2"></div>
        <div class="col-8  card-body bg-info">

            <div class="row">

                <div class="col-1" ><img src="sources/GG%20Bond.jpg" class="动态"> </div>
                <div class="col-3">TAI<br>2023年3月28日 23:55</div>
            </div>

            <div class="row">
                <div class="col-12"><span>这是我今天偷拍的迷糊老师哈哈哈哈哈哈哈哈哈好搞笑！</span>
                <br><br>
                <img src="sources/迷糊老师.gif" ></div>
            </div>


            <div class="col-12 card-footer">
                <img src="https://s1.aigei.com/src/img/png/db/db71566451a04ceeb343235818b893c0.png?imageMogr2/auto-orient/thumbnail/!240x240r/gravity/Center/crop/240x240/quality/85/&e=1735488000&token=P7S2Xpzfz11vAkASLTkfHN7Fw-oOZBecqeJaxypL:GW5JXraL9sE2aSOmR5ispW5FuHU=" width="20">
                <span class="点赞">超人强、菲菲公主、小呆呆、菲斯拉、刘强东、丁真、王源 共7人觉得很赞</span><br>
                <span class="点赞">迷糊老师</span>：猪猪侠，明早的课你第一个起来背课文！<br>
                <span class="点赞">GG Bond </span>回复 <span class="点赞">迷糊老师</span>：不要啊迷糊老师！
            </div>

        </div></div></div>

        <!------333333333333--->
<br>
<div class="container">
    <div class="row">
        <div class="col-2"></div>
        <div class="col-8  card-body bg-info">

            <div class="row">

                <div class="col-1" ><img src="sources/GG%20Bond.jpg" class="动态"> </div>
                <div class="col-3">TAI<br>2023年3月22日 11:40</div>
            </div>
            <div class="row">
                <div class="col-12" ><span class="动态1">谁不想变一次光呢<img src="http://qzonestyle.gtimg.cn/qzone/em/e10306.gif"> </span>
                    <br><br>
                    <video src="sources/guang.mp4" controls height="500"></video>
                </div>
                </div>
                <div class="col-12 card-footer">
                    <img src="https://s1.aigei.com/src/img/png/db/db71566451a04ceeb343235818b893c0.png?imageMogr2/auto-orient/thumbnail/!240x240r/gravity/Center/crop/240x240/quality/85/&e=1735488000&token=P7S2Xpzfz11vAkASLTkfHN7Fw-oOZBecqeJaxypL:GW5JXraL9sE2aSOmR5ispW5FuHU=" width="20">
                    <span class="点赞">迷糊老师、菲菲公主、小呆呆、菲斯拉、刘强东、丁真、阿里马云、马化腾、库克、任正非 共10人觉得很赞</span><br>
                        <span class="点赞">马化腾</span>:小弟什么时候来深圳坐坐，我带你面试一下公司的岗位？<br>
                        <span class="点赞">阿里马云</span>:小伙子我很欣赏你！<br>
                        <span class="点赞">库克</span>: Are you interested in Apple phones? I would like to invite you to the United States to have a look.
                </div>
            </div>
        <div class="col-2"><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <a href="#" class="btn btn-info" role="button">回到顶部</a>
        </div>
            <br><br><br><br><br><br><br><br><br><br><br>

<span>&nbsp;</span>
        </div>

    </div>
</div>
<br>






    </div></div>












    </div>
</div>



</body>
</html>
