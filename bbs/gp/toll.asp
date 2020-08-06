<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?> <!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<!--#include file="x.asp" -->

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

  stock=request("stock")
guid=request("guid")
y=request("y")
m=request("m")
d=request("d")
page=request("page")
toll=request("toll")
menu=request("menu")
if menu="" then menu="zxggxw"

Dim Url,Html,start,over,body,wap,wstr,str,stockcode,guid,y,m,d,page
Url="http://wap.csc108.com/toll.php?toll=4&menu="&menu&"&stock="&stock&"&guid="&guid&"&y="&y&"&m="&m&"&d="&d&"&page="&page
wstr=getHTTPPage(url)           
start=Instr(wstr,"<p>")
over=Instr(wstr,"<a href=""toll.php?toll=4&amp;menu=zxggzl")

body=mid(wstr,start,over-start)
body = replace(body,"php","asp")
body = replace(body,"<a href=""toll.php?toll=4&amp;menu=zxggzl","")
Response.write body
Response.write" <a href='gpxw.asp?stockcode="&stock&"&amp;SessionID="&SessionID&"'>个股新闻</a><br/><a href='gppl.asp?stockcode="&stock&"&amp;SessionID="&SessionID&"'>个股评论</a>"
%>
<!--#include file="bb.asp" -->
</p>
</card>
</wml>