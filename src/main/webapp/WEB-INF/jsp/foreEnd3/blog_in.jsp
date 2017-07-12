<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/7/3
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="distforeEnd.jsp"/>
    <script>
        $(function () {

            $(".bi_b1 button").click(function () {
                //获取一个坐标
                var listItem = $('.bi_b1 button').index(this);
                //根据坐标找到要操作的div,添加toggle();事件
                $('.bi_yt').eq(listItem).toggle();
            });
        })
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".blog_b1").click(function () {
                $(".blog_b1 span").toggleClass('fa-thumbs-up bi_c');
            });
            $(".blog_b2").click(function () {
                $(".blog_b2 span").toggleClass('fa-check-circle bi_c');
            });
        });
    </script>
</head>
<body>

<jsp:include page="headerforeEnd.jsp"/>

<div class="bi_all">
    <div class="container">
        <div class="bi_top">
            <h2>鹿晗的博客</h2>
            <div>嘿有点意思</div>
        </div>
        <div class="bi_in col-md-12">
            <form action="">
                <!--左边-->
                <div class="bi_left col-md-3">
                    <!--个人信息-->
                    <div class="blogin_news">
                        <div class="blogin_l">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/girl.png" alt="">
                        </div>
                        <div style="text-align: center">
                            <h4 style="margin-top: 15px">金泰妍</h4>
                            <div style="margin-top: 10px">
                                <button class="bi_b"><span class="fa fa-plus"></span> 加关注</button>
                                <button class="bi_b"><span class="fa fa-envelope"></span> 发私信</button>
                            </div>
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/scissors.png" alt="" style="width: 100%;">
                            <div class="bi_more">
                                <div class="bi_more1">
                                    访问: <span>4612</span>
                                </div>
                                <div class="bi_more1">
                                    积分: <span>4612</span>
                                </div>

                                <div class="bi_more1">等级:
                                    <span class="bi_s">BLOG<span class="arrow2"></span><span
                                            class="bi_s1">6</span></span>

                                </div>

                                <div class="bi_more1">
                                    <span>原创: <span>26</span></span>
                                </div>

                                <div class="bi_more1">
                                    <span>转载: <span>560</span></span>
                                </div>
                            </div>


                        </div>
                    </div>
                    <!--阅读排行-->
                    <div class="blog_line">
                        <h4>阅读排行</h4>
                        <ul>
                            <li>
                                <span class="br_l">1</span>&nbsp; <span><a href="">Android 开发技术选型（博客，新闻，阅读类）</a></span>
                            </li>
                            <li>
                                <span class="br_l">2</span>&nbsp; <span><a
                                    href="">React Native 自定义控件之验证码和Toast</a></span>
                            </li>
                            <li>
                                <span class="br_l">3</span>&nbsp; <span><a href="">Python Enclosing作用域、闭包、装饰器</a></span>
                            </li>
                            <li>
                                <span class="br_l">4</span>&nbsp; <span><a
                                    href="">VueJs与ReactJS&AngularJS的差异对比</a></span>
                            </li>
                            <li>
                                <span class="br_l">5</span>&nbsp; <span><a href="">Oracle DB Time 解读</a></span>
                            </li>
                            <li>
                                <span class="br_l">6</span>&nbsp; <span><a href="">SeaweedFS索引-CompactMap</a></span>
                            </li>
                            <li>
                                <span class="br_l">7</span>&nbsp; <span><a href="">[总结]FFMPEG视音频编解码零基础学习方法</a></span>
                            </li>
                            <li>
                                <span class="br_l">8</span>&nbsp; <span><a href="">Android里帐户同步的实现</a></span>
                            </li>
                            <li>
                                <span class="br_l">9</span>&nbsp; <span><a href="">pygame开发2048游戏</a></span>
                            </li>
                            <li>
                                <span class="br_l">10</span>&nbsp; <span><a href="">RSA算法之实现篇</a></span>
                            </li>
                        </ul>
                    </div>
                    <!--评论排行-->
                    <div class="blog_line">
                        <h4>评论排行</h4>
                        <ul>
                            <li>
                                <span class="br_l">1</span>&nbsp; <span><a href="">Android 开发技术选型（博客，新闻，阅读类）</a></span>
                            </li>
                            <li>
                                <span class="br_l">2</span>&nbsp; <span><a
                                    href="">React Native 自定义控件之验证码和Toast</a></span>
                            </li>
                            <li>
                                <span class="br_l">3</span>&nbsp; <span><a href="">Python Enclosing作用域、闭包、装饰器</a></span>
                            </li>
                            <li>
                                <span class="br_l">4</span>&nbsp; <span><a
                                    href="">VueJs与ReactJS&AngularJS的差异对比</a></span>
                            </li>
                            <li>
                                <span class="br_l">5</span>&nbsp; <span><a href="">Oracle DB Time 解读</a></span>
                            </li>
                            <li>
                                <span class="br_l">6</span>&nbsp; <span><a href="">SeaweedFS索引-CompactMap</a></span>
                            </li>
                            <li>
                                <span class="br_l">7</span>&nbsp; <span><a href="">[总结]FFMPEG视音频编解码零基础学习方法</a></span>
                            </li>
                            <li>
                                <span class="br_l">8</span>&nbsp; <span><a href="">Android里帐户同步的实现</a></span>
                            </li>
                            <li>
                                <span class="br_l">9</span>&nbsp; <span><a href="">pygame开发2048游戏</a></span>
                            </li>
                            <li>
                                <span class="br_l">10</span>&nbsp; <span><a href="">RSA算法之实现篇</a></span>
                            </li>
                        </ul>
                    </div>
                </div>

                <!--右边-->
                <div class="bi_right col-md-9">
                    <div class="bi_rin">
                        <div class="bi_rtop">
                            <span class="fa fa-lightbulb-o" style="margin-right: 10px;color: #fc6866"> </span>
                            直播 | 前端开发在线峰会 【直播】探究Linux的总线、设备、驱动模型！
                        </div>
                        <h3>【Cocos2d-x】开发基础-第一个Cocos2d-x游戏</h3>
                        <div class="bi_bb"> 标签：<span>cocos2d-x</span> <span>cocos2d</span> <span>游戏</span></div>
                        <div class="bi_time">
                            <span>2017-07-02 16:50</span>
                            <span class="fa fa-search-plus">114 <span>人收藏</span></span>
                            <span class="fa fa-comments">评论<span>0</span></span>
                        </div>
                        <hr>
                        <div style="margin-left: 10px"><span class="fa fa-bars">
                    </span>&emsp;分类: &emsp; <span>cocos2d-x（10）</span>
                        </div>
                        <hr>
                        <div class="blog_con">
                            命令工具cocos实现，cocos工具其实是cocos2d团队自己开发的。是使用Python脚本编写的，cocos工具的运行需要安装python环境
                            (还会用到ant,eclipse等工具哦，后面介绍)
                            Python下载地址
                            https://www.python.org/
                            需要注意的是它目前有Python3和Python2可以下载，我们选择Python
                            2，不要下载3，因为2和3语法有很大差别，cocos这个工具是使用2编写的，如果你使用了3，会在脚本编译就出问题
                            (我的源代码中有window的Python安装包)
                            下载->安装->配置环境变量(Path中添加Python根目录)
                            点击确定设置好。
                            因为你还没有设置其他环境变量，所以你需要到此目录下：
                            cocos2d-x-3.13.1\tools\cocos2d-console\bin
                            直接输入cmd回车
                            或者shift鼠标右键打开命令窗口，都行
                            如果你不知道怎么用，直接输入cocos会有帮助
                            终端中执行如下指令：
                            cocos new -p com.uifuture -l cpp -d E://chxCocosWork HelloWord
                            com.uifuture是包名，最好是写上(可以不写)，因为在安卓发布打包需要
                            cpp是语言，表示生成c++语言，还有lua,js
                            E://chxCocosWork 为生成目录
                            HelloWord为工程名命令工具cocos实现，cocos工具其实是cocos2d团队自己开发的。是使用Python脚本编写的，cocos工具的运行需要安装python环境
                            (还会用到ant,eclipse等工具哦，后面介绍)
                            Python下载地址
                            https://www.python.org/
                            需要注意的是它目前有Python3和Python2可以下载，我们选择Python
                            2，不要下载3，因为2和3语法有很大差别，cocos这个工具是使用2编写的，如果你使用了3，会在脚本编译就出问题
                            (我的源代码中有window的Python安装包)
                            下载->安装->配置环境变量(Path中添加Python根目录)
                            点击确定设置好。
                            因为你还没有设置其他环境变量，所以你需要到此目录下：
                            cocos2d-x-3.13.1\tools\cocos2d-console\bin
                            直接输入cmd回车
                            或者shift鼠标右键打开命令窗口，都行
                            如果你不知道怎么用，直接输入cocos会有帮助
                            终端中执行如下指令：
                            cocos new -p com.uifuture -l cpp -d E://chxCocosWork HelloWord
                            com.uifuture是包名，最好是写上(可以不写)，因为在安卓发布打包需要
                            cpp是语言，表示生成c++语言，还有lua,js
                            E://chxCocosWork 为生成目录
                            HelloWord为工程名

                        </div>

                        <div class="blogin_center">
                            <div style="float: right">
                                <button class="blog_b1" type="button"><span class="fa fa-thumbs-o-up"></span>
                                </button>
                                <button class="blog_b2" type="button"><span class="fa fa-check"></span>
                                </button>
                                <button class="blog_b3" type="button"><span class="fa fa-weibo"></span>
                                </button>
                                <button class="blog_b3" type="button"><span class="fa fa-weixin"></span>
                                </button>
                                <button class="blog_b3" type="button"><span class="fa fa-qq"></span>
                                </button>
                            </div>
                            <div style="clear: both"></div>
                        </div>

                        <div class="blogin_a">
                            <div class="blogin_a1">
                                <a href="">
                                    <button><span class="fa fa-chevron-up"></span> 上一篇</button>
                                    ArcGIS水文分析实战教程（5）细说流向与流量</a>
                            </div>
                            <div class="blogin_a2">
                                <a href="">
                                    <button><span class="fa fa-chevron-down"></span> 下一篇</button>
                                    ArcGIS水文分析实战教程（7）细说流域提取</a>
                            </div>
                        </div>
                        <div class="blogin_about">
                            <h5>相关文章推荐</h5>
                            <hr>
                            <div class="q col-md-6"><a href="">利用ArcGIS水文分析工具提取河网(转)</a></div>
                            <div class="q col-md-6"><a href="">利用ArcGIS水文分析工具提取河网(转)</a></div>
                            <div class="q col-md-6"><a href="">利用ArcGIS水文分析工具提取河网(转)</a></div>
                            <div class="q col-md-6"><a href="">利用ArcGIS水文分析工具提取河网(转)</a></div>
                            <div class="q col-md-6"><a href="">利用ArcGIS水文分析工具提取河网(转)</a></div>
                            <div class="q col-md-6"><a href="">利用ArcGIS水文分析工具提取河网(转)</a></div>
                            <div class="q col-md-6"><a href="">利用ArcGIS水文分析工具提取河网(转)</a></div>
                            <div class="q col-md-6"><a href="">利用ArcGIS水文分析工具提取河网(转)</a></div>
                            <div class="q col-md-6"><a href="">利用ArcGIS水文分析工具提取河网(转)</a></div>
                            <div class="q col-md-6"><a href="">利用ArcGIS水文分析工具提取河网(转)</a></div>
                            <div style="clear: both"></div>
                        </div>

                        <h3>查看评论</h3>
                        <div class="blog_bottom">
                            <div class="col-md-2">
                                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.jpg" alt="" class="blogin_img"></div>
                            <div class="col-md-10 bl_in">
                                <div class="bi_b1">
                                    <h4>芦苇系联盟</h4>
                                    <div style="">2017-07-02</div>
                                    <button type="button">回复</button>
                                </div>
                                <div style="clear: both"></div>
                                <div>如花少年，光影绮丽，清冽歌声，梦幻华丽。蜷川实花大师执导，以大电影拍摄标准，搭配美国制作人Santell与法国电子乐新贵Picard
                                    bros，共同呈现华美梦境，心血挑战音乐审美极限！@M鹿M 请关注鹿晗最新mini数字专辑《Xplore》，QQ音乐，酷我，酷狗均有销售，请支持正版
                                </div>
                                <div class="bi_yt">
                                    <textarea>
                                    </textarea>
                                    <button>提交</button>
                                </div>
                            </div>
                            <div style="clear: both"></div>

                            <hr>
                        </div>
                        <div class="blog_bottom">
                            <div class="col-md-2">
                                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.jpg" alt="" class="blogin_img"></div>
                            <div class="col-md-10 bl_in">
                                <div class="bi_b1">
                                    <h4>芦苇系联盟</h4>
                                    <div style="">2017-07-02</div>
                                    <button type="button">回复</button>
                                </div>
                                <div style="clear: both"></div>
                                <div>如花少年，光影绮丽，清冽歌声，梦幻华丽。蜷川实花大师执导，以大电影拍摄标准，搭配美国制作人Santell与法国电子乐新贵Picard
                                    bros，共同呈现华美梦境，心血挑战音乐审美极限！@M鹿M 请关注鹿晗最新mini数字专辑《Xplore》，QQ音乐，酷我，酷狗均有销售，请支持正版
                                </div>
                                <div class="bi_yt">
                                    <textarea>
                                    </textarea>
                                    <button>提交</button>
                                </div>
                            </div>
                            <div style="clear: both"></div>

                            <hr>
                        </div>
                        <div class="blog_bottom">
                            <div class="col-md-2">
                                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.jpg" alt="" class="blogin_img"></div>
                            <div class="col-md-10 bl_in">
                                <div class="bi_b1">
                                    <h4>芦苇系联盟</h4>
                                    <div style="">2017-07-02</div>
                                    <button type="button">回复</button>
                                </div>
                                <div style="clear: both"></div>
                                <div>如花少年，光影绮丽，清冽歌声，梦幻华丽。蜷川实花大师执导，以大电影拍摄标准，搭配美国制作人Santell与法国电子乐新贵Picard
                                    bros，共同呈现华美梦境，心血挑战音乐审美极限！@M鹿M 请关注鹿晗最新mini数字专辑《Xplore》，QQ音乐，酷我，酷狗均有销售，请支持正版
                                </div>
                                <div class="bi_yt">
                                    <textarea>
                                    </textarea>
                                    <button>提交</button>
                                </div>
                            </div>
                            <div style="clear: both"></div>

                            <hr>
                        </div>

                        <h3>发表评论</h3>
                        <div class="bi_bottom">
                            <textarea></textarea>
                            <button type="submit">提交</button>
                        </div>
                    </div>

                </div>
            </form>
        </div>
    </div>

</div>
<footer>

</footer>
</body>
</html>
