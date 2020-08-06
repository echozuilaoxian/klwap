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
Response.Write "<card id='card1' title='查看消息'><p>"

if Session("zh")="wap" then
        response.redirect "/BBS/UseLogin.asp"
      else
        Session("ltlybz")=""
    End if

SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
  dim id,page,pages,img,imgs
  pages=request("pages")
  id=request("id")
img=request("img")
imgs=request("imgs")
  page=request("page")

  sql="update guestbook set biaozi='f' Where CStr(id)='" & id & "'"
  Application.Lock
  conn.Execute(sql)
  Application.Unlock

  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from guestbook Where CStr(id)='" & id &"' "
  objgbrs.open ssql,conn

if objgbrs.eof then
Response.write "系统提示！该条信息不存在或者对方已经删除<br/>"
response.write"-----------<br/>"
Response.write"<a href='/bbs/public/main_ckly.asp?SessionID=" & SessionID & "'>返回收件箱</a><br/>"
Response.write"<a href='/bbs/public/srxx.asp?SessionID=" & SessionID & "'>返回消息中心</a><br/>"
Response.write "<a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>返回我的地盘</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a>"
Response.write "</p></card></wml>"
Response.end
end if

if CStr(objgbrs("ids"))<>CStr(Session("useid")) then
Response.write "系统提示！你的身份无法被识别....<br/>"
response.write"-----------<br/>"
Response.write"<a href='/bbs/public/main_ckly.asp?SessionID=" & SessionID & "'>返回收件箱</a><br/>"
Response.write"<a href='/bbs/public/srxx.asp?SessionID=" & SessionID & "'>返回消息中心</a><br/>"
Response.write "<a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>返回我的地盘</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a>"
Response.write "</p></card></wml>"
Response.end
end if

Content=objgbrs("niayo")

if lycount>0 then
dim rs
set rs=Server.CreateObject("ADODB.Recordset")
  ssql1="select * from guestbook Where CStr(ids)='" & iduse &"' and biaozi='t' order by times desc"
  rs.open ssql1,conn
    Response.write "<a href='/BBS/Public/MessageRead.Asp?ID=" & rs("id") & "&amp;SessionID=" & SessionID & "'>还有(" & lycount & ")条新消息</a><br/><br/>"
rs.close
Set rs= Nothing
end if

tjhm=objgbrs("reids")
      Response.write "编号:"&objgbrs("id")&"<br/>"

if objgbrs("reids")="0" then
      response.write "发送:系统信息<br/>"
   else
      Response.write "发送:<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("reids") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(redtjname) & "</a>(ＩＤ" & objgbrs("reids") & ")<br/>"
end if
      Response.write "时间:" & objgbrs("times") & "<br/>"
      Response.write "内容:"
if objgbrs("gn")<>"f" then
tjhm=objgbrs("yxxeid")
      Response.write "会员<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("yxxeid") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(redtjname) & "(ＩＤ" & objgbrs("yxxeid") & ")</a>"
end if
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

if objgbrs("gn")="j" then
      response.write "<br/><a href='/bbs/jieh/jies.asp?ids=" & objgbrs("yxxeid") & "&amp;SessionID=" & SessionID & "'>接受</a>|<a href='/bbs/index.asp?SessionID=" & SessionID & "'>不接受</a>"
elseif objgbrs("gn")="l" then
      response.write "<br/><a href='/bbs/room/from.asp?id=3&amp;SessionID=" & SessionID & "'>进入聊天室</a>"
elseif objgbrs("gn")="lw" then
      response.write "<br/><a href='/BBS/Gift/MyItem.Asp?SessionID=" & SessionID & "'>进入我的物品</a>"
elseif objgbrs("gn")="tf" then
      response.write "<br/><a href='/BBS/reg/dongf/room.asp?SessionID=" & SessionID & "'>进入洞房>></a>"
elseif objgbrs("gn")="yy" then
      response.write "<br/><a href='/BBS/reg/dongf/nnfc.asp?SessionID=" & SessionID & "'>进入医院>></a>"
elseif objgbrs("gn")="x" then
      response.write "<br/><a href='/bbs/skin/select1.asp?id=" & objgbrs("wpid") & "&amp;ids=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>[-穿上-]</a>"
elseif objgbrs("gn")="y" then
      response.write "<br/><a href='/bbs/friandbook/1yz.asp?frid=" & objgbrs("yxxeid") & "&amp;SessionID=" & SessionID & "'>[-通过-]</a>"
      response.write "<br/><a href='/bbs/friandbook/2yz.asp?frid=" & objgbrs("yxxeid") & "&amp;SessionID=" & SessionID & "'>[-拒绝-]</a>"
end if

response.write "<br/>-----------<br/>"
if 0<=i<PageAll then
if cint(i)<cint(PageAll)-1 then
Response.Write "<br/><a href='/BBS/Public/MessageRead.Asp?i=" & i+1 & "&amp;id=" & objgbrs("id") & "&amp;pages=" & pages & "&amp;SessionID=" & SessionID & "'>下一页</a>"
End if
if cint(i)>0 then 
Response.Write "&nbsp;" & "<a href='/BBS/Public/MessageRead.Asp?i=" & i-1 & "&amp;id=" & objgbrs("id") & "&amp;pages=" & pages & "&amp;SessionID=" & SessionID & "'>上一页</a>"
  End if
End if
if PageAll>1 then
response.write "&nbsp;" & "&#40;" &  i+1 & "&#47;" & PageAll & "&#41;<br/>"
End if
if objgbrs("reids")<>"0"  then
Response.write "快速回复<br/>内容:<input type='text' name='ltlyuan' maxlength='300' emptyok='true' /><br /><anchor>回复消息<go method='post' href='/bbs/public/fslycl.asp?SessionID=" & SessionID & "'><postfield name='ltlyuan' value='"&imgs&"$(ltlyuan)'/><postfield name='ids' value='" & objgbrs("reids") & "'/><postfield name='id' value='" & objgbrs("id") & "'/><postfield name='pages' value='" & pages & "'/></go></anchor>"
response.write "<br/>"
%>
-----------<br/>
最新消息记录:<br/>
<%
  set objgbrsx=Server.CreateObject("ADODB.Recordset")
  ssxql="select * from guestbook where (CStr(ids)='" & iduse & "' and reids='" & tjhm & "') or (CStr(ids)='" & tjhm & "' and reids='" & iduse & "') and biaozi='f' order by times desc"
  objgbrsx.open ssxql,conn,1,3
if objgbrsx.eof then
       Response.write "与" & converttowidebaiti(redtjname) & "没有聊天记录<br/>"
   Else
dim jdshow
jdshow=CLng(Session("showjd"))

 objgbrsx.PageSize=jdshow

  page=CLng(Request("page"))
 if page<1 or page="" then
    page=1
  End if

 if page>objgbrsx.pagecount then
    page=objgbrsx.pagecount
  End if

 objgbrsx.absolutepage=page
   if page=1 then
     bihao=0
    else
     bihao=page*jdshow-jdshow
   End if
For i=1 to objgbrsx.PageSize
    bihaocont=bihaocont+1
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

Response.Write bihao+bihaocont & "." & "<b>"&converttowidebaiti(rtjname) & "</b>:" & converttowidebaiti(hfylx) & ""
Response.write"(" & String(2-Len(Month(objgbrsx("times"))),"0") & Month(objgbrsx("times")) & "月" & String(2-len(Day(objgbrsx("times"))),"0") & Day(objgbrsx("times")) & "日 " & String(2-Len(hour(objgbrsx("times"))),"0") & hour(objgbrsx("times"))  & "时" & String(2-Len(minute(objgbrsx("times"))),"0") & minute(objgbrsx("times")) & "分)<br/>"

objgbrsx.movenext
  if objgbrsx.EOF then Exit for
    Next
  End if

    if objgbrsx.PageCount>1 then
    response.write "-----------<br/>"
End if

If page<objgbrsx.PageCount then
    Response.Write "<a href='/BBS/public/MessageRead.Asp?SessionID=" & SessionID & "&amp;page="&page+1&"&amp;ID="&id&"'>"&converttowidebaiti("下页")& "</a>"
 else 
    'Response.Write ""&converttowidebaiti("下页")& ""
End if

If page>1 then
    Response.Write "<a href='/BBS/public/MessageRead.Asp?SessionID=" & SessionID & "&amp;page="&page-1&"&amp;ID="&id&"'>"&converttowidebaiti("上页")& "</a>"
 else 
    'Response.Write ""&converttowidebaiti("上页")& ""
End if

if objgbrsx.PageCount>1 then
response.write ""&converttowidebaiti("(" &  page & "/" & objgbrsx.PageCount & "/" & objgbrsx.RecordCount & ")")& "<br/>"
response.write "<input  name='p' value='2' size='3' format='*N'/>"&converttowidebaiti("页")& "<anchor>"&converttowidebaiti("跳页")& "<go method='post' href='/BBS/public/MessageRead.Asp?SessionID=" & SessionID & "&amp;ID="&id&"'><postfield name='page' value='$(p)'/></go></anchor><br/>"
End if

	objgbrsx.close
	set objgbrsx=nothing
End if
if objgbrs("reids")<>"0" then
response.write"-----------<br/>"
End if
if Session("returnuppath")<>"" then
   Response.write "<a href='" & Session("returnuppath") & "&amp;SessionID=" & SessionID & "'>返回来源面页</a><br/>"
End if
Response.write"<a href='/bbs/public/main_fs.asp?SessionID=" & SessionID & "'>编写消息</a><br/>"
if objgbrs("reids")<>"0" then
Response.write"<a href='/bbs/public/zhuang.asp?id=" & objgbrs("id") & "&amp;pages=" & pages & "&amp;SessionID=" & SessionID & "'>转发消息</a><br/>"
Response.write"<a href='/bbs/public/bao.asp?id=" & objgbrs("id") & "&amp;pages=" & pages & "&amp;SessionID=" & SessionID & "'>收藏消息</a><br/>"
End if
Response.write"<a href='/bbs/public/delly.asp?id=" & objgbrs("id") & "&amp;pages=" & pages & "&amp;SessionID=" & SessionID & "'>删除消息</a>"
response.write"<br/>-----------<br/>"
Response.write"<a href='/bbs/public/main_ckly.asp?SessionID=" & SessionID & "'>返回收件箱</a><br/>"
Response.write"<a href='/bbs/public/srxx.asp?SessionID=" & SessionID & "'>返回消息中心</a><br/>"
Response.write "<a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>返回我的地盘</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a>"%>

<br/>北京时间:<%=time%>
<%
Response.write "</p></card></wml>"
objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing
%>