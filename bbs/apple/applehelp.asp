
<!--#include file="../../md5/Inc.asp"-->
<!--#include file="conn.asp"-->

<%
conn.close
set conn=nothing
 Response.write "<card  title=""水果机游戏规则""><p>"
 dim paylu,paynum,appletimes
   set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select paynum,appletimes,paylu,pcent from appleadmin where id=1",ydzqconn,1,1
if not rs.eof then
paynum=rs(0)
appletimes=rs(1)
paylu=rs(2)
pcent=rs(3)
end if
rs.close
set rs=nothing
ydzqconn.close
set ydzqconn=nothing
 %>
水果机游戏规则说明<br/>
游戏规则 1.水果机游戏为<%=appletimes%>分钟开一局，最后10秒为开机旋转阶段，无法再进行下注<br/>
2.游戏中共有8个目标可下注，中奖以后各有不同倍数奖励，每注为<%=pcent%><%=getcent%><br/>
3.所有中奖目标均分大小，开大为正常倍数，开小则统一为3倍<br/>
4.选择重压上局可以直接重复跟上局一样的下注，避免更多的操作节约流量<br/>
5.每个会员每场可以下注的次数为<%=paynum%>注
<br/>
注意：赌场每次从赢家奖金抽水<%=paylu%>%作为赌场佣金<br/>
-------------
<!--#include file="fanhui.asp"-->
</p></card>
</wml>