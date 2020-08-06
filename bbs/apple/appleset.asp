
<!--#include file="../../md5/Inc.asp"-->
<!--#include file="conn.asp"-->
<card title="水果机管理">
<p>
<%
if myid <> 1 then
call error("权限不足！")
end if
dim info
info=request("info")

Select Case info
	Case "a"   
		Call a()
	Case "b"  
		Call b()
	Case "c"   
		Call c()
	Case else
		Call l()
end select 

sub l()

Response.Write "<a href='appleget.asp?SessionID="&SessionID&"'>水果机基本设置</a><br/>"

Response.Write "<a href='appleset.asp?info=a&amp;SessionID="&SessionID&"'>清空水果机记录</a><br/>"

Response.Write "<a href='appleset.asp?info=b&amp;SessionID="&SessionID&"'>清空网友压注记录</a><br/>"
end sub

sub a()
dim action
action=request("action")
if action<>"ok" then
response.write"真的要清空水果机记录？清空将无法恢复！"
Response.Write "<br/><a href='appleset.asp?Action=ok&amp;info=a&amp;SessionID="&SessionID&"'>确定</a><br/>"
Response.Write "<a href='appleset.asp?SessionID="&SessionID&"'>取消</a><br/>"
Response.Write "</p></card></wml>"
Response.end 
end if
ydzqconn.Execute("delete from apple")
ydzqconn.Execute("delete from applelist")
'初始化
dim appletimes
  set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select appletimes from appleadmin where id=1",ydzqconn,1,1
if not rs.eof then
appletimes=rs(0)
end if
rs.close
set rs=nothing
dim newTimee
newTimee = DateAdd("n", appletimes, Now())
ydzqconn.execute("insert into apple(appletime)  values('"&newTimee&"')")
Response.Write "清空水果机记录成功！"
Response.Write "<br/><a href='appleset.asp?SessionID="&SessionID&"'>返回上级</a>"
end Sub

sub b()
dim action
action=request("action")
if action<>"ok" then
response.write"真的要清空网友水果机记录？清空将无法恢复！"
Response.Write "<br/><a href='appleset.asp?Action=ok&amp;info=b&amp;SessionID="&SessionID&"'>确定</a><br/>"
Response.Write "<a href='appleset.asp?SessionID="&SessionID&"'>取消</a><br/>"
Response.Write "</p></card></wml>"
Response.end 
end if
ydzqconn.Execute("delete from applelist")
ydzqconn.Execute("delete from myapple")
Response.Write "清空网友水果机记录成功！"
Response.Write "<br/><a href='appleset.asp?SessionID="&SessionID&"'>返回上级</a>"
end Sub
ydzqconn.close
set ydzqconn=nothing
conn.close
set conn=nothing
%><br/>-------------
<!--#include file="fanhui.asp"-->
</p></card>
</wml>