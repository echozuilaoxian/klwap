<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<wml>
<card id="card1" title="斑竹领日薪" ontimer='/bbs/index.asp?SessionID=<%=SessionID%>'>
<timer value='100'/><p>
<%
if Session("gly")<>"" and Session("bzbz")="" then
dim rd,ids
rd=Cstr(request("rd"))
ids=Session("useid")
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt where id="&rd
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then
dlname="无此论坛"
Else
dlname=objgbrsy("name")
end if
objgbrsy.close
Set objgbrsy= Nothing

sql="Delete FROM gaojxbz WHERE  DATEDIFF('s', time, now()) > 1440*60"
conn.Execute sql
Set rec=Server.CreateObject("ADODB.Recordset")
SQL="SELECT * FROM gaojxbz where Cstr(useid)='" & ids & "'"
rec.Open SQL,conn
    if not rec.eof then
       msg="今天您已经领过薪水了!<br/>24小时内只能领一次,请确定你上次领薪时间距离现时已超出24小时?"
     else
          SQL="insert into gaojxbz(useid,topao)values("
          SQL=SQL & sqlstr(ids) & ","
          SQL=SQL & sqlstr(rd) & ")"
          Application.Lock
          conn.execute SQL
          sql="update usereg set usejf=usejf+800,ml=ml+20,tili=tili+20 where CStr(id)='" & ids & "'"
          conn.execute sql
          Application.Unlock
          msg="您成功领取今日薪水1000金币,魅力+20点,体力+20点!<br/>请查看您的帐户!"
      end if
response.write msg
function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function
conn.close
set rec=nothing
set conn=nothing
     else
 response.write "你的身份不是副版哦"
end if
%><%
Response.write "<br/>------------"
Response.write "<br/><a href='/BBS/Forum_Content/ContentlisT.asp?ForumID=" & rd & "&amp;SessionID=" & SessionID & "'>返回" & dlname & "</a>"
Response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"%>