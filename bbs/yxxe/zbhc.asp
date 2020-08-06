<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card0" title="合成装备">
<p>
<%SessionID=request.querystring("SessionID")%>
<%
ky=request("ky")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky="&ky&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if

if ky="1" then%>
<img src='w/8.gif' alt='加载中...'/><br/>
轩辕煞魂斩<br/>
攻击：200
<br/>
合成所需物品<br/>
需要：铜矿5块,宝石1个,情人花1朵 ,巨型号角3本 ,魔皇粉星拳3本 ,星光灭绝3本, 银两10万 ,龙王剑5把<br/>
<%
elseif ky="2" then%>
<img src='t/8.gif' alt='加载中...'/><br/>
轩辕圣盔<br/>
攻击：90
<br/>
合成所需物品：<br/>
需要：铜矿5块,宝石1个,情人花1朵 ,巨型号角3本 ,魔皇粉星拳3本 ,星光灭绝3本, 银两10万 ,龙王头盔5个<br/>

<%
elseif ky="3" then%>
<img src='y/8.gif' alt='加载中...'/><br/>
轩辕圣甲<br/>
防御：200<br/>
<br/>
需要：铜矿5块,宝石1个,情人花1朵 ,巨型号角3本 ,魔皇粉星拳3本 ,星光灭绝3本, 银两10万 ,龙王甲5件<br/>

<%
elseif ky="4" then%>
<img src='x/8.gif' alt='加载中...'/><br/>
轩辕圣靴<br/>
防御：90<br/>
合成所需物品：<br/>
需要：铜矿5块,宝石1个,情人花1朵 ,巨型号角1本 ,魔皇粉星拳3本 ,星光灭绝3本, 银两10万 ,龙王靴5件<br/>

<%
elseif ky="5" then%>
<img src='w/9.gif' alt='加载中...'/><br/>
神魔玄兵<br/>
攻击力：400<br/>
合成所需物品如下：<br/>
（铜矿,宝石，情人花数,巨型号角,星光灭绝,魔皇粉星拳,积尸冥界波,天魔降伏,狮牙拳,庐山百龙霸,红色毒针,黄金箭,圣剑,钻石星尘,魔宫玫瑰,七彩石,珠宝粉,金刚石）各10件<br/>
银两一千万，轩辕煞魂斩1把<br/>

<%
elseif ky="6" then%>
<img src='t/9.gif' alt='加载中...'/><br/>
神魔玄盔<br/>
攻击力：180<br/>
合成所需物品如下：<br/>
（铜矿,宝石，情人花数,巨型号角,星光灭绝,魔皇粉星拳,积尸冥界波,天魔降伏,狮牙拳,庐山百龙霸,红色毒针,黄金箭,圣剑,钻石星尘,魔宫玫瑰,七彩石,珠宝粉,金刚石）各10件<br/>
银两一千万，轩辕圣盔1件<br/>
<%
elseif ky="7" then%>
<img src='y/9.gif' alt='加载中...'/><br/>
神魔玄翼<br/>
防御力：400<br/>
合成所需物品如下：<br/>
（铜矿,宝石，情人花数,巨型号角,星光灭绝,魔皇粉星拳,积尸冥界波,天魔降伏,狮牙拳,庐山百龙霸,红色毒针,黄金箭,圣剑,钻石星尘,魔宫玫瑰,七彩石,珠宝粉,金刚石）各10件<br/>
银两一千万，轩辕圣甲1件<br/>
<%
elseif ky="8" then%>
<img src='x/9.gif' alt='加载中...'/><br/>
神魔玄靴<br/>
防御力：180<br/>
合成所需物品如下：<br/>
（铜矿,宝石，情人花数,巨型号角,星光灭绝,魔皇粉星拳,积尸冥界波,天魔降伏,狮牙拳,庐山百龙霸,红色毒针,黄金箭,圣剑,钻石星尘,魔宫玫瑰,七彩石,珠宝粉,金刚石）各10件<br/>
银两一千万，轩辕圣靴1件<br/>
<%else%>
<%
Response.Write "<img src='img/npc_1.gif' alt='合成大师'/><br/>"
Response.Write "合成大师说：请选择您要合的装备@<br/>"
Response.Write "===轩辕套装===<br/>[轩辕煞魂斩][<a href='hw8.asp?SessionID="&SessionID&"'>合成</a>][<a href='/BBS/yxxe/zbhc.asp?ky=1&amp;SessionID="&SessionID&"'>说明..</a>]<br/>"
Response.Write "[轩辕圣盔][<a href='ht8.asp?SessionID="&SessionID&"'>合成</a>][<a href='/BBS/yxxe/zbhc.asp?ky=2&amp;SessionID="&SessionID&"'>说明..</a>]<br/>"
Response.Write "[轩辕圣甲][<a href='hd8.asp?SessionID="&SessionID&"'>合成</a>][<a href='/BBS/yxxe/zbhc.asp?ky=3&amp;SessionID="&SessionID&"'>说明..</a>]<br/>"
Response.Write "[轩辕圣靴][<a href='hk8.asp?SessionID="&SessionID&"'>合成</a>][<a href='/BBS/yxxe/zbhc.asp?ky=4&amp;SessionID="&SessionID&"'>说明..</a>]<br/>"

Response.Write "===神魔套装===<br/>[神魔玄兵][<a href='hw9.asp?SessionID="&SessionID&"'>合成</a>][<a href='/BBS/yxxe/zbhc.asp?ky=5&amp;SessionID="&SessionID&"'>说明..</a>]<br/>"
Response.Write "[神魔玄盔][<a href='ht9.asp?SessionID="&SessionID&"'>合成</a>][<a href='/BBS/yxxe/zbhc.asp?ky=6&amp;SessionID="&SessionID&"'>说明..</a>]<br/>"
Response.Write "[神魔玄翼][<a href='hd9.asp?SessionID="&SessionID&"'>合成</a>][<a href='/BBS/yxxe/zbhc.asp?ky=7&amp;SessionID="&SessionID&"'>说明..</a>]<br/>"
Response.Write "[神魔玄靴][<a href='hk9.asp?SessionID="&SessionID&"'>合成</a>][<a href='/BBS/yxxe/zbhc.asp?ky=8&amp;SessionID="&SessionID&"'>说明..</a>]<br/>"
%>
<%End if%>
-------------<br/>
<%
if ky<>"" then%>
<a href='/BBS/yxxe/zbhc.asp?SessionID=<%=SessionID%>'>返回合成装备</a><br/>
<%End if%>
<a href="mywp.asp?SessionID=<%=SessionID%>">返回我的包袱</a><br/>
<a href="index.asp?SessionID=<%=SessionID%>">返回江湖首页</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
</p>
</card>
</wml>