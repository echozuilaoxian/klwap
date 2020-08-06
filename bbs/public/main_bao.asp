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
<%SessionID=request.querystring("SessionID") %>
<card id="card1" title="短信收藏夹"><p>
<% 
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id=id"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
iduse=Session("useid")
lasttlls="96"
lasttls
  dim id,objgbrs,jdshow,ForumID
  ForumID=request("ForumID")
jdshow=CLng(Session("showjd"))
  id=Session("useid")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from guestbook where CStr(ids)='" & id & "' and bz='1' order by times desc"
  objgbrs.open ssql,conn,1,3
if objgbrs.eof then
       Response.write "你没有收藏记录<br/>"
   Else
Response.write "已收藏" & objgbrs.RecordCount & "条信息<br/>"
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
bz=""
else
bz=""
End if
Response.write "<a href='cklycl.asp?id=" & objgbrs("id") & "&amp;pages=" & pages & "&amp;SessionID=" & SessionID & "'>" & bz & "" & objgbrs.RecordCount-CLng(bihao+bihaocont)+1 & "." & biaozis & converttowidebaiti(hfyl) & "</a><br/>"
if objgbrs("reids")="0" then
      response.write "系统信息<br/>"
   else
      Response.write "发信人:<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("reids") & "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti(redtjname) & "(ID:" & objgbrs("reids") & ")</a><br/>"
end if
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
End if
Response.write "----------<br/>"
If pages<objgbrs.PageCount then
      Response.Write "<a href='main_bao.asp?pages=" & (pages+1) &"&amp;id=" & id & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
      Response.Write "&nbsp;" & "<a href='main_bao.asp?pages=" & (pages-1) & "&amp;id=" & id & "&amp;SessionID=" & SessionID & "'>上页</a><br/>"
End if

if objgbrs.PageCount>1 then
      response.write "第" & pages & "页/共" & objgbrs.PageCount & "页<br/>"
if objgbrs.PageCount>1 then
response.write "<input  name='pages' value='1' size='2' format='*N'/>>><anchor>GO<go method='post' href='main_ckly.asp?SessionID=" & SessionID & "'><postfield name='pages' value='$(pages)'/><postfield name='id' value='"& id &"'/></go></anchor><br/>"
End if
End if
if Session("returnuppath")<>"" then
   Response.write "<a href='" & Session("returnuppath") & "&amp;SessionID=" & SessionID & "'>[刚才界面]</a><br/>"
  Else
end if  
Response.write "<a href='/bbs/public/srxx.asp?SessionID=" & SessionID & "'>[我的信箱]</a><br/>"     
Response.Write "<a href='/bbs/index.asp?SessionID=" & SessionID & "'>[社区首页]</a><br/>"
%>
北京时间:<%
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
Response.write "<card id='card2' title='按页搜索'><p><input  name='pages' value='1' format='*N'/><anchor>GO<go method='post' href='ckly.asp?wap=" & wap & "'><postfield name='pages' value='$(pages)'/><postfield name='id' value='"& id &"'/></go></anchor></p></card></wml>"
objgbrs.close
conn.close
set objgbrs=nothing
set conn=nothing
%>



