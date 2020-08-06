<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<%s=request.QueryString("s")
if s="" then s="xhbao.cn"
%>  
<head>
<meta http-equiv="Cache-Control" content="no-cache" forua="true"/>
<meta http-equiv="Cache-Control" content="max-age=0" forua="true"/>
</head>
<card id="main" title="报码专区" ontimer="bm.asp?s=<%=s%>"><timer value="50"/>
<p>
 
<%
'**************************************
'WAP优惠建站套餐
'50 元建一独立站 
'空间大小100M全能空间, 
'赠送简易建站系统. 
'赠送Cn顶级域名一个（免费一年） 
'脚本支持：htm html asp php 
'永久免费ACCESS 
'首年赠送：MYSQL或sql2000/mssql （选一） 
'MYSQL数据库：赠送20M 
'MSSQL数据库：赠送20M 
'IIS数量： 150个 
'CPU限制：CPU限制3% 
'空间流量：无限制 
'域名绑定：4个域名绑定 
'在线解压：支持 
'WAP访问 ：支持 
'技术QQ:162290070 
'信箱：Wapss@QQ.com 
'电话：0757-26672231
'☆長風網絡☆Cfwap.Net 
'長風技術聯盟群:37539667
'****************************************
'国外空间，可以做色情。6合 彩票等。。。
'100M/108元1000M298元/年要的联系我
'**************************************** 
On Error Resume Next
Server.ScriptTimeOut=9999999
Function getHTTPPage(Path)
 t = GetBody(Path)      
End function
function getHTTPPage(url) 
dim Http 
set Http=server.createobject("Microsoft.XMLHTTP") 
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
s=request("s")
page=request("page")
 
cf = " http://bm.viphk.net/index.asp"
%>
<% 
Dim Url,Html,start,over,body,wap,wstr,str
Url=""&cf&""
wstr=getHTTPPage(url)
start=Instr(wstr,"<p")
over=Instr(wstr,"</p>")
body=mid(wstr,start,over-start)
'**************************************
'WAP优惠建站套餐
'50 元建一独立站 
'空间大小100M全能空间, 
'赠送简易建站系统. 
'赠送Cn顶级域名一个（免费一年） 
'脚本支持：htm html asp php 
'永久免费ACCESS 
'首年赠送：MYSQL或sql2000/mssql （选一） 
'MYSQL数据库：赠送20M 
'MSSQL数据库：赠送20M 
'IIS数量： 150个 
'CPU限制：CPU限制3% 
'空间流量：无限制 
'域名绑定：4个域名绑定 
'在线解压：支持 
'WAP访问 ：支持 
'技术QQ:162290070 
'信箱：Wapss@QQ.com 
'电话：0757-26672231
'☆長風網絡☆Cfwap.Net 
'長風技術聯盟群:37539667
'****************************************
'国外空间，可以做色情。6合 彩票等。。。
'100M/108元1000M298元/年要的联系我
'****************************************
body = replace(body,"<p>","")
body = replace(body,"</p>","")
body = replace(body,"<p align=""left"">","")
body = replace(body,"<p align=""center"">","")
body = replace(body,"<p align='left'>","")
body = replace(body,"<p align='center'>","")
body = replace(body,"asp","asp")
body = replace(body,"<a href=''>返回首页</a>","-----------------")
body = replace(body,"共享同步报码室","销魂同步报码室")
body = replace(body,"","")
body = replace(body,"","")
body = replace(body,"","")
body = replace(body,"","")
'--------------------------------------------------
%>
<%
Set objRegExp = New RegExp
objRegExp.IgnoreCase = True
objRegExp.Global = True
objRegExp.Pattern="Cfwap.Net"
body= objRegExp.Replace(body,"")
%>
<%if len(body)>30 then%>
<%
Response.write body
%>
<%else%>
非常抱歉，服务器繁忙，请重新从首页进入<br/>
<anchor><prev/>返回上页</anchor><br/>
<%end if%>
<%
url = replace(cf,"&","&amp;")
%><br/>
<a href=".">中国彩票</a><br/><a href='http://<%=s%>'>返回首页</a>
</p>
</card>
</wml>
 