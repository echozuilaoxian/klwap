<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<% 
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("bbslybz")=""
    End if
'-----------
On Error Resume Next
ip=Request.ServerVariables("REMOTE_ADDR")
id=Request("id")
if id="" then id="1"
 set zmyars=Server.CreateObject("ADODB.Recordset")
  zmyasql="select * from ltsy"
zmyars.open zmyasql,conn
rd=Cstr(request("id"))
ids=Session("useid")
sql="Delete FROM gaogao WHERE  DATEDIFF('s', time, now()) > 1440*60"
conn.Execute sql
Set rec=Server.CreateObject("ADODB.Recordset")
SQL="SELECT * FROM gaogao where Cstr(useid)='" & ids & "' and gaoid='"&id&"'"
rec.Open SQL,conn
    if not rec.eof then
       msg="这条你今天已经点过了哦!换一条吧!"
%>

<card id='card' title='正在连接'>
<p align='left'>
<%=msg%><br/>
 <a href='sqgg.asp?SessionID=<%=SessionID%>'>返回点击赚币</a><br/><%=now%>
</p>
</card>
</wml>
<%
     else
          SQL="insert into gaogao(useid,topao,gaoid)values("
          SQL=SQL & sqlstr(ids) & ","
          SQL=SQL & sqlstr(rd) & ","
          SQL=SQL & sqlstr(id) & ")"
          Application.Lock
          conn.execute SQL
          sql="update usereg set usejf=usejf+"& zmyars("ggzb")&" where CStr(id)='" & ids & "'"
          conn.execute sql
          Application.Unlock
          msg=""
'      end if


set objgbrs=Server.CreateObject("ADODB.Recordset")
sql = "select * from gogo where id="&id
objgbrs.open sql,conn,1,2
if not (objgbrs.bof and objgbrs.eof)  then
ip2=objgbrs("ip")
url=objgbrs("url")
name=objgbrs("name")
end if
conn.Execute"Update gogo set ip='"&ip&"' where id="&id&""
conn.Execute"Update gogo set hit=hit+1 where id="&id&"" 
conn.Execute"Update gogo set lctime=now() where id="&id&""
%>

<card id='card' title='正在连接……'>
<onevent type='onenterforward'>
<go href='<%=url%>'/>
</onevent>
<p align='left'>
<a href='<%=url%>'>请稍候,正在检测中……</a>
<br/>
<%=msg%>
<br/>---------<br/>
 <a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a><br/><%=now%>
</p>
</card>
</wml>
<%
end if
%>
<%
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
%>