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
<card title="心情"><p align="left">
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
Response.write "=最近心情=<br/>"
       set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select usename,id from usereg where id=" & id & ""
       objgbrs.open ssql,conn
Response.write "主人:" & objgbrs("usename") & "<br/>"
  dim pages,ly
  pages=request("pages")
  set ly=Server.CreateObject("ADODB.Recordset")
  ssql="select * from jyxq where xqid=" & id & " and xqlx<>2 order by xqtime desc"
  ly.open ssql,conn,1,1
if ly.eof then
Response.write "暂时没有心情<br/>"
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
if ly("xqlx")="0" then
Response.write "" & ly("xqnr") & "[" & ly("xqtime") & "]"
else
if ly("xqlx")="1" then
if CStr(ly("xqid"))=CStr(Session("useid")) then
Response.write "[私]" & ly("xqnr") & "[" & ly("xqtime") & "]"
else
Response.write "此条心情不公开."
end if
end if
end if
if CStr(ly("xqid"))=CStr(Session("useid")) and ly("xqlx")<>2 then
Response.write "<a href='homexq.asp?ide=" & ly("id") & "&amp;idd=" & ly("xqid") & "&amp;abSessionID="&SessionID&"'>删除</a>"
end if
Response.write "<br/>"
ly.Movenext
if ly.EOF then Exit for
 Next
end if
Response.write "--------------<br/>"
If Pages<ly.PageCount then
    Response.Write "<a href='homexq.asp?id="&id&"&amp;pages=" & (pages+1) & "&amp;SessionID="&SessionID&"'>下页</a>"
End if
If pages>1 then
    Response.Write "|<a href='homexq.asp?id="&id&"&amp;pages=" & (pages-1) & "&amp;SessionID="&SessionID&"'>上页</a>"
End if
    if ly.RecordCount>ly.PageSize then
    response.write "<br/>"
End if
response.write "&#40;第" &  Pages & "页&#47;共" & ly.PageCount & "页&#41;" & "共" & ly.RecordCount & "条心情."
if ly.PageCount>1 then
response.write "<br/>第<input  name='pages' value='2' size='2' format='*N'/>页<anchor>GO<go method='post' href='homexq.asp?id="&id&"&amp;SessionID="&SessionID&"'><postfield name='pages' value='$(pages)'/></go></anchor>>>"
End if
if objgbrs("id")=Session("useid") then
Response.write "<br/><input type='text' name='abcyi16' title='回复内容' maxlength='120'/><br/><select name='lx' value='0'><option value='0'>公开</option><option value='1'>私密</option></select><br/><anchor>发表心情<go method='post' href='homexq.asp?SessionID="&SessionID&"'><postfield name='yi' value='xq'/><postfield name='SessionID' value='" & SessionID & "'/><postfield name='abcyi88' value='$(abcyi16)'/><postfield name='xqid' value='"&iduse&"'/><postfield name='xqlx' value='$(lx)'/></go></anchor>"
end if
ly.close
set ly=nothing
end if
if yi="sc" then
idd=request("idd")
ide=request("ide")
if CStr(idd)=CStr(Session("useid")) then
 sql="update jyxq set xqlx='2' Where id=" & ide & ""
  conn.Execute(sql)
  Application.Unlock
response.write "删除成功..<br/>"
Response.write "<a href='homexq.asp?id=" &idd & "&amp;SessionID="&SessionID&"'>返回心情</a>|<a href='home.asp?id=" &idd & "&amp;SessionID="&SessionID&"'>返回家园</a>"
end if
end if
if yi="xq" then
xqid=request("xqid")
abcyi88=request("abcyi88")
xqlx=request("xqlx")
  sql="insert into jyxq(xqid,xqnr,xqlx)values("
  sql=sql & sqlstr(xqid) & ","
  sql=sql & sqlstr(abcyi88) & ","
  sql=sql & sqlstr(xqlx) & ")"
  Application.Lock
  conn.execute sql
  Application.Unlock
response.write "发表心情成功..<br/>"
Response.write "<a href='homexq.asp?id=" &xqid & "&amp;SessionID="&SessionID&"'>返回心情</a>|<a href='home.asp?id=" &xqid & "&amp;SessionID="&SessionID&"'>返回家园</a>"
end if
%>
<br/>-------------
<br/><a href='/bbs/xhjy/home.asp?SessionID=<%=SessionID%>'>返回我的家园</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
<br/>北京时间:<%=time%>
</p></card></wml>