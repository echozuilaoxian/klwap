<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="UTF-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->

<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="hk, 1 Jan 1990 00:00:00 GMT"/>
</head>
<% 
Server.ScriptTimeout=999
iduse=Session("useid")
  dim show,objgbrs,pages
if pages="" then pages="1"
  show=request("show")
  if show="" then show=0
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from gproom where baoch='4' order by id desc"
  objgbrs.open ssql,conn,1,3
Response.write "<card id='card1' title='龙宝交流大厅' ontimer='Chats.asp?pages=" & pages & "&amp;t=" & time() & "&amp;show=" & show & "&amp;SessionID=" & SessionID & "&amp;wxwm=" & wxwm & "'><timer value='300'/><p>"


    Response.write "<a href='talk.asp?show=" & show & "&amp;SessionID=" & SessionID & "&amp;wxwm=" & wxwm & "'>发言</a>|<a href='Chats.asp?pages=" & pages & "&amp;t=" & time() & "&amp;show=" & show & "&amp;SessionID=" & SessionID & "&amp;wxwm=" & wxwm & "'>刷新</a><br/>----------<br/>"
if objgbrs.eof then
   Response.write "欢迎进入龙宝交流大厅<br/>"
else
objgbrs.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrs.PageCount then pages=objgbrs.PageCount
objgbrs.absolutepage=pages
if pages=1 then
bihao=0
else
bihao=pages*10-10
End if
For k=1 to objgbrs.PageSize
     Response.write objgbrs("usename") & ":"& chUBBCodes(objgbrs("talk")) & "(" & objgbrs("times") & ")<br/>"
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
end if
sql="Delete FROM gproom WHERE baoch='4' and DATEDIFF('s', date, now()) > 1440*60"
conn.Execute sql
Response.write "----------<br/>"
If pages<objgbrs.PageCount then
Response.Write "<a href='Chats.asp?pages=" & (pages+1) & "&amp;show=" & show & "&amp;SessionID=" & SessionID & "&amp;wxwm=" & wxwm & "'>下页</a>"
End if
If pages>1 then
Response.Write "&nbsp;" & "<a href='chats.asp?pages=" & (pages-1) & "&amp;show=" & show & "&amp;SessionID=" & SessionID & "&amp;wxwm=" & wxwm & "'>上页</a>"
End if
if objgbrs.PageCount>1 then
response.write "(" & pages & "/" & objgbrs.PageCount & ")<br/>"
End if
objgbrs.close
set objgbrs=nothing
    Response.write "<input type='text' name='talks' maxlength='30'/><br/><anchor>快速发言<go method='post' href='talkcl.asp?show=" & show & "&amp;SessionID=" & SessionID & "&amp;wxwm=" & wxwm & "'><postfield name='talks' value='$(talks)'/></go></anchor>"
response.write "<br/><a href='afund.asp?pages=" & pages & "&amp;SessionID=" & SessionID & "'>龙宝大厅</a>.<a href='index.asp?SessionID=" & SessionID & "'>龙宝中心</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>社区首页</a>.<a href='/index.asp'>网站首页</a>"

%>
<%
response.write "</p></card></wml>"
function chUBBCodes(memo)
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
    re.Pattern="(^.*)(图=([0-9]*))(.*)"
 if show=1 then
        memo=re.Replace(memo,"$1<img src=""img/$3.gif"" alt=""load...""/>$4")
    else
        memo=re.Replace(memo,"$1[表情]$4")
end if 
	chUBBCodes=memo
end function
%>
<%
conn.close
set conn=nothing%>



