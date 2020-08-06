<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<!--#include file="conn.asp"-->
<card title="挑战记录">
<p>您目前共有<%=myjb%><%=getcent%><br/>
<%
dim id
id=request("id")
if id="" or Isnumeric(id)=false then
call error("ID无效！")
end if
set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select * from YD_jd where id=" & id & " and reuseid="&myid&" order by id desc",ydzqconn,1,1
if rs.eof then
response.write "您好,这个挑战不存在,赶快再去<a href=""index.asp?SessionID="&SessionID&""">抢一个</a>来玩吧!<br/>"
Else
response.write "应战编号:"&id&"<br/>"
set rs1=Server.CreateObject("ADODB.Recordset")
rs1.open"select usename from usereg where id="&rs("useid"),conn,1,1
if not rs1.eof then
response.write "挑战人:<a href='/bbs/reg/useinfo.asp?id=" & rs("reuseid") & "&amp;SessionID=" & SessionID & "'>" & rs1("usename") & "</a><br/>"	
end if
rs1.close
set rs1=nothing
if rs("active")=1 then
response.write "挑战类型:公开挑战!<br/>"
else
response.write "挑战类型:单人挑战!<br/>"
end if
response.write "挑战发起时间:"&rs("times")&"<br/>"
response.write "赌注是:"&rs("num")&getcent&"<br/>"
if rs("op")=1 then
	dim getusename
	if rs("about2")="B" then
	getusename="获胜!"
	elseif rs("about2")="A" then
	getusename="失败!"
	elseif rs("about2")="C" then
	getusename="平局!"
	else
	getusename="放弃挑战!"
	end if
response.write "状态:"&getusename&"<br/>"	
	else
response.write "状态:未回应<br/>"	
end if
	dim getusename2
	if rs("about1")="B" then
	getusename2="妖怪!"
	elseif rs("about1")="C" then
	getusename2="悟空!"
	elseif rs("about1")="D" then
	getusename2="唐僧!"
	end if
response.write "挑战方出的是"&getusename2&"<br/>"	
rs.close
set rs=nothing
end if
ydzqconn.close
set ydzqconn=nothing
conn.close
set conn=nothing
%>-------------
<!--#include file="fanhui.asp"-->
</p></card>
</wml>