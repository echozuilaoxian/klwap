<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="我的书包"><p>
<%SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
ForumID=request("ForumID")
mon=request("mon")
pages=request("pages")
 dim page,objgbrs,ids
  page=request("page")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut =999
  ssql="select * from myalbum where Cstr(ids)=" & iduse & " order by times desc"
  objgbrs.open ssql,conn,3,3
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有(" & lycount & ")条新信息</a><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ForumID=" & ForumID & "&amp;mon=" & mon & ""
End if
if objgbrs.eof then
    response.write "你暂时没有收藏或者没有上传,快去上传或者到论坛的图铃贴收藏资源吧<br/>"
  else
objgbrs.PageSize=5
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrs.PageCount then pages=objgbrs.PageCount
objgbrs.absolutepage=pages
Response.write "你有" & objgbrs.RecordCount & "张图片<br/>----------<br/>"
if pages=1 then
bihao=0
else
bihao=pages*5-5
End if
For k=1 to objgbrs.PageSize
bihaocont=bihaocont+1
if objgbrs("bz")="1" then
bz="[相册]"
else
bz=""
End if
Response.write bihao+bihaocont & "." & "<anchor>" &  bz & converttowide(objgbrs("niayo")) & "<go method='post' href=""/BBS/Forum_content/Forum_Addcontent.Asp?ForumID="&ForumID&"&amp;Page="&Page&"&amp;Mon="&mon&"&amp;SessionID="&SessionID&"""><postfield name='img' value='" & objgbrs("xclink") & "'/><postfield name='imgs' value='(img)" & objgbrs("xclink") & "(/img)'/><postfield name='wen' value='[图]'/><postfield name='nais' value='" & objgbrs("niayo") & "'/></go></anchor><br/>"
Response.write "<img src='" & objgbrs("xclink") & "' width='25' height='22' alt='图片'/><br/>"
objgbrs.Movenext
if objgbrs.EOF then Exit for
 Next
End if
Response.write "----------<br/>"
If pages<objgbrs.PageCount then
Response.Write "<a href='Imgs.asp?ForumID=" & ForumID & "&amp;Page="&Page&"&amp;Mon="&mon&"&amp;Pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
Response.Write "&nbsp;" & "<a href='Imgs.asp?ForumID=" & ForumID & "&amp;Page="&Page&"&amp;Mon="&mon&"&amp;Pages=" & (pages-1) & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if

if objgbrs.PageCount>1 then
response.write "(" & pages & "/" & objgbrs.PageCount & ")<br/>"
End if
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt where id="&ForumID
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then
dlname="无此论坛"
Else
dlname=objgbrsy("name")
end if
objgbrsy.close
Set objgbrsy= Nothing
%>
<%
response.write "<br/><a href='/BBS/Forum_content/Forum_Addcontent.Asp?ForumID=" & ForumID & "&amp;Mon=" & Mon & "&amp;SessionID=" & SessionID & "'>返回继续发贴</a><br/>"
response.write "<br/><a href='/bbs/forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回"&dlname&"</a><br/>"
response.write "<a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a><br/></p></card></wml>"
conn.close
	set objgbrs=nothing
	Set conn = Nothing%>