<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<%'============================================================
' 更新: 2007-10-28
' 主页: http://wap.twapp.cn
' 电邮: xivn@163.com
' Q Q : QQ:531233814
' 版权: 燃点真情All Rights Reserved.
'============================================================ 
%>
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
</head>
<card title="LRC歌词查询"><p>
<% 
dim sid
sid=request("sid")
dim searchstr,p
searchstr=Request("searchstr")
searchstr=server.urlencode(request("searchstr"))
p=Request("p")
if p="" then p=1
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
Dim Url,Html,start,over,body,wap,wstr,str
Url="http://down.lxyes.com/lrclist.aspx?searchstr="&searchstr&"&p="&p&""
wstr=getHTTPPage(url)           
start=Instr(wstr,"<p>")
over=Instr(wstr,"<a href=""lrc.aspx?cd=923"">返回重新搜索</a>")

body=mid(wstr,start,over-start)
body = replace(body,"<p align=""left"">","")'这是把<p align=""left"">替换成空
body = replace(body,"<p align=""center"">","")
body = replace(body,"</p>","")
body = replace(body,"<p>","")
body = replace(body,"<br/><br/>","")
body = replace(body,"lrcdetail.aspx?","view.asp?sid="&sid&"&amp;")
body = replace(body,"&amp;cd=923","")
body = replace(body,".aspx",".asp")
if body="" then
Response.Write "很遗憾.暂停服务"
else
Response.write body
end if
%>
<br/><a href='index.asp?sid=<%=sid%>'>LRC歌词查询</a><br/>
<a href="/index.asp?sid=<%=sid%>">返回首页</a></p></card></wml>
