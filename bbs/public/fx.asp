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
<card id="card1" title="发件箱"><p>
<% SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID") %>
<%
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id=id"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlls="167"
lasttls
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有(" & lycount & ")条未读信息!</a><br/>"
End if
  dim id,objgbrs,jdshow,itid
  itid=request("itid")
jdshow=CLng(Session("showjd"))
  id=Session("useid")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from guestbook where CStr(reids)='" & id & "' order by times desc"
  objgbrs.open ssql,conn,1,3
if objgbrs.eof then
       Response.write "没有发信记录<br/>"
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
For k=1 to objgbrs.PageSize
bihaocont=bihaocont+1
ltlyuan=left(objgbrs("niayo"),25)
if len(objgbrs("niayo"))>25 then
ltlyuan=ltlyuan+"..."
End if
tjhm=objgbrs("ids")
if objgbrs("biaozi")="t" then
biaozis="未阅"
else
biaozis=""
End if
if objgbrs("bz")="1" then
bz="保存"
else
bz=""
End if
if objgbrs("ids")="0" then
      yxxe="系统消息"
   else
      yxxe=converttowidebaiti(redtjname)
end if
Response.write objgbrs.RecordCount-CLng(bihao+bihaocont)+1 & "." & biaozis& ""& bz & "<a href='ckfx.asp?id=" & objgbrs("id") & "&amp;pages=" & pages & "&amp;SessionID=" & SessionID & "'>" & yxxe & ":" & converttowidebaiti(ltlyuan) & "</a><br/>"
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
End if
if objgbrs.PageCount>1 then
Response.write "------------<br/>"
End if
If pages<objgbrs.PageCount then
      Response.Write "<a href='FX.asp?pages=" & (pages+1) &"&amp;id=" & id & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
      Response.Write "&nbsp;" & "<a href='FX.asp?pages=" & (pages-1) & "&amp;id=" & id & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
if objgbrs.PageCount>1 then
      response.write "(" & pages & "/" & objgbrs.PageCount & "/" & objgbrs.RecordCount & ")<br/>"
response.write "<input  name='pages' value='1' size='3' format='*N'/>页<anchor>跳页<go method='post' href='FX.asp?SessionID=" & SessionID & "'><postfield name='pages' value='$(pages)'/><postfield name='id' value='"& id &"'/></go></anchor><br/>"
End if
Response.write "------------<br/>"
Response.write "<a href='/bbs/public/main_fs.asp?SessionID=" & SessionID & "'>编写消息</a><br/>"    
Response.write "<a href='/bbs/public/dellyall1.asp?pages=" & pages & "&amp;SessionID=" & SessionID & "'>清空发件箱</a><br/>"     

Response.write "------------<br/>"

if Session("returnuppath")<>"" then
   Response.write "<a href='" & Session("returnuppath") & "&amp;SessionID=" & SessionID & "'>返回来源面页</a><br/>"
end if
Response.write "<a href='/bbs/public/srxx.asp?SessionID=" & SessionID & "'>返回消息中心</a><br/>"   
Response.Write "<a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/>"
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
response.write "</p></card></wml>"
objgbrs.close
conn.close
set objgbrs=nothing
set conn=nothing
%>