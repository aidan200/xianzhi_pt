<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/8/4
  Time: 8:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="distforeEnd.jsp"/>
</head>
<body style="background-color: #EEEEEE">
<jsp:include page="headerforeEnd.jsp"/>
<jsp:include page="personnav.jsp"/>

<div class="pup_container">
    <div class="dot_allin">
        <ul id="myTab" class="nav nav-tabs">
            <li class="active">
                <a href="#dot_one" data-toggle="tab" class="dot_tab">
                    我收藏的职位
                </a>
            </li>
            <li><a href="#dot_two" data-toggle="tab" id="to_dot_two">谁查看了我的简历</a></li>
            <li><a href="#dot_three" data-toggle="tab" id="to_dot_three">我关注的企业</a></li>
        </ul>

        <div class="dot_top">
            <div id="myTabContent" class="tab-content">

                <%--我收藏的职位--%>
                <div class="tab-pane fade in active" id="dot_one">
                    <div class="dot_top2">
                        <span class="dot_span">我收藏的职位（<span>10</span>）</span>
                    </div>

                    <%--每个公司列表--%>
                    <div class="dot_have">
                        <div class="dot_left2">
                            <a href="">
                                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.jpg" alt=""
                                     class="dot_head"></a>
                            <div class="dot_test2">
                                <a href=""><h4>网站美工/网页设计师</h4></a>
                                <div>
                                    <span class="dot_sp" style="color: #fc6866;margin-left: 10px">10万</span>|
                                    <span class="dot_sp">沈阳</span>|
                                    <span class="dot_sp">1年经验</span>|
                                    <span class="dot_sp">本科</span>
                                </div>
                            </div>
                            <div class="dot_test3">
                                <div class="dot_t3s"><a href="">吉林省江山网络科技公司</a></div>
                                <div class="dot_t3s" style="margin-top: 5px">互联网/移动联网/电子商务</div>
                                <span style="margin-left: 190px;color: #666">4小时前</span>
                            </div>
                            <div style="float: left;width: 100px;height: auto;overflow: hidden">

                                <button class="dot_but">取消收藏</button>

                            </div>
                        </div>

                        <div class="pop-right-bottom">
                            <b>国</b>
                        </div>
                    </div>
                    <div class="dot_have">
                        <div class="dot_left2">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.jpg" alt=""
                                 class="dot_head">
                            <div class="dot_test2">
                                <h4>网站美工/网页设计师</h4>
                                <div>
                                    <span class="dot_sp" style="color: #fc6866;margin-left: 10px">10万</span>|
                                    <span class="dot_sp">沈阳</span>|
                                    <span class="dot_sp">1年经验</span>|
                                    <span class="dot_sp">本科</span>
                                </div>
                            </div>
                            <div class="dot_test3">
                                <div class="dot_t3s">吉林省江山网络科技公司</div>
                                <div class="dot_t3s" style="margin-top: 5px">互联网/移动联网/电子商务</div>
                                <span style="margin-left: 190px;color: #666">4小时前</span>
                            </div>
                            <div style="float: left;width: 100px;height: auto;overflow: hidden">
                                <button class="dot_but">取消收藏</button>

                            </div>
                        </div>

                        <div class="pop-right-bottom">
                            <b>国</b>
                        </div>
                    </div>


                    <%--分页--%>
                    <div class="zp_botv">
                        <div class="zp_pl">
                            <ul class="pagination zp_pa">
                                <li class="b"><a href="#">上一页</a></li>
                                <li class="active"><a href="#">1</a></li>
                                <li class="a"><a href="#">2</a></li>
                                <li class="a"><a href="#">3</a></li>
                                <li class="a"><a href="#">4</a></li>
                                <li class="a"><a href="#">5</a></li>
                                <li class="a"><a href="#">下一页</a></li>
                            </ul>
                            <div class="zp_page">共 <span>100</span> 页</div>
                        </div>
                    </div>

                    <%--<div class="pop_no">--%>
                    <%--<div class="pop_allimg">--%>
                    <%--<img src="${pageContext.request.contextPath}/dist/foreEnd3/img/sfs.png" alt=""--%>
                    <%--class="rem_img">--%>
                    <%--<p class="all_p">暂无收藏记录</p>--%>
                    <%--</div>--%>
                    <%--</div>--%>
                </div>

                <%--谁查看了我的简历--%>
                <div class="tab-pane fade" id="dot_two">
                    <div class="dot_top2">
                        <span class="dot_span">谁看过我（<span>10</span>）</span>
                    </div>

                    <div class="dot_have">
                        <div class="dot_left2">
                            <a href="">
                                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.jpg" alt=""
                                     class="dot_head"></a>
                            <div class="dot_com">
                                <a href="">
                                    <div class="dot_t5">吉林省江山网络科技公司</div>
                                </a>
                                <div class="dot_ss">
                                    <span>沈阳</span>|
                                    <span>互联网/移动联网/电子商务</span>
                                </div>
                                <div class="dot_spe">
                                    <span>五险一金</span>
                                    <span>包吃包住</span>
                                    <span>没有工资</span>
                                </div>

                            </div>
                            <div class="dot_com2">
                                <div style="margin-top: 5px"><a href="">web前端工程师</a></div>
                                <div style="margin-top: 5px"><a href="">Java高级工程师</a></div>
                                <div style="margin-top: 5px"><a href="">更多</a></div>
                            </div>
                            <%--<div style="float: left;width: 150px;height: auto;overflow: hidden;margin-top: 20px">--%>
                            <%--<span class="fa fa-envelope" style="color: #fc6866;display: inline-block"></span>--%>
                            <%--<span class="fa fa-envelope-open-o" style="color: #cccccc"></span>--%>
                            <%--<div class="dot_sma">时间在这呢</div>--%>
                            <%--</div>--%>
                            <div style="margin-top: 70px;width: 150px;float: left">
                                <span class="dot_sma">2017-08-08</span>&emsp;
                                <span class="fa fa-envelope" style="color: #fc6866;"></span>
                                <span class="fa fa-envelope-open-o" style="color: #cccccc"></span>
                            </div>

                        </div>

                        <div class="pop-right-bottom">
                            <b>国</b>
                        </div>
                    </div>

                    <%--分页--%>
                    <div class="zp_botv">
                        <div class="zp_pl">
                            <ul class="pagination zp_pa">
                                <li class="b"><a href="#">上一页</a></li>
                                <li class="active"><a href="#">1</a></li>
                                <li class="a"><a href="#">2</a></li>
                                <li class="a"><a href="#">3</a></li>
                                <li class="a"><a href="#">4</a></li>
                                <li class="a"><a href="#">5</a></li>
                                <li class="a"><a href="#">下一页</a></li>
                            </ul>
                            <div class="zp_page">共 <span>100</span> 页</div>
                        </div>
                    </div>
                    <%--<div class="pop_no">--%>
                    <%--<div class="pop_allimg">--%>
                    <%--<img src="${pageContext.request.contextPath}/dist/foreEnd3/img/sfs.png" alt=""--%>
                    <%--class="rem_img">--%>
                    <%--<p class="all_p">暂无查看记录</p>--%>
                    <%--</div>--%>
                    <%--</div>--%>
                </div>

                <%--我关注的企业--%>
                <div class="tab-pane fade" id="dot_three">
                    <div class="dot_top2">
                        <span class="dot_span">我关注的企业（<span>10</span>）</span>
                    </div>

                    <div class="dot_have">
                        <div class="dot_left2">
                            <a href="">
                                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.jpg" alt=""
                                     class="dot_head"></a>
                            <div class="dot_com">
                                <a href="">
                                    <div class="dot_t5">吉林省江山网络科技公司</div>
                                </a>
                                <div class="dot_ss">
                                    <span>沈阳</span>|
                                    <span>互联网/移动联网/电子商务</span>
                                </div>
                                <div class="dot_spe">
                                    <span>五险一金</span>
                                    <span>包吃包住</span>
                                    <span>没有工资</span>
                                </div>

                            </div>
                            <div class="dot_com2">
                                <div style="margin-top: 5px"><a href="">web前端工程师</a></div>
                                <div style="margin-top: 5px"><a href="">Java高级工程师</a></div>
                                <div style="margin-top: 5px"><a href="">更多</a></div>
                            </div>
                            <div style="float: left;width: 100px;height: auto;overflow: hidden">
                                <button class="dot_but">取消关注</button>
                                <div class="dot_sma">时间在这呢</div>
                            </div>
                        </div>

                        <div class="pop-right-bottom">
                            <b>国</b>
                        </div>
                    </div>

                    <%--分页--%>
                    <div class="zp_botv">
                        <div class="zp_pl">
                            <ul class="pagination zp_pa">
                                <li class="b"><a href="#">上一页</a></li>
                                <li class="active"><a href="#">1</a></li>
                                <li class="a"><a href="#">2</a></li>
                                <li class="a"><a href="#">3</a></li>
                                <li class="a"><a href="#">4</a></li>
                                <li class="a"><a href="#">5</a></li>
                                <li class="a"><a href="#">下一页</a></li>
                            </ul>
                            <div class="zp_page">共 <span>100</span> 页</div>
                        </div>
                    </div>

                    <%--<div class="pop_no">--%>
                    <%--<div class="pop_allimg">--%>
                    <%--<img src="${pageContext.request.contextPath}/dist/foreEnd3/img/sfs.png" alt=""--%>
                    <%--class="rem_img">--%>
                    <%--<p class="all_p">暂无关注记录</p>--%>
                    <%--</div>--%>
                    <%--</div>--%>
                </div>


            </div>
        </div>
    </div>

</div>
<jsp:include page="behindforeEnd.jsp"/>
</body>
</html>
<script src="${pageContext.request.contextPath}/dist/foreEnd3/js/myDate.js"></script>
<script>
    var path = '${pageContext.request.contextPath}';


    function BaseBox() {
        this.page;
        this.rows = 5;
        this.pages;
        this.total;
        this.dataBox;

    }
    BaseBox.prototype.init = function () {
        var _self = this;
        if (_self.page) {
            _self.go(_self.page);
        } else {
            _self.go(1);
        }
    }
    BaseBox.prototype.getData = function (url, data, callBack) {
        var _self = this;
        $.ajax({
            url: url,
            data: data,
            dataType: 'json',
            success: function (data) {
                callBack(data);
                _self.fen(10, data.page, data.pages);
            }, error: function () {
                alert("超时，请重新登陆");
            }
        });
    }
    BaseBox.prototype.fen = function (length, page, pages) {
        var _self = this;
        var html = "";
        var pBegin;
        var pEnd;
        if (pages > length) {
            pBegin = page - length / 2;
            if (pBegin <= 0) {
                pBegin = 1;
            }
            pEnd = length + pBegin - 1;
            if (pEnd > pages) {
                pEnd = pages;
                pBegin = pEnd - length + 1;
            }
        } else {
            pBegin = 1;
            pEnd = pages;
        }
        html += '<div class="zp_botv"><div class="zp_pl"><ul class="pagination zp_pa">';
        if (page == 1) {
            html += '<li class="b"><a>上一页</a></li>';
        } else {
            html += '<li class="a"><a onclick="toPage(' + (page - 1) + ')" href="#">上一页</a></li>';
        }
        for (var i = pBegin; i <= pEnd; i++) {
            if (i == page) {
                html += '<li class="active"><a>' + i + '</a></li> ';
            } else {
                html += '<li class="a"><a onclick="toPage(' + i + ')">' + i + '</a></li> ';
            }
        }
        if (page == pages) {
            html += '<li class="b"><a>下一页</a></li>';
        } else {
            html += '<li class="a"><a onclick="toPage(' + (page + 1) + ')">下一页</a></li>';
        }
        html += '</ul><div class="zp_page">共 <span>' + pages + '</span> 页</div></div></div>';
        $(_self.dataBox).append(html);
    }


    function sawMe(dataBox) {
        BaseBox.call(this);
        this.dataBox = dataBox;
    }
    sawMe.prototype = new BaseBox();


    sawMe.prototype.go = function (page) {
        var _self = this;
        _self.getData(path + "/ResumeBrowse/selWhoSawMe.do", {page: page, rows: _self.rows}, function (data) {
            _self.dataBox.innerHTML = '<div class="dot_top2">' +
                '<span class="dot_span">谁看过我（<span>' + data.total + '</span>）</span></div>';
            var rbList = data.resumeBrowseList;
            for (var i = 0; i < rbList.length; i++) {
                var str = '';
                str += '<div class="dot_have"><div class="dot_left2">';
                if(rbList[i].company.companyPicture!=null){
                    str += '<a><img src="'+path+'/uploadImg/'+rbList[i].company.companyPicture+'" class="dot_head"/></a>';
                }else{
                    str += '<a><img src="'+path+'/dist/foreEnd3/img/huilogo.png" class="dot_head"/></a>';
                }
                str += '<div class="dot_com"><a class="isRead" data-readId="'+rbList[i].browseId+'" target="_blank" href="'+path+'/CompanyInfo/selCompanyInf.do?companyId='+rbList[i].company.companyId+'">';
                str += '<div class="dot_t5">' + rbList[i].company.companyName + '</div></a>';
                str += '<div class="dot_ss"><span>' + rbList[i].company.companyCity + '</span>|';
                str += '<span>';
                for(j=0;j<rbList[i].company.domains.length;j++){
                    str +=rbList[i].company.domains[j].field.fieldName;
                    if(j>=2)break;
                    str +='/';
                }
                str += '</span>';
                str += '</div><div class="dot_spe">';
                for (var j = 0; j < rbList[i].company.welfares.length; j++) {
                    str += '<span>' + rbList[i].company.welfares[j].welfareName + '</span>';
                    if (j > 3)break;
                }
                str += '</div></div><div class="dot_com2">';
                for (var j = 0; rbList[i].company.postions.length; j++) {
                    str += '<div style="margin-top: 5px"><a class="isRead" data-readId="'+rbList[i].browseId+'" target="_blank" href="'+path+'/Postion/selPostionInfo.do?postionId='+rbList[i].company.postions[j].postionId+'">' + rbList[i].company.postions[j].postionName + '</a></div>';
                    if (j >= 1)break;
                }
                str += '</div>';
                str += '<div style="margin-top: 70px;width: 150px;float: left">';
                str += '<span class="dot_sma">'+getNowFormatDateSS(rbList[i].browseTime)+'</span>&emsp;';
                if(rbList[i].isread=='0'){
                    str += '<span id="readFlag" class="fa fa-envelope" style="color: #fc6866;"></span>';
                }else if(rbList[i].isread=='1'){
                    str += '<span class="fa fa-envelope-open-o" style="color: #cccccc"></span>';
                }
                str += '</div>';

                str += '</div><div class="pop-right-bottom"><b>';
                if (rbList[i].company.companyNature == '1') {
                    str += '国';
                } else if (rbList[i].company.companyNature == '2') {
                    str += '民';
                } else if (rbList[i].company.companyNature == '3') {
                    str += '外';
                } else if (rbList[i].company.companyNature == '4') {
                    str += '政';
                }
                str += '</b></div></div></div>';
                $(_self.dataBox).append(str);
            }
            $('.isRead').on('click',function () {
                alert($(this).attr('data-readId'));
                $.ajax({
                   url:path+'/ResumeBrowse/updateIsRead.do',
                    data:{resumeBrowseId:$(this).attr('data-readId')},
                    success:function (data) {
                        if(data.msg=="ok"){
                            $('#readFlag').css('color','#cccccc');
                            $('#readFlag').removeClass('fa-envelope');
                            $('#readFlag').addClass('fa-envelope-open-o');
                        }
                    }
                });
            })
        });
    }
    function follow(dataBox) {
        BaseBox.call(this);
        this.dataBox = dataBox;
    }
    follow.prototype = new BaseBox();
    follow.prototype.go = function (page) {
        var _self = this;
        _self.getData(path + "/Follow/selFollowByMember.do", {page: page, rows: _self.rows}, function (data) {
            _self.dataBox.innerHTML = '<div class="dot_top2">' +
                '<span class="dot_span">我关注的企业（<span>' + data.total + '</span>）</span></div>';
            var rbList = data.companyFollowList;
            for (var i = 0; i < rbList.length; i++) {
                var str = '';
                str += '<div class="dot_have"><div class="dot_left2">';
                if(rbList[i].company.companyPicture!=null){
                    str += '<a><img src="'+path+'/uploadImg/'+rbList[i].company.companyPicture+'" class="dot_head"/></a>';
                }else{
                    str += '<a><img src="'+path+'/dist/foreEnd3/img/huilogo.png" class="dot_head"/></a>';
                }
                str += '<div class="dot_com"><a target="_blank" href="'+path+'/CompanyInfo/selCompanyInf.do?companyId='+rbList[i].company.companyId+'">';
                str += '<div class="dot_t5">' + rbList[i].company.companyName + '</div></a>';
                str += '<div class="dot_ss"><span>' + rbList[i].company.companyCity + '</span>|';
                str += '<span>';
                for(j=0;j<rbList[i].company.domains.length;j++){
                    str +=rbList[i].company.domains[j].field.fieldName;
                    if(j>=2)break;
                    str +='/';
                }
                str += '</span>';
                str += '</div><div class="dot_spe">';
                for (var j = 0; j < rbList[i].company.welfares.length; j++) {
                    str += '<span>' + rbList[i].company.welfares[j].welfareName + '</span>';
                    if (j > 3)break;
                }
                str += '</div></div><div class="dot_com2">';
                for (var j = 0; rbList[i].company.postions.length; j++) {
                    str += '<div style="margin-top: 5px"><a target="_blank" href="'+path+'/Postion/selPostionInfo.do?postionId='+rbList[i].company.postions[j].postionId+'">' + rbList[i].company.postions[j].postionName + '</a></div>';
                    if (j >= 1)break;
                }
            /*<div style="float: left;width: 100px;height: auto;overflow: hidden">
                    <button class="dot_but">取消关注</button>
                    <div class="dot_sma">时间在这呢</div>
                </div>*/
                str += '</div>';
                str += '<div style="float: left;width: 100px;height: auto;overflow: hidden">';
                str += '<button class="dot_but">取消关注</button>';
                str += '<div class="dot_sma">'+getNowFormatDateSS(rbList[i].followTime)+'</div></div>';

                str += '</div><div class="pop-right-bottom"><b>';
                if (rbList[i].company.companyNature == '1') {
                    str += '国';
                } else if (rbList[i].company.companyNature == '2') {
                    str += '民';
                } else if (rbList[i].company.companyNature == '3') {
                    str += '外';
                } else if (rbList[i].company.companyNature == '4') {
                    str += '政';
                }
                str += '</b></div></div></div>';
                $(_self.dataBox).append(str);
            }
        });
    }




    var sm = new sawMe(document.getElementById("dot_two"));
    var ff = new follow(document.getElementById("dot_three"));

    $('#to_dot_two').on("click", function () {
        sm.init();
    })
    $('#to_dot_three').on('click',function () {
        ff.init();
    })
</script>