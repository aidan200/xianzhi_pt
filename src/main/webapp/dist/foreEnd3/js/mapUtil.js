/**
 * Created by Administrator on 2017/7/24.
 */


/*
var postion = {};
postion.city = "北京"
postion.x = 123;
postion.y = 123;
postion.input = null;
postion.container = "gsdz";
postion.rollback;
*/

function myMap(postion) {
    this.x = postion.x;
    this.y = postion.y;
    this.autocomplete;
    if(postion.city){
        this.city = postion.city;
    }else{
        this.city = "北京";
    }
    if(postion.input){
        this.inputId = postion.input;
    }
    if(postion.rollback){
        this.rollback = postion.rollback;
    }
    this.map = new BMap.Map(postion.container);
    this.point;
    if(this.x&&this.y){
        this.point = new BMap.Point(this.x,this.y);
    }
}

myMap.prototype.init = function () {
    var _self = this;
    //创建搜索服务对象
    if(_self.point){
        //节点搜索范围
        _self.map.centerAndZoom(_self.point,10);
        _self.map.enableScrollWheelZoom(true);
        _self.autocomplete = new BMap.Autocomplete({location:_self.point,input:_self.inputId});
        var rs = {point:_self.point};
        _self.setPoint(rs);
    }else{
        //console.log(_self.map);
        //城市搜索范围
        _self.map.centerAndZoom(_self.city);
        //_self.map.addControl(new BMap.NavigationControl());
        _self.map.enableScrollWheelZoom(true);
        _self.autocomplete = new BMap.Autocomplete({location:_self.city,input:_self.inputId});
    }
    //搜索对象
    var localSearch = new BMap.LocalSearch(_self.map);
    localSearch.setSearchCompleteCallback(function (searchResult) {
        var poi = searchResult.getPoi(0);
        _self.setPoint(poi);
    });
    //搜索对象选中回调
    _self.autocomplete.addEventListener('onconfirm',function (rs) {
        var address = document.getElementById(_self.inputId).value;
        //console.log(address);
        _self.map.setZoom(14);
        //触发坐标搜索
        localSearch.search(address);
    });
    //map点击事件
    _self.map.addEventListener('click',function (rs) {
            _self.setPoint(rs);
    })

}
//设置坐标
myMap.prototype.setPoint = function (rs) {
    var _slef = this;
    _slef.map.clearOverlays();//清空原来的标注
    var ppt = new BMap.Point(rs.point.lat,rs.point.lng);
    var marker = new BMap.Marker(ppt);  // 创建标注，为要查询的地址对应的经纬度
    _slef.map.addOverlay(marker);
    _slef.map.panTo(ppt);
    if(_slef.rollback){
        _slef.rollback(rs);
    }
}
myMap.prototype.setCity = function (postion) {
    var _self = this;
    //城市搜索范围
    _self.map = new BMap.Map(postion.container);
    console.log(_self.map);
    _self.point = null;
    _self.city = postion.city;
    _self.init();

}