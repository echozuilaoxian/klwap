<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="UTF-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/CODEUN.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%if session("useid")="828" then response.redirect"/bbs/yksm.asp" end if
%> 
<% 
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID") 
iduse=Session("useid")
lasttlss="93"
lasttlls="93"
lasttls
  dim show,jdshow,objgbrs
  show=request("show")
  jdshow=CLng(Session("showjd"))
  if show="" then
     show=0
  end if
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from room2 order by id desc"
  objgbrs.open ssql,conn,1,3
Response.write "<card id='card1' title='竞技大厅' ontimer='/bbs/tz/chatroom/chatroom.asp?t=" & time() & "&amp;show=" & show & "&amp;SessionID=" & SessionID & "'><timer value='380'/><p>"
%>
<% 
    set objgbrs1=Server.CreateObject("ADODB.Recordset")
  ssql1="select * from marry1 where [reuseid]=" & iduse & " and [open]=0 order by id desc"
  objgbrs1.open ssql1,conn,1,1
    if objgbrs1.eof then
%>
<%
	elseif objgbrs1("about")="J" then
%>
<img src='notice.gif' alt=''/><a href="/bbs/tz/lb.asp?SessionID=<%=SessionID%>">有人向你发起挑战</a><br/>
<%
	elseif objgbrs1("about")="D" then
%>
<img src='notice.gif' alt=''/><a href="/bbs/tz/dxlb.asp?SessionID=<%=SessionID%>">有人向你发起挑战</a><br/>
<%
     end if 
%>
<%
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>>您有</a>" & lycount & "条新留言<br/>"
    Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?show=" & show
End if
    Response.write "<a href='talk.asp?show=" & show & "&amp;SessionID=" & SessionID & "'>发言</a>"
    Response.write "|<a href='chatroom.asp?t=" & time() & "&amp;show=" & show & "&amp;SessionID=" & SessionID & "'>刷新</a>"
    RecordCounts=RecordCount
    response.write "|<a href='/bbs/tz/index.asp?SessionID=" & SessionID & "'>我的竞技</a><br/>----------<br/>"

if objgbrs.eof then
   Response.write "欢迎您进入竞技大厅！<br/>"
else
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
   if objgbrs("forname")="大家" then
     Response.write "<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("ids") & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(objgbrs("usename")) & "</a>:"
    else
   Response.write ""
   end if
Response.write converttowide(UBBCodes(objgbrs("talk"))) & "(" & objgbrs("times") & ")<br/>"
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
End if
If pages<objgbrs.PageCount then
      Response.Write "<a href='chatroom.asp?pages=" & (pages+1) &"&amp;id=" & id & "&amp;SessionID=" & SessionID & "'>下一页</a>"
End if
If pages>1 then
      Response.Write "&nbsp;" & "<a href='chatroom.asp?pages=" & (pages-1) & "&amp;id=" & id & "&amp;SessionID=" & SessionID & "'>上一页</a><br/>"
End if
Response.write "共" & objgbrs.RecordCount & "条"

if objgbrs.PageCount>1 then
      response.write "第" & pages & "页/共" & objgbrs.PageCount & "页"
if objgbrs.PageCount>1 then
response.write "<br/><input  name='pages' value='1' size='2' format='*N'/><anchor>跳至此页<go method='post' href='chatroom.asp?SessionID=" & SessionID & "'><postfield name='pages' value='$(pages)'/><postfield name='id' value='"& id &"'/></go></anchor>"
End if
end if
objgbrs1.close
     set objgbrs1=nothing
set objgbrs=nothing
sql="Delete FROM room2 WHERE DATEDIFF('s', date, now()) > 1440*60"
conn.Execute sql
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
Response.write "<br/>----------<br/>"
    Response.write "<a href='talk.asp?show=" & show & "&amp;SessionID=" & SessionID & "'>发言</a>"
    Response.write "|<a href='chatroom.asp?t=" & time() & "&amp;show=" & show & "&amp;SessionID=" & SessionID & "'>刷新</a>"
    response.write "|<a href='/bbs/tz/ph0.asp?SessionID=" & SessionID & "'>竞技英雄</a>"
Response.Write "<br/>---------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>[&#x793E;&#x533A;&#x9996;&#x9875;]</a>"
%><br/>
<br/>&#x73B0;&#x5728;&#x65F6;&#x95F4;:<%
dim distime
distime=""
if hour(now())<10 then distime=distime&"0"
distime=distime&hour(now())&":"
if minute(now())<10 then distime=distime&"0"
distime=distime&minute(now())
response.write distime
%><br/>
<%
response.write "</p></card></wml>"
function chUBBCodes(memo)
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
    re.Pattern="(^.*)(!([0-9]*)!)(.*)"
 if show=0 then
        memo=re.Replace(memo,"$1<img src=""/bbs/room/image/$3.gif"" alt=""load...""/>$4")
    else
        memo=re.Replace(memo,"$1$4")
 end if
	chUBBCodes=memo
end function
%>


