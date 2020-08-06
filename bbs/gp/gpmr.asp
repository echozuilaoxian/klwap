<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?> <!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<!--#include file="m.asp" --><p>
<% 
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"

    End if
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
gfdsa=Session("ltname")
dim objgbrs
 Set objgbrs=Server.CreateObject("ADODB.Recordset")
          sql="select banktime,bank from usereg where CStr(id)='" & iduse & "'"
          objgbrs.open sql,conn
if objgbrs("banktime")="" or objgbrs("bank")=0 then
response.write "你银行没有钱或者还未开户,不能购买股票。<a href='/bbs/reg/bank.asp?SessionID=" & SessionID & "'>到银行看看</a>。"
else
Set objgbrs= Nothing
conn.close
set conn=nothing
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
over=Instr(wstr,"(")

body=mid(wstr,start,over-start)
body = replace(body,"php","asp")
body = replace(body,"<p align=""center"">","")
body = replace(body,"			","")
Response.write "购买["&trim(body)&" ]股票"
%>
<br/>数量:<input type="text" name="name" title="股票数量" maxlength="10" format="*N" size="7"/>
<br/><anchor>确定购买
<go method="post" href='gpmrcl.asp?stockcode=<%=stockcode%>&amp;SessionID=<%=SessionID%>'>
<postfield name="name" value="$(name)"/>
<postfield name="memo" value='<%=trim(body)%>'/>
<postfield name='id' value='<%=iduse%>'/>
<postfield name='ltname' value='<%=gfdsa%>'/>
</go>
</anchor>
<!--#include file="bb.asp" -->
 <%end if%>
</p>
</card>
</wml>
