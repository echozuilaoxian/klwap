<?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"><% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<wml>  
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>     
<card title="天气预报">
<p> <img src="logo.gif" alt=""/><br/>
输入一个城市，如：北京 <br/>
<input name="word" emptyok="true" /><br/><anchor>搜天气<go href="index.asp" method="get">  
<postfield name="loc" value="$(word)"/></go>
</anchor><br/>=-=-=-=-=-=-
<% 
source=server.urlencode(request("source"))
if source="" then source="g_cn"
loc=server.urlencode(request("loc"))
if loc="" then loc="%E5%B9%BF%E5%B7%9E"
mrestrict=server.urlencode(request("mrestrict"))
if mrestrict="" then mrestrict="xhtml"
eosr=server.urlencode(request("eosr"))
if eosr="" then eosr="on"
site=server.urlencode(request("site"))
if site="" then site="weather"
On Error Resume Next
Server.ScriptTimeOut=9999999
Function getHTTPPage(Path)
 t = GetBody(Path)
End function
function getHTTPPage(url) 
dim Http 
set Http=server.createobject("MSXML2.XMLHTTP")
Http.open "GET",url,false 
Http.send() 
if Http.readystate<>4 then 
exit function 
end if 
getHTTPPage=bytesToBSTR(Http.responseBody,"utf-8") 
set http=nothing 
if err.number<>0 then err.Clear 
end function 
Function BytesToBstr(body,Cset) 
dim objstream 
set objstream = Server.CreateObject("adodb.stream") 
objstream.Type = 1 
objstream.Mode =3 
objstream.Open 
objstream.Write body 
objstream.Position = 0 
objstream.Type = 2 
objstream.Charset = Cset 
BytesToBstr = objstream.ReadText 
objstream.Close 
set objstream = nothing 
End Function 
%>
<% 
Dim Url,Html,start,over,body,wap,wstr,str
Url="http://www.google.cn/wml/search?eosr=on&mrestrict=wml&loc="&loc&"&site="&site&""
wstr=getHTTPPage(url)           
start=Instr(wstr,"<br/> </p> <p align=""left"">")
over=Instr(wstr,"<b><small>热门城市天气")
body=mid(wstr,start,over-start)
'body = replace(body,"","") 
Response.write body
%><br/>
热门城市<br/>
<a href="index.asp?loc=%E5%8C%97%E4%BA%AC">北京</a>|<a href="index.asp?loc=%E5%B9%BF%E5%B7%9E">广州</a>|<a href="index.asp?loc=%E6%B7%B1%E5%9C%B3">深圳</a>|<a href="index.asp?loc=%E4%B8%8A%E6%B5%B7">上海</a>|<a href="index.asp?loc=%E6%9D%AD%E5%B7%9E">杭州</a>
<br/>=-=-=-=-=-=-<br/>
<a href="/index.asp">首页</a><br/><b>CopyRight 2009 <br/>气象报告天气粉不错..太阳晒得偶脸颊红红..</b><br/><small>提醒:将查询后的页面存入书签,可方便下次查询!<br/>
<%=time%></small><br/></p></card></wml>