﻿<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<wml>
<card id="card1" title="宠物赚币" ontimer='/bbs/index.asp?SessionID=<%=SessionID%>'>
<timer value='5'/><p>
<% SessionID=request.querystring("SessionID") %>
<%
dim rd,ids
rd=Cstr(request("rd"))
ids=Session("useid")
sql="Delete FROM gao44 WHERE  DATEDIFF('s', time, now()) > 1440*60"
conn.Execute sql
Set rec=Server.CreateObject("ADODB.Recordset")
SQL="SELECT * FROM gao44 where Cstr(useid)='" & ids & "'"
rec.Open SQL,conn
    if not rec.eof then
       msg="你的猫猫今天已经为你赚了800个金币了!还来?还让不让它活啊???"
     else
          SQL="insert into gao44(useid,topao)values("
          SQL=SQL & sqlstr(ids) & ","
          SQL=SQL & sqlstr(rd) & ")"
          Application.Lock
          conn.execute SQL
          sql="update usereg set usejf=usejf+800 where CStr(id)='" & ids & "'"
          conn.execute sql
          Application.Unlock
          msg="今天猫猫为你赚800个金币哦,快.马上去买条龙虾..."
      end if
response.write msg
function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function
conn.close
set rec=nothing
set conn=nothing
%>

</p>
</card>
</wml>