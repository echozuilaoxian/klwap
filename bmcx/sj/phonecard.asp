<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 
'============================================================
' 更新: 2007-10-15
' 主页: http://wap.twapp.cn
' 电邮: xivn@163.com
' Q Q : QQ:531233814
' 版权: 燃点真情All Rights Reserved.
'============================================================ 
%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml><card title="手机卡查询"><p>
<%dim sid
sid=request.querystring("sid")
%>
<%
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
Function bytestobstr(body,CSET)
DIM OBJSTREAM
SET OBJSTREAM = Server.CreateObject("adodb.stream")
objstream.type = 1
objstream.Mode = 3
objstream.Open 
objstream.Write body
objstream.Position = 0
objstream.type = 2
objstream.Charset=Cset
bytesTobstr = objstream.readText
objstream.close
set objstream=nothing
end function

if request.QueryString("phone")<>"" then
On Error Resume Next
Server.ScriptTimeOut=9999999
Session.CodePage = 65001
dim content,numstart,numstart1,numstarts
content=getHTTPPage("http://c.lexun.com/phonecard/detail.aspx?phone="&request.QueryString("phone")&"")
numstart=InStr(content,"<p>")+3
numstart1=InStr(content,"index.aspx")-10
numstarts=numstart1-numstart
content=Lcase(MID(content,numstart,numstarts))
response.write content
end if

%><br/>---------<br/><a href="sj.asp?sid=<%=sid%>">返回上级</a><br/>
<a href="/index.asp?sid=<%=sid%>">返回首页</a>
<br/>
</p>
</card>
</wml>