<!--#include file="../Inc.asp"-->
<!--#include file="../../md5.asp"-->
<%Dim urls,urlSessionID
urls=Request.Querystring("url")
If urls="" Then urls="index.asp"
If instr(urls,"@@")>0 or instr(urls,"?")>0 Then
urlSessionID="@@SessionID="
Else
urlSessionID="?SessionID="
End if
dim SessionID,TP,Action
SessionID=request("SessionID")
Action=request("Action")
if Action="ok" then

dim wapgo
wapgo=Request.QueryString("wapgo")
wapgo=replace(wapgo,"@@","&amp;")

dim user,pass,sql
user=request("user")
pass=request("pass")
if user="" or pass="" then
  Call Error("<card title=""出错""><p>各项不能为空！")
  end if
set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select * from usereg where sjhm='"&user&"'",ydzqconn,1,2
if rs.eof then
rs.close
set rs=nothing

set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select * from usereg where id="&user&"",ydzqconn,1,2
if rs.eof then
  Call Error("<card title=""出错""><p>没有该会员注册信息！")
  end if
end if


if pass<>rs("mm") then
  Call Error("<card title=""出错""><p>密码错误！")
  end if
'更新时间和IP

rs("loginIP")=PassIP

rs("tjj")=now()
rs.update
Response.write "<card title=""社区登陆"" ontimer="""&replace(wapgo,"&amp;o=&amp;SessionID=","&amp;SessionID=")&""&rs("SessionID")&""">"
Response.write "<timer value=""20""/><p>"
response.write " 登录成功！正在返回..<br/>"
response.write "<a href='"&replace(wapgo,"&amp;o=&amp;SessionID=","&amp;SessionID=")&""&rs("SessionID")&"'>手动进入</a><br/>"
response.write "----------<br/>"
response.write "<a href=""/bbs/public/gygl.asp?SessionID="&rs("SessionID")&""">我的地盘</a>"
response.write "<br/><a href=""/bbs/index.asp?SessionID="&rs("SessionID")&""">社区首页</a>"
response.write "<br/><a href=""/index.asp?SessionID="&rs("SessionID")&""">网站首页</a>"
rs.close
set rs=nothing
ydzqconn.close
set ydzqconn=nothing
conn.close
set conn=nothing
else
Response.Write "<card title=""社区登陆""><p>"
dim act
act=trim(request.querystring("act"))
if act<>"" then
Response.Write "您的IP与上次IP不符请重新登录<br/>"
end if
Response.Write "输入ID或手机号码:<br/>"
Response.Write "<input usename=""user"" title=""输入ID或手机号码"" type=""text"" format=""*N"" emptyok=""true"" maxlength=""500""  value=""""/><br/>"
Response.Write "密码:<br/>"
Response.Write "<input usename=""pass"" type=""password"" format=""*M"" emptyok=""true"" maxlength=""500"" value=""""/><br/>"
Response.write "<anchor title=""确认提交"">确认提交"
	Response.write "<go href=""login.asp?Action=ok&amp;wapgo="&urls&urlSessionID&""" method=""post"">"
	Response.write "<postfield usename=""user"" value=""$(user)"" />"
	Response.write "<postfield usename=""pass"" value=""$(pass)"" />"
	Response.write "</go></anchor><br/>"
Response.write "<a href=""../reg.asp"">还没有注册?</a><br/>"
Response.write "-----------"
Response.write "<br/><a href=""../getmm.asp"">找回密码</a>"
Response.write "<br/><a href=""../index.asp"">社区首页</a>"
Response.write "<br/><a href=""/index.asp"">网站首页</a><br/>"
end if
response.write "</p></card></wml>"
%>
