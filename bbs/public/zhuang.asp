<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
  id=request("id")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id="&id&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if 
Server.ScriptTimeout=999
  dim id,page,pages
  pages=request("pages")
  page=request("page")
  sql="update guestbook set biaozi='f' Where CStr(id)='" & id & "'"
  Application.Lock
  conn.Execute(sql)
  Application.Unlock
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from guestbook Where CStr(id)='" & id &"'"
  objgbrs.open ssql,conn
Response.Write "<card id='card1' title='转发信息'><p>"
tjhm=objgbrs("reids")

hfyl=left(objgbrs("niayo"),13)
if len(objgbrs("niayo"))>13 then
hfyl=hfyl+"....."
    End if
Response.Write "转发信息:<a href='/bbs/public/cklycl.asp?id=" & objgbrs("id") & "&amp;pages=" & pages & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(hfyl) & "</a><br/>"
%>
收信人ID:<input name='ids' format="*N" value=''/>
<br/><anchor>确定转发<go method='post' href='/bbs/public/fslycl2.asp?SessionID=<%=SessionID%>'>
<postfield name='ids' value='$(ids)'/>
<postfield name='ltlyuan' value='〖转发〗<% =objgbrs("niayo") %>'/>
</go></anchor>
<br/>-----------
<%
if Session("returnuppath")<>"" then
   Response.write "<br/><a href='" & Session("returnuppath") & "&amp;SessionID=" & SessionID & "'>返回来源页面</a>"
End if
response.write "<br/><a href='main_ckly.asp?pages=" & pages & "&amp;SessionID=" & SessionID & "'>返回信息列表</a>"
   Response.write "<br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>返回我的地盘</a>"
Response.Write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a>" %>
</p>
</card>
</wml>