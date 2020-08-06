<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->

<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="hk, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="龙宝排名"><p><br/>--------------<br/>
<% 
Server.ScriptTimeout=999
iduse=Session("useid")
 dim page,objgbrs,sl
  page=request("page")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
 ssql="select top 100 myjjnames,jjsl from jj_hk_my order by jjsl desc"
  objgbrs.open ssql,conn,1,3
objgbrs.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
sl="10"
if objgbrs.PageCount>sl then objgbrs.PageCount=sl
if pages>objgbrs.PageCount then pages=objgbrs.PageCount
objgbrs.absolutepage=pages
if pages=1 then
bihao=0
else
bihao=pages*10-10
End if
For k=1 to objgbrs.PageSize
bihaocont=bihaocont+1
Response.write bihao+bihaocont & ".<a href='/bbss/hk/hk/Myreg.asp?id=" & objgbrs("id") & "&amp;sid=" & sid & "&amp;wxwm=" & wxwm & "'>" & objgbrs("myjjnames") & "(" & objgbrs("jjsl") & "股)</a><br/>"
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next

Response.write "--------------<br/>"
If pages<10 then
Response.Write "<a href='JJ_pail.asp?pages=" & (pages+1) & "&amp;sid=" & sid & "&amp;wxwm=" & wxwm & "'>下页</a>"
End if
If pages>1 then
Response.Write "|<a href='JJ_pail.asp?pages=" & (pages-1) & "&amp;sid=" & sid & "&amp;wxwm=" & wxwm & "'>上页</a>"
End if

response.write "&#40;" & pages & "&#47;" & sl & "&#41;"
objgbrs.close
set objgbrs=nothing
Response.Write "<br/><a href='afund.asp?pages=" & pages & "&amp;SessionID=" & SessionID & "'>龙宝大厅</a>.<a href='index.asp?SessionID=" & SessionID & "'>龙宝中心</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>社区首页</a>.<a href='/index.asp'>网站首页</a>"

%>
<%
conn.close
set conn=nothing%>
</p></card></wml>


