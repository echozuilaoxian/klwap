<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<card id="card1" title="修改公告" ontimer="gongg.asp?wap=<%=wap%>">
<timer value="10"/>  
<p>
<% wap=request.querystring("wap") %>
<%
if Session("Counter")="pass_numbers_55556666" then
if request("tt")<>"" and request("tt1")<>"" then
ON ERROR RESUME NEXT
Set rec=Server.CreateObject("ADODB.Recordset")
dim1 SQL
SQL="delete from biaoti1"
conn.Execute sql,0,0
sql="select * from biaoti1"
rec.open sql,conn,3,3
if request("tt")<>"" then 
 rec.AddNew
 rec.Fields("biaoti1")=request("tt")
end if
if request("tt1")<>"" then 
 rec.AddNew
 rec.Fields("biaoti1")=request("tt1")
end if
if request("tt2")<>"" then 
 rec.AddNew
 rec.Fields("biaoti1")=request("tt2")
end if

rec.update
conn.close
set rec=nothing
set conn=nothing
    response.write "公告内容修改成功!"
  else
    response.write "没有主题公告!"
end if
%>
</p>
</card>
</wml>
<% end if %>



