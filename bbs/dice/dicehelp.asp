<!--#include file="../../md5/Inc.asp"-->
<!--#include file="conn.asp"-->

<%
conn.close
set conn=nothing
 Response.write "<card  title=""幸运彩球游戏规则""><p>"
 dim paylu
   set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select paylu from diceadmin where id=1",ydzqconn,1,1
if not rs.eof then
paylu=rs(0)
end if
rs.close
set rs=nothing
ydzqconn.close
set ydzqconn=nothing
 %>
幸运彩球游戏规则<br/>
小:4,5,6,7,8,9,10<br/>
大:11,12,13,14,15,16,17<br/>
单:5,7,9,11,13,15,17<br/>
双:4,6,8,10,12,14,16<br/>
合数:三个球点数相加得到总和与你投注的合数一致即中奖<br/>
合数范围：合3至合18<br/>
赌场每次从赢家奖金抽水<%=paylu%>%作为赌场佣金
<br/>
-------------
<!--#include file="fanhui.asp"-->
</p></card>
</wml>