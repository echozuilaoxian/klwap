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
<card title="家园留言"><p align="left">
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
Response.write "访客列表<br/>"
sql="delete from jyfk Where DATEDIFF('s', times, now()) > 10*86400"
  conn.Execute(sql)
  dim pages,ly
  pages=request("pages")
  set ly=Server.CreateObject("ADODB.Recordset")
  ssql="select * from jyfk where CStr(fkzid)='" & id & "' order by times desc"
  ly.open ssql,conn,1,1
if ly.eof then
Response.write "暂时没有访客.<br/>"
else
ly.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>ly.PageCount then pages=ly.PageCount
ly.absolutepage=pages
if pages=1 then
bihao=0
else
bihao=pages*10-10
End if
For k=1 to ly.PageSize
    bihaocontd=bihaocontd+1
Response.write bihao+bihaocontd & ".<a href='home.asp?id=" & ly("fkfid") & "&amp;SessionID="&SessionID&"'>" & ly("fkname") & "</a><br/>"
ly.Movenext
if ly.EOF then Exit for
 Next
end if
Response.write "--------------<br/>"
If Pages<ly.PageCount then
    Response.Write "<a href='homefk.asp?id="&id&"&amp;pages=" & (pages+1) & "&amp;SessionID="&SessionID&"'>下页</a>"
End if
If pages>1 then
    Response.Write "|<a href='homefk.asp?id="&id&"&amp;pages=" & (pages-1) & "&amp;SessionID="&SessionID&"'>上页</a>"
End if
    if ly.RecordCount>ly.PageSize then
    response.write "<br/>"
End if
response.write "&#40;第" &  Pages & "页&#47;共" & ly.PageCount & "页&#41;" & "共" & ly.RecordCount & "个访客.<br/>(仅保留10天内的访客)"
if ly.PageCount>1 then
response.write "<br/>第<input  name='pages' value='2' size='2' format='*N'/>页<anchor>GO<go method='post' href='homefk.asp?id="&id&"&amp;SessionID="&SessionID&"'><postfield name='pages' value='$(pages)'/></go></anchor>>>"
End if
ly.close
set ly=nothing
Response.write "<br/><a href='home.asp?id=" &id & "&amp;SessionID="&SessionID&"'>主人家园</a>>访客列表"
%>
<br/>-------------
<br/><a href='/bbs/xhjy/home.asp?SessionID=<%=SessionID%>'>返回我的家园</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
<br/>北京时间:<%=time%>
</p></card></wml>