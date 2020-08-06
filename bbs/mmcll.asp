<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn2.asp"-->
<%sjhm=request("sjhm")
if sjhm="" then sjhm="0"
myan=dlubb(request("myan"))
if myan="" then myan="0"
%>
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="找回结果">
<p>
<%
Dim RefreshTime,isRefresh   
RefreshTime = 360  '防止刷新时间,单位（秒）   
isRefresh = 1   '是否使用防刷新功能，0=否，1=是   
If isRefresh = 1 Then  
If (Not IsEmpty(Session("RefreshTime"))) And RefreshTime > 0 Then  
If DateDiff("s", Session("RefreshTime"), Now()) < RefreshTime Then  
aaa=DateDiff("s", Session("RefreshTime"), Now())
     response.write "由于你多次操作不成功,请在<b>"&RefreshTime-aaa&"</b>秒后操作……"
     response.write "<br/><a href='/BBS/zhmm.asp'>&gt;等待&lt;</a>"
     response.write "<br/>-----------<br/><a href='/BBS/yksm.asp'>返回登陆界面</a>"
     response.write "<br/><a href='/BBS/index.asp'>返回社区首页</a></p></card></wml>"
     response.end
Response.End  
Else  
Session("RefreshTime") = Now()   
End If  
Else  
Session("RefreshTime") = Now()   
End If  
End If
%>
<%
set rs=Server.CreateObject("ADODB.Recordset")
sql="select * from usereg where cstr(useklsj)="&sjhm
rs.open sql,conn,1,2
if rs.eof then
cww="没有该账号信息！<br/>"
Elseif rs("wtda")<>myan then cww="答案错误<br/>"
else
mymm=rs("useklmm")
myid=rs("id")
gw=rs("wap")
end if
rs.close
set rs=nothing%>
<%if cww="" then%>
找回成功！请牢记您的资料<br/>
手机号：<%=sjhm%><br/>
密码是：<%=mymm%><br/>
<a href="/bbs/index.asp?SessionID=<%=gw%>">直接进入社区</a><br/>
<%else%>
<%=cww%>
<%end if%>
---------<br/>
<a href="/BBS/yksm.asp">返回登陆界面</a>
<br/><a href="/bbs/index.asp">返回社区首页</a>
</p>
</card>
</wml>