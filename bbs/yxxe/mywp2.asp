<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="我的物品[备用]"><p>
<%
Server.ScriptTimeout=999
wap=request("wap")
ids=session("useid")
%>
我的物品.备用通道<br/>
----------<br/>
[<a href="wq.asp?wap=<%=wap%>">我的武器</a>]<br/>
[<a href="dp.asp?wap=<%=wap%>">我的衣服</a>]<br/>
[<a href="xue2.asp?wap=<%=wap%>">我的靴子</a>]<br/>
[<a href="tou.asp?wap=<%=wap%>">我的头盔</a>]<br/>
[<a href="yp.asp?wap=<%=wap%>">我的药品</a>]<br/>
[<a href="mm.asp?wap=<%=wap%>">我的魔法</a>]<br/>
[<a href="jk.asp?wap=<%=wap%>">我的金矿</a>]<br/>
[<a href="baos.asp?wap=<%=wap%>">我的宝石</a>]<br/>
部分机型不可进入原版“我的包袱”可以从这里进入<br/>
----------<br/>
<a href="PH.asp?wap=<%=wap%>">[江湖排行]</a><br/>
<a href="index.asp?wap=<%=wap%>">[江湖首页]</a><br/>
<a href="/index.asp?wap=<%=wap%>">[社区首页]</a><br/>
</p>
</card>
</wml>



