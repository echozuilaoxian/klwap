<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<!--#include file="conn.asp"-->
<card title="挑战列表">
<p>
<%
dim rs,ssql,ids
ids=request("ids")
if ids="" or Isnumeric(ids)=false then
call error("ID无效！")
end if
  set rs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from YD_jd where id=" & ids & " and about='J' order by id desc"
  rs.open ssql,ydzqconn,1,1
if rs.eof then
response.write "您好,这个挑战已经被结束了,赶快再去<a href=""index.asp?SessionID="&SessionID&""">抢一个</a>来玩吧!<br/>"
Else
id1=rs("useid")
num=rs("num")
  set objgbrs1=Server.CreateObject("ADODB.Recordset")
  ssql1="select usename,id from usereg where id=" & id1
  objgbrs1.open ssql1,conn
Response.write "<a href='/bbs/reg/useinfo.asp?id=" & id1 & "&amp;SessionID=" & SessionID& "'>" & objgbrs1("usename") & "(ID:" & id1 & ")</a>发起公开挑战<br/>下注金额为" & rs("num") &getcent&"<br/>西游><a href='pk_jdg2.asp?ids=" & ids & "&amp;id=" & id1 & "&amp;SessionID=" & SessionID & "'>妖怪</a>.<a href='pk_stg2.asp?ids=" & ids & "&amp;id=" & id1 & "&amp;SessionID=" & SessionID & "'>悟空</a>.<a href='pk_bg2.asp?ids=" & ids & "&amp;id=" & id1 & "&amp;SessionID=" & SessionID & "'>唐僧</a><br/>"
end if
rs.close
set rs=nothing
ydzqconn.close
set ydzqconn=nothing
conn.close
set conn=nothing
%>-------------
<!--#include file="fanhui.asp"-->
</p></card>
</wml>