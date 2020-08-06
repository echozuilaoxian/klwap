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
<card id="card1" title="车子转让"><p>车子转让<br/>---------<br/>
<%
SessionID=request.querystring("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
       set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select cz from usereg where CStr(id)='" & iduse & "'"
       objgbrs.open ssql,conn
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?"
End if
if objgbrs("cz")=0 then
response.write "你没有车子"
end if
if objgbrs("cz")=1 then
response.write "<img src='/bbs/gift/54.jpg' awapzmya='.'/><br/><a href='cz1.asp?SessionID=" & SessionID & "'>转让帕萨特</a>"
end if
if objgbrs("cz")=2 then
response.write "<img src='/bbs/gift/55.jpg' awapzmya='.'/><br/><a href='cz2.asp?SessionID=" & SessionID & "'>转让新皇冠</a>"
end if
if objgbrs("cz")=3 then 
response.write "<img src='/bbs/gift/56.jpg' awapzmya='.'/><br/><a href='cz3.asp?SessionID=" & SessionID & "'>转让法拉利</a>"
end if
if objgbrs("cz")=4 then 
response.write "<img src='bbs/gift/57.jpg' awapzmya='.'/><br/><a href='cz4.asp?SessionID=" & SessionID & "'>转让保时捷</a>"
end if
if objgbrs("cz")=5 then
response.write "<img src='/bbs/gift/58.jpg' awapzmya='.'/><br/><a href='cz5.asp?SessionID=" & SessionID & "'>转让劳斯来斯</a>"
end if
if objgbrs("cz")=6 then
response.write "<img src='/bbs/gift/59.jpg' awapzmya='.'/><br/><a href='cz6.asp?SessionID=" & SessionID & "'>转让电动车</a>"
end if
if objgbrs("cz")=7 then 
response.write "<img src='/bbs/gift/60.jpg' awapzmya='.'/><br/><a href='cz7.asp?SessionID=" & SessionID & "'>转让脚踏车</a>"
end if
if objgbrs("cz")=8 then 
response.write "<img src='/bbs/gift/61.jpg' awapzmya='.'/><br/><a href='cz8.asp?SessionID=" & SessionID & "'>转让摩托车</a>"
end if
if objgbrs("cz")=9 then
response.write "<img src='/bbs/gift/62.jpg' awapzmya='.'/><br/><a href='cz9.asp?SessionID=" & SessionID & "'>转让轮船</a>"
end if
if objgbrs("cz")=10 then
response.write "<img src='/bbs/gift/63.jpg' awapzmya='.'/><br/><a href='cz10.asp?SessionID=" & SessionID & "'>转让飞机</a>"
end if
Response.write "<br/><a href='index.asp?SessionID=" & SessionID & "'>回交易市场</a><br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>回我的地盘</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing

%>