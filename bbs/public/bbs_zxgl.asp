<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%id=request("id")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
cz=request("cz")
%>
<card id="main" title="撤除会员权限" >
<p>
<%if Cstr(Session("yxxezb"))<>"" or Session("Counter")="pass_numbers_55556666" then%>
<%if cz="1" then%>
是否撤除正版<br/>
<a href="bbs_zxgl.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;cz=11">是</a>|<a href="/bbs/reg/useinfo.asp?id=<%=request("id")%>&amp;SessionID=<%=SessionID%>">否</a>
<%elseif cz="11" then%>
撤除正版成功
<%
sql="update usereg set bzbz='0',gly='0' where cstr(id)="&id
  conn.Execute(sql)
%>
<%elseif cz="2" then%>
是否撤除副版<br/>
<a href="bbs_zxgl.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;cz=22">是</a>|<a href="/bbs/reg/useinfo.asp?id=<%=request("id")%>&amp;SessionID=<%=SessionID%>">否</a>
<%elseif cz="22" then%>
撤除副版成功
<%
sql="update usereg set gly='0' where cstr(id)="&id
  conn.Execute(sql)
%>
<%elseif cz="3" then%>
是否设为社区总管<br/>
<a href="bbs_zxgl.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;cz=33">是</a>|<a href="/bbs/reg/useinfo.asp?id=<%=request("id")%>&amp;SessionID=<%=SessionID%>">否</a>
<%elseif cz="33" then%>
设为社区总管成功
<%
sql="update usereg set yxxezb='1' where cstr(id)="&id
  conn.Execute(sql)
%>
<%elseif cz="4" then%>
是否撤除社区总管<br/>
<a href="bbs_zxgl.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;cz=44">是</a>|<a href="/bbs/reg/useinfo.asp?id=<%=request("id")%>&amp;SessionID=<%=SessionID%>">否</a>
<%elseif cz="44" then%>
撤除社区总管成功
<%
sql="update usereg set yxxezb='0' where cstr(id)="&id
  conn.Execute(sql)
%>
<%elseif cz="5" then%>
是否设为论坛巡查<br/>
<a href="bbs_zxgl.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;cz=55">是</a>|<a href="/bbs/reg/useinfo.asp?id=<%=request("id")%>&amp;SessionID=<%=SessionID%>">否</a>
<%elseif cz="55" then%>
设为论坛巡查成功
<%
sql="update usereg set yxxexc='1' where cstr(id)="&id
  conn.Execute(sql)
%>
<%elseif cz="6" then%>
是否撤除论坛巡查<br/>
<a href="bbs_zxgl.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;cz=66">是</a>|<a href="/bbs/reg/useinfo.asp?id=<%=request("id")%>&amp;SessionID=<%=SessionID%>">否</a>
<%elseif cz="66" then%>
撤除论坛巡查成功
<%
sql="update usereg set yxxexc='0' where cstr(id)="&id
  conn.Execute(sql)
%>
<%elseif cz="7" then%>
是否设为VIP会员<br/>
<a href="bbs_zxgl.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;cz=77">是</a>|<a href="/bbs/reg/useinfo.asp?id=<%=request("id")%>&amp;SessionID=<%=SessionID%>">否</a>
<%elseif cz="77" then%>
设为VIP会员成功
<%
sql="update usereg set vip='1' where cstr(id)="&id
  conn.Execute(sql)
%>
<%elseif cz="8" then%>
是否撤除VIP会员<br/>
<a href="bbs_zxgl.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;cz=88">是</a>|<a href="/bbs/reg/useinfo.asp?id=<%=request("id")%>&amp;SessionID=<%=SessionID%>">否</a>
<%elseif cz="88" then%>
撤除VIP会员成功
<%
sql="update usereg set vip='0' where cstr(id)="&id
  conn.Execute(sql)
%>
<%elseif cz="9" then%>
是否设为社区法官<br/>
<a href="bbs_zxgl.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;cz=99">是</a>|<a href="/bbs/reg/useinfo.asp?id=<%=request("id")%>&amp;SessionID=<%=SessionID%>">否</a>
<%elseif cz="99" then%>
设为社区法官成功
<%
sql="update usereg set cw1='1' where cstr(id)="&id
  conn.Execute(sql)
%>
<%elseif cz="10" then%>
是否撤除社区法官<br/>
<a href="bbs_zxgl.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;cz=1010">是</a>|<a href="/bbs/reg/useinfo.asp?id=<%=request("id")%>&amp;SessionID=<%=SessionID%>">否</a>
<%elseif cz="1010" then%>
撤除社区法官成功
<%
sql="update usereg set cw1='0' where cstr(id)="&id
  conn.Execute(sql)
%>
<%elseif cz="13" then%>
是否设为论坛彩管<br/>
<a href="bbs_zxgl.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;cz=1313">是</a>|<a href="/bbs/reg/useinfo.asp?id=<%=request("id")%>&amp;SessionID=<%=SessionID%>">否</a>
<%elseif cz="1313" then%>
设为论坛彩管成功
<%
sql="update usereg set cg='1' where cstr(id)="&id
  conn.Execute(sql)
%>
<%elseif cz="14" then%>
是否撤除论坛彩管<br/>
<a href="bbs_zxgl.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;cz=1414">是</a>|<a href="/bbs/reg/useinfo.asp?id=<%=request("id")%>&amp;SessionID=<%=SessionID%>">否</a>
<%elseif cz="1414" then%>
撤除论坛彩管成功
<%
sql="update usereg set cg='0' where cstr(id)="&id
  conn.Execute(sql)
%>
<%elseif cz="15" then%>
是否授予帮主身份勋章<br/>
<a href="bbs_zxgl.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;cz=1515">是</a>|<a href="/bbs/reg/useinfo.asp?id=<%=request("id")%>&amp;SessionID=<%=SessionID%>">否</a>
<%elseif cz="1515" then%>
成功授予帮主身份勋章
<%
sql="update usereg set klwll='1' where cstr(id)="&id
  conn.Execute(sql)
%>
<%elseif cz="16" then%>
是否撤除帮主身份勋章<br/>
<a href="bbs_zxgl.asp?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;cz=1616">是</a>|<a href="/bbs/reg/useinfo.asp?id=<%=request("id")%>&amp;SessionID=<%=SessionID%>">否</a>
<%elseif cz="1616" then%>
成功撤除帮主身份勋章
<%
sql="update usereg set klwll='0' where cstr(id)="&id
  conn.Execute(sql)
%>
<%else%>
未知错误！
<%end if%>
<%end if%>
<br/>------------<br/>
<a href="/bbs/reg/useinfo.asp?id=<%=request("id")%>&amp;SessionID=<%=SessionID%>">返回会员资料</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
</p>
</card>
</wml>