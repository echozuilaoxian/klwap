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
<card title="家园"><p align="left">
<%session.abandon%>
<%
Server.ScriptTimeout=999
iduse=Session("useid")
fkname=Session("ltname")
id=request("id")
if Session("zh")="abcyi" then
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
Response.write "错误，无此家园."
else
if obj("id")<>iduse then
Response.write "家园.<a href='/bbs/xhjy/homehy.asp?id="&id&"&amp;SessionID="&SessionID&"'>花园</a>.<a href='/bbs/reg/useinfo.asp?id="&id&"&amp;SessionID="&SessionID&"'>资料</a><br/>[主人]:<a href='/bbs/xhjy/homegrzl.asp?id="&id&"&amp;SessionID="&SessionID&"'>" & obj("usename")&"(" & obj("id")&")</a>的送花记录.<br/>"
else
Response.write "<a href='/bbs/friandbook/myfriend.asp?SessionID="&SessionID&"'>好友</a>.<a href='/bbs/xhjy/homehy.asp?id="&id&"&amp;SessionID="&SessionID&"'>花园</a>.<a href='/bbs/reg/useinfo.asp?id="&id&"&amp;SessionID="&SessionID&"'>资料</a><br/>我的送花记录.<br/>"
end if
sql="delete from jyjl Where DATEDIFF(s, lytime, getdate()) > 30*86400"
  conn.Execute(sql)
dim rt11,pages
set rt11=Server.CreateObject("ADODB.Recordset")
  sql="select * from jyjl where lylx=0 and (lyzid=" & id & " or lyfid=" & id & ") order by lytime desc"
  rt11.open sql,conn,1,3
if rt11.eof then
Response.write "" & obj("usename")&"暂无送花记录.<br/>"
else
rt11.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>rt11.PageCount then pages=rt11.PageCount
rt11.absolutepage=pages
if pages=1 then
bihao=0
else
bihao=pages*10-10
End if
For k=1 to rt11.PageSize
    bihaocontd=bihaocontd+1
Response.write bihao+bihaocontd & "."
%>
<%newyear=DateDiff("s",cdate("" & rt11("lytime") & ""),now)%>
<%
if newyear>59 and newyear<3600 then
Response.write "" & int(newyear/60) & "分钟前"
end if
if newyear<60 then
Response.write "" & newyear & "秒钟前"
end if
if newyear>3599 and newyear<86400 then
Response.write "" & int(newyear/3600) & "小时前"
end if
if newyear>86399 then
Response.write "" & int(newyear/86400) & "天前"
end if
Response.write "<a href='home.asp?id=" & rt11("lyzid") & "&amp;SessionID="&SessionID&"'>" & rt11("lyzname") & "</a>给<a href='home.asp?id=" & rt11("lyfid") & "&amp;SessionID="&SessionID&"'>" & rt11("lyfname") & "</a>送了" & rt11("lynr") & ".<br/>"
rt11.Movenext
if rt11.EOF then Exit for
 Next
end if
Response.write "--------------<br/>"
If Pages<rt11.PageCount then
    Response.Write "<a href='homejl.asp?id="&id&"&amp;pages=" & (pages+1) & "&amp;SessionID="&SessionID&"'>下页</a>"
End if
If pages>1 then
    Response.Write "|<a href='homejl.asp?id="&id&"&amp;pages=" & (pages-1) & "&amp;SessionID="&SessionID&"'>上页</a>"
End if
    if rt11.RecordCount>rt11.PageSize then
    response.write "<br/>"
End if
response.write "&#40;第" &  Pages & "页&#47;共" & rt11.PageCount & "页&#41;" & "共" & rt11.RecordCount & "条记录.<br/>(仅保留30天内的记录)"
if rt11.PageCount>1 then
response.write "<br/>第<input  name='pages' value='2' size='2' format='*N'/>页<br/><anchor>跳到该页<go method='post' href='homejl.asp?id="&id&"&amp;SessionID="&SessionID&"'><postfield name='pages' value='$(pages)'/></go></anchor>"
End if
Response.write "<br/><a href='home.asp?id=" &id & "&amp;SessionID="&SessionID&"'>主人家园</a>>送花记录"
end if
%>
<br/>-------------
<br/><a href='/bbs/xhjy/home.asp?SessionID=<%=SessionID%>'>返回我的家园</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
<br/>北京时间:<%=time%>
</p>
</card>
</wml>