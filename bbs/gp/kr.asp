<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?> <!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<!--#include file="f.asp" -->

<% 
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
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



 
  stockcode=request("stockcode")


sid=request("sid")
  feeflag=request("feeflag")

Dim Url,Html,start,over,body,wap,wstr,str,stockcode
Url="http://wap.csc108.com/toll.php?toll=2:5&stockcode="&stockcode&"&type=day&menu=gegu&feefla="&feefla&"&sid="&sid&""
wstr=getHTTPPage(url)           
start=Instr(wstr,"<p>")+0
over=Instr(wstr,"<a")

body=mid(wstr,start,over-start)
body = replace(body,"/t_kline","http://wap.csc108.com/t_kline")
body = replace(body,"center","left")
body = replace(body,"<a","")
Response.write body
Response.write"<br/><a href='kf.asp?stockcode="&stockcode&"&amp;SessionID="&SessionID&"'>分时走势图</a><br/>日K线走势图<br/><a href='kz.asp?stockcode="&stockcode&"&amp;SessionID="&SessionID&"'>周K线走势图</a><br/><a href='guhq.asp?stockcode="&stockcode&"&amp;SessionID="&SessionID&"'>返回股票</a>"
%>
<!--#include file="bb.asp" -->
</p>
</card>
</wml>