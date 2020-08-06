<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card0" title="家园临时工">
<p>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
iduse=Session("useid")
Session("returnuppath")=""
gfdsa=Session("ltname")
lasttlls="58"
lasttls
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
%>
<%
Response.write "<a href='/bbs/reg/useinfo.asp?id=" & iduse & "&amp;SessionID=" & SessionID & "'>" & converttowide(gfdsa) & "</a>你好！<br/>"
if lycount>0 then
Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有" & lycount & "条新消息！</a>"
End if
%>
您有金币:<% =objgbrs("usejf") %><br/>
你想做什么工作啊？
<br/><a href="#card1">临时摄影师</a>
<br/><a href="#card2">电脑程序员</a>
<br/><a href="#card3">临时建筑工</a>
<br/><a href="#card4">桑拿按摸师</a>
<br/><a href="#card5">网络维护员</a>
<br/><a href="#card6">程序设计师</a>
<br/><a href="#card7">开心魔法师</a>
<br/><a href="#card8">高级电旱工</a>
<br/><a href="#card9">新乐团鼓手</a>
<br/><a href="#card10">超市收银员</a>
<br/>
<br/><a href='/bbs/dg/index.asp?SessionID=<%=SessionID%>'>返回打工</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a>
</p>	
</card>
<card id="card1" title="临时摄影师">
<p>
<img src='g1.gif' alt='load...'/><br/>
<anchor>开始工作<go method="post" href='gzz.asp?SessionID=<%=SessionID%>'><postfield name="lx" value="1"/><postfield name="sl" value="1"/></go></anchor>
<br/><a href='/bbs/dg/gz.asp?SessionID=<%=SessionID%>'>返回</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a>
</p>	
</card>
<card id="card2" title="电脑程序员">
<p>
<img src='g2.gif' alt='load...'/><br/>
<anchor>开始工作<go method="post" href='gzz.asp?SessionID=<%=SessionID%>'><postfield name="lx" value="1"/><postfield name="sl" value="2"/></go></anchor>
<br/><a href='/bbs/dg/gz.asp?SessionID=<%=SessionID%>'>返回</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a>
</p>	
</card>
<card id="card3" title="临时建筑工"><p>
<img src='g3.gif' alt='load...'/><br/>
<anchor>开始工作<go method="post" href='gzz.asp?SessionID=<%=SessionID%>'><postfield name="lx" value="1"/><postfield name="sl" value="3"/></go></anchor>
<br/><a href='/bbs/dg/gz.asp?SessionID=<%=SessionID%>'>返回</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a>
</p>	
</card>
<card id="card4" title="桑拿按摸师"><p>
<img src='g4.gif' alt='load...'/><br/>
<anchor>开始工作<go method="post" href='gzz.asp?SessionID=<%=SessionID%>'><postfield name="lx" value="1"/><postfield name="sl" value="4"/></go></anchor>
<br/><a href='/bbs/dg/gz.asp?SessionID=<%=SessionID%>'>返回</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a>
</p>	
</card>
<card id="card5" title="网络维护员"><p>
<img src='g5.gif' alt='load...'/><br/>
<anchor>开始工作<go method="post" href='gzz.asp?SessionID=<%=SessionID%>'><postfield name="lx" value="1"/><postfield name="sl" value="5"/></go></anchor>
<br/><a href='/bbs/dg/gz.asp?SessionID=<%=SessionID%>'>返回</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a>
</p>	
</card>
<card id="card6" title="程序设计师"><p>
<img src='g6.gif' alt='load...'/><br/>
<anchor>开始工作<go method="post" href='gzz.asp?SessionID=<%=SessionID%>'><postfield name="lx" value="1"/><postfield name="sl" value="6"/></go></anchor>
<br/><a href='/bbs/dg/gz.asp?SessionID=<%=SessionID%>'>返回</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a>
</p>	
</card>
<card id="card7" title="开心魔法师"><p>
<img src='g7.gif' alt='load...'/><br/>
<anchor>开始工作<go method="post" href='gzz.asp?SessionID=<%=SessionID%>'><postfield name="lx" value="1"/><postfield name="sl" value="7"/></go></anchor>
<br/><a href='/bbs/dg/gz.asp?SessionID=<%=SessionID%>'>返回</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a>
</p>
</card>
<card id="card8" title="高级电旱工"><p>
<img src='g8.gif' alt='load...'/><br/>
<anchor>开始工作<go method="post" href='gzz.asp?SessionID=<%=SessionID%>'><postfield name="lx" value="1"/><postfield name="sl" value="8"/></go></anchor>
<br/><a href='/bbs/dg/gz.asp?SessionID=<%=SessionID%>'>返回</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a>
</p>	
</card>
<card id="card9" title="新乐团鼓手"><p>
<img src='g9.gif' alt='load...'/><br/>
<anchor>开始工作<go method="post" href='gzz.asp?SessionID=<%=SessionID%>'><postfield name="lx" value="1"/><postfield name="sl" value="8"/></go></anchor>
<br/><a href='/bbs/dg/gz.asp?SessionID=<%=SessionID%>'>返回</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a>
</p>	
</card>
<card id="card10" title="超市收银员"><p>
<img src='g10.gif' alt='load...'/><br/>
<anchor>开始工作<go method="post" href='gzz.asp?SessionID=<%=SessionID%>'><postfield name="lx" value="1"/><postfield name="sl" value="10"/></go></anchor>
<br/><a href='/bbs/dg/gz.asp?SessionID=<%=SessionID%>'>返回</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a>
</p>
</card>
</wml>

