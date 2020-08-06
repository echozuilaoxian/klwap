<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Server.ScriptTimeout=999
  dim id,page,pages
  pages=request("pages")
  id=request("id")
  page=request("page")
  iduse=Session("useid")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from guestbook Where CStr(id)='" & id &"'"
  objgbrs.open ssql,conn
Content=objgbrs("niayo")
Response.Write "<card id='card1' title='发出的信息'><p>"
if CStr(objgbrs("reids"))<>CStr(Session("useid")) then
Response.Write "未知错误</p></card></wml>"
Response.end
end if

tjhm=objgbrs("ids")
      Response.write "编号:"&objgbrs("id")&"<br/>"

if objgbrs("ids")="0" or objgbrs("ids")="1860"  then
      response.write "接收:系统信息<br/>"
   else
      Response.write "接收:<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("ids") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(redtjname) & "</a>(" & objgbrs("ids") & ")" & frionline & "<br/>"
end if
      Response.write "时间:" & objgbrs("times") & "<br/>"
      Response.write "内容:"
pageWordNum=300
StartWord = 1
Length=len(Content)
PageAll=(Length+PageWordNum-1)\PageWordNum
i=request("i")
if isnull(i) or i="" then
i=0
end if
Content = mid(Content,StartWord+i*PageWordNum,PageWordNum)
Response.Write converttowide(UBBCodes(Content))
response.write "<br/>-----------"
if 0<=i<PageAll then
if cint(i)<cint(PageAll)-1 then
Response.Write "<br/><a href='ckfx.asp?i=" & i+1 & "&amp;id=" & objgbrs("id") & "&amp;pages=" & pages & "&amp;SessionID=" & SessionID & "'>下一页</a>"
End if
if cint(i)>0 then 
Response.Write "&nbsp;" & "<a href='ckfx.asp?i=" & i-1 & "&amp;id=" & objgbrs("id") & "&amp;pages=" & pages & "&amp;SessionID=" & SessionID & "'>上一页</a>"
  End if
End if
if PageAll>1 then
response.write "&nbsp;" & "&#40;" &  i+1 & "&#47;" & PageAll & "&#41;<br/>"
End if

if objgbrs("reids")<>"0" and objgbrs("reids")<>"1860"  then
Response.write "<br/>快速回复<br/>内容:<input type='text' name='ltlyuan' maxlength='300' emptyok='true' /><br /><anchor>回复<go method='post' href='/bbs/public/fslycl.asp?SessionID=" & SessionID & "'><postfield name='ltlyuan' value='"&imgs&"$(ltlyuan)'/><postfield name='ids' value='" & objgbrs("ids") & "'/><postfield name='id' value='" & objgbrs("id") & "'/><postfield name='pages' value='" & pages & "'/></go></anchor>"
response.write "<br/>"
%>
---------<br/>
最新消息记录:<br/>
<%
  set objgbrsx=Server.CreateObject("ADODB.Recordset")
  ssxql="select top 8 * from guestbook where (CStr(ids)='" & tjhm & "' and reids='" & iduse & "') or (CStr(ids)='" & iduse & "' and reids='" & tjhm & "') and biaozi='f' order by times desc"
  objgbrsx.open ssxql,conn,1,3
if objgbrsx.eof then
       Response.write "与" & converttowidebaiti(redtjname) & "没有聊天记录<br/>"
   Else
  dim i 
	   	i=0
   do while not objgbrsx.eof
hfylx=left(objgbrsx("niayo"),60)
if len(objgbrsx("niayo"))>60 then
hfylx=hfylx+"..."
End if
if objgbrsx("ids")<>iduse then
tjhmd=objgbrsx("reids")
   Else
tjhmd=objgbrsx("ids")
End if
	sql="select * from usereg where CStr(id)='" & tjhmd & "'"
	set rsSS=conn.execute(sql)
	rtjname=rsSS("usename")
set rsSS=nothing
Response.write ""&i+1&"."&converttowidebaiti(rtjname) & ":" & converttowidebaiti(hfylx) & ""
Response.write"(" & String(2-Len(Month(objgbrsx("times"))),"0") & Month(objgbrsx("times")) & "月" & String(2-len(Day(objgbrsx("times"))),"0") & Day(objgbrsx("times")) & "日 " & String(2-Len(hour(objgbrsx("times"))),"0") & hour(objgbrsx("times"))  & "时" & String(2-Len(minute(objgbrsx("times"))),"0") & minute(objgbrsx("times")) & "分)<br/>"
        i=i+1
objgbrsx.movenext
	loop
	end if
	objgbrsx.close
	set objgbrsx=nothing
End if
response.write"-----------<br/>"
Response.write"<a href='/bbs/public/main_fs.asp?SessionID=" & SessionID & "'>编写消息</a><br/>"
Response.write"<a href='zhuang.asp?id=" & objgbrs("id") & "&amp;pages=" & pages & "&amp;SessionID=" & SessionID & "'>转发消息</a><br/>"
Response.write"<a href='bao.asp?id=" & objgbrs("id") & "&amp;pages=" & pages & "&amp;SessionID=" & SessionID & "'>收藏消息</a><br/>"
Response.write"<a href='dellyy.asp?id=" & objgbrs("id") & "&amp;pages=" & pages & "&amp;SessionID=" & SessionID & "'>删除消息</a>"


response.write "<br/>-----------<br/>"
Response.write"<a href='fx.asp?pages=" & pages & "&amp;SessionID=" & SessionID & "'>返回发件箱</a><br/>"
Response.write"<a href='srxx.asp?SessionID=" & SessionID & "'>返回消息中心</a>"

   Response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a>"%>
<br/>北京时间:<%=time%>
<%
Response.write "</p></card></wml>"
objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing
Function frionline()
   page=request("page")
   set objgbrr=Server.CreateObject("ADODB.Recordset")
   ssql="select * from SoftDown_online where Cstr(ids)='" & tjhm & "'"
   objgbrr.open ssql,conn
   if objgbrr.eof then
      frionline="(离线)"
   Else
      frionline="(在线)"
   End if
   set objgbrr=nothing
End function
%>