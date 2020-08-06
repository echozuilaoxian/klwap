<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<% SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("cw1")<>"" then

%>
<card id="card1" title="成功执行法院判决"><p>
<%
Server.ScriptTimeout=999
dim id,gfjd,ltlyuan
gfjf=trim(request("gfjf"))
reids=request("reids")
idd=request("idd")
id=request("id")
sql="update urls set pcdj=pcdj+1 Where CStr(id)='" & idd & "'"
  conn.Execute(sql) 
    Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & reids & "'"
    objgbrs.open sql,conn

            sql="update usereg set usejf=usejf-" & gfjf & " Where CStr(id)='" & reids & "'"
            Application.Lock
            conn.execute(sql)
            sql="update usereg set usejf=usejf+" & gfjf & " Where CStr(id)='" & id & "'"
            conn.execute(sql)
            Application.Unlock
            msg="成功执行法院判决,已发信息通知被告<br/>"
ltlyuan="法院对你的控诉执行以下判决：扣除被告人的" & gfjf & "金币,给于你赔偿。这是系统信息,请勿回复!"
  sql="insert into guestbook(ids,reids,niayo) values ("
  sql=sql & sqlstr(id) & ","
  sql=sql & sqlstr(0) & ","
  sql=sql & sqlstr(ltlyuan) & ")"
  Application.Lock
  conn.execute sql
  Application.Unlock

function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function

 response.write msg


Response.write "------------<br/>"
Response.write "<a href='/bbs/ltfy/index.asp?SessionID=" & SessionID & "'>返回城市法院</a>"
Response.write "<br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/>"

Set objgbrs= Nothing
conn.close
set conn=nothing
    End if
%>
</p></card>
</wml>

