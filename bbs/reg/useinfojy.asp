<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="家园资料"><p>
<%
wap=request.querystring("wap")
Server.ScriptTimeout=999
iduse=Session("useid")
iduse=Session("useid")
lasttlls="323"
lasttls
       set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select * from usereg where CStr(id)='" & iduse & "'"
       objgbrs.open ssql,conn
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?wap=" & wap & "'>" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id=" & objgbrs("id") & "&amp;"
End if
Response.write "<img src='jy.gif' alt='LOGO'/><br/>住址:第" & CStr(objgbrs("id"))
if objgbrs("fanj")=0 then
response.write "个公园内.(未买房子)"
end if
if objgbrs("fanj")=1 then
response.write "号-<a href='/bbs/chan/fanjt/dsgy.asp?wap=" & wap & "'>单身公寓</a>"
end if
if objgbrs("fanj")=2 then
response.write "号-<a href='/bbs/chan/fanjt/dhty.asp?wap=" & wap & "'>帝豪庭苑</a>"
end if
if objgbrs("fanj")=3 then 
response.write "号-<a href='/bbs/chan/fanjt/csjy.asp?wap=" & wap & "'>彩色家园</a>"
end if
if objgbrs("fanj")=4 then 
response.write "号-<a href='/bbs/chan/fanjt/hstf.asp?wap=" & wap & "'>环山套房</a>"
end if
if objgbrs("fanj")=5 then
response.write "号-<a href='/bbs/chan/fanjt/hwbs.asp?wap=" & wap & "'>海湾别墅</a>"
end if
Response.write "<br/>车子：" 
if objgbrs("cz")=0 then
response.write "<a href='/bbs/chan/cz.asp?wap=" & wap & "'>(未买车子)</a>"
end if
if objgbrs("cz")=1 then
response.write "<a href='/bbs/chan/czt/dz.asp?wap=" & wap & "'>帕萨特</a>"
end if
if objgbrs("cz")=2 then
response.write "<a href='/bbs/chan/czt/jm.asp?wap=" & wap & "'>新皇冠</a>"
end if
if objgbrs("cz")=3 then 
response.write "<a href='/bbs/chan//czt/fll.asp?wap=" & wap & "'>法拉利</a>"
end if
if objgbrs("cz")=4 then 
response.write "<a href='/bbs/chan/czt/bsj.asp?wap=" & wap & "'>保时捷</a>"
end if
if objgbrs("cz")=5 then
response.write "<a href='/bbs/chan/czt/lsls.asp?wap=" & wap & "'>劳斯来斯"
end if
if objgbrs("cz")=6 then
response.write "<a href='/bbs/chan/czt/ddc.asp?wap=" & wap & "'>电动车</a>"
end if
if objgbrs("cz")=7 then
response.write "<a href='/bbs/chan/czt/jtc.asp?wap=" & wap & "'>脚踏车</a>"
end if
if objgbrs("cz")=8 then
response.write "<a href='/bbs/chan/czt/mtc.asp?wap=" & wap & "'>摩托车</a>"
end if
if objgbrs("cz")=9 then
response.write "<a href='/bbs/chan/czt/lc.asp?wap=" & wap & "'>轮船</a>"
end if
if objgbrs("cz")=10 then
response.write "<a href='/bbs/chan/czt/fj.asp?wap=" & wap & "'>飞机</a>"
end if
Response.write "<br/><br/><a href='/bbs/public/gygl.asp?wap=" & wap & "'>我的地盘</a><br/><a href='/bbs/ztlb.asp?wap=" & wap & "'>回社区论坛</a><br/><a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a></p></card></wml>"
%>



