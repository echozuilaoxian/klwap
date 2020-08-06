<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>

<card title="福彩3D">
<p>

<%
wap=request.querystring("wap")
On Error Resume Next
Server.ScriptTimeOut=9999999
Function getHTTPPage(Path)
t = GETBody(Path)
        
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
%>
<% 
Dim Url,Html,start,over,body,wap,wstr,str

Url="http://wap.2858.cn/lottery/moremsg/index.wml?type_id=5" 
wstr=getHTTPPage(url)            
start=Instr(wstr,"<p>")+0
over=Instr(wstr,"<a href=""/lottery/moremsg/index.wml?type_id=5&amp;type_url=null&amp;type_name=&amp;kind_name=&amp;kind_url=null&amp;page=2"">")+0

body=mid(wstr,start,over-start)
'------------------------------------------------

body = replace(body,"<p>","")
body = replace(body,"null?","3dd.asp?")




'--------------------------------------------------
Response.write body
%>


<br/><a href='index.asp?wap=<%=wap%>'>返回彩票</a>
<br/><a href='/bbs/sqcp/sqcp.asp?wap=<%=wap%>'>社区彩票</a>
<br/><a href='/bbs/index.asp?wap=<%=wap%>'>社区首页</a>-<a href='/index.asp?wap=<%=wap%>'>首页</a>


</p>
</card>
</wml>
