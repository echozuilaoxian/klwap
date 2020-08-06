<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/></head>
<card id="hotpk" title="我的花园"><p>
<img src='/bbs/hua/img/1_0.gif' alt='花园'/><br/>
<%
 if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id="&id&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
  	response.end
    End if

Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
lasttlls="132"
lasttls

if Session("ltlybz")="dfg34fdf_dfg554ghy_3452" then
  Response.write "对不起,您的发信权已被锁，请与管理员联系！</p></card></wml>" 
    response.end
End if
%>
<%

'--------------------
'宠物PK

'结束
'-------------------



  set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select id from usereg where CStr(id)='" & iduse & "'"
       objgbrs.open ssql,conn
if objgbrs.eof then
Response.write "错误,该号不存在"
else
set rs8=Server.CreateObject("ADODB.Recordset")
       ssql="select * from hua where CStr(ids)='" & iduse & "'"
       rs8.open ssql,conn,1,2
if rs8.recordcount<1 then
rs8.addnew
rs8("ids")=iduse
rs8.update
end if
end if

if lycount>0 then
    Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'>" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id=" & objgbrs("id") & "&amp;"
End if
if rs8("nong")="m" then
Response.write "你还没有购置农场,<br/>要想种花先要<a href='/bbs/hua/nong.asp?SessionID="&SessionID&"'>购置</a>农场哦.<br/>"
else
%>

<%
end if
newyear=DateDiff("n",now,rs8("timed"))
if rs8("huas")=0 then mgs="<a href='/bbs/hua/zhong_y.asp?SessionID="&SessionID&"'>你要给它浇水才会发芽哦</a><br/>"

if rs8("huas")=1 and rs8("timed")>now() then mgs="<img src='/bbs/hua/img/plantedseed.gif' alt='发芽'/><br/>还有"&newyear&"分钟就发芽了<br/>"
if rs8("huas")=1 and rs8("timed")<(now) then mgs="<img src='/bbs/hua/img/seedling.gif' alt='成长'/><br/>要使它长成花苗:<br/>你现在要给它<a href='/bbs/hua/zhong_y.asp?SessionID="&SessionID&"'>浇水</a>1次.<a href='/bbs/hua/zhong_f.asp?SessionID="&SessionID&"'>施肥</a>1次<br/>"
if rs8("huas")=2  and rs8("huax")=0 then mgs="<img src='/bbs/hua/img/seedling.gif' alt='成长'/><br/>要使它长成花苗:<br/>你现在要给它<a href='/bbs/hua/zhong_f.asp?SessionID="&SessionID&"'>施肥</a>1次<br/>"
if rs8("huas")=1  and rs8("huax")=1 then mgs="<img src='/bbs/hua/img/seedling.gif' alt='成长'/><br/>要使它长成花苗:<br/>你现在要给它<a href='/bbs/hua/zhong_y.asp?SessionID="&SessionID&"'>浇水</a>1次<br/>"

if rs8("huas")=2 and rs8("timed")>now() and rs8("huax")=1  then mgs="<img src='/bbs/hua/img/seedling.gif' alt='成长'/><br/>还有"&newyear&"分钟就成长稚嫩花苗了<br/>"
if rs8("huas")=2 and rs8("timed")<(now)  and rs8("huax")=1 then mgs="<img src='/bbs/hua/img/bud.gif' alt='成长'/><br/>成为待放花蕾还需给它<br/><a href='/bbs/hua/zhong_y.asp?SessionID="&SessionID&"'>浇水</a>1次.<a href='/bbs/hua/zhong_f.asp?SessionID="&SessionID&"'>施肥</a>1次<a href='/bbs/hua/zhong_e.asp?SessionID="&SessionID&"'>除草除虫</a>1次<br/>"

if rs8("huas")=3  and rs8("huax")=1   and rs8("huaxx")=0 then mgs="<img src='/bbs/hua/img/bud.gif' alt='成长'/><br/>成为待放花蕾还需给它<br/><a href='/bbs/hua/zhong_f.asp?SessionID="&SessionID&"'>施肥</a>1次<a href='/bbs/hua/zhong_e.asp?SessionID="&SessionID&"'>除草除虫</a>1次<br/>"
if rs8("huas")=3  and rs8("huax")=2   and rs8("huaxx")=0 then mgs="<img src='/bbs/hua/img/bud.gif' alt='成长'/><br/>成为待放花蕾还需给它<br/><a href='/bbs/hua/zhong_e.asp?SessionID="&SessionID&"'>除草除虫</a>1次<br/>"
if rs8("huas")=2  and rs8("huax")=2   and rs8("huaxx")=0 then mgs="<img src='/bbs/hua/img/bud.gif' alt='成长'/><br/>成为待放花蕾还需给它<br/><a href='/bbs/hua/zhong_y.asp?SessionID="&SessionID&"'>浇水</a>1次<a href='/bbs/hua/zhong_e.asp?SessionID="&SessionID&"'>除草除虫</a>1次<br/>"
if rs8("huas")=2  and rs8("huax")=1   and rs8("huaxx")=1 then mgs="<img src='/bbs/hua/img/bud.gif' alt='成长'/><br/>成为待放花蕾还需给它<br/><a href='/bbs/hua/zhong_f.asp?SessionID="&SessionID&"'>施肥</a>1次<a href='/bbs/hua/zhong_y.asp?SessionID="&SessionID&"'>浇水</a>1次<br/>"
if rs8("huas")=3  and rs8("huax")=1   and rs8("huaxx")=1 then mgs="<img src='/bbs/hua/img/bud.gif' alt='成长'/><br/>成为待放花蕾还需给它<br/><a href='/bbs/hua/zhong_f.asp?SessionID="&SessionID&"'>施肥</a>1次<br/>"
if rs8("huas")=2  and rs8("huax")=2   and rs8("huaxx")=1 then mgs="<img src='/bbs/hua/img/bud.gif' alt='成长'/><br/>成为待放花蕾还需给它<br/><a href='/bbs/hua/zhong_y.asp?SessionID="&SessionID&"'>浇水</a>1次"


if rs8("huas")=3 and rs8("timed")>now()  and rs8("huax")=2   and rs8("huaxx")=1  then mgs="<img src='/bbs/hua/img/bud.gif' alt='成长'/><br/>还有"&newyear&"分钟就成为待放花蕾了<br/>"
if rs8("huas")=3 and rs8("timed")<(now) and rs8("huax")=2   and rs8("huaxx")=1 then mgs="<img src='/bbs/hua/img/bud.gif' alt='花蕾'/><br/>成为鲜花还需给它<br/><a href='/bbs/hua/zhong_y.asp?SessionID="&SessionID&"'>浇水</a>1次.<a href='/bbs/hua/zhong_f.asp?SessionID="&SessionID&"'>施肥</a>1次<a href='/bbs/hua/zhong_e.asp?SessionID="&SessionID&"'>除草除虫</a>1次<br/>"

if rs8("huas")=4  and rs8("huax")=2   and rs8("huaxx")=1 then mgs="<img src='/bbs/hua/img/bud.gif' alt='花蕾'/><br/>成为鲜花还需给它<br/><a href='/bbs/hua/zhong_f.asp?SessionID="&SessionID&"'>施肥</a>1次<a href='/bbs/hua/zhong_e.asp?SessionID="&SessionID&"'>除草除虫</a>1次<br/>"
if rs8("huas")=4  and rs8("huax")=3   and rs8("huaxx")=1 then mgs="<img src='/bbs/hua/img/bud.gif' alt='花蕾'/><br/>成为鲜花还需给它<br/><a href='/bbs/hua/zhong_e.asp?SessionID="&SessionID&"'>除草除虫</a>1次<br/>"
if rs8("huas")=3  and rs8("huax")=3   and rs8("huaxx")=1 then mgs="<img src='/bbs/hua/img/bud.gif' alt='花蕾'/><br/>成为鲜花还需给它<br/><a href='/bbs/hua/zhong_y.asp?SessionID="&SessionID&"'>浇水</a>1次<a href='/bbs/hua/zhong_e.asp?SessionID="&SessionID&"'>除草除虫</a>1次<br/>"
if rs8("huas")=3  and rs8("huax")=2   and rs8("huaxx")=2 then mgs="<img src='/bbs/hua/img/bud.gif' alt='花蕾'/><br/>成为鲜花还需给它<br/><a href='/bbs/hua/zhong_f.asp?SessionID="&SessionID&"'>施肥</a>1次<a href='/bbs/hua/zhong_y.asp?SessionID="&SessionID&"'>浇水</a>1次<br/>"
if rs8("huas")=4  and rs8("huax")=2   and rs8("huaxx")=2 then mgs="<img src='/bbs/hua/img/bud.gif' alt='花蕾'/><br/>成为鲜花还需给它<br/><a href='/bbs/hua/zhong_f.asp?SessionID="&SessionID&"'>施肥</a>1次<br/>"
if rs8("huas")=3  and rs8("huax")=3   and rs8("huaxx")=2 then mgs="<img src='/bbs/hua/img/bud.gif' alt='花蕾'/><br/>成为鲜花还需给它<br/><a href='/bbs/hua/zhong_y.asp?SessionID="&SessionID&"'>浇水</a>1次"

if rs8("huas")=4 and rs8("timed")>now()  and rs8("huax")=3   and rs8("huaxx")=2  then mgs="<img src='/bbs/hua/img/bud.gif' alt='开花'/><br/>还有"&newyear&"分钟就成为鲜花了<br/>"
if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=12 then mgs="<img src='/bbs/xhjy/hua/12.gif' alt='鲜花'/><br/>经过你的精心照料后,终于等到了花开之时!<br/><a href='/bbs/hua/zhong_ok.asp?SessionID="&SessionID&"'>摘取鲜花</a><br/>"

if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=11 then mgs="<img src='/bbs/xhjy/hua/11.gif' alt='鲜花'/><br/>经过你的精心照料后,终于等到了花开之时!<br/><a href='/bbs/hua/zhong_ok.asp?SessionID="&SessionID&"'>摘取鲜花</a><br/>"

if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=10 then mgs="<img src='/bbs/xhjy/hua/10.gif' alt='鲜花'/><br/>经过你的精心照料后,终于等到了花开之时!<br/><a href='/bbs/hua/zhong_ok.asp?SessionID="&SessionID&"'>摘取鲜花</a><br/>"

if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=9 then mgs="<img src='/bbs/xhjy/hua/9.gif' alt='鲜花'/><br/>经过你的精心照料后,终于等到了花开之时!<br/><a href='/bbs/hua/zhong_ok.asp?SessionID="&SessionID&"'>摘取鲜花</a><br/>"
if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=8 then mgs="<img src='/bbs/xhjy/hua/8.gif' alt='鲜花'/><br/>经过你的精心照料后,终于等到了花开之时!<br/><a href='/bbs/hua/zhong_ok.asp?SessionID="&SessionID&"'>摘取鲜花</a><br/>"

if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=7 then mgs="<img src='/bbs/xhjy/hua/7.gif' alt='鲜花'/><br/>经过你的精心照料后,终于等到了花开之时!<br/><a href='/bbs/hua/zhong_ok.asp?SessionID="&SessionID&"'>摘取鲜花</a><br/>"

if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=6 then mgs="<img src='/bbs/xhjy/hua/6.gif' alt='鲜花'/><br/>经过你的精心照料后,终于等到了花开之时!<br/><a href='/bbs/hua/zhong_ok.asp?SessionID="&SessionID&"'>摘取鲜花</a><br/>"

if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=5 then mgs="<img src='/bbs/xhjy/hua/5.gif' alt='鲜花'/><br/>经过你的精心照料后,终于等到了花开之时!<br/><a href='/bbs/hua/zhong_ok.asp?SessionID="&SessionID&"'>摘取鲜花</a><br/>"
if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=4 then mgs="<img src='/bbs/xhjy/hua/4.gif' alt='鲜花'/><br/>经过你的精心照料后,终于等到了花开之时!<br/><a href='/bbs/hua/zhong_ok.asp?SessionID="&SessionID&"'>摘取鲜花</a><br/>"

if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=3 then mgs="<img src='/bbs/xhjy/hua/3.gif' alt='鲜花'/><br/>经过你的精心照料后,终于等到了花开之时!<br/><a href='/bbs/hua/zhong_ok.asp?SessionID="&SessionID&"'>摘取鲜花</a><br/>"

if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=2 then mgs="<img src='/bbs/xhjy/hua/2.gif' alt='鲜花'/><br/>经过你的精心照料后,终于等到了花开之时!<br/><a href='/bbs/hua/zhong_ok.asp?SessionID="&SessionID&"'>摘取鲜花</a><br/>"

if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=1 then mgs="<img src='/bbs/xhjy/hua/1.gif' alt='鲜花'/><br/>经过你的精心照料后,终于等到了花开之时!<br/><a href='/bbs/hua/zhong_ok.asp?SessionID="&SessionID&"'>摘取鲜花</a><br/>"
if rs8("hongdj")=0 and rs8("hongz")=0 then
Response.write "<img src='/bbs/hua/img/seed.gif' alt='荒地'/><br/>空地还没有种花"
end if
if rs8("hongdj")=0 and rs8("hongz")>0 then
Response.write "<img src='/bbs/hua/img/seed.gif' alt='.'/><br/>"
Response.write mgs
end if
if rs8("hongdj")=1then
Response.write mgs
end if
if rs8("hongdj")=2 then
Response.write mgs
end if
if rs8("hongdj")=3 then
Response.write mgs
end if
if rs8("hongdj")=4 then
Response.write mgs
end if
Response.write "<br/>------------<br/>你共收到<a href='/bbs/hua/souhua.asp?SessionID="&SessionID&"'>("&rs8("hongss")+rs8("huangss")+rs8("ziss")+rs8("yiss")+rs8("hmuss")+rs8("kangss")+rs8("manss")+rs8("tianss")+rs8("zmuss")+rs8("qangss")+rs8("qianss")+rs8("puss")&")</a>朵鲜花.<a href='/bbs/hua/bbsshjl.asp?SessionID="&SessionID&"'>记录</a>"
Response.write "<br/>------------<br/>你共有<a href='/bbs/hua/zhong.asp?SessionID="&SessionID&"'>("&rs8("hong")+rs8("huang")+rs8("zi")+rs8("yi")+rs8("hmu")+rs8("kang")+rs8("man")+rs8("tian")+rs8("zmu")+rs8("qang")+rs8("qian")+rs8("pu")&")</a>粒花种子.<a href='/bbs/hua/zhong_m.asp?SessionID="&SessionID&"'>购买</a>"
Response.write "<br/>------------<br/>你共有("&rs8("hongs")+rs8("huangs")+rs8("zis")+rs8("yis")+rs8("hmus")+rs8("kangs")+rs8("mans")+rs8("tians")+rs8("zmus")+rs8("qangs")+rs8("qians")+rs8("pus")&")朵鲜花.<a href='/BBS/hua/sohua.Asp?SessionID=" & SessionID & "'>"&converttowidebaiti("送花")&"</a><br/>------------<br/>"
response.write "<img src='/bbs/xhjy/hua/1.gif' alt='.'/>红玫瑰:"&rs8("hongs")&"朵."
response.write "<img src='/bbs/xhjy/hua/2.gif' alt='.'/>红牡丹:"&rs8("hmus")&"朵"
response.write "<br/><img src='/bbs/xhjy/hua/3.gif' alt='.'/>郁金香:"&rs8("huangs")&"朵."
response.write "<img src='/bbs/xhjy/hua/4.gif' alt='.'/>康乃馨:"&rs8("kangs")&"朵<br/><img src='/bbs/xhjy/hua/5.gif' alt='.'/>满天星:"&rs8("mans")&"朵."
response.write "<img src='/bbs/xhjy/hua/6.gif' alt='.'/>蓝玫瑰:"&rs8("zis")&"朵"
response.write "<br/><img src='/bbs/xhjy/hua/7.gif' alt='.'/>天堂鸟:"&rs8("tians")&"朵."
response.write "<img src='/bbs/xhjy/hua/8.gif' alt='.'/>紫牡丹:"&rs8("zmus")&"朵<br/><img src='/bbs/xhjy/hua/9.gif' alt='.'/>向日葵:"&rs8("yis")&"朵."
response.write "<img src='/bbs/xhjy/hua/10.gif' alt='.'/>蔷薇花:"&rs8("qangs")&"朵"
response.write "<br/><img src='/bbs/xhjy/hua/11.gif' alt='.'/>牵牛花:"&rs8("qians")&"朵."
response.write "<img src='/bbs/xhjy/hua/12.gif' alt='.'/>蒲公英:"&rs8("pus")&"朵<br/>"
%>
<!--#INCLUDE VIRTUAL="/bbs/hua/klwll.asp"-->
</p></card></wml>


   


