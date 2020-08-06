<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
dim sjhm,sisd
sisd=request.querystring("sisd")
code=Request.ServerVariables("QUERY_STRING")
code1=right(code,35)
sjhm=left(code1,11)
pass=right(sjhm,6)
if sjhm="" then
response.redirect "/bbs/no.gif"
response.end
end if
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where usephone=" & sqlstr(sjhm)
  objgbrs.open ssql,conn
if not objgbrs.eof then
if objgbrs("usephone")=sjhm then
sql="update usereg set [wap]='"&sisd&"' where usephone=" & sqlstr(sjhm)
conn.execute(sql)
response.redirect "/bbs/ok.gif"
response.end
end if
else
if conn.execute("select * from usereg where usephone="& sqlstr(sjhm)).eof then 
  sql="insert into usereg(usephone,usepass) values ("
  sql=sql & sqlstr(sjhm) & ","
  sql=sql & sqlstr(pass) & ")"
  Application.Lock
  conn.execute sql
  Application.Unlock
sql="update usereg set [wap]='"&sisd&"' where usephone=" & sqlstr(sjhm)
conn.execute(sql)
response.redirect "/bbs/reg.gif"
response.end
end if
end if
set objgbrs=nothing
conn.close
set conn=nothing
function sqlstr(data)
sqlstr="'" & Replace(data,"'","'") & "'"
End function
%>