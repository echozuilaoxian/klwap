<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<card id="card1" title="相册操作"><p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
dim id,tj
   tj=request("tj")
   id=request("id")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  sql="select * from myalbum Where CStr(id)='" & id &"' and biaozi<>'" & tj & "'"
  objgbrs.open sql,conn
if objgbrs.eof then
      response.write "操作已成功,请不要刷新!</p></card></wml>"
      conn.close
      set objgbrs=nothing
      set conn=nothing
      response.end
    else
      sql="update myalbum set biaozi='"& tj & "' Where CStr(id)='" & id & "'"
      Application.Lock
      conn.Execute(sql)
      Application.Unlock
end if
  conn.close
  set objgbrs=nothing
  set conn=nothing
  response.write "操作成功！！<br/><a href='myalbum.asp?id=" &id & "&amp;SessionID=" & SessionID & "'>返回我的书包</a><br/><a href='index.asp?SessionID=" & SessionID & "'>返回网友相册</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"

%>



