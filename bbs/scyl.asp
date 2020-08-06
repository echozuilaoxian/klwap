<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="GB2312"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<card id="card1" title="社区娱乐">
<p align="left">
<img src="/bbs/game/du.gif" alt="销魂赌场" />
<% SessionID=request.querystring("SessionID") %><br/>-----------<br/>
<a href='/bbs/dxy/index.asp?SessionID=<%=SessionID%>'>斗 西 游</a>
<br/><a href='/bbs/game/36.asp?SessionID=<%=SessionID%>'>36 选 1</a>
<br/><a href='/bbs/game/wabao.asp?SessionID=<%=SessionID%>'>挖 宝 箱</a>
<br/><a href='/bbs/game/zadan.asp?SessionID=<%=SessionID%>'>砸 金 蛋</a>
<br/><a href='/bbs/game/dx.asp?SessionID=<%=SessionID%>'>猜 点 数</a>
<br/><a href='/bbs/dhxh/index.asp?SessionID=<%=SessionID%>'>疯狂吹牛</a>
<br/><a href='/bbs/game/daxiao.asp?SessionID=<%=SessionID%>'>开大开小</a>
<br/><a href='/bbs/game/saima.asp?SessionID=<%=SessionID%>'>赛马游戏</a>
<br/><a href='/bbs/game/suanmin.asp?SessionID=<%=SessionID%>'>电脑算命</a>
<br/><a href='/bbs/game/jiandao.asp?SessionID=<%=SessionID%>'>剪刀石头布</a>
<br/><a href='/bbs/LHC/Index.asp?SessionID=<%=SessionID%>'>虚拟娱乐</a>
<br/><a href='/bbs/nbaxh/index.asp?SessionID=<%=SessionID%>'>球赛娱乐</a>
<br/>-------------
<br/><a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>返回我的地盘</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
<br/>北京时间:<%=time%>
</p></card></wml>