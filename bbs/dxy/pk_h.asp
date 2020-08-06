<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<%
conn.close
set conn=nothing
 Response.write "<card  title=""游戏规则说明""><p>"
 Response.write "欢迎来到斗西游游戏中心<br/>"
 Response.write "【规则说明】<br/>"
 Response.write "--------------<br/>"
 %>
提供了公开挑战和单人挑战两种斗西游游戏<br/>
获胜规则：唐僧大于悟空,悟空大于妖怪,妖怪大于唐僧;<br/>
最大下注为10000<%=getcent%>，最小下注额为100<%=getcent%><br/>
在您和友友的对战中，如果其它友友获胜,您的赌注就要输光哦,如果您获胜,您将获得您赌注的90%<%=getcent%>,如果平局则退回挑战<%=getcent%><br/>
-------------
<!--#include file="fanhui.asp"-->
</p></card>
</wml>