/**
 * Created by Administrator on 2017/7/4.
 */
function getNowFormatDate(tt)
{
    var day;
    if(tt == undefined){
        day = new Date();
    }else{
        day = new Date(tt);
    }
    var Year = 0;
    var Month = 0;
    var Day = 0;
    var CurrentDate = "";
    //初始化时间
    //Year       = day.getYear();//有火狐下2008年显示108的bug
    Year       = day.getFullYear();//ie火狐下都可以
    Month      = day.getMonth()+1;
    Day        = day.getDate();
    CurrentDate += Year + "-";
    if (Month >= 10 )
    {
        CurrentDate += Month + "-";
    }
    else
    {
        CurrentDate += "0" + Month + "-";
    }
    if (Day >= 10 )
    {
        CurrentDate += Day ;
    }
    else
    {
        CurrentDate += "0" + Day ;
    }

    return CurrentDate;
}

function getNowFormatDateSS(tt)
{
    var day;
    if(tt == undefined){
        day = new Date();
    }else{
        day = new Date(tt);
    }
    var Month = 0;
    var Day = 0;
    var H = 0;
    var M = 0;
    var CurrentDate = "";
    //初始化时间
    Month      = day.getMonth()+1;
    Day        = day.getDate();
    H          = day.getHours();
    M          = day.getMinutes();
    if (Month >= 10 )
    {
        CurrentDate += Month + "-";
    }
    else
    {
        CurrentDate += "0" + Month + "-";
    }
    if (Day >= 10 )
    {
        CurrentDate += Day ;
    }
    else
    {
        CurrentDate += "0" + Day ;
    }
    CurrentDate += " ";
    if (H >= 10){
        CurrentDate += H;
    }else{
        CurrentDate += "0" + H;
    }
    CurrentDate += ":";
    if(M >= 10){
        CurrentDate += M;
    }else{
        CurrentDate += "0" + M;
    }

    return CurrentDate;
}
