<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="江湖任务">
<p>
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
%>
<%
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlss="190"
lasttlls="190"
lasttls
wap=request("wap")
ids=session("useid")


%>
<!--#INCLUDE VIRTUAL="/bbs/pk/conn.asp"-->
<%set rsppp=Server.CreateObject("ADODB.Recordset")
rsstr="select dj from sx where cstr(ids)="&ids
rsppp.open rsstr,conn,1,2
%>
=20级以下任务=<br/>
<%if rsppp("dj")<21 then%>
迷宫寻宝<a href="mg/index.asp?wap=<%=wap%>&amp;id=1">接受</a><br/>
说明：走出迷宫奖励100000两银子！<br/>
<%else%>
您的等级超过本次任务要求<br/>
<%end if%>
更多任务开发中。。
<br/>--------<br/>
<%   rsppp.close
set rsppp=Nothing%>
<a href="index.asp?wap=<%=wap%>">江湖首页</a><br/>
<a href="/bbs/index.asp?wap=<%=wap%>">社区首页</a><br/>
</p>
</card>
</wml>