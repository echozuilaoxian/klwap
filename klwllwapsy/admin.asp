<%  sid=Request.querystring("sid")
set Rsqq=server.createobject("adodb.recordset")
                Sqlqq="select * from [admin]"
                Rsqq.open sqlqq,conn,1,1
if Rsqq("sid")<>sid then response.redirect "login.asp"
Rsqq.close
set Rsqq=nothing
%>





