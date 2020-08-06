<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="使用物品">  
<p>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=session("useid")
wpid=request("wpid")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?wpid="&wpid&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
set rszx=Server.CreateObject("ADODB.Recordset")
rsplzx="select * from gift Where CStr(id)='"&wpid&"'"
rszx.open rsplzx,conn
if rszx.eof then
response.write "这是什么东西啊?我怎么没见过？<br/><anchor><prev/>返回</anchor></p></card></wml>"
response.end
end if
yname=rszx("yname")
xyyz=rszx("xyyz")
rszx.close
set rszx=nothing
%>
<img src='/bbs/gift/<%=wpid%>.jpg' alt='wap'/><br/>
赠送物品:<%=yname%>,价值:<%=xyyz%>金币<br/>
ＩＤ号码:<input name="useid" size="5" format="*N"/><br/>
赠送数量:<input name="wnum" size="5" format="*N"/><br/>
<anchor>确定送出
<go method="post" href="/bbs/gift/songcl.Asp?SessionID=<%=SessionID%>">
<postfield name="useid" value="$(useid)"/>
<postfield name="wnum" value="$(wnum)"/>
<postfield name="wpid" value="<%=wpid%>"/>
<postfield name="yname" value="<%=yname%>"/>
<postfield name="xyyz" value="<%=xyyz%>"/>
</go></anchor><br/>
-----------<br/>
<a href="/BBS/Gift/MyItem.Asp?SessionID=<%=SessionID%>">返回我的物品</a><br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
</p>
</card>
</wml><%
conn.close
 set conn=nothing%>

