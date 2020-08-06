<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<card id="card1" title="每天工作"><p>
<% wap=request.querystring("wap") %>
<%
dim rd,ids
rd=Cstr(request("rd"))
ids=session("useid")
%>
<!--#include file="conn.asp"-->
<%
set rs=Server.CreateObject("ADODB.Recordset")
strSQL="select * from sx where cstr(ids)="&ids
rs.open strSQL,Conn,1,1
%>
<%
  set objgbrs=Server.CreateObject("ADODB.Recordset")
   sql="Delete FROM gguan WHERE  DATEDIFF('s', time, now()) > 720*60"
conn.Execute sql
Set rec=Server.CreateObject("ADODB.Recordset")

SQL="SELECT * FROM gguan where cstr(ids)="&ids
rec.Open SQL,conn
    if not rec.eof then
       msg="今天您已工作过了，不用太辛苦的!!"
else
          SQL="insert into gguan(ids,topao)values("
          SQL=SQL & sqlstr(ids) & ","
          SQL=SQL & sqlstr(rd) & ")"
          Application.Lock
          conn.execute SQL

'第一级
if rs("jy")=1 then
sql="update sx set yz=yz+1000,jy=jy+10000 where cstr(ids)="&ids
conn.execute sql
Application.Unlock
msg="你今天任务完成,成功完成任务!获得金币1000,体力加10,魅力加10,智力加10,才华加10!!努力工作吧!"
end if
end if
response.write msg
function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function
conn.close
set rec=nothing
set conn=nothing
%>
<br/><a href="/bbs/job/sy.asp?wap=<%=wap%>">返回商场</a>
<br/><a href='/bbs/ztlb.asp?wap=<%=wap%>'>论坛</a>|
<a href='/bbs/sqtt.asp?wap=<%=wap%>'>家族</a>|
<a href='/bbs/tcjy/index.asp?wap=<%=wap%>'>同城</a>|
<a href='/bbs/room/from.asp?wap=<%=wap%>'>聊室</a>
<br/><a href='/bbs/public/gygl.asp?wap=<%=wap%>'>我的家园</a>
-<a href='/bbs/index.asp?wap=<%=wap%>'>社区首页</a>
<br/><%=now%>
</p>
</card>
</wml>