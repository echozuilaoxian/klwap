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
yi=request("yi")
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
if yi="" then
Response.write "=访客最新留言=<br/>"
       set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select usename from usereg where id=" & id & ""
       objgbrs.open ssql,conn
Response.write "主人:" & objgbrs("usename") & "<br/>"
sql="delete from jyly Where DATEDIFF('s', lytime, now()) > 30*86400 and lylx<>3"
  conn.Execute(sql)
  set zdly=Server.CreateObject("ADODB.Recordset")
  ssql="select top 3 * from jyly where lyzid=" & id & " and lylx=3 order by lytime desc"
  zdly.open ssql,conn,1,1
if zdly.eof then
else
For i=1 to zdly.PageSize
    bihaocont=bihaocont+1
Response.write "【顶】"
Response.write bihao+bihaocont & "."
Response.write "<a href='grzl.asp?id=" & zdly("lyfid") & "&amp;SessionID="&SessionID&"'>" & zdly("lyfname") & "</a>:" & zdly("lynr") & "[" & zdly("lytime") & "]"
if CStr(zdly("lyzid"))=CStr(Session("useid")) and zdly("lylx")=3 then
Response.write "|<a href='homely.asp?id=" &id & "&amp;yi=qd&amp;ide=" & zdly("id") & "&amp;idd=" & zdly("lyzid") & "&amp;pages=1&amp;SessionID="&SessionID&"'>消顶</a>"
end if
if CStr(zdly("lyzid"))=CStr(Session("useid")) and zdly("lylx")<>2 then
Response.write "|<a href='homely.asp?id=" &id & "&amp;yi=sc&amp;ide=" & zdly("id") & "&amp;idd=" & zdly("lyzid") & "&amp;pages=1&amp;SessionID="&SessionID&"'>删除</a>"
end if
Response.write "<br/>"
    zdly.Movenext
  if zdly.EOF then Exit for
    Next
zdly.close
set zdly=nothing
end if

  dim pages,ly
  pages=request("pages")
  set ly=Server.CreateObject("ADODB.Recordset")
  ssql="select * from jyly where lyzid=" & id & " order by lytime desc"
  ly.open ssql,conn,1,1
if ly.eof then
Response.write "暂时没有留言<br/>"
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
Response.write bihao+bihaocontd & "."
if ly("lylx")="2" then
Response.write "此条留言已被删除."
if CStr(ly("lyzid"))=CStr(Session("useid")) and ly("lylx")=2 then
Response.write "|<a href='homely.asp?id=" &id & "&amp;yi=hf&amp;ide=" & ly("id") & "&amp;idd=" & ly("lyzid") & "&amp;pages=" & pages & "&amp;SessionID="&SessionID&"'>恢复</a>"
end if
else
if ly("lylx")="0" or ly("lylx")="3" then
Response.write "<a href='grzl.asp?id=" & ly("lyfid") & "&amp;SessionID="&SessionID&"'>" & ly("lyfname") & "</a>:" & ly("lynr") & "[" & ly("lytime") & "]"
else
if ly("lylx")="1" then
if CStr(ly("lyzid"))=CStr(Session("useid")) or CStr(ly("lyfid"))=CStr(Session("useid")) then
Response.write "[私]<a href='grzl.asp?id=" & ly("lyfid") & "&amp;SessionID="&SessionID&"'>" & ly("lyfname") & "</a>:" & ly("lynr") & "[" & ly("lytime") & "]"
else
Response.write "此条留言不公开."
end if
end if
end if
end if
if CStr(ly("lyzid"))=CStr(Session("useid")) and ly("lylx")=0 then
Response.write "|<a href='homely.asp?id=" &id & "&amp;yi=zd&amp;ide=" & ly("id") & "&amp;idd=" & ly("lyzid") & "&amp;pages=" & pages & "&amp;SessionID="&SessionID&"'>置顶</a>"
end if
if CStr(ly("lyzid"))=CStr(Session("useid")) and ly("lylx")=3 then
Response.write "|<a href='homely.asp?id=" &id & "&amp;yi=qd&amp;ide=" & ly("id") & "&amp;idd=" & ly("lyzid") & "&amp;pages=" & pages & "&amp;SessionID="&SessionID&"'>取顶</a>"
end if
if CStr(ly("lyzid"))=CStr(Session("useid")) and ly("lylx")<>2 then
Response.write "|<a href='homely.asp?id=" &id & "&amp;yi=sc&amp;ide=" & ly("id") & "&amp;idd=" & ly("lyzid") & "&amp;pages=" & pages & "&amp;SessionID="&SessionID&"'>删除</a>"
end if
Response.write "<br/>"
ly.Movenext
if ly.EOF then Exit for
 Next
end if
Response.write "--------------<br/>"
If Pages<ly.PageCount then
    Response.Write "<a href='homely.asp?id="&id&"&amp;pages=" & (pages+1) & "&amp;SessionID="&SessionID&"'>下页</a>"
End if
If pages>1 then
    Response.Write "|<a href='homely.asp?id="&id&"&amp;pages=" & (pages-1) & "&amp;SessionID="&SessionID&"'>上页</a>"
End if
    if ly.RecordCount>ly.PageSize then
    response.write "<br/>"
End if
response.write "&#40;第" &  Pages & "页&#47;共" & ly.PageCount & "页&#41;" & "共" & ly.RecordCount & "条留言.<br/>仅保留30天内的留言."
if ly.PageCount>1 then
response.write "<br/>第<input  name='pages' value='2' size='2' format='*N'/>页<anchor>GO<go method='post' href='homely.asp?id="&id&"&amp;SessionID="&SessionID&"'><postfield name='pages' value='$(pages)'/></go></anchor>>>"
End if
Response.write "<br/><input type='text' name='abcyi11' title='回复内容' maxlength='120'/><br/><select name='lx' value='0'><option value='0'>公开</option><option value='1'>私密</option></select><br/><anchor>给他留言<go method='post' href='ly.asp?SessionID="&SessionID&"'><postfield name='abcyi88' value='$(abcyi11)'/><postfield name='lyzid' value='"&id&"'/><postfield name='lyfid' value='"&iduse&"'/><postfield name='lyfname' value='"&fkname&"'/><postfield name='lx' value='$(lx)'/></go></anchor>"
ly.close
set ly=nothing
end if
if yi="zd" then
id=request("id")
idd=request("idd")
ide=request("ide")
pages=request("pages")
if CStr(idd)=CStr(Session("useid")) then
 sql="update jyly set lylx='3' Where id=" & ide & ""
  conn.Execute(sql)
  Application.Unlock
response.write "置顶成功..<br/><a href='homely.asp?id=" &id & "&amp;pages=" & pages & "&amp;SessionID="&SessionID&"'>返回留言列表</a><br/><a href='home.asp?id=" &id & "&amp;SessionID="&SessionID&"'>返回主人家园</a>"
end if
end if
if yi="qd" then
id=request("id")
idd=request("idd")
ide=request("ide")
pages=request("pages")
if CStr(idd)=CStr(Session("useid")) then
 sql="update jyly set lylx='0' Where id=" & ide & ""
  conn.Execute(sql)
  Application.Unlock
response.write "取顶成功..<br/><a href='homely.asp?id=" &id & "&amp;pages=" & pages & "&amp;SessionID="&SessionID&"'>返回留言列表</a><br/><a href='home.asp?id=" &id & "&amp;SessionID="&SessionID&"'>返回主人家园</a>"
end if
end if
if yi="hf" then
id=request("id")
idd=request("idd")
ide=request("ide")
pages=request("pages")
if CStr(idd)=CStr(Session("useid")) then
 sql="update jyly set lylx='0' Where id=" & ide & ""
  conn.Execute(sql)
  Application.Unlock
response.write "恢复成功..<br/><a href='homely.asp?id=" &id & "&amp;pages=" & pages & "&amp;SessionID="&SessionID&"'>返回留言列表</a><br/><a href='home.asp?id=" &id & "&amp;SessionID="&SessionID&"'>返回主人家园</a>"
end if
end if
if yi="sc" then
id=request("id")
idd=request("idd")
ide=request("ide")
pages=request("pages")
if CStr(idd)=CStr(Session("useid")) then
 sql="update jyly set lylx='2' Where id=" & ide & ""
  conn.Execute(sql)
  Application.Unlock
response.write "删除成功..<br/><a href='homely.asp?id=" &id & "&amp;pages=" & pages & "&amp;aSessionID="&SessionID&"'>返回留言列表</a><br/><a href='home.asp?id=" &id & "&amp;abcSessionID="&SessionID&"'>返回主人家园</a>"
end if
end if
Response.write "<br/><a href='home.asp?id=" &id & "&amp;SessionID="&SessionID&"'>主人家园</a>>访客留言"
%>
<br/>-------------
<br/><a href='/bbs/xhjy/home.asp?SessionID=<%=SessionID%>'>返回我的家园</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
<br/>北京时间:<%=time%>
</p></card></wml>