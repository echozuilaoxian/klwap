<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="合成神魔玄盔">
<p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid=pid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
%>
<%
Server.ScriptTimeout=999
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select j2,bs,y6,hw1,hw2,hw3,hw4,hw5,hw6,hw7,hw8,hw9,hw10,hw11,hw12,hw13,hw14,hw15,yz,t8,t9 from wupin where cstr(ids)='"&ids& "'"
rs.open strsQL,Conn,1,1
if rs("j2")<10 then
msg="您的铜矿数量不够！需要10块"
else
if rs("bs")<10 then
msg="您的宝石数量不够！需要10个"
else
if rs("y6")<10 then
msg="您的情人花数量不够！需要10朵"
else
if rs("hw1")<10 then
msg="您的巨型号角数量不够！需要10本"
else
if rs("hw2")<10 then
msg="您的星光灭绝数量不够！需要10本"
else
if rs("hw3")<10 then
msg="您的魔皇粉星拳数量不够！需要10本"
else
if rs("hw4")<10 then
msg="您的积尸冥界波数量不够！需要10本"
else
if rs("hw5")<10 then
msg="您的天魔降伏数量不够！需要10本"
else
if rs("hw6")<10 then
msg="您的狮牙拳数量不够！需要10本"
else
if rs("hw7")<10 then
msg="您的庐山百龙霸数量不够！需要10本"
else
if rs("hw8")<10 then
msg="您的红色毒针数量不够！需要10本"
else
if rs("hw9")<10 then
msg="您的黄金箭数量不够！需要10本"
else
if rs("hw10")<10 then
msg="您的圣剑数量不够！需要10本"
else
if rs("hw11")<10 then
msg="您的钻石星尘数量不够！需要10本"
else
if rs("hw12")<10 then
msg="您的魔宫玫瑰数量不够！需要10本"
else
if rs("hw13")<10 then
msg="您的七彩石数量不够！需要10个"
else
if rs("hw14")<10 then
msg="您的珠宝粉数量不够！需要10个"
else
if rs("hw15")<10 then
msg="您的金刚石数量不够！需要10个"
else
if rs("yz")<10000000 then
msg="您的银两不够扣除手续费"
else
if rs("t8")<1 then
msg="您没有轩辕圣盔！"
else
sql="update wupin set j2=j2-10 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set bs=bs-10 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set y6=y6-10 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set hw1=hw1-10 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set hw2=hw2-10 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set hw3=hw3-10 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set hw4=hw4-10 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set hw5=hw5-10 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set hw6=hw6-10 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set hw7=hw7-10 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set hw8=hw8-10 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set hw9=hw9-10 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set hw10=hw10-10 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set hw11=hw11-10 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set hw12=hw12-10 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set hw13=hw13-10 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set hw14=hw14-10 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set hw15=hw15-10 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set yz=yz-10000000 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set t8=t8-1 where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set t9=t9+1 where cstr(ids)="&ids
  conn.Execute(sql)
msg="您成功合成物品<b><u>神魔玄盔</u></b>"
END IF
end if
end if
end if
END IF
end if
end if
end if
END IF
end if
end if
end if
END IF
end if
end if
end if
end if
end if
end if
end if
Response.Write ""&msg&"<br/>========<br/>"
 rs.Close
	Set rs=Nothing
     Conn.Close
      Set Conn=Nothing
%>
<a href="mywp.asp?SessionID=<%=SessionID%>">我的物品</a><br/>
<a href="index.asp?SessionID=<%=SessionID%>">江湖首页</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
</p>
</card>
</wml>