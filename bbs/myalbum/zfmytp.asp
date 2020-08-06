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
Server.ScriptTimeout=999
  dim id,page,pages
  pages=request("pages")
  id=request("id")
  page=request("page")
  sql="update myalbum set biaozi='f' Where CStr(id)='" & id & "'"
  Application.Lock
  conn.Execute(sql)
  Application.Unlock
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from myalbum Where CStr(id)='" & id &"'"
  objgbrs.open ssql,conn
Response.Write "<card id='card1' title='转发图片'><p>"
if CStr(objgbrs("ids"))<>CStr(Session("useid")) then
Response.end
end if
%>
收信人ID:<input name='ids' format="*N" value=''/>
<br/><anchor>确定转发<go method='post' href='/bbs/public/fslycl.asp?SessionID=<%=SessionID%>'><postfield name='ids' value='$(ids)'/><postfield name='ltlyuan' value='(img)<% =objgbrs("xclink") %>(/img)(该图片来自对方图片夹)'/></go></anchor>
<br/>-----------
<%
response.write "<br/><a href='mybook.asp?pages=" & pages & "&amp;SessionID=" & SessionID & "'>返回我的书包</a>"
if Session("returnuppath")<>"" then
   Response.write "<br/><a href='" & Session("returnuppath") & "&amp;SessionID=" & SessionID & "'>回刚才页面</a>"
  Else
End if
   Response.write "<br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>返回我的地盘</a>"
Response.Write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a>" %>
</p>
</card>
</wml>




