<% @LANGUAGE="VBScript" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjnames.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
</head>
<%
Server.ScriptTimeout=999
iduse=Session("useid")
fkname=Session("ltname")
id=request("id")
if id="" then id=""&iduse&""
set ps=Server.CreateObject("ADODB.Recordset")
ssql="select * from jyhome where jyid=" & id & ""
ps.open ssql,conn
if ps.eof then
response.write "<card title='家园'><p>"
else
response.write "<card title='"&ps("jyname")&"'><p>"
end if
ps.close
Set ps= Nothing
if Session("zh")="wap" then
 Response.write " 请您<a href='/BBS/UseLogin.asp?SessionID="&SessionID&"'>登陆/注册</a><br/>"
else
Response.write " <a href='/bbs/reg/useinfo.asp?id="&iduse&"&amp;SessionID="&SessionID&"'><img src='/bbs/xhjy/id.gif' alt=''/>"& iduse &"</a>"
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'><img src='/bbs/xhjy/xx.gif' alt=''/>信息("&lycount&")</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?"
else
Response.write " <a href='/bbs/public/gygl.asp?SessionID="&SessionID&"'><img src='/bbs/xhjy/jy.gif' alt=''/>地盘</a><br/>"
end if
end if
%>
<%
Function frionline()
   set objgbrr=Server.CreateObject("ADODB.Recordset")
   ssql="select id from SoftDown_online where ids='" & id & "'"
 objgbrr.open ssql,conn
if not objgbrr.eof then
      frionline="(在线)"
   End if
set objgbrr=nothing
End function
       set obj=Server.CreateObject("ADODB.Recordset")
       ssql="select * from usereg where id=" & id & ""
       obj.open ssql,conn
       set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select * from jyhome where jyid=" & id & ""
       objgbrs.open ssql,conn
if objgbrs.eof then
Response.write "错误，无此家园或者用户还没有开通家园。<br/><a href='/bbs/xhjy/sxft.asp?yi=jy&amp;SessionID=" & SessionID & "'>开通家园</a><br/>"
else
if obj("id")<>iduse then
Response.write "家园.<a href='/bbs/hua/index.asp?id="&id&"&amp;SessionID="&SessionID&"'>花园</a>.<a href='/bbs/reg/useinfo.asp?id="&id&"&amp;SessionID="&SessionID&"'>资料</a><br/>[主人]:<a href='/bbs/xhjy/homegrzl.asp?id="&id&"&amp;SessionID="&SessionID&"'>" & obj("usename")&"(" & obj("id")&")</a><br/>"
else
Response.write "<a href='/bbs/friandbook/myfriend.asp?SessionID="&SessionID&"'>好友</a>.<a href='/bbs/hua/index.asp?id="&id&"&amp;SessionID="&SessionID&"'>花园</a>.<a href='/bbs/reg/useinfo.asp?id="&id&"&amp;SessionID="&SessionID&"'>资料</a><br/><a href='/bbs/xhjy/homegrzl.asp?id="&id&"&amp;SessionID="&SessionID&"'>" & obj("usename")&"</a>[<a href='/bbs/xhjy/homexg.asp?SessionID="&SessionID&"'>修改</a>]<br/>" & objgbrs("jyhy")&""
end if
dim crs4
set crs4=Server.CreateObject("ADODB.Recordset")
  sql="select * from my_xh where zid=" & id & ""
  crs4.open sql,conn,1,3
dim crs3
set crs3=Server.CreateObject("ADODB.Recordset")
  sql="select * from jyhy where hyid=" & id & " and hylx=4"
  crs3.open sql,conn,1,3
dim crs2
set crs2=Server.CreateObject("ADODB.Recordset")
  sql="select * from jyhy where hyid=" & id & " and hylx=3"
  crs2.open sql,conn,1,3
dim crs10
set crs10=Server.CreateObject("ADODB.Recordset")
  sql="select * from jyhy where hyid=" & id & " and hylx=2"
  crs10.open sql,conn,1,3
dim crs0
set crs0=Server.CreateObject("ADODB.Recordset")
  sql="select * from jyhy where hyid=" & id & " and hylx=1"
  crs0.open sql,conn,1,3
crs4.close
Set crs4= Nothing
crs3.close
Set crs3= Nothing
crs2.close
Set crs2= Nothing
crs0.close
Set crs0= Nothing
crs10.close
Set crs10= Nothing
dim rb2
set rb2=Server.CreateObject("ADODB.Recordset")
  sql="select * from jyxq where xqid=" & id & " and xqlx<>2 order by xqtime desc"
  rb2.open sql,conn,1,3
response.write "<br/><img src='xq.gif' alt=''/><a href='homexq.asp?id=" & id & "&amp;SessionID=" & SessionID & "'>主人心情(" & rb2.RecordCount & ")</a><br/>"
if rb2.eof then
Response.write "暂无心情<br/>"
else
if rb2("xqlx")=0 then
Response.write "" & rb2("xqnr") & "<br/>"
else
Response.write "此条心情不公开.<br/>"
end if
end if
rb2.close
Set rb2= Nothing
if obj("id")<>iduse then
if obj("usesex")="男" then
usesex="他"
else
usesex="她"
end if
Response.write "<input name='ltlyuan' maxlength='200' size='6'/><anchor>给" & usesex & "家信<go method='post' href='/bbs/public/fslycl.asp?SessionID=" & SessionID& "'><postfield name='ltlyuan' value='$(ltlyuan)'/><postfield name='ids' value='" & id & "'/></go></anchor><br/>"
end if
Response.write "------------<br/><img src='fk.gif' alt=''/><a href='homefk.asp?id=" & id & "&amp;SessionID=" & SessionID & "'>访客(共" & objgbrs("jyfk")&"次)</a><br/>"
dim rb1
set rb1=Server.CreateObject("ADODB.Recordset")
  sql="select * from jyfk where fkzid=" & id & " order by times desc"
  rb1.open sql,conn,1,3
if rb1.eof then
Response.write ""
else
For i=1 to 3
Response.write "<a href='home.asp?id=" & rb1("fkfid") & "&amp;SessionID=" & SessionID & "'>" & rb1("fkname") & "(" & rb1("fkfid")&")</a><br/>"
rb1.Movenext
if rb1.EOF then Exit for
 Next
end if
rb1.close
Set rb1= Nothing

dim rt1
set rt1=Server.CreateObject("ADODB.Recordset")
  sql="select * from jyly where lyzid=" & id & " order by lytime desc"
  rt1.open sql,conn,1,3
response.write "------------<br/><img src='ly.gif' alt=''/><a href='homely.asp?id=" & id & "&amp;SessionID=" & SessionID & "'>留言(共" & objgbrs("jyly")&"条)</a><br/>" 
if rt1.eof then
Response.write ""
else
For i=1 to 3
if rt1("lylx")=0 then
Response.write "<a href='home.asp?id=" & rt1("lyfid") & "&amp;SessionID=" & SessionID & "'>" & rt1("lyfname") & "(" & rt1("lyfid")&")</a>:" & rt1("lynr") & "<br/>"
end if
if rt1("lylx")=3 then
Response.write "<a href='home.asp?id=" & rt1("lyfid") & "&amp;SessionID=" & SessionID & "'>" & rt1("lyfname") & "(" & rt1("lyfid")&")</a>:" & rt1("lynr") & "<br/>"
end if
rt1.Movenext
if rt1.EOF then Exit for
 Next
end if
rt1.close
Set rt1= Nothing
if obj("id")<>iduse then
Response.write "<input type='text' name='abcyi88' title='回复内容' maxlength='120' /><anchor>给他留言<go method='post' href='ly.asp?SessionID=" & SessionID & "'><postfield name='abcyi88' value='$(abcyi88)'/><postfield name='lyzid' value='"&id&"'/><postfield name='lyfid' value='"&iduse&"'/><postfield name='lyfname' value='"&fkname&"'/><postfield name='lx' value='0'/></go></anchor><br/>"
end if
Response.write "------------<br/><input type='text' name='abcyi555' size='8' maxlength='6' />输入ID<br/><anchor>去逛逛他的家园<go method='post' href='home.asp?'><postfield name='SessionID' value='" & SessionID & "'/><postfield name='id' value='$(abcyi555)'/></go></anchor>"
Response.write "<br/>"

'访客记录
       set oba=Server.CreateObject("ADODB.Recordset")
       ssql="select * from jyfk where fkzid=" & id & " and fkfid=" & iduse & ""
       oba.open ssql,conn
if oba.eof then
if ""&id&""<>""&iduse&"" then
  sql="insert into jyfk(fkzid,fkfid,fkname)values("
  sql=sql & sqlstr(id) & ","
  sql=sql & sqlstr(iduse) & ","
  sql=sql & sqlstr(fkname) & ")"
  conn.execute sql
  sql="update jyhome set jyfk=jyfk+1 where jyid=" & id & ""
  Application.Lock
  conn.execute sql
  Application.Unlock
end if
else
if oba("fkzid")<>iduse then
set obaa=Server.CreateObject("ADODB.Recordset")
ssql="select * from jyfk where fkzid=" & id & " and fkfid=" & iduse & " and DATEDIFF('s', times, now()) > 2*60"
obaa.open ssql,conn
if not obaa.eof then
  sql="update jyhome set jyfk=jyfk+1 where jyid=" & id & ""
  conn.execute sql
end if
obaa.close
Set obaa= Nothing
  sql="update jyfk set times=now(),fkname='" & fkname & "' where fkzid=" & id & " and fkfid=" & iduse & ""
  conn.execute sql
  Application.Unlock
end if
end if
oba.close
Set oba= Nothing
'结束
end if
Response.write "<br/>------------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/>"
%>
北京时间:<%=time%>
</p>
</card>
</wml>