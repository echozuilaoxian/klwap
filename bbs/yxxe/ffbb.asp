<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#INCLUDE file="conn1.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<card title="发布消息">
<p>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid=pid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
%>
<%set rspy=Server.CreateObject("ADODB.Recordset")
strSQL="select yz from wupin where cstr(ids)="&ids
rspy.open strSQL,liao,1,1
yyzz=rspy("yz")
rspy.close
set rspy=nothing%>
<%if yyzz=<10 then%>
您只有银子：<%=yyzz%>两<br/>
不能发布挑战！<br/>
*最低发布10两银子！<br/>
<%else%>
您现在有银子：<%=yyzz%>两
<br/>挑战银子：<br/>
<input name="text<%=minute(now)%><%=second(now)%>" title="挑战银子" type="text" format="*M" emptyok="true" maxlength="500" value="<%=yyzz%>"/><br/>
匿名发布：
<select  name="yc">
<option  value="0">否</option>
<option  value="1">是</option>
</select><br/>
<anchor>确定发布
    <go href="ffbbcl.asp?SessionID=<%=SessionID%>" method="post" accept-charset="utf-8">
        <postfield name="txt" value="$(text<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="yc" value="$(yc)"/>
        <postfield name="lid" value="<%=session("useid")%>"/>
        <postfield name="name" value="<%=session("ltname")%>"/>
    </go>
</anchor><br/>赢了既可以赢得相应银子，输则相反！<br/>
<%end if%>
----------<br/>
<a href="tt.asp?SessionID=<%=SessionID%>">[挑战大厅]</a><br/>
<a href="index.asp?SessionID=<%=SessionID%>">[江湖首页]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
</p>
</card>
</wml>