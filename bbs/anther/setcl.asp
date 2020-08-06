<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<card id="card1" title="修改投票" ontimer="topao.asp?wap=<%=wap%>">
<timer value="10"/>  
<p>
<% wap=request.querystring("wap") %>
<%
if Session("Counter")="pass_numbers_55556666" then
if request("tt")<>"" and request("tt1")<>"" then
ON ERROR RESUME NEXT
Set rec=Server.CreateObject("ADODB.Recordset")
dim SQL
SQL="delete from biaoti"
conn.Execute sql,0,0
SQL="delete from useid"
conn.Execute sql,0,0
sql="select * from biaoti"
rec.open sql,conn,3,3
if request("tt")<>"" then 
 rec.AddNew
 rec.Fields("biaoti")=request("tt")
end if
if request("tt1")<>"" then 
 rec.AddNew
 rec.Fields("biaoti")=request("tt1")
end if
if request("tt2")<>"" then 
 rec.AddNew
 rec.Fields("biaoti")=request("tt2")
end if
if request("tt3")<>"" then 
 rec.AddNew
 rec.Fields("biaoti")=request("tt3")
end if
if request("tt4")<>"" then 
 rec.AddNew
 rec.Fields("biaoti")=request("tt4")
end if
if request("tt5")<>"" then 
 rec.AddNew
 rec.Fields("biaoti")=request("tt5")
end if
if request("tt6")<>"" then 
 rec.AddNew
 rec.Fields("biaoti")=request("tt6")
end if
if request("tt7")<>"" then 
 rec.AddNew
 rec.Fields("biaoti")=request("tt7")
end if
if request("tt8")<>"" then 
 rec.AddNew
 rec.Fields("biaoti")=request("tt8")
end if
if request("tt9")<>"" then 
 rec.AddNew
 rec.Fields("biaoti")=request("tt9")
end if
if request("tt10")<>"" then 
 rec.AddNew
 rec.Fields("biaoti")=request("tt10")
end if
if request("tt11")<>"" then 
 rec.AddNew
 rec.Fields("biaoti")=request("tt11")
end if
if request("tt12")<>"" then 
 rec.AddNew
 rec.Fields("biaoti")=request("tt12")
end if
if request("tt13")<>"" then 
 rec.AddNew
 rec.Fields("biaoti")=request("tt13")
end if
if request("tt14")<>"" then 
 rec.AddNew
 rec.Fields("biaoti")=request("tt14")
end if
if request("tt15")<>"" then 
 rec.AddNew
 rec.Fields("biaoti")=request("tt15")
end if
if request("tt16")<>"" then 
 rec.AddNew
 rec.Fields("biaoti")=request("tt16")
end if
if request("tt17")<>"" then 
 rec.AddNew
 rec.Fields("biaoti")=request("tt17")
end if
if request("tt18")<>"" then 
 rec.AddNew
 rec.Fields("biaoti")=request("tt18")
end if
rec.update
conn.close
set rec=nothing
set conn=nothing
    response.write "调查内容修改成功!"
  else
    response.write "没有主题或子项!"
end if
%>
<br/><a href='topao.asp?wap=<%=wap%>'>查看投票</a>
</p>
</card>
</wml>
<% end if %>



