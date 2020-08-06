<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?> <!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<!--#include file="u.asp" -->
<% 
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
lasttlss="200"
lasttlls="200"
lasttls
  stockcode=request("stockcode")
dim objgbrs
    Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select jysl from gpmr where CStr(idd)='" & iduse & "' and CStr(gpid)='" & stockcode & "'"
    objgbrs.open sql,conn
if objgbrs.eof then
   Response.write "<p>你不持有该股"
Else
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

Dim Url,Html,start,over,body,wstr,str,stockcode

Url="http://wap.csc108.com/toll.php?toll=2:1&stockcode="&stockcode&"&feefla="&feefla&"&sid="&sid&""
wstr=getHTTPPage(url)           
start=Instr(wstr,"<p align=""center"">")
over=Instr(wstr,"<a title=")

body=mid(wstr,start,over-start)

body = replace(body,"<a title=","") 

if body="" then
Response.write "<p>远程数据丢失"
else

Response.write body
Response.write"<a href='gpmc.asp?stockcode="&stockcode&"&amp;SessionID="&SessionID&"'>卖出股票</a>|<a href='mygp.asp?stockcode="&stockcode&"&amp;tim="&time()&"&amp;SessionID="&SessionID&"'>刷新</a><br/>查看><a href='gpxq.asp?stockcode="&stockcode&"&amp;SessionID="&SessionID&"'>资料</a>.<a href='gpxw.asp?stockcode="&stockcode&"&amp;SessionID="&SessionID&"'>新闻</a>.<a href='gppl.asp?stockcode="&stockcode&"&amp;SessionID="&SessionID&"'>评论</a><br/>记录><a href='jyjl.asp?stockcode="&stockcode&"&amp;SessionID="&SessionID&"'>买入</a>.<a href='zzjl.asp?stockcode="&stockcode&"&amp;SessionID="&SessionID&"'>卖出</a><br/>走势><a href='kf.asp?stockcode="&stockcode&"&amp;SessionID="&SessionID&"'>分时</a>.<a href='kr.asp?stockcode="&stockcode&"&amp;SessionID="&SessionID&"'>日K</a>.<a href='kz.asp?stockcode="&stockcode&"&amp;SessionID="&SessionID&"'>周K</a>"
end if
end if
objgbrs.close
set objgbrs=nothing
conn.close
set conn=nothing
%>
<!--#include file="bb.asp" -->
</p>
</card>
</wml>
