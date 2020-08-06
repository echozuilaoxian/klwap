<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
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
<card id="card1" title="新消息列表"><p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/BBS/UseLogiN.Asp?SessionID=" & SessionID & ""
      else
        Session("ltlybz")=""
    End if
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlls="168"
lasttls
  dim id,objgbrs,jdshow,ForumID
  ForumID=request("ForumID")
jdshow=CLng(Session("showjd"))
  id=Session("useid")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from guestbook where CStr(ids)='" & id & "' and biaozi='t' order by times desc"
  objgbrs.open ssql,conn,1,3
if objgbrs.eof then
       Response.write "您没有未读的留言<br/>"
   Else
     objgbrs.PageSize=jdshow
     pages =CLng(Request("pages"))
    if pages<1 then pages=1
        if pages>objgbrs.PageCount then pages=objgbrs.PageCount
              objgbrs.absolutepage=pages
           if pages=1 then
                bihao=0
              else
                bihao=pages*jdshow-jdshow
           End if
if objgbrs.RecordCount>0 then
      response.write "您有(" & objgbrs.RecordCount & ")条新信息<br/>"
end if
For k=1 to objgbrs.PageSize
bihaocont=bihaocont+1
hfyl=left(objgbrs("niayo"),13)
if len(objgbrs("niayo"))>13 then
hfyl=hfyl+"..."
End if
tjhm=objgbrs("reids")
if objgbrs("biaozi")="t" then
biaozis="(新)"
else
biaozis=""
End if
if objgbrs("bz")="1" then
bz="D"
else
bz=""
End if

Response.write bz & objgbrs.RecordCount-CLng(bihao+bihaocont)+1 & "." & "" & biaozis & "<a href='MessageRead.Asp?id=" & objgbrs("id") & "&amp;pages=" & pages & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(hfyl) & "</a><br/>"
if objgbrs("reids")="0" then
      response.write "<u>系统信息</u><br/>"
   else
      Response.write "发信人:<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("reids") & "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti(redtjname) & "(ID:" & objgbrs("reids") & ")</a><br/>"
end if
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
End if
Response.write "------------<br/>"
If pages<objgbrs.PageCount then
      Response.Write "<a href='ckly.asp?pages=" & (pages+1) &"&amp;id=" & id & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
      Response.Write "&nbsp;" & "<a href='ckly.asp?pages=" & (pages-1) & "&amp;id=" & id & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
if objgbrs.PageCount>1 then
      response.write "(" & pages & "/" & objgbrs.PageCount & "/" & objgbrs.RecordCount & ")<br/>"
response.write "<input  name='pages' value='1' size='8' format='*N'/>页<anchor>ＧＯ<go method='post' href='ckly.asp?SessionID=" & SessionID & "'><postfield name='pages' value='$(pages)'/><postfield name='id' value='"& id &"'/></go></anchor><br/>"
End if
if Session("returnuppath")<>"" then
   Response.write "<a href='" & Session("returnuppath") & "&amp;SessionID=" & SessionID & "'>返回来源面页</a><br/>"
end if     
Response.write "<a href='/bbs/public/main_ckly.asp?SessionID=" & SessionID & "'>查看已阅消息</a><br/>"
Response.write "<a href='/bbs/public/srxx.asp?SessionID=" & SessionID & "'>返回我的信箱</a><br/>"
Response.Write "<a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/>"
%>
北京时间<%
dim distime
distime=""
if hour(now())<10 then distime=distime&"0"
distime=distime&hour(now())&":"
if minute(now())<10 then distime=distime&"0"
distime=distime&minute(now())
response.write distime
%>
<%
response.write "</p></card>"
Response.write "<card id='card2' title='[按页搜索]'><p><input  name='pages' value='1' format='*N'/><anchor>GO<go method='post' href='ckly.asp?SessionID=" & SessionID & "'><postfield name='pages' value='$(pages)'/><postfield name='id' value='"& id &"'/></go></anchor></p></card></wml>"
objgbrs.close
conn.close
set objgbrs=nothing
set conn=nothing
%>