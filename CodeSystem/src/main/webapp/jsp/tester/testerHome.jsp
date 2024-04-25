<%--
  Created by IntelliJ IDEA.
  User: 希望是太阳
  Date: 2024/4/23
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>tester首页</title>
</head>
<style>
    .layui-tab-title li {
        color: black;
    }

</style>
<body class="layui-layout-body">

<div class='layui-layout layui-layout-admin'>
    <div class="layui-header  layui-bg-blue" >
        <div class="layui-logo layui-bg-gray" ><i class="layui-icon layui-icon-tree  layui-bg-orange"></i>&nbsp;&nbsp;&nbsp;<span style="color: cornflowerblue; font-weight: bolder">软件故障定位系统</span>
        </div>
        <!-- 头部区域（可配合layui 已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <!-- 移动端显示 -->
            <li class="layui-nav-item layui-show-xs-inline-block " lay-header-event="menuLeft">
                <!--        上面li标签和原来复制下来的不一样-->
                <i class="layui-icon layui-icon-spread-left" id="icon"></i>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item layui-hide layui-show-sm-inline-block">
                <a href="javascript:;">
                    <img src="//unpkg.com/outeres@0.0.10/img/layui/icon-v2.png" class="layui-nav-img">

                </a>
                <dl class="layui-nav-child">
                    <dd>
                        <a data-url="${pageContext.request.contextPath}/login/ToMine" data-id="tomine" data-title="个人信息" class="site-demo-active"  href="javascript:;" data-type="tabAdd">个人信息</a>
                    </dd>
                    <dd><a href="javascript:;" onclick="logout()">退出系统</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
                <a href="javascript:;">
                    <i class="layui-icon layui-icon-more-vertical"></i>
                </a>
            </li>
        </ul>
    </div>

    <div class='layui-side ' style="background-color: whitesmoke;">
        <div class='layui-side-scroll  layui-bg-blue'>
            <ul class='layui-nav layui-bg-blue layui-nav-tree' lay-filter='side'>

                <li class="layui-nav-item">
                    <a href='javascript:;'>项目管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            &nbsp;&nbsp;&nbsp;&nbsp;<a data-url="${pageContext.request.contextPath}/admin/ToUserList" data-id="userlist" data-title="人员查看" class="site-demo-active"  href="javascript:;" data-type="tabAdd"><i class="layui-icon layui-icon-rate-half"></i>&nbsp;&nbsp;项目查看</a>
                        </dd>
                        <dd>
                            &nbsp;&nbsp;&nbsp;&nbsp;<a data-url="${pageContext.request.contextPath}/admin/ToUserList" data-id="userlist" data-title="人员查看" class="site-demo-active"  href="javascript:;" data-type="tabAdd"><i class="layui-icon layui-icon-rate-half"></i>&nbsp;&nbsp;项目上传</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href='javascript:;'>任务管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            &nbsp;&nbsp;&nbsp;&nbsp; <a data-url="${pageContext.request.contextPath}/admin/ToTaskList" data-id="taskList" data-title="任务查看" class="site-demo-active"  href="javascript:;" data-type="tabAdd"><i class="layui-icon layui-icon-rate"></i>任务查看</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href='javascript:;'>代码管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            &nbsp;&nbsp;&nbsp;&nbsp; <a data-url="${pageContext.request.contextPath}/admin/ToCodeManage" data-id="codemanage" data-title="代码文件查看" class="site-demo-active"  href="javascript:;" data-type="tabAdd"><i class="layui-icon layui-icon-rate-solid"></i>代码文件查看</a>
                        </dd>

                    </dl>
                </li>

                <li class="layui-nav-item">
                    <a href='javascript:;'>文件管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            &nbsp;&nbsp;&nbsp;&nbsp; <a data-url="${pageContext.request.contextPath}/admin/ToFileManage" data-id="filemanage" data-title="文件管理" class="site-demo-active"  href="javascript:;" data-type="tabAdd"><i class="layui-icon  layui-icon-rate-half"></i>文件管理</a>
                        </dd>

                    </dl>
                </li>
                <!-- 以下是其他导航菜单项 -->
            </ul>
        </div>



        <div class="layui-body" >
            <!-- 内容主体区域 -->
            <div class="layui-tab layui-tab-card" lay-filter="demo" lay-allowclose="true">
                <ul class="layui-tab-title" >

                </ul>

                <div class="layui-tab-content" >

                </div>
            </div>
        </div>

    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/layui/2.5.5/layui.all.js"></script>
<script>
    function logout() {
        // 在这里执行退出系统的逻辑
        // 重定向到登录页面
        window.location.href = "${pageContext.request.contextPath}/login/logout";
    }
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
        var $ = layui.jquery;
        //触发事件
        var active = {
            //在这里给active绑定几项事件，后面可通过active调用这些事件
            tabAdd: function(url,id,name) {
                //新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
                //关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
                element.tabAdd('demo', {
                    title: name,
                    content: '<iframe data-frameid="'+id+'" scrolling="auto" frameborder="0" src="'+url+'" style="width:100%; height:120vh;"></iframe>',
                    id: id //规定好的id
                })
                element.render('tab');
            },
            tabChange: function(id) {
                //切换到指定Tab项
                element.tabChange('demo', id); //根据传入的id传入到指定的tab项
            },
            tabDelete: function (id) {
                element.tabDelete("demo", id);//删除
            }
            , tabDeleteAll: function (ids) {//删除所有
                $.each(ids, function (i,item) {
                    element.tabDelete("demo", item); //ids是一个数组，里面存放了多个id，调用tabDelete方法分别删除
                })
            }
        };


        //当点击有site-demo-active属性的标签时，即左侧菜单栏中内容 ，触发点击事件

        $('.site-demo-active').on('click', function()
        {
            var dataid = $(this);
            //这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
            if ($(".layui-tab-title li[lay-id]").length <= 0)
            {
                //如果比零小，则直接打开新的tab项
                active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"),dataid.attr("data-title"));
            }
            else {
                //否则判断该tab项是否以及存在
                var isData = false;
                //初始化一个标志，为false说明未打开该tab项 为true则说明已有

                $.each($(".layui-tab-title li[lay-id]"), function () {
                    //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                    if ($(this).attr("lay-id") == dataid.attr("data-id"))
                    {
                        isData = true;
                    }
                })
                if (isData == false)
                {
                    //标志为false 新增一个tab项
                    active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"),dataid.attr("data-title"));
                }
            }
            //最后不管是否新增tab，最后都转到要打开的选项页面上
            active.tabChange(dataid.attr("data-id"));
        });
    });

</script>

<script>
    //JS
    layui.use(['element', 'layer', 'util'], function () {
        var element = layui.element;
        var layer = layui.layer;
        var util = layui.util;
        var $ = layui.$;
        var isShow = true;

        //头部事件
        util.event('lay-header-event', {
            menuLeft: function (othis) { // 左侧菜单事件
                //定义一个标志位
                //选择出所有的span，并判断是不是hidden,用来隐藏icon后面的span里面的内容，而icon不隐藏
                $('.layui-nav-item span').each(function () {
                    if ($(this).is(':hidden')) {
                        $(this).show();
                    } else {
                        $(this).hide();

                    };
                });
                $('.layui-header span').each(function () {//同上
                    if ($(this).is(':hidden')) {
                        $(this).show();
                    } else {
                        $(this).hide();
                    };
                });

                //判断isshow的状态
                if (isShow) {//收起来
                    $('.layui-side.layui-bg-black').width(60); //设置宽度
                    $('.layui-logo').width(60);
                    // $('.kit-side-fold i').css('margin-right', '70%');  //修改图标的位置
                    $('#icon').removeClass("layui-icon-spread-left");  //修改图标
                    $('#icon').addClass("layui-icon-shrink-right");  //修改图标
                    $('.layui-side li').removeClass("layui-nav-itemed");//取消选中二级导航栏
                    //将footer和body的宽度修改
                    $('.layui-layout-left').css('left', 60 + 'px');
                    $('.layui-body').css('left', 60 + 'px');
                    $('.layui-footer').css('left', 60 + 'px');
                    //将二级导航栏隐藏
                    // $('dd span').each(function () {
                    //   $(this).hide();
                    // });
                    //修改标志位
                    isShow = false;
                } else {//展开来
                    $('.layui-side.layui-bg-black').width(200);
                    $('.layui-logo').width(200);
                    //  $('.kit-side-fold i').css('margin-right', '10%');
                    $('.layui-layout-left').css('left', 200 + 'px');
                    $('.layui-body').css('left', 200 + 'px');
                    $('.layui-footer').css('left', 200 + 'px');
                    $('dd span').each(function () {
                        $(this).show();
                    });
                    $('#icon').addClass("layui-icon-spread-left");  //修改图标
                    $('#icon').removeClass("layui-icon-shrink-right");  //修改图标
                    isShow = true;
                };
            },
            menuRight: function () {  // 右侧菜单事件
                layer.open({
                    type: 1,
                    title: '更多',
                    content: '<div style="padding: 15px;">处理右侧面板的操作</div>',
                    area: ['260px', '100%'],
                    offset: 'rt', // 右上角
                    anim: 'slideLeft', // 从右侧抽屉滑出
                    shadeClose: true,
                    scrollbar: false
                });
            }
        });
    });
</script>
</body>
</html>
