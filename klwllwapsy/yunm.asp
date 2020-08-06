<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-cache" forua="true"/>
<meta http-equiv="Cache-Control" content="max-age=0" forua="true"/>
</head>
<%If Request("SubmitFlag") <> "" Then%>
<card id="main" title="查看源码">
<p>
<% 
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
uuurr=request("iidd")
ffss=request("ffss")
%>
地址:<%=uuurr%><br/>
<% 
dim Page
Page=request.QueryString("Page")
if Page="" then Page="1"
Dim Url,Html,start,over,body,wap,wstr,str
Url=""&uuurr&""
wstr=getHTTPPage(url)
start=Instr(wstr,"<p")
over=Instr(wstr,"</p>")+4
body=mid(wstr,start,over-start)
'------------------------------------------------
body = replace(body,"<p>","")
body = replace(body,"</p>","")
body = replace(body,"<p align=""left"">","")
body = replace(body,"<p align=""center"">","")
body = replace(body,"<p align='left'>","")
body = replace(body,"<p align='center'>","")
body = replace(body,"&","&amp;")
body = replace(body,"<","&lt;")
body = replace(body,">","&gt;")
body = replace(body,"$","$$")
body = replace(body,"&amp;#x","&#x")
body = replace(body,"'","&apos;")
body = replace(body,"""","&quot;")
'--------------------------------------------------
%>
<%if len(body)>30 then%>
<%=body%><br/>
<input name="sssss<%=minute(now)%><%=second(now)%>" value="<%=body%>"/>
<%else%>
该地址无法查看
<%end if%>
<br/><img src="/img/hr.gif" alt=""/><br/>
<a href="yunm.asp?sid=<%=sid%>">[继续查看]</a><br/>
<a href="index.asp?sid=<%=sid%>">[后台管理]</a><br/>
</p>
</card>
</wml>
<%else%>
<card id="main" title="源码查看器" >
<p align="left"><img src="/IMG/12.gif" alt='站长工具'/><br/>
<%=Request.ServerVariables("SERVER_NAME")%><br/>
地址:<input name='iidd' value='http://'/><br/>
<anchor>查看源码<go href='yunm.asp?SubmitFlag=true&amp;sid=<%=sid%>' method='post' accept-charset='utf-8'>
<postfield name='idp' value='$(idp)'/>
<postfield name='iidd' value='$(iidd)'/>
</go></anchor>
<br/><img src="/img/hr.gif" alt=""/><br/>
<a href="index.asp?sid=<%=sid%>">[后台管理]</a><br/>
</p>
</card>
</wml>
<%end if%>