﻿<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?> <!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<!--#include file="u.asp" -->
<% 
keyword=server.urlencode(request("keyword"))
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
Url="http://wap.ebscn.com/smenu.php?menu=setua"

wstr=getHTTPPage(url)           
start=Instr(wstr,"<p>")+0
over=Instr(wstr,"</p>")

body=mid(wstr,start,over-start)
body = replace(body,"php","asp")
body = replace(body,"/setua.asp","setua.asp")
Response.write body

%>
<!--#include file="bb.asp" -->
</p>
</card>
</wml>